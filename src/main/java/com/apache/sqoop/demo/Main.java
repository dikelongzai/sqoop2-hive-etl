package com.apache.sqoop.demo;

import com.apache.sqoop.demo.dataimport.Import;
import com.apache.sqoop.demo.util.SqoopJobInit;
import com.quartz.core.Mouse;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by houlongbin on 2016/11/1.
 */
public class Main {
    public static void main(String[] args) throws Exception{
        SqoopJobInit.init();
        Mouse.run();
    }

}
