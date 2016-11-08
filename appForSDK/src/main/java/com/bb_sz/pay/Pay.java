package com.bb_sz.pay;

import android.content.Context;

import cn.waps.AppConnect;
import cn.waps.UpdatePointsListener;

/**
 * Created by Administrator on 2016/9/13.
 */
public class Pay implements UpdatePointsListener {
    private static Context context;

    public static int init(Context c) {
        context = c;
        AppConnect.getInstance("347012a08a3a89480e8ffcbbd67989f9", "game_" + c.getPackageName(), c);
        return 0;
    }

    public static void pay(int price, String goodDes, IPayCallback callback) {
        if (price <= 0) {
            if (null != callback)
                callback.payResult(-1, "failed price");
            return;
        }
        AppConnect.getInstance(context).getPoints(this);
    }

    @Override
    public void getUpdatePoints(String s, int i) {

    }

    @Override
    public void getUpdatePointsFailed(String s) {

    }
}
