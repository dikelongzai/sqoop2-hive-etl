package com.apache.sqoop.demo.util;

import com.apache.sqoop.demo.entity.DBType;
import com.hive.util.DBMSMetaUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.sqoop.client.SqoopClient;
import org.apache.sqoop.model.*;
import org.apache.sqoop.submission.counter.Counter;
import org.apache.sqoop.submission.counter.CounterGroup;
import org.apache.sqoop.submission.counter.Counters;
import org.apache.sqoop.validation.Status;

import java.util.*;

import static com.apache.sqoop.demo.util.Constant.SQOOP_COUNT_CLASS;
import static com.apache.sqoop.demo.util.Constant.SQOOP_ROWS_WRITTEN;

/**
 * Created by houlongbin on 2016/11/14.
 */
public class SqoopUtil {
    private static final Log log = LogFactory.getLog(SqoopUtil.class);
    public static final int JDBC_CONNECT_ID = 1;
    public static final int HDFS_CONNECT_ID = 3;
    public static final String CONNECT_USER = "hadoop";
    public static final String COMMON_HDFS_LINK = "hadoop_common_link";

    static String SQOOP_URL = "";
    static String HDFS_URL = "";

    public static Map<String, SqoopClient> SQOOP_CLIENT_MAP = Collections.synchronizedMap(new HashMap<String, SqoopClient>());

    static {
        Properties properties = new Properties();

        try {
            properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("hosts.properties"));
        } catch (Exception var2) {
            log.error("hosts.properties must contains in classpath");
        }
        SQOOP_URL = properties.getProperty("sqoop.url");
        log.error(" SQOOP_URL init=" + SQOOP_URL);
        HDFS_URL = properties.getProperty("hdfs.uri");
        log.error(" HDFS_URL init=" + HDFS_URL);

    }

    /**
     * 获取JDBC linkid
     *
     * @param datatype
     * @param ip
     * @param port
     * @param database
     * @param user
     * @param pass
     * @param uuid
     * @return
     * @throws Exception
     */
    public static long getJDBCLinkId(String datatype, String ip, String port, String database, String user, String pass, String uuid) throws Exception {
        long linkId = 0;
        String linkName = getFromLinkName(datatype, ip, port, database, user, pass);
        SqoopClient client = getSqoopClient(uuid);
        List<MLink> list = client.getLinks();
        for (MLink link : list) {
            if (link.getName().equals(linkName)) {
                if (!link.getEnabled()) {
                    client.enableLink(link.getPersistenceId(), true);
                }
                linkId = link.getPersistenceId();
                break;

            }
        }
        if (linkId == 0) {
            linkId = initJDBCLink(datatype, ip, port, database, user, pass, client);
            log.info("  getJDBCLinkId initJDBCLink name= " + getFromLinkName(datatype, ip, port, database, user, pass));
        }
        log.info("getJDBCLinkId result=" + linkId + ";param datatype=" + datatype + ";ip=" + ip + ";port=" + port + ";database=" + database);
        return linkId;
    }

    /**
     * <p>
     * 创建jdbc sqoop link
     * </p>
     *
     * @param datatype
     * @param ip
     * @param port
     * @param database
     * @param user
     * @param pass
     * @param client
     * @return
     * @throws Exception
     */
    public static long initJDBCLink(String datatype, String ip, String port, String database, String user, String pass, SqoopClient client) throws Exception {
        long processId = 0;
        MLink link = client.createLink(JDBC_CONNECT_ID);
        link.setName(getFromLinkName(datatype, ip, port, database, user, pass));
        log.info("initJDBCLink name= " + getFromLinkName(datatype, ip, port, database, user, pass));
        link.setCreationUser(CONNECT_USER);
        MLinkConfig fromLinkConfig = link.getConnectorLinkConfig();
        DBMSMetaUtil.DATABASETYPE dbtype = DBMSMetaUtil.parseDATABASETYPE(datatype);
        fromLinkConfig.getStringInput("linkConfig.connectionString").setValue(concatSQOOPDBURL(dbtype, ip, port, database));
        log.info("linkConfig.connectionString : " + concatSQOOPDBURL(dbtype, ip, port, database));
        fromLinkConfig.getStringInput("linkConfig.jdbcDriver").setValue(DBMSMetaUtil.getJDBCDrive(dbtype));
        log.info("linkConfig.jdbcDriver :" + DBMSMetaUtil.getJDBCDrive(dbtype));
        fromLinkConfig.getStringInput("linkConfig.username").setValue(user);
        log.info("linkConfig.username :" + user);
        fromLinkConfig.getStringInput("linkConfig.password").setValue(pass);
        log.info("linkConfig.password :" + pass);
        Status status = client.saveLink(link);
        if (status.canProceed()) {
            log.info("Created Link with Link Id : " + link.getPersistenceId());
            processId = link.getPersistenceId();
        } else {
            log.info("Something went wrong creating the link");
        }
        return processId;
    }

    public static String concatSQOOPDBURL(DBMSMetaUtil.DATABASETYPE dbtype, String ip, String port, String dbname) {
        String url = "";
        if (DBMSMetaUtil.DATABASETYPE.ORACLE.equals(dbtype)) {
            url = url + "jdbc:oracle:thin:@";
            url = url + ip.trim();
            url = url + ":" + port.trim();
            url = url + ":" + dbname;
            String url2 = "";
            url2 = url2 + "jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = " + ip.trim() + ")(PORT =" + port.trim() + ")))(CONNECT_DATA = (SERVICE_NAME =" + dbname + ")(FAILOVER_MODE = (TYPE = SELECT)(METHOD = BASIC)(RETRIES = 180)(DELAY = 5))))";
        } else if (DBMSMetaUtil.DATABASETYPE.MYSQL.equals(dbtype)) {
            url = url + "jdbc:mysql://";
            url = url + ip.trim();
            url = url + ":" + port.trim();
            url = url + "/" + dbname + com.hive.util.Constant.POST_JDBC;
        } else if (DBMSMetaUtil.DATABASETYPE.SQLSERVER.equals(dbtype)) {
            url = url + "jdbc:jtds:sqlserver://";
            url = url + ip.trim();
            url = url + ":" + port.trim();
            url = url + "/" + dbname;
            url = url + ";tds=8.0;lastupdatecount=true";
        } else if (DBMSMetaUtil.DATABASETYPE.SQLSERVER2005.equals(dbtype)) {
            url = url + "jdbc:sqlserver://";
            url = url + ip.trim();
            url = url + ":" + port.trim();
            url = url + ";database=" + dbname;
        } else if (DBMSMetaUtil.DATABASETYPE.DB2.equals(dbtype)) {
            url = url + "jdbc:db2://";
            url = url + ip.trim();
            url = url + ":" + port.trim();
            url = url + "/" + dbname;
        } else if (DBMSMetaUtil.DATABASETYPE.INFORMIX.equals(dbtype)) {
            url = url + "jdbc:informix-sqli://";
            url = url + ip.trim();
            url = url + ":" + port.trim();
            url = url + "/" + dbname;
        } else if (DBMSMetaUtil.DATABASETYPE.SYBASE.equals(dbtype)) {
            url = url + "jdbc:sybase:Tds:";
            url = url + ip.trim();
            url = url + ":" + port.trim();
            url = url + "/" + dbname;
        } else {
            if (!DBMSMetaUtil.DATABASETYPE.HIVE.equals(dbtype)) {
                throw new RuntimeException("不认识的数据库类型!");
            }

            url = url + "jdbc:hive2://";
            url = url + ip.trim();
            url = url + ":" + port.trim();
            url = url + "/" + dbname;
            url = url + ";auth=noSasl";
        }

        return url;
    }

    /**
     * 获取hdfs linkid
     *
     * @param uuid
     * @return
     */
    public static long getHDFSLinkId(String uuid) {
        long linkId = 0;
        SqoopClient client = getSqoopClient(uuid);
        List<MLink> list = client.getLinks();
        for (MLink link : list) {
            if (link.getName().equals(COMMON_HDFS_LINK)) {
                if (link.getEnabled()) {
                    linkId = link.getPersistenceId();
                    break;
                }

            }
        }
        if (linkId == 0) {
            try {
                linkId = createHDFSLink(client, true);
            } catch (Exception e) {
                linkId = createHDFSLink(client, false);
            }

        }
        log.info("getHDFSLinkId linkId=" + linkId);
        return linkId;

    }

    /**
     * 建立 sqoop HDFS link
     *
     * @param client
     * @return
     */
    public static long createHDFSLink(SqoopClient client, boolean isCommon) {
        long processId = 0;
        MLink link = client.createLink(HDFS_CONNECT_ID);
        if (isCommon) {
            link.setName(COMMON_HDFS_LINK);
        } else {
            link.setName(COMMON_HDFS_LINK + System.currentTimeMillis());
        }

        link.setCreationUser(CONNECT_USER);
        MLinkConfig linkConfig = link.getConnectorLinkConfig();
        linkConfig.getStringInput("linkConfig.uri").setValue(HDFS_URL);
        Status status = client.saveLink(link);
        if (status.canProceed()) {
            processId = link.getPersistenceId();
            log.info("Created Link with Link Id :" + processId);
        } else {
            log.info("Something went wrong creating the link");
        }
        return processId;
    }

    /**
     * 获取链接名称
     *
     * @param datatype
     * @param ip
     * @param port
     * @param database
     * @param user
     * @param pass
     * @return
     * @throws Exception
     */
    public static String getFromLinkName(String datatype, String ip, String port, String database, String user, String pass) throws Exception {
        return MD5Util.getMd5Value((datatype + ip + port + database + user + pass));
    }

    /**
     * 根据uuid获取SqoopClient
     *
     * @param uuid
     * @return
     */
    public static SqoopClient getSqoopClient(String uuid) {
        if (StringUtils.isNotEmpty(uuid)) {
            if (SQOOP_CLIENT_MAP.get(uuid) != null) {
                return SQOOP_CLIENT_MAP.get(uuid);
            } else {
                return SQOOP_CLIENT_MAP.get(addSqoopClient(uuid));
            }

        } else {
            return SQOOP_CLIENT_MAP.get(addSqoopClient(uuid));
        }
    }

    /**
     * 添加sqoop client
     *
     * @return
     */
    public static String addSqoopClient(String uuid) {
        SqoopClient sqoopClient = new SqoopClient(SQOOP_URL);
        synchronized (SQOOP_CLIENT_MAP) {
            SQOOP_CLIENT_MAP.put(uuid, sqoopClient);
        }
        return uuid;

    }

    /**
     * 移除SqoopClient
     *
     * @param uuid
     */
    public static synchronized void removeSqoopClient(String uuid) {
        SQOOP_CLIENT_MAP.remove(uuid);
    }

    /**
     * 建立hdfs to mysql 任务
     * Link configuration:
     * linkConfig.uri,HDFS URI : null
     * <p>
     * From Job configuration:
     * fromJobConfig.inputDirectory,Input directory : null
     * <p>
     * ToJob configuration:
     * toJobConfig.outputFormat,Output format : null
     * toJobConfig.compression,Compression format : null
     * toJobConfig.customCompression,Custom compression format : null
     * toJobConfig.outputDirectory,Output directory : null
     * <p>
     * Link configuration:
     * linkConfig.jdbcDriver,JDBC Driver Class : null
     * linkConfig.connectionString,JDBC Connection String : null
     * linkConfig.username,Username : null
     * linkConfig.password,Password : null
     * linkConfig.jdbcProperties,JDBC Connection Properties : null
     * From database configuration:
     * fromJobConfig.schemaName,Schema name : null
     * fromJobConfig.tableName,Table name : null
     * fromJobConfig.sql,Table SQL statement : null
     * fromJobConfig.columns,Table column names : null
     * fromJobConfig.partitionColumn,Partition column name : null
     * fromJobConfig.allowNullValueInPartitionColumn,Null value allowed for the partition column : null
     * fromJobConfig.boundaryQuery,Boundary query : null
     * To database configuration:
     * toJobConfig.schemaName,Schema name : null
     * toJobConfig.tableName,Table name : null
     * toJobConfig.sql,Table SQL statement : null
     * toJobConfig.columns,Table column names : null
     * toJobConfig.stageTableName,Stage table name : null
     * toJobConfig.shouldClearStageTable,Should clear stage table : null
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
    static MJob createJobFromHdfs2JDBC(SqoopClient client, long fromLinkId, long toLinkId,
                                       String input, String tableName, String columns, int mappers) {
        MJob job = client.createJob(fromLinkId, toLinkId);
        job.setName("hdfs to mysql");
        job.setCreationUser("fansy");
// set the "FROM" link job config values
        MFromConfig fromJobConfig = job.getFromJobConfig();
        fromJobConfig.getStringInput("fromJobConfig.inputDirectory").setValue(input);
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
     * <p>
     * 建立从JDBC到hdfsjob
     * </p>
     *
     * @param client
     * @param fromLinkId
     * @param toLinkId
     * @param schemaName      库名
     * @param tableName       表名
     * @param selectColumns   要导出的字段
     * @param partitionColumn 分区字段一般按照主键或者createtime等
     * @param lastValue       最后一次分区字段值
     * @return
     */
    public static long createJobFromJDBC2HDFS(String dataType, SqoopClient client, long fromLinkId, long toLinkId,
                                              String schemaName, String tableName, String selectColumns,
                                              String partitionColumn, String lastValue) {
        MJob job = client.createJob(fromLinkId, toLinkId);
        job.setName(schemaName + tableName + System.currentTimeMillis());
        job.setCreationUser(CONNECT_USER);
        //设置源链接任务配置信息
        MFromConfig fromJobConfig = job.getFromJobConfig();
        DBMSMetaUtil.DATABASETYPE dbtype = DBMSMetaUtil.parseDATABASETYPE(dataType);
        //有分区字段并且分区字段值不为空
        if (StringUtils.isNotEmpty(partitionColumn)) {
            StringBuffer sqlBuffer = new StringBuffer();
            if (StringUtils.isNotEmpty(selectColumns)) {
                sqlBuffer.append(Constant.SQOOP_SELECT)
                        .append(selectColumns);

            } else {
                sqlBuffer.append(Constant.SQOOP_SELECT_ALL);

            }
            sqlBuffer.append(Constant.SQL_FROM);
            if (!dbtype.equals(DBMSMetaUtil.DATABASETYPE.ORACLE)) {
                sqlBuffer.append(schemaName).append(".");

            }
            sqlBuffer.append(tableName);
            sqlBuffer.append(Constant.SQL_WHERE);
            if (StringUtils.isNotEmpty(lastValue)) {

                sqlBuffer.append(partitionColumn)
                        .append(">'")
                        .append(lastValue)
                        .append("'");
                sqlBuffer.append(Constant.SQOOP_QUERY_AND);
            }
            sqlBuffer.append(Constant.SQOOP_QUERY_END);
            fromJobConfig.getStringInput("fromJobConfig.sql").setValue(sqlBuffer.toString());
            log.info("createJobFromJDBC2HDFS fromJobConfig.sql=" + sqlBuffer.toString());

        } else {
            fromJobConfig.getStringInput("fromJobConfig.schemaName").setValue(schemaName);
            log.info("createJobFromJDBC2HDFS fromJobConfig.schemaName=" + schemaName);
            fromJobConfig.getStringInput("fromJobConfig.tableName").setValue(tableName);
            log.info("createJobFromJDBC2HDFS fromJobConfig.tableName=" + tableName);
        }
        if (StringUtils.isNotEmpty(selectColumns)) {
            fromJobConfig.getStringInput("fromJobConfig.columns").setValue(selectColumns);
            log.info("createJobFromJDBC2HDFS fromJobConfig.columns=" + selectColumns);
        }
        if (StringUtils.isNotEmpty(partitionColumn)) {
            fromJobConfig.getStringInput("fromJobConfig.partitionColumn").setValue(partitionColumn);
            log.info("createJobFromJDBC2HDFS fromJobConfig.partitionColumn=" + partitionColumn);
        }
        log.info("createJobFromJDBC2HDFS fromJobConfig=" + fromJobConfig.toString());

        MToConfig toJobConfig = job.getToJobConfig();
        //获取hdfs输出路径
        toJobConfig.getStringInput("toJobConfig.outputDirectory").setValue(Constant.SQOOP_BASE_DIR + client.getLink(fromLinkId).getName() + "/");
        log.info("createJobFromJDBC2HDFS toJobConfig.outputDirectory=" + Constant.SQOOP_BASE_DIR + client.getLink(fromLinkId).getName() + "/");
        MDriverConfig driverConfig = job.getDriverConfig();
        Status status = client.saveJob(job);
        if (status.canProceed()) {
            log.info("JOB创建成功，ID为: " + job.getPersistenceId());
        } else {
            log.info("JOB创建失败。");
        }
        return job.getPersistenceId();
    }

    /**
     * 创建从hdfs到JDBC任务
     *
     * @param dataType
     * @param client
     * @param fromLinkId
     * @param toLinkId
     * @param schemaName
     * @param tableName
     * @param hdfsPath
     * @return
     */
    public static long createJobFromHDFS2JDBC(String dataType, SqoopClient client, long fromLinkId, long toLinkId,
                                              String schemaName, String tableName, String hdfsPath) {
        MJob job = client.createJob(fromLinkId, toLinkId);
        job.setName(schemaName + tableName + System.currentTimeMillis());
        job.setCreationUser(CONNECT_USER);
        MFromConfig fromJobConfig = job.getFromJobConfig();
        fromJobConfig.getStringInput("fromJobConfig.inputDirectory").setValue(hdfsPath);
        MToConfig toJobConfig = job.getToJobConfig();
        toJobConfig.getStringInput("toJobConfig.schemaName").setValue(schemaName);
        toJobConfig.getStringInput("toJobConfig.tableName").setValue(tableName);
        MDriverConfig driverConfig = job.getDriverConfig();
        Status status = client.saveJob(job);
        if (status.canProceed()) {
            log.info("JOB创建成功，ID为: " + job.getPersistenceId());
        } else {
            log.info("JOB创建失败。");
        }
        return job.getPersistenceId();
    }


    /**
     * 启动任务
     *
     * @param client
     * @param jobId
     */
    public static long startJob(SqoopClient client, long jobId) {
        long resultImport = 0;
        long start = System.currentTimeMillis();
        MSubmission submission = client.startJob(jobId);
        log.info("Job Submission Status : " + submission.getStatus());
        if (submission.getStatus().isRunning() && submission.getProgress() != -1) {
            log.info("Progress : " + String.format("%.2f %%", submission.getProgress() * 100));
        }
        log.info("Hadoop job id :" + submission.getExternalJobId());
        log.info("Job link : " + submission.getExternalLink());
        while (submission.getStatus().isRunning() && submission.getProgress() != -1) {
            System.out.println("进度 : " + String.format("%.2f %%", submission.getProgress() * 100));
            //三秒报告一次进度
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        log.info("JOB执行结束... ...");
        log.info("Hadoop任务ID为 :" + submission.getExternalJobId());
        Counters counters = submission.getCounters();
        if (counters != null) {
            System.out.println("计数器:");
            resultImport = counters.getCounterGroup(SQOOP_COUNT_CLASS).getCounter(SQOOP_ROWS_WRITTEN).getValue();
            for (CounterGroup group : counters) {
                System.out.print("\t");
                System.out.println(group.getName());
                if (group.getName().equals(SQOOP_COUNT_CLASS)) {

                }
                for (Counter counter : group) {
                    System.out.print("\t\t");
                    System.out.print(counter.getName());
                    System.out.print(": ");
                    System.out.println(counter.getValue());
                }
            }
        }
        if (submission.getError() != null) {
            log.info("JOB执行异常，异常信息为 : " + submission.getError());
        }
        log.info("MySQL通过sqoop传输数据到HDFS统计执行完毕 cost=" + (System.currentTimeMillis() - start) + "ms");
        return resultImport;

    }

    /**
     * 删除任务
     *
     * @param client
     * @param jobId
     */
    public static void deleteSqoopJob(SqoopClient client, long jobId) {
        client.deleteJob(jobId);

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

    /**
     * 数据从 jdbc load到hdfs上
     *
     * @param datatype
     * @param ip
     * @param port
     * @param database
     * @param user
     * @param pass
     * @param selectColumns
     * @param partitionColumn
     * @param lastValue
     * @param tableName
     * @return
     * @throws Exception
     */
    public static String loadJDBCData2Hdfs(String datatype, String ip, String port, String database, String user, String pass, String selectColumns,
                                           String partitionColumn, String lastValue, String tableName) throws Exception {
        //获取唯一标识
        String uuid = SqoopUtil.getFromLinkName(datatype, ip, port, database, user, pass);
        log.info("loadJDBCData2Hdfs uuid=" + uuid);
        //获取jdbc linkid
        long fromLinkId = SqoopUtil.getJDBCLinkId(datatype, ip, port, database, user, pass, uuid);
        log.info("loadJDBCData2Hdfs fromLinkId=" + fromLinkId);
        long toLinkId = SqoopUtil.getHDFSLinkId(uuid);
        log.info("loadJDBCData2Hdfs toLinkId=" + toLinkId);
        long jobId = SqoopUtil.createJobFromJDBC2HDFS(datatype, SqoopUtil.getSqoopClient(uuid), fromLinkId, toLinkId, database, tableName, selectColumns, partitionColumn, lastValue);
        log.info("loadJDBCData2Hdfs jobId=" + jobId);
        SqoopUtil.startJob(SqoopUtil.getSqoopClient(uuid), jobId);
        log.info("loadJDBCData2Hdfs jobId end ");
        //任务结束删除任务
        //deleteSqoopJob(SqoopUtil.getSqoopClient(uuid), jobId);
        return Constant.SQOOP_BASE_DIR + uuid + "/";
    }

    /**
     * 数据从hdfs->jdbc
     * @param datatype
     * @param ip
     * @param port
     * @param database
     * @param user
     * @param pass
     * @param tableName
     * @param hdfsURL
     * @throws Exception
     */
    public static void loadHdfsData2JDBC(String datatype, String ip, String port, String database, String user, String pass, String tableName, String hdfsURL) throws Exception {
        //获取唯一标识
        String uuid = SqoopUtil.getFromLinkName(datatype, ip, port, database, user, pass);
        log.info("loadHdfsData2JDBC uuid=" + uuid);
        long fromLinkId = SqoopUtil.getHDFSLinkId(uuid);
        log.info("loadHdfsData2JDBC fromLinkId=" + fromLinkId);
        //获取jdbc linkid
        long toLinkId = SqoopUtil.getJDBCLinkId(datatype, ip, port, database, user, pass, uuid);
        log.info("loadHdfsData2JDBC toLinkId=" + toLinkId);
        long jobId = SqoopUtil.createJobFromHDFS2JDBC(datatype, SqoopUtil.getSqoopClient(uuid), fromLinkId, toLinkId, database, tableName, hdfsURL);
        log.info("loadHdfsData2JDBC jobId=" + jobId);
        SqoopUtil.startJob(SqoopUtil.getSqoopClient(uuid), jobId);
        //任务结束删除任务
       // deleteSqoopJob(SqoopUtil.getSqoopClient(uuid), jobId);
        log.info("loadHdfsData2JDBC jobId end ");
    }

    public static void main(String[] args) throws Exception {
        String ip = "dbtestyun.e6xayf.com";
        String port = "8089";
        String dbname = "E6PlateFormMain";
        String username = "sa";
        String password = "xa1101";
        String databasetype = DBType.MAP_DB.get(3);
        String table = "Base.E6Driver";
        DBMSMetaUtil.DATABASETYPE dbtype = DBMSMetaUtil.parseDATABASETYPE(databasetype);
        System.out.println(concatSQOOPDBURL(dbtype, ip, port, dbname));
        System.out.println(DBMSMetaUtil.getJDBCDrive(dbtype));
        System.out.println("com.microsoft.sqlserver.jdbc.SQLServerDriver".equals("com.microsoft.sqlserver.jdbc.SQLServerDriver"));
        System.out.println("jdbc:sqlserver://dbtestyun.e6xayf.com:8089;database=E6PlateFormMain".equals("jdbc:sqlserver://dbtestyun.e6xayf.com:8089;database=E6PlateFormMain"));
        // org.apache.derby.impl.jdbc.EmbedSQLException
//        String uuid = SqoopUtil.addSqoopClient();
//        System.out.println(getJDBCLinkId(databasetype, ip, port, dbname, username, password, uuid));
//        System.out.println(getJDBCLinkId(databasetype, ip, port, dbname, username, password, uuid));
//        System.out.println(getHDFSLinkId(uuid));
//        System.out.println(getHDFSLinkId(uuid));
    }


}
