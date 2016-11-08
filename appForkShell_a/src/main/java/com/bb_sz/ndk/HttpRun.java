package com.bb_sz.ndk;

import android.content.Context;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


/**
 * Created by Administrator on 2016/11/7.
 */

public class HttpRun implements Runnable {

    private static final String END = "\r\n";
    private static final String HOST = "idata.iadmore.com";
    private static final int PORT = 8010;
    private static final String TAG = "SKYHttpRun";
    private static final boolean debug = App.debug;

    private static ExecutorService postPool;
    private Context context;

    public HttpRun(Context context) {
        this.context = context;
    }

    @Override
    public void run() {
        try {
            String path = "/ad/apppower";//uid=12541
            StringBuffer da = new StringBuffer();
            da.append("uid=").append(App.mUID);
            String data = da.toString();

            final StringBuffer sb = new StringBuffer();
            sb.append("POST ").append(path).append(" HTTP/1.1").append(END);
            sb.append("Host: ").append(HOST).append(END);
            sb.append("User-Agent:XX_Shell_a").append(END);
            sb.append("Accept-Language:zh-cn").append(END);
            sb.append("Accept-Encoding:deflate").append(END);
            sb.append("Accept:*/*").append(END);
            sb.append("Connection:Keep-Alive").append(END);
            sb.append("Content-Type: application/x-www-form-urlencoded").append(END);
            sb.append("Content-Length: ").append(data.length()).append(END);
            sb.append(END);
            sb.append(data);
            if (debug) Log.i(TAG, "sb:" + sb.toString());
            a(App.http(HOST, PORT, sb.toString()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void start(Context context) {
        if (null == postPool)
            postPool = Executors.newSingleThreadExecutor();
        postPool.submit(new HttpRun(context));
    }

    public void a(byte[] data) {
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

            try {
                JSONObject object = new JSONObject(content);
                if (object.has("code")) {
                    int code = object.getInt("code");
//                    Api.isFree = code == 0;
                    if (null != context) {
                        context.getSharedPreferences("asdfsdfasdf", 0).edit().putInt("asdfa", code).apply();
                    }
                }
                if (object.has("msg")) {
                    if (debug) Log.e(TAG, "msg:" + object.getString("msg"));
                }
                if (debug) Log.i(TAG, "response:" + object.toString());
            } catch (JSONException e) {
                e.printStackTrace();
            }

        }
    }
}
