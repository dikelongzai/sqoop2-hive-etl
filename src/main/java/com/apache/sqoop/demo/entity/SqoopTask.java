package com.apache.sqoop.demo.entity;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;

import java.io.Serializable;

/**
 * Created by houlongbin on 2016/11/1.
 */
public class SqoopTask implements Serializable{
    private long sqoop_etl_id=0;
    /* * 任务执行时间*/
    private String task_express;
    /* * 数据库链接地址*/
    private String datasource_url;
    /* * 数据库链接端口 */
    private int  datasource_port;
    /* * 数据库用户名 */
    private String datasource_user;
    /* * 数据库密码 */
    private String datasource_pass;
    /* * 迁移数据表名 */
    private String datasource_table;
    /* * 迁移数据表字段已,分割 */
    private String datasource_table_columns;
    /* * 迁移数据where条件 */
    private String datasource_table_where_condition;
    /* * 分区字段一般是主键没有主键的情况下createtime等也ok */
    private String partitionColumn;
    /* * 最后一次成功导入的最大分区字段值 */
    private String lastpartitionColumnValue;
    /* * 创建时间13位时间戳 */
    private long create_time;
    /* * 更新时间13位时间戳 */
    private long update_time;
    /* * 最后任务结束时间13位时间戳 */
    private long last_end_time;
    /* * 1代表来源为msyql,2来源为Oracle,3来源为mssql4*/
    private Integer from_datasource_type;
    /* * 1代表hive*/
    private Integer to_datasource_type;

    public String getLast_Value() {
        return last_Value;
    }

    public void setLast_Value(String last_Value) {
        this.last_Value = last_Value;
    }

    private String last_Value;

    public Integer getFrom_datasource_type() {
        return from_datasource_type;
    }

    public void setFrom_datasource_type(Integer from_datasource_type) {
        this.from_datasource_type = from_datasource_type;
    }

    public Integer getTo_datasource_type() {
        return to_datasource_type;
    }

    public void setTo_datasource_type(Integer to_datasource_type) {
        this.to_datasource_type = to_datasource_type;
    }



    public String getTask_express() {
        return task_express;
    }

    public void setTask_express(String task_express) {
        this.task_express = task_express;
    }


    public String getPartitionColumn() {
        return partitionColumn;
    }

    public void setPartitionColumn(String partitionColumn) {
        this.partitionColumn = partitionColumn;
    }

    public String getLastpartitionColumnValue() {
        return lastpartitionColumnValue;
    }

    public void setLastpartitionColumnValue(String lastpartitionColumnValue) {
        this.lastpartitionColumnValue = lastpartitionColumnValue;
    }



    public String getDatasource_database() {
        return datasource_database;
    }

    public void setDatasource_database(String datasource_database) {
        this.datasource_database = datasource_database;
    }

    private String datasource_database;
    public long getSqoop_etl_id() {
        return sqoop_etl_id;
    }

    public void setSqoop_etl_id(long sqoop_etl_id) {
        this.sqoop_etl_id = sqoop_etl_id;
    }



    public String getDatasource_url() {
        return datasource_url;
    }

    public void setDatasource_url(String datasource_url) {
        this.datasource_url = datasource_url;
    }

    public int getDatasource_port() {
        return datasource_port;
    }

    public void setDatasource_port(int datasource_port) {
        this.datasource_port = datasource_port;
    }

    public String getDatasource_user() {
        return datasource_user;
    }

    public void setDatasource_user(String datasource_user) {
        this.datasource_user = datasource_user;
    }

    public String getDatasource_pass() {
        return datasource_pass;
    }

    public void setDatasource_pass(String datasource_pass) {
        this.datasource_pass = datasource_pass;
    }

    public String getDatasource_table() {
        return datasource_table;
    }

    public void setDatasource_table(String datasource_table) {
        this.datasource_table = datasource_table;
    }

    public String getDatasource_table_columns() {
        return datasource_table_columns;
    }

    public void setDatasource_table_columns(String datasource_table_columns) {
        this.datasource_table_columns = datasource_table_columns;
    }

    public String getDatasource_table_where_condition() {
        return datasource_table_where_condition;
    }

    public void setDatasource_table_where_condition(String datasource_table_where_condition) {
        this.datasource_table_where_condition = datasource_table_where_condition;
    }

    public long getCreate_time() {
        return create_time;
    }

    public void setCreate_time(long create_time) {
        this.create_time = create_time;
    }

    public long getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(long update_time) {
        this.update_time = update_time;
    }

    public long getLast_end_time() {
        return last_end_time;
    }

    public void setLast_end_time(long last_end_time) {
        this.last_end_time = last_end_time;
    }

    @Override
    public String toString() {
        return super.toString();
    }





}
