package com.bb_sz.ndk;

import android.app.Application;
import android.content.Context;

/**
 * Created by Administrator on 2016/9/22.
 */

public class App extends Application {
    public static Context mContext = null;//for jni need

    @Override
    protected void attachBaseContext(Context base) {
        mContext = this;
        super.attachBaseContext(base);
        System.loadLibrary("sz_shell_a");
    }

    @Override
    public void onCreate() {
        super.onCreate();
    }
}
