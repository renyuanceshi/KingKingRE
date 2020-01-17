package com.pccw.dialog;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Bundle;
import com.pccw.dialog.listener.IKKDialogOnClickListener;
import com.pccw.mobile.sip02.R;

public abstract class KKDialog {
    Activity activity;
    Bundle args;
    AlertDialog.Builder builder;
    EnumKKDialogType dialogType;
    int tag;

    public Bundle getArguments() {
        return this.args;
    }

    public EnumKKDialogType getDialogType() {
        return this.dialogType;
    }

    public int getTag() {
        return this.tag;
    }

    /* access modifiers changed from: package-private */
    public void init(Activity activity2) {
        this.builder = new AlertDialog.Builder(activity2);
        this.activity = activity2;
    }

    public void setArguments(Bundle bundle) {
        this.args = bundle;
    }

    /* access modifiers changed from: package-private */
    public abstract void setButton();

    /* access modifiers changed from: package-private */
    public abstract void setContent();

    /* access modifiers changed from: package-private */
    public abstract void setListener(IKKDialogOnClickListener iKKDialogOnClickListener);

    public void setTag(int i) {
        this.tag = i;
    }

    /* access modifiers changed from: package-private */
    public void setTitle() {
        this.builder.setTitle(2131165290);
        this.builder.setIcon(R.drawable.ic_logo);
    }

    public void show() {
        this.builder.show();
    }
}
