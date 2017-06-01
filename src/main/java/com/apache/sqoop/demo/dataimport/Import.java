package com.apache.sqoop.demo.dataimport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
//import org.apache.sqoop.Sqoop;
//import org.apache.sqoop.tool.ImportTool;

import java.util.ArrayList;
import java.util.Map;

/**
 * Created by houlongbin on 2016/11/1.
 */
public class Import {
    public static final Log LOG = LogFactory.getLog(Import.class);
    public static int importHiveFromMysql(Map<String, String> param)throws Exception{
        LOG.info("------------------>import begin");
        long start=System.currentTimeMillis();
        int num=0;
        ArrayList<String> list = new ArrayList<String>();
        list.add("--connect");
        list.add(param.get("url"));
        list.add("--username");
        list.add(param.get("userName")); // 数据库的用户名
        list.add("--password");
        list.add(param.get("pwd")); // 数据库的密码
        list.add("--table");
        list.add(param.get("tableName")); // 数据库中的表。
        list.add("--hive-import");
        list.add("--null-string");
        list.add("'\\\\N'");
        list.add("--null-non-string");
        list.add("'\\\\N'");
        list.add("-m");
        list.add(param.get("m"));// 定义mapreduce的数量。
        String[] arg = new String[1];
//        ImportTool importer = new ImportTool();
//        Sqoop sqoop = new Sqoop(importer);
//        arg = list.toArray(new String[0]);
//        num=Sqoop.runSqoop(sqoop, arg);
        LOG.info("------------------>import param="+list.toString()+";cost="+(System.currentTimeMillis()-start)+"ms");
        return num;

    }
    public static int importHbase(Map<String, String> param) throws Exception {
        ArrayList<String> list = new ArrayList<String>();
        list.add("--connect");
        list.add(param.get("url"));
        list.add("--username");
        list.add(param.get("userName")); // 数据库的用户名
        list.add("--password");
        list.add(param.get("pwd")); // 数据库的密码
        list.add("--table");
        list.add(param.get("tableName")); // 数据库中的表。
        list.add("--columns");
        list.add(param.get("columns")); // 将导入指定字段
        list.add("--hbase-table");
        list.add(param.get("hbaseTableName"));// 导入hbase指定表
        list.add("--column-family");
        list.add(param.get("hbaseColumnFamily"));
        list.add("--hbase-row-key");
        list.add(param.get("rowKey"));// 记录边界
        list.add("--split-by");
        list.add(param.get("split"));
        list.add("-m");
        list.add(param.get("m"));// 定义mapreduce的数量。
        String[] arg = new String[1];
//        ImportTool importer = new ImportTool();
//        Sqoop sqoop = new Sqoop(importer);
//        arg = list.toArray(new String[0]);
//        return Sqoop.runSqoop(sqoop, arg);
        return 0;
    }
}
