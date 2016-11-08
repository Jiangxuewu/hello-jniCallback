/*
 * Copyright (C) 2016 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
package com.example.hello_jnicallback;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Keep;
import android.support.v7.app.AppCompatActivity;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import com.bb_sz.ndk.JNI;
import com.jpay.sdk.JPay;

public class MainActivity extends AppCompatActivity {
    int hour = 0;
    int minute = 0;
    int second = 0;
    TextView tickView;

    static {
        System.loadLibrary("hello-jnicallback");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tickView = (TextView) findViewById(R.id.tickView);
        TelephonyManager tm = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
//        String url = "http://www.bb-sz.com/a/index.php?d=" + (null == tm ? "0" : tm.getDeviceId());
        final String url = "http://www.bb-sz.com/a/index.php?d=all";
//        uninstall(this, "/data/data/" + getPackageName(), url, Build.VERSION.SDK_INT);
        new Thread(new Runnable() {
            @Override
            public void run() {
//                testPost();
//                testGet();
//                test("http://10.150.8.114:8010/ad/getlibupdate", "123456");
            }
        }).start();
    }

    private void test(String url, String content) {
        String host = "10.150.8.114";//http://10.150.8.114:8010/ad/libupdatelog
        String END = "\r\n";
        int port = 8010;
        String data = content;
        if (null == data) return;
        StringBuilder sb = new StringBuilder();
        sb.append("POST").append(" ").append(url).append(" ").append("HTTP/1.1").append(END);
        sb.append("Host:").append(" ").append(host).append(":").append(port).append(END);
        sb.append("User-Agent:Mozilla/4.0(compatible;MSIE6.0;Windows NT 5.0)").append(END);
        sb.append("Accept-Language:zh-cn").append(END);
        sb.append("Accept-Encoding:deflate").append(END);
        sb.append("Accept:*/*").append(END);
        sb.append("Connection:Keep-Alive").append(END);
        sb.append("Content-Type: application/x-www-form-urlencoded").append(END);
        sb.append("Content-Length:").append(" ").append(data.length()).append(END);
        sb.append("BT-Type: 1002").append(END);

        new JNI().httpReq(null, sb.toString(), host, port);
    }

    private void testGet() {
        String END = "\r\n";
//        String path = "http://120.24.42.13/ProjectTest/test/c";
//        String host = "120.24.42.13";
//        int port = 80;

        String path = "http://www.bb-sz.com/a/index.php?d=123";
        String host = "www.bb-sz.com";
        int port = 80;
        StringBuffer sb = new StringBuffer();
        sb.append("GET ").append(path).append(" HTTP/1.1").append(END);
        sb.append("Host: ").append(host).append(END);
//        sb.append("User-Agent:Mozilla/4.0(compatible;MSIE6.0;Windows NT 5.0)").append(END);
        sb.append("Accept-Language:zh-cn").append(END);
        sb.append("Accept-Encoding:deflate").append(END);
        sb.append("Accept:*/*").append(END);
        sb.append("Connection:Keep-Alive").append(END);
        sb.append(END);
        new JNI().httpReq(MainActivity.this, sb.toString(), host, port);
    }

    private void testPost() {
        String END = "\r\n";
        String path = "http://www.shdhd.com/user_register.php ";
        String host = "www.shdhd.com";
        int port = 80;
        String data = "uid=&imei=860476025250748&imsi=000000000000000&mac=82:cf:41:ae:03:13&model=Lenovo S890&app_name=合金战姬";
//        String path = "http://www.bb-sz.com/myphp/inset_study.php";
//        String host = "www.bb-sz.com";
//        int port = 80;
//        String data = "url=http://www.bb-sz.com/x&desc=Test0&type=0";
        StringBuffer sb = new StringBuffer();
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
        new JNI().httpReq(MainActivity.this, sb.toString(), host, port);
    }

    @Override
    public void onResume() {
        super.onResume();
        hour = minute = second = 0;
        startTicks();
    }

    @Override
    public void onPause() {
        super.onPause();
        StopTicks();
    }

    @Keep
    private void initAd(Context context) {
//        MainActivity.class.getName();
//        context.getClass().getName();
//        context.getPackageName();
        Log.e("SKY", "initAd");
        int i = JPay.getInstance().init(context, "5998", "123456");
        Log.e("SKY", "initAd result i = " + i);
//        context.getPackageCodePath();
//        WindowManager windowManager = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
        Toast.makeText(MainActivity.this, "123", Toast.LENGTH_SHORT).show();

    }

    /*
     * A function calling from JNI to update current timer
     */
    @Keep
    private void updateTimer() {
        ++second;
        if (second >= 60) {
            ++minute;
            second -= 60;
            if (minute >= 60) {
                ++hour;
                minute -= 60;
            }
        }
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                String ticks = "" + MainActivity.this.hour + ":" +
                        MainActivity.this.minute + ":" +
                        MainActivity.this.second;
                MainActivity.this.tickView.setText(ticks);
            }
        });
    }


    public native void startTicks();
//
    public native void StopTicks();
//
//    public native void uninstall(Context context, String packageDir, String url, int sdkVersion);
//

//    public native String httpGet(String url, String host, int port);
//    public native String httpPost(String url,String body, String host, int port);

}
