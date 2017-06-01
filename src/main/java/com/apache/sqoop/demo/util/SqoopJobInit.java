package com.apache.sqoop.demo.util;

import com.alibaba.fastjson.JSON;
import com.apache.sqoop.demo.entity.DBType;
import com.apache.sqoop.demo.entity.SqoopTask;
import com.hive.util.DBMSMetaUtil;
import com.hive.util.HiveUtil;
import com.quartz.core.Mouse;
import com.quartz.util.JDBC;
import com.quartz.util.PropertiesUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 * Created by houlongbin on 2016/11/1.
 */
public class SqoopJobInit {
    private static final Log log = LogFactory.getLog(SqoopJobInit.class);

    public static void init() throws Exception {
        etlInit();
        //每分钟定时检查是否有改变的etl定时任务
        Timer timer = new Timer();
        timer.schedule(new SqoopJobInit.CheckTimer(), new Date(), 60000);
    }
    public static void etlInit()throws Exception{
        //清除数据迁移Job
        truncateSqoopJob();
        initSqoopEtlTask();
    }
    static void initSqoopEtlTask() throws Exception {
        String sql = "SELECT * FROM sqoop_etl_task WHERE STATE='1'";
        SqoopTask[] sqoopTasks = getJobTaskBean(sql, null);

        for (SqoopTask bean : sqoopTasks) {
            String lastpartitionColumnValue = getlastpartitionColumnValueByETLID(bean.getSqoop_etl_id());
            if (StringUtils.isNotEmpty(lastpartitionColumnValue)) {
                bean.setLastpartitionColumnValue(lastpartitionColumnValue);
            }
            StringBuffer sqlBuffer = new StringBuffer("INSERT INTO job_task(STATE,TASK_JAR_PATH,CREATE_DATE,STATE_DATE,PARMS,TASK_EXPRESS,TASK_IMPL_CLASS,TASK_CODE,TASK_TYPE) SELECT 'U','',(SELECT NOW() FROM DUAL),(SELECT NOW() FROM DUAL),");
            sqlBuffer.append("'").append(JSON.toJSONString(bean)).append("',");
            log.info("------------->initSqoopEtlTask sqoop task bean=" + JSON.toJSONString(bean));
            if (StringUtils.isNotEmpty(bean.getTask_express())) {
                sqlBuffer.append("'").append(bean.getTask_express()).append("',");
                if (bean.getFrom_datasource_type() <= 3 && bean.getTo_datasource_type() == DBType.HIVE_DBTYPE) {
                    sqlBuffer.append("'com.apache.sqoop.demo.task.JDBC2HiveETLTask',");
                    sqlBuffer.append("'sqoop_etl_task").append(bean.getSqoop_etl_id() + "','sqoop_etl_task'");
                    execeteUpdate(sqlBuffer.toString());
                }else{
                    sqlBuffer.append("'com.apache.sqoop.demo.task.Hive2JDBCTask',");
                    sqlBuffer.append("'sqoop_etl_task").append(bean.getSqoop_etl_id() + "','sqoop_etl_task'");
                    execeteUpdate(sqlBuffer.toString());
                }

            } else {
                throw new RuntimeException(" spoop job task Task_express must not be null");
            }

            //baseSql.
        }


    }

    public static String getlastpartitionColumnValueByETLID(long etlTaskId) throws Exception {
        String lastValue = "";
        Connection con = JDBC.getConnection();
        String sql = "SELECT partitionColumn_last_value FROM sqoop_etl_task_lastvalue WHERE sqoop_etl_id=" + etlTaskId;
        PreparedStatement ps = JDBC.execStatementValues(con, sql, null);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            lastValue = rs.getString("partitionColumn_last_value");
        }
        log.info("------------->getlastpartitionColumnValueByETLID sql=" + sql + ";result=" + lastValue);
        return lastValue;

    }

    public static SqoopTask[] getJobTaskBean(String sql, HashMap map) throws Exception {
        Connection con = JDBC.getConnection();
        PreparedStatement ps = JDBC.execStatementValues(con, sql, map);
        ResultSet rs = ps.executeQuery();
        ArrayList list = new ArrayList();
        while (rs.next()) {
            SqoopTask bean = new SqoopTask();
            bean.setSqoop_etl_id(rs.getLong("sqoop_etl_id"));
            bean.setCreate_time(rs.getLong("create_time"));
            bean.setDatasource_url(rs.getString("datasource_url"));
            bean.setDatasource_port(rs.getInt("datasource_port"));
            bean.setDatasource_user(rs.getString("datasource_user"));
            bean.setDatasource_pass(rs.getString("datasource_pass"));
            bean.setFrom_datasource_type(rs.getInt("from_datasource_type"));
            bean.setTo_datasource_type(rs.getInt("to_datasource_type"));
            bean.setDatasource_table(rs.getString("datasource_table"));
            bean.setDatasource_table_columns(rs.getString("datasource_table_columns"));
            bean.setDatasource_table_where_condition(rs.getString("datasource_table_where_condition"));
            bean.setTask_express(rs.getString("task_express"));
            bean.setDatasource_database(rs.getString("datasource_database"));
            bean.setPartitionColumn(rs.getString("partitionColumn"));

            list.add(bean);
        }
        rs.close();
        con.close();
        return list.size() == 0 ? null : (SqoopTask[]) ((SqoopTask[]) list.toArray(new SqoopTask[0]));
    }

    /**
     * <p>
     * 清除sqoop_etl_task
     * </p>
     */
    static void truncateSqoopJob() {
        try {
            Connection con = JDBC.getConnection();
            String sql = "UPDATE  job_task SET STATE='N' WHERE TASK_TYPE='sqoop_etl_task'";
            HashMap m = new HashMap();
            PreparedStatement ps = JDBC.execStatementValues(con, sql, m);
            ps.executeUpdate();
            log.info("------------->execeteUpdate sql=" + sql);
            con.close();
            ps.close();
        } catch (Exception e1) {
            e1.printStackTrace();
        }
    }

    static void execeteUpdate(String sql) {
        try {
            Connection con = JDBC.getConnection();
            HashMap m = new HashMap();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.executeUpdate();
            log.info("------------->execeteUpdate sql=" + sql);
            con.close();
        } catch (Exception e1) {
            e1.printStackTrace();
        }
    }

    public static void updateLastValue(long etl_id, String lastValue, String hiveTable) {
        String sql = "REPLACE INTO sqoop_etl_task_lastvalue(sqoop_etl_id,partitionColumn_last_value,result_table)SELECT " + etl_id + ",'" + lastValue + "','" + hiveTable + "'";
        log.info("updateLastValue sql=" + sql);
        execeteUpdate(sql);
    }

    /**
     * 检测是否有数据更改
     */
    static class CheckTimer extends TimerTask {
        CheckTimer() {
        }
        public void run() {
            log.info(" sqoop_etl_task check is need reload");
            try {
                //如果有新的数据源动态加入进来或者调整某一些etl参数则写入参数需要修改 等待 quartz.job.isneedreload 每5秒的线程发现重新加载job
                if (isNeedReload()) {
                    log.info("sqoop_etl_task check need reload");
                    PropertiesUtils.writeData("quartzcore.properties", "quartz.job.isneedreload", "true");
                    log.info(" sqoop_etl_task check need reload CheckTimer change quartz.job.isneedreload true ");
                    //重新加载
                    etlInit();
                    //重置状态
                    execeteUpdate("UPDATE sqoop_etl_task SET   is_need_reload=0 WHERE STATE='1' AND is_need_reload=1");
                    log.info("reload success");
                }
            } catch (Exception e) {
                log.error("reload exception" + e.getMessage());
                e.printStackTrace();
            }
        }

        protected boolean isNeedReload() throws Exception {
            String sql = "SELECT COUNT(1) as count  FROM sqoop_etl_task WHERE STATE='1' AND is_need_reload=1";
            long count = 0;
            Connection con = JDBC.getConnection();
            PreparedStatement ps = JDBC.execStatementValues(con, sql, null);
            ResultSet rs = ps.executeQuery();
            ArrayList list = new ArrayList();
            while (rs.next()) {
                count = rs.getInt("count");
            }
            DBMSMetaUtil.close(con);
            DBMSMetaUtil.close(ps);
            DBMSMetaUtil.close(rs);
            if (count > 0) {
                return true;
            } else {
                return false;
            }


        }
    }

    public static void main(String[] args) throws Exception {
        updateLastValue(1, "2016-05-17 10:04:22.000", "schema_E6PlateFormMain_Base_table_E6Driver");
        // init();
    }
}
