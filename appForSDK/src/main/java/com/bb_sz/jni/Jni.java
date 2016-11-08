package com.bb_sz.jni;

import android.os.Build;
import android.util.Log;

/**
 * Created by Administrator on 2016/9/9.
 */
public class Jni {

    private static final boolean debug = false;
    private static final String TAG = "Jni_java";

    public Jni() {
        if (debug)
            Log.i(TAG, "Jni()");
    }

    public String callCmd(String cmd, String key) {
        return JniUtil.callCmd(cmd, key);
    }


    static public String specialGet() {
        if (debug) Log.i(TAG, "specialGet:key1=" + 123);
        return "123";
    }
    static public String specialGet(String key1) {
        if (debug) Log.i(TAG, "specialGet:key1=" + key1);
        return key1;
    }
    static public String specialGet(String key1, String key2) {
        if (debug) Log.i(TAG, "specialGet:key1=" + key1 + ", key2= " + key2);
        return JniUtil.get(key1, key2);
    }
    static public String getHttpData(String url, String param, String methos){
        return "";
    }

    static public String getBuildVersion() {
        return Build.VERSION.RELEASE;
    }

    public long getRuntimeMemorySize() {
        return Runtime.getRuntime().freeMemory();
    }

    public static native void init();
}
