package com.pccw.mobile.sip;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.ActionBarActivity;

public class BaseActionBarActivity extends ActionBarActivity {
    /* access modifiers changed from: protected */
    public void onCreate(@Nullable Bundle bundle) {
        getWindow().setFlags(1024, 1024);
        super.onCreate(bundle);
    }
}
