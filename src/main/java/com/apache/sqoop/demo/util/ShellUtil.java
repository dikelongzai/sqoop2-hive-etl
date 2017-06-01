package com.apache.sqoop.demo.util;

import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.ArrayList;
import java.util.List;

/**
 * 注:如果sh中含有awk,一定要按new String[]{"/bin/sh","-c",shStr}写,才可以获得流
 * Created by houlongbin on 2016/11/1.
 */
public class ShellUtil {
    /**
     * 运行shell脚本
     * @param shell 需要运行的shell脚本
     */
    public static void execShell(String shell){
        try {
            Runtime rt = Runtime.getRuntime();
            rt.exec(shell);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 运行shell
     *
     * @param shStr
     *            需要执行的shell
     * @return
     * @throws IOException
     */
    public static List runShell(String shStr) throws Exception {
        List<String> strList = new ArrayList();

        Process process;
        process = Runtime.getRuntime().exec(new String[]{"/bin/sh","-c",shStr},null,null);
        InputStreamReader ir = new InputStreamReader(process
                .getInputStream());
        LineNumberReader input = new LineNumberReader(ir);
        String line;
        process.waitFor();
        while ((line = input.readLine()) != null){
            strList.add(line);
        }

        return strList;
    }
    public  void test() throws Exception{
        String shpath="/test/test.sh";   //程序路径

        Process process =null;

        String command1 = "chmod 777 " + shpath;
        process = Runtime.getRuntime().exec(command1);
        process.waitFor();




        String var="201102";               //参数

        String command2 = "/bin/sh " + shpath + " " + var;
        Runtime.getRuntime().exec(command2).waitFor();
    }

}
