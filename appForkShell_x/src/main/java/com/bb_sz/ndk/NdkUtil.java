package com.bb_sz.ndk;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.util.zip.GZIPInputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * Created by Administrator on 2016/9/22.
 */
public class NdkUtil {
    private static final String TAG = "SKY_NdkUtil";
    private static final boolean debug = true;
    public static Context mContext = null;//for jni need
    public static String mApplication = null;
    private static String mSrcPath;
    private static String mDexFile;
    private static byte[] key = {0, 1, 2, 3};

    /**
     * get cur apk 's classes.dex file from cur apk file.
     *
     * @return the bytes of cur apk 's classes.dex
     * @throws IOException
     */
    private static byte[] readDexFileFromApk(String srcPath) throws IOException {
        if (debug) Log.i(TAG, "start readDexFileFromApk");
        ByteArrayOutputStream dexByteArrayOutputStream = new ByteArrayOutputStream();
        ZipInputStream localZipInputStream = new ZipInputStream(
                new BufferedInputStream(new FileInputStream(srcPath)));
        while (true) {
            ZipEntry localZipEntry = localZipInputStream.getNextEntry();
            if (localZipEntry == null) {
                localZipInputStream.close();
                break;
            }
            if (localZipEntry.getName().equals("classes.dex")) {
                byte[] arrayOfByte = new byte[1024];
                while (true) {
                    int i = localZipInputStream.read(arrayOfByte);
                    if (i == -1)
                        break;
                    dexByteArrayOutputStream.write(arrayOfByte, 0, i);
                }
            }
            localZipInputStream.closeEntry();
        }
        localZipInputStream.close();
        if (debug) Log.i(TAG, "end readDexFileFromApk");
        return dexByteArrayOutputStream.toByteArray();
    }

    /**
     * get really classes.dex from cur apk 's classes.dex
     *
     * @param data    the bytes of cur apk 's classes.dex
     * @param dexFile the file path to save really classes.dex
     * @throws IOException
     */
    private static void splitPayLoadFromDex(byte[] data, String dexFile) throws IOException {
        if (debug) Log.i(TAG, "start splitPayLoadFromDex");
        byte[] apkdata = decrypt(data);
        int ablen = apkdata.length;
        //取被加壳class.dex的长度   这里的长度取值，对应加壳时长度的赋值都可以做些简化
        byte[] dexlen = new byte[4];
        System.arraycopy(apkdata, ablen - 4 - key.length, dexlen, 0, 4);
        if (debug) Log.e(TAG, "dexlen:" + dexlen[0] + ":" + dexlen[1] + ":" + dexlen[2] + ":" + dexlen[3]);

        ByteArrayInputStream bais = new ByteArrayInputStream(dexlen);
        DataInputStream in = new DataInputStream(bais);
        int readInt = in.readInt();
        byte[] newdex = new byte[readInt];
        //把被加壳class.dex内容拷贝到newdex中
        System.arraycopy(apkdata, ablen - 4 - readInt - key.length, newdex, 0, readInt);
        //这里应该加上对于apk的解密操作，若加壳是加密处理的话
        //写入apk文件
        File file = new File(dexFile);
        if (!file.exists()) {
            file.createNewFile();
        }
        try {
            FileOutputStream localFileOutputStream = new FileOutputStream(file);
            localFileOutputStream.write(a(newdex));
            localFileOutputStream.close();
            if (debug) Log.i(TAG, "end splitPayLoadFromDex");
        } catch (IOException localIOException) {
            throw new RuntimeException(localIOException);
        }
    }

    private static short getS(int i) {
        return (short) Math.abs((Short.valueOf(String.valueOf(key[i % key.length])) % 4));
    }

    private static byte[] decrypt(byte[] bsInput) {
        int len = bsInput.length;
        System.arraycopy(bsInput, len - key.length, key, 0, key.length);
        if (debug) Log.e(TAG, "key:" + key[0] + ":" + key[1] + ":" + key[2] + ":" + key[3]);
        return bsInput;
    }

    private static byte[] a(byte[] bytes) {
        int len = bytes.length;
        byte[] result = new byte[len];
        for (int i = 0; i < len; i++) {
            result[i] = bytes[len - 1 - i];
        }
        return result;
    }

    private final static byte[] MD5(byte[] btInput) {
        // char
        // hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
        try {
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            return md;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private static byte[] ungzip(byte[] src) {
        if (null != src) {
            final ByteArrayInputStream is = new ByteArrayInputStream(src);
            final ByteArrayOutputStream os = new ByteArrayOutputStream(
                    src.length);
            try {
                final GZIPInputStream in = new GZIPInputStream(is);
                final byte[] buffer = new byte[512];
                int len = 0;
                while ((len = in.read(buffer)) != -1) {
                    os.write(buffer, 0, len);
                    os.flush();
                }
                in.close();
                return os.toByteArray();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        return null;
    }


    public static void shellFixProcess(Context context) {
        if (debug) Log.i(TAG, "start fix process");
        mContext = context;
        initDexSplit(context);
        installDexSplit();
        if (debug) Log.i(TAG, "end fix process");
    }

    public static void shellFixApplication(Context context) {
        mContext = context;
        if (null == mApplication) {
            try {
                ApplicationInfo appInfo = context.getPackageManager()
                        .getApplicationInfo(
                                context.getPackageName(),
                                PackageManager.GET_META_DATA);
                if (null != appInfo) {
                    Bundle bundle = appInfo.metaData;
                    if (bundle != null) {
                        if (bundle.containsKey("SZ_SHELL_APP")) {
                            mApplication = String.valueOf(bundle.get("SZ_SHELL_APP"));
                        } else if (bundle.containsKey("BB_SZ_APP")) {
                            mApplication = String.valueOf(bundle.get("BB_SZ_APP"));
                        } else if (bundle.containsKey("BB_SHELL_APP")) {
                            mApplication = String.valueOf(bundle.get("BB_SHELL_APP"));
                        }
                    }
                }
            } catch (PackageManager.NameNotFoundException e) {
                e.printStackTrace();
            }
        }
        if (debug) Log.i(TAG, "mApplication = " + mApplication);
        if (!TextUtils.isEmpty(mApplication)) {
            if (mApplication.startsWith(".")) {
                mApplication = context.getPackageName() + mApplication;
                if (debug) Log.i(TAG, "mApplication = " + mApplication);
            } else if (!mApplication.contains(".")) {
                mApplication = context.getPackageName() + "." + mApplication;
                if (debug) Log.i(TAG, "mApplication = " + mApplication);
            }
            System.loadLibrary("sz_shell_x");
        }
    }

    protected static void run() {
        //TODO
    }

    private static boolean initDexSplit(Context context) {
        if (debug) Log.i(TAG, "start initDexSplit");
        String pkgName = context.getPackageName();
        mSrcPath = context.getApplicationInfo().sourceDir;
        String dexPath = "/data/data/" + pkgName + "/tx_shell";
        mDexFile = dexPath + "/dex2.zip";
        File localFile = new File(dexPath);
        if (!localFile.exists())
            localFile.mkdir();
        if (debug) Log.i(TAG, "end initDexSplit");
        return true;
    }

    private static void installDexSplit() {
        try {
            if (debug) Log.i(TAG, "start installDexSplit");
            // 读取程序classes.dex文件
            byte[] dexdata = readDexFileFromApk(mSrcPath);
            // 分离出解壳后的apk文件已用于动态加载
            splitPayLoadFromDex(dexdata, mDexFile);
            // 配置动态加载环境
            setLoaderPath();
            if (debug) Log.i(TAG, "end installDexSplit");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void setLoaderPath() {
        System.loadLibrary("sz_shell_a");
    }
}
