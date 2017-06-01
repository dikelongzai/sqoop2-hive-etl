package com.apache.sqoop.demo.entity;

import com.hive.util.DBDaTaType;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by houlongbin on 2016/11/2.
 */
public class DBType {
    public static final int MYSQL_DBTYPE = 1;
    public static final int ORACLE_DBTYPE = 2;
    public static final int MSSQL_DBTYPE = 3;
    public static final int HIVE_DBTYPE = 4;
    public static Map<Integer,String> MAP_DB= Collections.synchronizedMap(new HashMap<Integer,String>());
    static {
        MAP_DB.put(MYSQL_DBTYPE, DBDaTaType.DATABASE_TYPE_MYSQL);
        MAP_DB.put(ORACLE_DBTYPE,DBDaTaType.DATABASE_TYPE_ORACLE);
        MAP_DB.put(MSSQL_DBTYPE,DBDaTaType.DATABASE_TYPE_MSSQL);
        MAP_DB.put(HIVE_DBTYPE,DBDaTaType.DATABASE_TYPE_HIVE);
    }

}
