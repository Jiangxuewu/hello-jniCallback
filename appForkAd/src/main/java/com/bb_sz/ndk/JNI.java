package com.bb_sz.ndk;

import android.content.Context;

/**
 * Created by Administrator on 2016/8/31.
 */
public class JNI {

    public native void httpReq(Context context, String content, String host, int port);
}
