package com.xust.ffms.configs;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5UtilSimple {

    /**
     * @param data
     * @return
     */
    public static String md5(String data) {
        StringBuilder sb = new StringBuilder();
        try {
            MessageDigest md = MessageDigest.getInstance("md5");
            byte[] md5 = md.digest(data.getBytes(StandardCharsets.UTF_8));

            // Convert byte data to hexadecimal
            for (byte b : md5) {
                sb.append(Integer.toHexString(b & 0xff));
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String password = "admin123";
        String md5HexStr = md5(password);
        System.out.println("==> MD5 pre-encryption: " + password);
        System.out.println("==> MD5 after-encryption: " + md5HexStr);
    }
}
