package com.hive.author;

import org.apache.hadoop.conf.Configurable;
import org.apache.hadoop.conf.Configuration;
import org.apache.hive.service.auth.PasswdAuthenticationProvider;

import javax.security.sasl.AuthenticationException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by houlongbin on 2016/11/3.
 */
public class HivePasswsAuthen implements PasswdAuthenticationProvider,Configurable {
    private Configuration conf=null;

    private static final String HIVE_JDBC_PASSWD_AUTH_PREFIX="hive.jdbc_passwd.auth.%s";

    public HivePasswsAuthen() {
        init();
    }

    /**
     *
     */
    public void init(){

    }

    @Override
    public void Authenticate(String userName, String passwd)
            throws AuthenticationException {

        String passwdMD5 = getConf().get(String.format(HIVE_JDBC_PASSWD_AUTH_PREFIX, userName));

        if(passwdMD5==null){
            String message = "user's ACL configration is not found. user:"+userName;
            throw new AuthenticationException(message);
        }

        String md5 = new MD5().md5(passwd);

        if(!md5.equals(passwdMD5)){
            String message = "user name and password is mismatch. user:"+userName;
            throw new AuthenticationException(message);
        }

    }

    @Override
    public Configuration getConf() {
        if(conf==null){
            this.conf=new Configuration();
        }

        return conf;
    }

    @Override
    public void setConf(Configuration arg0) {
        this.conf=arg0;
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
