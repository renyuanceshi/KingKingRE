package com.pccw.dialog;

import android.app.Activity;
import com.pccw.dialog.listener.IKKDialogOnClickListener;

public class KKDialogProvider {
    private Activity activity;
    private KKDialogBuilder builder;

    public KKDialogProvider(KKDialogBuilder kKDialogBuilder, Activity activity2) {
        this.builder = kKDialogBuilder;
        this.activity = activity2;
    }

    public KKDialog requestDialog(EnumKKDialogType enumKKDialogType, IKKDialogOnClickListener iKKDialogOnClickListener) {
        KKDialog createDialog = this.builder.createDialog(enumKKDialogType);
        createDialog.init(this.activity);
        createDialog.setTitle();
        createDialog.setContent();
        createDialog.setListener(iKKDialogOnClickListener);
        createDialog.setButton();
        return createDialog;
    }
}
