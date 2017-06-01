package com.hive.author;

import java.sql.*;

/**
 * Created by houlongbin on 2016/11/3.
 */
public class HiveJdbcClient {
    private static String driverName = "org.apache.hive.jdbc.HiveDriver";

    public boolean run() {

        try {
            Class.forName(driverName);
            Connection con = null;
            con = DriverManager.getConnection(
                    "jdbc:hive2://192.168.8.207:10000/", "hadoop", "hadoop");
            Statement stmt = con.createStatement();
            ResultSet res = null;

            String sql = "select count(*) from test_data";

            System.out.println("Running: " + sql);
            res = stmt.executeQuery(sql);
            System.out.println("ok");
            while (res.next()) {
                System.out.println(res.getString(1));

            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error");
            return false;
        }

    }

    public static void main(String[] args) throws SQLException {
        HiveJdbcClient hiveJdbcClient = new HiveJdbcClient();
        hiveJdbcClient.run();
    }
}
