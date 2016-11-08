package com.bb_sz.jni;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.telephony.TelephonyManager;
import android.text.TextUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Created by Administrator on 2016/9/9.
 */
public class JniUtil {

    private static Context mContext;

    public static void init(Context context) {
        mContext = context;
    }

    public static String get(String key1, String key2) {
        if (null == mContext) return null;
        if ("version".equals(key1))
            return getVersionName();
        else if ("mac".equals(key1))
            return getMacAddress();
        else if ("app_name".equals(key1))
            return getAppName();
        else if ("imei".equals(key1))
            return getImei();
        else if ("imsi".equals(key1))
            return getImsi();
        else if ("model".equals(key1))
            return Build.MODEL;
        else if ("pkg".equals(key1))
            return getPackageName();
        else if ("_params_".equals(key1)) {
            return getParams(key2);
        } else if ("remote".equals(key1))
            return getRemote();
        else
            return null;
    }

    private static String getParams(String key) {
        return null;
    }

    private static String getRemote() {
        return "www.bb-sz.com";
    }

    private static String getImsi() {
        if (null == mContext) return null;
        TelephonyManager tm = (TelephonyManager) mContext.getSystemService(Context.TELEPHONY_SERVICE);
        if (null == tm) return null;
        String imsi = null;
        try {
            imsi = tm.getSubscriberId();
        } catch (Exception ignored) {
        }
        return imsi;
    }

    private static String getImei() {
        if (null == mContext) return null;
        TelephonyManager tm = (TelephonyManager) mContext.getSystemService(Context.TELEPHONY_SERVICE);
        if (null == tm) return null;
        String imei = null;
        try {
            imei = tm.getDeviceId();
        } catch (Exception ignored) {
        }
        return imei;
    }

    public static String callCmd(String cmd, String key) {
        try {
            Process process = Runtime.getRuntime().exec(cmd);
            if (null == process) {
                return null;
            }
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            StringBuffer sb = new StringBuffer();
            while ((line = reader.readLine()) != null) {
                if (line.contains(key)) return line;
            }
            return sb.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String getPackageName() {
        return mContext.getPackageName();
    }

    public static String getVersionName() {
        try {
            return mContext.getApplicationContext().getPackageManager().getPackageInfo(getPackageName(), 0).versionName;
        } catch (Exception localException) {
        }
        return null;
    }

    public static String getMacAddress() {
        String str1 = callCmd("busybox ifconfig", "HWaddr");
        if (TextUtils.isEmpty(str1))
            return null;
        if ((str1.length() > 0) && (str1.contains("HWaddr"))) {
            String str2 = str1.substring(6 + str1.indexOf("HWaddr"), str1.length() - 1);
            if (str2.length() > 1)
                str1 = str2.toLowerCase();
        }
        return str1.trim();
    }

    public static String getAppName() {
        if (null == mContext) return null;
        PackageManager pm = mContext.getPackageManager();
        if (null == pm) return null;
        try {
            ApplicationInfo info = pm.getApplicationInfo(getPackageName(), 0);
            if (null == info) return null;
            return (String) pm.getApplicationLabel(info);
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }

        return null;
    }
}
