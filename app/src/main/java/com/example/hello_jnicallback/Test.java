package com.example.hello_jnicallback;


import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * Created by Administrator on 2016/10/8.
 */

public class Test {

    //    public static final String key = "755927";
    public static byte[] key = {1, 0, 1, 0};

    static final String mSrcPath = "D:\\DengZong\\2016-10-08\\ttt\\PT002_SuperMary2.apk";

    /** 文件名 */
    private static final String shareName = "" + (char) 97 + (char) 100 + (char) 109
            + (char) 97 + (char) 105 + (char) 110 + (char) 108 + (char) 105
            + (char) 98 + (char) 95 + (char) 110 + (char) 101 + (char) 119;

    public static void main(String[] args) {
//        int len = new Random().nextInt(Integer.MAX_VALUE);
//        key = intToByte(len);

        System.out.print("shareName:" + shareName);
        if (null == key)
            return;


//        byte[] bytes = {1, -2, 3, -4, 5, -6, 7, 8, 9};
//        byte[] bytes = new byte[10];
//        try {
//           byte[] tmp = readDexFileFromApk(mSrcPath);
//            System.arraycopy(tmp, 0, bytes, 0, 10);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        byte[] resEncode = encode(bytes);
//        byte[] resDecode = decode(resEncode);
//        System.err.print("result : " + isEqual(bytes, resDecode) + " \n");


//        System.err.print("[x]:" + (byte)(100 << 2) + "\n");
//        System.err.print("[x]:" + (byte) (len % 256) + "\n");

    }

    private static byte[] intToByte(int number) {
        byte[] b = new byte[4];
        for (int i = 3; i >= 0; i--) {
            b[i] = (byte) (number % 256);
            number >>= 8;
        }
        return b;
    }

    private static boolean isEqual(byte[] bytes, byte[] resDecode) {
        int len = bytes.length;
        int len2 = resDecode.length;
        if (len != len2) return false;
        for (int i = 0; i < len; i++) {
            if (bytes[i] != resDecode[i]) return false;
        }
        return true;
    }

    private static byte[] encode(byte[] bytes) {
        int len = bytes.length;
        byte[] result = new byte[len];
        System.out.print("encode \n");
        for (int i = 0; i < len; i++) {
            result[i] = bytes[len - 1 - i];
            System.out.print(" " + result[i]);
        }
        System.out.print("\n");
        return result;
    }

    private static short getS(int i) {
        return (short) Math.abs((Short.valueOf(String.valueOf(key[i % key.length])) % 4));
    }

    private static byte[] decode(byte[] bytes) {
        int len = bytes.length;
        byte[] result = new byte[len];
        System.out.print("decode \n");
        for (int i = 0; i < len; i++) {
            result[i] = bytes[len - 1 - i];
            System.out.print(" " + result[i]);
        }
        System.out.print("\n");
        return result;
    }


    private static byte[] readDexFileFromApk(String srcPath) throws IOException {
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
        return dexByteArrayOutputStream.toByteArray();
    }
}
