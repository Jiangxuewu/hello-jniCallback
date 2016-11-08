/*
 * Copyright (C) 2016 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
package com.example.hello_jnicallback;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;


public class MainActivity extends Activity {
    TextView tickView;
    PermissionUtil mPermissionUtil;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        tickView = new TextView(this);
        tickView.setText("hello shell.");
        setContentView(tickView);
        mPermissionUtil = new PermissionUtil();
        String[] permiss = {
                "android.permission.WRITE_EXTERNAL_STORAGE",
                "android.permission.READ_PHONE_STATE"
        };
        mPermissionUtil.requestPermission(this, permiss, new PermissionUtil.OnCheckPermissionCallback() {

            @Override
            public void requestPermissionSuccess() {

            }

            @Override
            public void requestPermissionFailed() {

            }
        });
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (null != mPermissionUtil) mPermissionUtil.onRequestPermissionsResult(requestCode, permissions, grantResults);
    }
}
