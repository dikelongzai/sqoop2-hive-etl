package com.apache.sqoop.demo.task;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.apache.sqoop.demo.entity.DBType;
import com.apache.sqoop.demo.util.SqoopJobInit;
import com.apache.sqoop.demo.util.SqoopUtil;
import com.hive.util.HiveUtil;
import com.quartz.core.Task;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.HashMap;

/**
 * <p>
 *     第一步数据导出返回hdfs路径
 *     第二步hive建标
 *     第三部数据从hdfs导出到hive
 *     第四步统计结果
 * </p>
 * Created by houlongbin on 2016/11/2.
 */
public class JDBC2HiveETLTask extends Task{
    private static final Log log = LogFactory.getLog(JDBC2HiveETLTask.class);
    @Override
    public void execute(HashMap hashMap) {
        long start=System.currentTimeMillis();
        //{"create_time":0,"datasource_database":"E6PlateFormMain","datasource_pass":"xa1101","datasource_port":8090,"datasource_table":"Base.E6Driver","datasource_table_columns":"","datasource_table_where_condition":"","datasource_url":"dbtestyun.e6xayf.com","datasource_user":"sa","from_datasource_type":3,"last_end_time":0,"lastpartitionColumnValue":"2014-08-19 02:22:07.000","sqoop_etl_id":1,"task_express":"0 07 11 * * ?","to_datasource_type":4,"update_time":0}
        log.info("------>JDBC2HiveETLTask execute");
        JSONObject json=JSON.parseObject(JSON.toJSONString(hashMap));
        try {
            //参数初始化
            String databaseType= DBType.MAP_DB.get(json.getInteger("from_datasource_type")).trim();
            String to_datasource_type= DBType.MAP_DB.get(json.getInteger("to_datasource_type")).trim();
            if(StringUtils.isEmpty(databaseType)||StringUtils.isEmpty(to_datasource_type)){
                throw new RuntimeException("from_datasource_type or  to_datasource_type must be in (1,2,3,4)");
            }
            String datasource_database=json.getString("datasource_database").trim();
            if(StringUtils.isEmpty(datasource_database)){
                throw new RuntimeException("datasource_database must not be null ");
            }
            String datasource_port=json.getString("datasource_port").trim();
            if(StringUtils.isEmpty(datasource_port)){
                throw new RuntimeException("datasource_port must not be null ");
            }
            String datasource_table=json.getString("datasource_table").trim();
            if(StringUtils.isEmpty(datasource_table)){
                throw new RuntimeException("datasource_table must not be null ");
            }
            String datasource_user=json.getString("datasource_user").trim();
            if(StringUtils.isEmpty(datasource_user)){
                throw new RuntimeException("datasource_user must not be null ");
            }
            String datasource_pass=json.getString("datasource_pass").trim();
            if(StringUtils.isEmpty(datasource_pass)){
                throw new RuntimeException("datasource_pass must not be null ");
            }
            String datasource_url=json.getString("datasource_url").trim();
            if(StringUtils.isEmpty(datasource_url)){
                throw new RuntimeException("datasource_url must not be null ");
            }
            String datasource_table_columns=json.getString("datasource_table_columns");
            if (StringUtils.isNotEmpty(datasource_table_columns)){
                datasource_table_columns=datasource_table_columns.trim();
            }
            String lastpartitionColumnValue=json.getString("lastpartitionColumnValue");
            if (StringUtils.isNotEmpty(lastpartitionColumnValue)){
                lastpartitionColumnValue=lastpartitionColumnValue.trim();
            }
            String partitionColumn=json.getString("partitionColumn");
            if (StringUtils.isNotEmpty(partitionColumn)){
                partitionColumn=partitionColumn.trim();
            }
            //获取hdfs路径
            String hdfsPath=SqoopUtil.loadJDBCData2Hdfs(databaseType,datasource_url,datasource_port,datasource_database,datasource_user,datasource_pass,datasource_table_columns,partitionColumn,lastpartitionColumnValue,datasource_table);
            log.info("sqoop load over cost="+(System.currentTimeMillis()-start)+"ms;hdfsPath="+hdfsPath);
            start=System.currentTimeMillis();
            //hive表初始化
            HiveUtil.getInstance().initTable(datasource_table,databaseType,datasource_url,datasource_port,datasource_database,datasource_user,datasource_pass);
            log.info("hive table init over cost"+(System.currentTimeMillis()-start)+"ms;");
            start=System.currentTimeMillis();
            //hive数据load
            HiveUtil.getInstance().loadData(HiveUtil.getHiveTableName(datasource_table,datasource_database),hdfsPath);
            log.info("hive load data over cost"+(System.currentTimeMillis()-start)+"ms;");
            start=System.currentTimeMillis();
            if(StringUtils.isNotEmpty(partitionColumn)){
                String maxColumns=HiveUtil.getInstance().getMaxDefaultColumns(datasource_table,datasource_database,partitionColumn);
                log.info("hive getMaxgetMaxDefaultColumns cost "+(System.currentTimeMillis()-start)+"ms;maxColumns="+maxColumns);
                SqoopJobInit.updateLastValue(json.getLong("sqoop_etl_id"),maxColumns.replaceAll("'",""),HiveUtil.getHiveTableName(datasource_table,datasource_database));

            }






        }catch (Exception e){
            e.printStackTrace();
        }finally {

        }





    }
}
