package com.sqoop.demo.test;

import com.apache.sqoop.demo.util.SqoopUtil;
import junit.framework.TestCase;

/**
 * Created by houlongbin on 2016/11/15.
 */
public class SqoopUtilTest  extends TestCase {
   public void testCreateJdbkCon()throws Exception{
       String ip= "dbtestyun.e6xayf.com";
       String port= "8089";
       String dbname= "E6PlateFormMain";
       String username= "sa";
       String password= "xa1101";
       String databasetype= "SQL Server2008";
       String table="Base.E6Driver";
      // org.apache.derby.impl.jdbc.EmbedSQLException
//       String uuid= SqoopUtil.addSqoopClient();
//       System.out.println(SqoopUtil.getJDBCLinkId(databasetype,ip,port,dbname,username,password,uuid));
//       System.out.println(SqoopUtil.getJDBCLinkId(databasetype,ip,port,dbname,username,password,uuid));
    }
}
