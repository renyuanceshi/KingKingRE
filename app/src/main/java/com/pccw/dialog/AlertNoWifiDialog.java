package com.pccw.dialog;

import android.content.DialogInterface;
import com.pccw.dialog.listener.IKKDialogOnClickListener;
import com.pccw.mobile.sip02.R;

public class AlertNoWifiDialog extends KKDialog {
    IKKDialogOnClickListener listener;

    public AlertNoWifiDialog() {
        this.dialogType = EnumKKDialogType.AlertNoWifiDialog;
    }

    private void setNegativeButton() {
        this.builder.setNegativeButton(17039360, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                if (AlertNoWifiDialog.this.listener != null) {
                    AlertNoWifiDialog.this.listener.onClickKKDialogNegativeButton(AlertNoWifiDialog.this);
                }
            }
        });
    }

    private void setPositiveButton() {
        this.builder.setPositiveButton(R.string.go_to_wifi_setting, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                if (AlertNoWifiDialog.this.listener != null) {
                    AlertNoWifiDialog.this.listener.onClickKKDialogPositiveButton(AlertNoWifiDialog.this);
                }
            }
        });
    }

    /* access modifiers changed from: package-private */
    public void setButton() {
        setPositiveButton();
        setNegativeButton();
    }

    public void setContent() {
        this.builder.setMessage(R.string.ask_wifi);
    }

    /* access modifiers changed from: package-private */
    public void setListener(IKKDialogOnClickListener iKKDialogOnClickListener) {
        this.listener = iKKDialogOnClickListener;
    }
}
