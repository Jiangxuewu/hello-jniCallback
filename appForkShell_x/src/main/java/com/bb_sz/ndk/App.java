package com.bb_sz.ndk;

import android.app.Application;
import android.content.Context;
import android.os.Build;

/**
 * Created by Administrator on 2016/9/22.
 */

public class App extends Application {

    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        NdkUtil.shellFixProcess(base);
    }

    @Override
    public void onCreate() {
        super.onCreate();
        NdkUtil.shellFixApplication(this);
    }
}
