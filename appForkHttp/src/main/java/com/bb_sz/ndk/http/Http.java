package com.bb_sz.ndk.http;

import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by Administrator on 2016/9/28.
 */

public class Http {

    static {
        System.loadLibrary("http");
    }

    public static native byte[] socket(String content, String host, int port);

    public static native int download(String url, String fileName, String localPath);

    public static void test() {
        String END = "\r\n";
        String path = "/user_register.php ";
        final String host = "www.shdhd.com";
        final int port = 80;
        String data = "uid=1610171013128384118&imei=866713021751194&imsi=460011082206904&mac=32:d6:8a:75:3d:a4&model=HM NOTE 1LTE&app_name=合金战姬&ver=1&is_register=0";

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
                int len = res.length;
                byte[] content = null;
                int j = 0;
                int cLen = 0;
                for (int i = 0; i < len; i++) {
                    if (res[i] == 13 && res[i + 1] == 10 && res[i + 2] == 13 && res[i + 3] == 10 ) {
                        Log.d("Test", "res:: start");
                        content = new byte[len - i - 4];
                        System.arraycopy(res, i + 4, content, 0, len - i - 4);
//                        saveContent(content);
                        break;
                    } else if (res[i] == 13 && res[i + 1] == 10) {
                        byte[] tmp = new byte[i - j];
                        System.arraycopy(res, j, tmp, 0, tmp.length);
                        String tt = new String(tmp);
                        Log.i("Test", "res::" + tt);
                        if (tt.contains("Content-Length:") && tt.contains(" ")){
//                            cLen = Integer.valueOf(tt.split(" ")[1]);
                            String len2 = tt.split("[ ]")[1];
                            Log.i("Test", "res::len2::" + len2);
                            cLen = Integer.valueOf(len2);
                            Log.i("Test", "res::cLen::" + cLen);
                        }
                        j = i;
                    }
                }
            }
        }).start();

    }

    public static void testp() {
        String END = "\r\n";
//        String path = "http://www.bb-sz.com/apk/hjzj.txt";
        String path = "http://www.bb-sz.com/apk/live.apk";
//        String path = "http://www.bb-sz.com/a/index.php?d=all";
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
                int len = res.length;
                byte[] content = null;
                int j = 0;
                int cLen = 0;
                for (int i = 0; i < len; i++) {
                    if (res[i] == 13 && res[i + 1] == 10 && res[i + 2] == 13 && res[i + 3] == 10 ) {
                        Log.d("Test", "res:: start");
                        content = new byte[len - i - 4];
                        System.arraycopy(res, i + 4, content, 0, len - i - 4);
                        saveContent(content);
                        break;
                    } else if (res[i] == 13 && res[i + 1] == 10) {
                        byte[] tmp = new byte[i - j];
                        System.arraycopy(res, j, tmp, 0, tmp.length);
                        String tt = new String(tmp);
                        Log.i("Test", "res::" + tt);
                        if (tt.contains("Content-Length:") && tt.contains(" ")){
//                            cLen = Integer.valueOf(tt.split(" ")[1]);
                            String len2 = tt.split("[ ]")[1];
                            Log.i("Test", "res::len2::" + len2);
                            cLen = Integer.valueOf(len2);
                            Log.i("Test", "res::cLen::" + cLen);
                        }
                        j = i;
                    }
                }
            }

        }).start();

    }

    private static void saveContent(byte[] content) {
        try {
                    File file = new File("/sdcard/Download/Apk/live.apk");
//            File file = new File("/sdcard/Download/Apk/hjzj.txt");
            if (!file.exists()) {
                file.createNewFile();
            }
            FileOutputStream localFileOutputStream = new FileOutputStream(file);
            localFileOutputStream.write(content);
            localFileOutputStream.close();
            Log.i("Test", "end saveContent");
        } catch (IOException localIOException) {
            throw new RuntimeException(localIOException);
        }
    }

    private static void handlerRes(byte[] res) {
        Log.e("Test", "res::" + res.length);
//        saveContent(res);
        int len = res.length;
        byte[] content = null;
        int j = 0;
        int cLen = 0;
        int contentStart = -1;
        int contentEnd = -1;
        boolean isHeader = true;
        boolean isContent = false;
        StringBuffer header = new StringBuffer();
        StringBuffer response = new StringBuffer();
        for (int i = 0; i < len; i++) {
            if (res[i] == 13
                    && i + 1 < len && res[i + 1] == 10) {
                if (i + 2 < len && res[i + 2] == 13
                        && i + 3 < len && res[i + 3] == 10) {//\r\n
                    Log.i("Test", "res::rn");
                    if (isHeader) isHeader = false;
                    if (!isContent) isContent = true;
                    if (cLen > 0) {
//                    Log.d("Test", "res:: start 0 ");
                        content = new byte[cLen];
                        System.arraycopy(res, i + 4, content, 0, cLen);

                    } else if (cLen == 0 && contentStart == -1) {
                        contentStart = i + 4;
//                    Log.d("Test", "res:: start 1 cLen = " + cLen + ", start = " + contentStart);
                    } else if (cLen == 0 && contentStart > 0) {
                        contentEnd = i;
//                    Log.d("Test", "res:: start 2 cLen = " + cLen + ", start = " + contentStart + ", end = " + contentEnd);
                        content = new byte[contentEnd - contentStart];
                        System.arraycopy(res, contentStart, content, 0, contentEnd - contentStart);
//                    saveContent(content);
                    } else {
//                    Log.d("Test", "res:: start 3 cLen = " + cLen + ", start = " + contentStart + ", end = " + contentEnd);
                    }
                    continue;
                } else {
                    byte[] tmp = new byte[i - j];
                    System.arraycopy(res, j, tmp, 0, tmp.length);
                    String tt = new String(tmp);
                    if (isHeader) header.append(tt);
                    if (isContent) response.append(tt);
//                Log.i("Test", "res::" + tt + ", size:" + tmp.length);
                    if (tt.contains("Content-Length:") && tt.contains(" ")) {
                        String len2 = tt.split("[ ]")[1];
                        cLen = Integer.valueOf(len2);
//                    Log.i("Test", "res::cLen::" + cLen);
                    }
                    j = i + 2;
                }
            }
        }

        Log.i("TestH", header.toString());
        Log.i("TestR", response.toString());
    }
}
