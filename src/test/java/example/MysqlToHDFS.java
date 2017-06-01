package example;

import org.apache.sqoop.client.SqoopClient;
import org.apache.sqoop.model.*;
import org.apache.sqoop.submission.counter.Counter;
import org.apache.sqoop.submission.counter.CounterGroup;
import org.apache.sqoop.submission.counter.Counters;
import org.apache.sqoop.validation.Status;

/**
 * Created by houlongbin on 2016/11/2.
 */
public class MysqlToHDFS {
    public static void main(String[] args) {
        sqoopTransfer();
    }
    public static void sqoopTransfer() {
        long start=System.currentTimeMillis();
        //初始化
        String url = "http://192.168.8.207:12000/sqoop/";
        SqoopClient client = new SqoopClient(url);
        //创建一个源链接 JDBC
        long fromConnectorId = 1;
        MLink fromLink = client.createLink(fromConnectorId);
        fromLink.setName("JDBC car_info"+System.currentTimeMillis());
        //com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException
        fromLink.setCreationUser("hadoop");
        MLinkConfig fromLinkConfig = fromLink.getConnectorLinkConfig();
        fromLinkConfig.getStringInput("linkConfig.connectionString").setValue("jdbc:mysql://192.168.8.50:3306/car_warn");
        fromLinkConfig.getStringInput("linkConfig.jdbcDriver").setValue("com.mysql.jdbc.Driver");
        fromLinkConfig.getStringInput("linkConfig.username").setValue("car_warn");
        fromLinkConfig.getStringInput("linkConfig.password").setValue("1q2w3e4r5t@");
        Status fromStatus = client.saveLink(fromLink);
        if(fromStatus.canProceed()) {
            System.out.println("创建JDBC Link成功，ID为: " + fromLink.getPersistenceId());
        } else {
            System.out.println("创建JDBC Link失败");
        }
        //创建一个目的地链接HDFS
        long toConnectorId = 3;
        MLink toLink = client.createLink(toConnectorId);
        toLink.setName("HDFS car_info"+System.currentTimeMillis());
        toLink.setCreationUser("hadoop");
        MLinkConfig toLinkConfig = toLink.getConnectorLinkConfig();
        toLinkConfig.getStringInput("linkConfig.uri").setValue("hdfs://192.168.8.207:9000/");
        Status toStatus = client.saveLink(toLink);
        if(toStatus.canProceed()) {
            System.out.println("创建HDFS Link成功，ID为: " + toLink.getPersistenceId());
        } else {
            System.out.println("创建HDFS Link失败");
        }

        //创建一个任务
        long fromLinkId = fromLink.getPersistenceId();
        long toLinkId = toLink.getPersistenceId();
        MJob job = client.createJob(fromLinkId, toLinkId);
        job.setName("MySQL car_info to HDFS job"+System.currentTimeMillis());
        job.setCreationUser("hadoop");
        //设置源链接任务配置信息
        MFromConfig fromJobConfig = job.getFromJobConfig();
        fromJobConfig.getStringInput("fromJobConfig.schemaName").setValue("car_warn");
        fromJobConfig.getStringInput("fromJobConfig.tableName").setValue("tb_car_info");
//        fromJobConfig.getStringInput("fromJobConfig.columns").setValue("car_id");
//        fromJobConfig.getIntegerInput()
//        fromJobConfig.getStringInput("fromJobConfig.partitionColumn").setValue("car_id");
        MToConfig toJobConfig = job.getToJobConfig();
        toJobConfig.getStringInput("toJobConfig.outputDirectory").setValue("/test/tmp/tb_car_info");
        MDriverConfig driverConfig = job.getDriverConfig();
//        driverConfig.getStringInput("throttlingConfig.numExtractors").setValue("3");

        Status status = client.saveJob(job);
        if(status.canProceed()) {
            System.out.println("JOB创建成功，ID为: "+ job.getPersistenceId());
        } else {
            System.out.println("JOB创建失败。");
        }

        //启动任务
        long jobId = job.getPersistenceId();
        MSubmission submission = client.startJob(jobId);
        System.out.println("JOB提交状态为 : " + submission.getStatus());
        while(submission.getStatus().isRunning() && submission.getProgress() != -1) {
            System.out.println("进度 : " + String.format("%.2f %%", submission.getProgress() * 100));
            //三秒报告一次进度
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        System.out.println("JOB执行结束... ...");
        System.out.println("Hadoop任务ID为 :" + submission.getExternalJobId());
        Counters counters = submission.getCounters();
        if(counters != null) {
            System.out.println("计数器:");
            for(CounterGroup group : counters) {
                System.out.print("\t");
                System.out.println(group.getName());
                for(Counter counter : group) {
                    System.out.print("\t\t");
                    System.out.print(counter.getName());
                    System.out.print(": ");
                    System.out.println(counter.getValue());
                }
            }
        }
        if(submission.getError() != null) {
            System.out.println("JOB执行异常，异常信息为 : " +submission.getError());
        }
        System.out.println("MySQL通过sqoop传输数据到HDFS统计执行完毕 cost="+(System.currentTimeMillis()-start)+"ms");
    }
}
