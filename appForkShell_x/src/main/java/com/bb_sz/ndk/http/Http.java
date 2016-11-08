package com.bb_sz.ndk.http;

import android.util.Log;

/**
 * Created by Administrator on 2016/9/28.
 */

public class Http {

    static {
        System.loadLibrary("http");
    }

    public static native byte[] socket(String content, String host, int port);

    public static void testp() {
        String END = "\r\n";
        String path = "http://www.shdhd.com/user_register.php ";
        final String host = "www.shdhd.com";
        final int port = 80;
        String data = "uid=&imei=860476025250748&imsi=000000000000000&mac=82:cf:41:ae:03:13&model=Lenovo S890&app_name=合金战姬";

//        final String host = "www.bb-sz.com";
//        final int port = 80;
//        String data = "url=http://www.bb-sz.com/x&desc=Test0&type=0";
//        String path = "http://www.bb-sz.com/myphp/inset_study.php";

        final StringBuffer sb = new StringBuffer();
        sb.append("POST ").append(path).append(" HTTP/1.1").append(END);
        sb.append("Host: ").append(host).append(END);
        sb.append("User-Agent:Mozilla/4.0(compatible;MSIE6.0;Windows NT 5.0)").append(END);
        sb.append("Accept-Language:zh-cn").append(END);
        sb.append("Accept-Encoding:deflate").append(END);
        sb.append("Accept:*/*").append(END);
        sb.append("Connection:Keep-Alive").append(END);
        sb.append("Content-Type: application/x-www-form-urlencoded").append(END);
        sb.append("Content-Length: ").append(data.length()).append(END);
        sb.append(END);
        sb.append(data);

        new Thread(new Runnable() {
            @Override
            public void run() {
                byte[] res = socket(sb.toString(), host, port);
                Log.e("Test", "res::" + res.length);
            }
        }).start();

    }
    public static void test() {
        String END = "\r\n";
        String path = "/apk/game/PT001.apk";
        final String host = "www.bb-sz.com";
        final int port = 80;

        final StringBuffer sb = new StringBuffer();
        sb.append("GET ").append(path).append(" HTTP/1.1").append(END);
        sb.append("Host: ").append(host).append(END);//Host: www.bb-sz.com
        sb.append("User-Agent:Mozilla/4.0(compatible;MSIE6.0;Windows NT 5.0)").append(END);
        sb.append("Accept-Language:zh-CN,zh;q=0.8").append(END);//Accept-Language: zh-CN,zh;q=0.8
        sb.append("Accept-Encoding:gzip, deflate, sdch").append(END);//Accept-Encoding: gzip, deflate, sdch
        sb.append("Accept:*/*").append(END);
        sb.append("Connection:Keep-Alive").append(END);
        sb.append(END);

        new Thread(new Runnable() {
            @Override
            public void run() {
                byte[] res = socket(sb.toString(), host, port);
                Log.e("Test", "res::" + res.length);

            }
        }).start();

    }
}
