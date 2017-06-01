package example;

import org.apache.sqoop.client.SqoopClient;
import org.apache.sqoop.model.*;
import org.apache.sqoop.submission.counter.Counter;
import org.apache.sqoop.submission.counter.CounterGroup;
import org.apache.sqoop.submission.counter.Counters;
import org.apache.sqoop.validation.Status;

import java.util.List;
import java.util.ResourceBundle;

/**
 * Created by houlongbin on 2016/11/3.
 */
public class Sqoop1_99_4_Test {
    public static void main(String[] args) {
        String url = "http://192.168.8.207:12000/sqoop/";
        SqoopClient client = new SqoopClient(url);
        // 建立link 连接
        long connectorId = 3;
        MLink link = createHDFSLink(client,connectorId);
         connectorId = 1;
        MLink link2 = createMysqlLink(client,connectorId);
        listInputAndOutputParameters(client, connectorId);
        // 建立任务
        long fromLinkId = 1;
        long toLinkId = 2;
        String input = "/test/mysql2hdfs/";
        String tableName = "tb_car_status";
        String columns = "car_id";
        int mappers = 2;
        MJob job = createJob(client, fromLinkId, toLinkId, input, tableName, columns, mappers);
        System.out.println(job.getEnabled());
        // 启动任务
        long jobId = 1;
        startJob(client, jobId);
    }

    static void describe(List<MConfig> configs, ResourceBundle resource) {
        for (MConfig config : configs) {
            System.out.println(resource.getString(config.getLabelKey()) + ":");
            List<MInput<?>> inputs = config.getInputs();
            for (MInput input : inputs) {
                System.out.println(input.getName() + "," + resource.getString(input.getLabelKey()) + " : " + input.getValue());
            }
            System.out.println();
        }
    }

    /**
     * 打印各个connector的参数
     *
     * @param client
     * @param connectorId
     */
    static void listInputAndOutputParameters(SqoopClient client, long connectorId) {
        describe(client.getConnector(connectorId).getLinkConfig().getConfigs(), client.getConnectorConfigBundle(connectorId));
        describe(client.getConnector(connectorId).getFromConfig().getConfigs(), client.getConnectorConfigBundle(connectorId));
        describe(client.getConnector(connectorId).getToConfig().getConfigs(), client.getConnectorConfigBundle(connectorId));
    }

    /**
     * 建立mysql link
     *
     * @param client
     * @param connectorId
     * @return
     */
    static MLink createMysqlLink(SqoopClient client, long connectorId) {
        MLink link = client.createLink(connectorId);
        link.setName("mysql");
        link.setCreationUser("fansy");
        MLinkConfig linkConfig = link.getConnectorLinkConfig();
// fill in the link config values
        linkConfig.getStringInput("linkConfig.connectionString").setValue("jdbc:mysql://192.168.8.50:3306/car_warn");
        linkConfig.getStringInput("linkConfig.jdbcDriver").setValue("com.mysql.jdbc.Driver");
        linkConfig.getStringInput("linkConfig.username").setValue("car_warn");
        linkConfig.getStringInput("linkConfig.password").setValue("1q2w3e4r5t@");
// save the link object that was filled
        Status status = client.saveLink(link);
        if (status.canProceed()) {
            System.out.println("Created Link with Link Id : " + link.getPersistenceId());
        } else {
            System.out.println("Something went wrong creating the link");
        }
        return link;
    }

    /**
     * 建立HDFS link
     *
     * @param client
     * @param connectorId
     * @return
     */
    static MLink createHDFSLink(SqoopClient client, long connectorId) {
        MLink link = client.createLink(connectorId);
        link.setName("hdfs");
        link.setCreationUser("fansy");
        MLinkConfig linkConfig = link.getConnectorLinkConfig();
// fill in the link config values
        linkConfig.getStringInput("linkConfig.uri").setValue("hdfs://192.168.8.207:9000");
// save the link object that was filled
        Status status = client.saveLink(link);
        if (status.canProceed()) {
            System.out.println("Created Link with Link Id : " + link.getPersistenceId());
        } else {
            System.out.println("Something went wrong creating the link");
        }
        return link;
    }

    /**
     * 建立hdfs to mysql 任务
     *
     * @param client
     * @param fromLinkId
     * @param toLinkId
     * @param input
     * @param tableName
     * @param columns
     * @param mappers
     * @return
     */
    static MJob createJob(SqoopClient client, long fromLinkId, long toLinkId,
                          String input, String tableName, String columns, int mappers) {
        MJob job = client.createJob(fromLinkId, toLinkId);
        job.setName("hdfs to mysql");
        job.setCreationUser("fansy");
// set the "FROM" link job config values
        MFromConfig fromJobConfig = job.getFromJobConfig();
        fromJobConfig.getStringInput("fromJobConfig.inputDirectory").setValue(input);

// set the "TO" link job config values
        MToConfig toJobConfig = job.getToJobConfig();
        toJobConfig.getStringInput("toJobConfig.tableName").setValue(tableName);
        toJobConfig.getStringInput("toJobConfig.columns").setValue(columns);

// set the driver config values
        MDriverConfig driverConfig = job.getDriverConfig();
//        driverConfig.getStringInput("throttlingConfig.numExtractors").setValue(String.valueOf(mappers));
        driverConfig.getIntegerInput("throttlingConfig.numExtractors").setValue(mappers);
        Status status = client.saveJob(job);
        if (status.canProceed()) {
            System.out.println("Created Job with Job Id: " + job.getPersistenceId());
        } else {
            System.out.println("Something went wrong creating the job");
        }
        return job;
    }

    /**
     * 启动任务
     *
     * @param client
     * @param jobId
     */
    static void startJob(SqoopClient client, long jobId) {
        MSubmission submission = client.startJob(jobId);
        System.out.println("Job Submission Status : " + submission.getStatus());
        if (submission.getStatus().isRunning() && submission.getProgress() != -1) {
            System.out.println("Progress : " + String.format("%.2f %%", submission.getProgress() * 100));
        }
        System.out.println("Hadoop job id :" + submission.getExternalJobId());
        System.out.println("Job link : " + submission.getExternalLink());
        Counters counters = submission.getCounters();
        if (counters != null) {
            System.out.println("Counters:");
            for (CounterGroup group : counters) {
                System.out.print("\t");
                System.out.println(group.getName());
                for (Counter counter : group) {
                    System.out.print("\t\t");
                    System.out.print(counter.getName());
                    System.out.print(": ");
                    System.out.println(counter.getValue());
                }
            }
        }
        if (submission.getError() != null) {
            System.out.println("Exception info : " + submission.getError());
        }


    }

    /**
     * 查看任务状态
     *
     * @param client
     * @param jobId
     */
    static void checkJobStatus(SqoopClient client, long jobId) {
        //Check job status for a running job
        MSubmission submission = client.getJobStatus(jobId);
        if (submission.getStatus().isRunning() && submission.getProgress() != -1) {
            System.out.println("Progress : " + String.format("%.2f %%", submission.getProgress() * 100));
        }
        System.out.println("Job status:" + submission.getStatus().name());
    }

}
