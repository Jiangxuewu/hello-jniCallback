package com.example.hello_jnicallback;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

import com.bb_sz.jni.Jni;
import com.bb_sz.jni.JniUtil;

public class MainActivity extends Activity {
    int hour = 0;
    int minute = 0;
    int second = 0;
    TextView tickView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tickView = (TextView) findViewById(R.id.tickView);
        JniUtil.init(this);
        new Thread(new Runnable() {
            @Override
            public void run() {
                Jni.init();
            }
        }).start();
    }
    @Override
    public void onResume() {
        super.onResume();
        hour = minute = second = 0;
//        startTicks();
    }


    @Override
    public void onPause () {
        super.onPause();
//        StopTicks();
    }
    static {
        System.loadLibrary("hello-jnicallback");
    }
    public native  String stringFromJNI();
    public native void startTicks();
    public native void StopTicks();

    public native void checkProcess();

    public native void uninstall(String packageDir, int sdkVersion);

}
