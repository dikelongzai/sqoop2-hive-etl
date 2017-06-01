package com.apache.sqoop.demo.task;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.apache.sqoop.demo.entity.DBType;
import com.apache.sqoop.demo.util.SqoopUtil;
import com.hive.util.CommonJDBCUtil;
import com.hive.util.DBDaTaType;
import com.hive.util.HiveUtil;
import com.quartz.core.Task;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.HashMap;

/**
 * Created by houlongbin on 2016/11/28.
 * <p>
 *     step 1 根据hsql创建hive临时表
 *     step 2 读取 临时表创建关系型数据库
 *     step 3 sqoop load数据
 *     step 4 删除临时表统计结果
 * </p>
 */
public class Hive2JDBCTask extends Task {
    private static final Log log = LogFactory.getLog(Hive2JDBCTask.class);

    @Override
    public void execute(HashMap hashMap) {
        long start = System.currentTimeMillis();
        //{"create_time":0,"datasource_database":"E6PlateFormMain","datasource_pass":"xa1101","datasource_port":8090,"datasource_table":"Base.E6Driver","datasource_table_columns":"","datasource_table_where_condition":"","datasource_url":"dbtestyun.e6xayf.com","datasource_user":"sa","from_datasource_type":3,"last_end_time":0,"lastpartitionColumnValue":"2014-08-19 02:22:07.000","sqoop_etl_id":1,"task_express":"0 07 11 * * ?","to_datasource_type":4,"update_time":0}
        log.info("------>Hive2JDBCTask execute");
        JSONObject json = JSON.parseObject(JSON.toJSONString(hashMap));
        try {
            //参数初始化
            String databaseType = DBType.MAP_DB.get(json.getInteger("from_datasource_type")).trim();
            String to_datasource_type = DBType.MAP_DB.get(json.getInteger("to_datasource_type")).trim();
            if (StringUtils.isEmpty(databaseType) || StringUtils.isEmpty(to_datasource_type)||(!databaseType.equals(DBDaTaType.DATABASE_TYPE_HIVE))) {
                throw new RuntimeException("from_datasource_type or  to_datasource_type must be in (1,2,3,4)");
            }
            String datasource_database = json.getString("datasource_database").trim();
            if (StringUtils.isEmpty(datasource_database)) {
                throw new RuntimeException("datasource_database must not be null ");
            }
            String datasource_port = json.getString("datasource_port").trim();
            if (StringUtils.isEmpty(datasource_port)) {
                throw new RuntimeException("datasource_port must not be null ");
            }
            String datasource_table = json.getString("datasource_table").trim();
            if (StringUtils.isEmpty(datasource_table)) {
                throw new RuntimeException("datasource_table must not be null ");
            }
            String datasource_user = json.getString("datasource_user").trim();
            if (StringUtils.isEmpty(datasource_user)) {
                throw new RuntimeException("datasource_user must not be null ");
            }
            String datasource_pass = json.getString("datasource_pass").trim();
            if (StringUtils.isEmpty(datasource_pass)) {
                throw new RuntimeException("datasource_pass must not be null ");
            }
            String datasource_url = json.getString("datasource_url").trim();
            if (StringUtils.isEmpty(datasource_url)) {
                throw new RuntimeException("datasource_url must not be null ");
            }
            String hive_sql = json.getString("datasource_table_where_condition").trim();
            if (StringUtils.isEmpty(hive_sql)) {
                throw new RuntimeException("datasource_table_where_condition must not be null ");
            }
            String hiveTmpTable=HiveUtil.getInstance().initTmpHiveTable(hive_sql,datasource_table);
            log.info("Hive2JDBCTask hiveinitTable="+hiveTmpTable+"cost="+(System.currentTimeMillis()-start)+"ms;");
            start=System.currentTimeMillis();
            CommonJDBCUtil.createJdbcTable(to_datasource_type,datasource_url,datasource_port,datasource_database,datasource_user,datasource_pass,datasource_table,hiveTmpTable);
            log.info("Hive2JDBCTask createJdbcTable "+datasource_table+"cost="+(System.currentTimeMillis()-start)+"ms;");
            start=System.currentTimeMillis();
            String hiveTmpHdfsPath=HiveUtil.getInstance().getHiveHdfsPath(hiveTmpTable,"");
            log.info("Hive2JDBCTask getHiveHdfsPath="+hiveTmpHdfsPath+"cost="+(System.currentTimeMillis()-start)+"ms;");
            start=System.currentTimeMillis();
            SqoopUtil.loadHdfsData2JDBC(to_datasource_type,datasource_url,datasource_port,datasource_database,datasource_user,datasource_pass,datasource_table,hiveTmpHdfsPath);
            log.info("Hive2JDBCTask loadHdfsData2JDBC cost="+(System.currentTimeMillis()-start)+"ms;");
            start=System.currentTimeMillis();
            HiveUtil.getInstance().dropHiveTable(hiveTmpTable,"");
            log.info("Hive2JDBCTask dropHiveTable="+hiveTmpTable+" cost="+(System.currentTimeMillis()-start)+"ms;");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
