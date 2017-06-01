package com.hive.author;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.security.sasl.AuthenticationException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hive.conf.HiveConf;
import org.apache.hive.service.auth.PasswdAuthenticationProvider;

/**
 * Created by houlongbin on 2016/11/3.
 */
public class CustomHiveServer2Auth implements PasswdAuthenticationProvider {
    public void Authenticate(String username, String password)
            throws AuthenticationException {

        boolean ok = false;
        String passMd5 = new MD5().md5(password);
        HiveConf hiveConf = new HiveConf();
        Configuration conf = new Configuration(hiveConf);
        String filePath = conf.get("hive.server2.custom.authentication.file");
        System.out.println("hive.server2.custom.authentication.file [" + filePath + "] ..");
        File file = new File(filePath);
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            while ((tempString = reader.readLine()) != null) {
                String[] datas = tempString.split(",", -1);
                if(datas.length != 2) continue;
                //ok
                if(datas[0].equals(username) && datas[1].equals(passMd5)) {
                    ok = true;
                    break;
                }
            }
            reader.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new AuthenticationException("read auth config file error, [" + filePath + "] ..", e);
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {}
            }
        }
        if(ok) {
            System.out.println("user [" + username + "] auth check ok .. ");
        } else {
            System.out.println("user [" + username + "] auth check fail .. ");
            throw new AuthenticationException("user [" + username + "] auth check fail .. ");
        }
    }

    //MD5加密
    class MD5 {
        private MessageDigest digest;
        private char hexDigits[] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
        public MD5() {
            try {
                digest = MessageDigest.getInstance("MD5");
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }
        }

        public String md5(String str) {
            byte[] btInput = str.getBytes();
            digest.reset();
            digest.update(btInput);
            byte[] md = digest.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char strChar[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                strChar[k++] = hexDigits[byte0 >>> 4 & 0xf];
                strChar[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(strChar);
        }
    }
}
