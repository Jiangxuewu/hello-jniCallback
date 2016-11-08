package com.bb_sz.jni;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by Administrator on 2016/9/9.
 */
public class Http {

    public static String getHttpData(String url) {
        return getHttpData(url, "GET");
    }

    public static String getHttpData(String url, String method) {
        String str1 = "";
        try {
            HttpURLConnection localHttpURLConnection = (HttpURLConnection) new URL(url).openConnection();
            localHttpURLConnection.setDoOutput(true);
            localHttpURLConnection.setRequestMethod(method);
            BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(localHttpURLConnection.getInputStream(), "UTF-8"));
            String str2;
            while ((str2 = localBufferedReader.readLine()) != null) {
                str1 = str1 + str2;
            }
            localBufferedReader.close();
            System.out.println(str1);
            return str1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str1;
    }
}
