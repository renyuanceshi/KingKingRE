package com.pccw.mobile.sip;

import android.app.Activity;
import android.os.Bundle;
import android.support.annotation.Nullable;

public class BaseActivity extends Activity {
    /* access modifiers changed from: protected */
    public void onCreate(@Nullable Bundle bundle) {
        getWindow().setFlags(1024, 1024);
        super.onCreate(bundle);
    }
}
