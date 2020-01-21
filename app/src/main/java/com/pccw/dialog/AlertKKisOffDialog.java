package com.pccw.dialog;

import android.content.DialogInterface;
import com.pccw.dialog.listener.IKKDialogOnClickListener;
import com.pccw.mobile.sip02.R;

public class AlertKKisOffDialog extends KKDialog {
    IKKDialogOnClickListener listener;

    public AlertKKisOffDialog() {
        this.dialogType = EnumKKDialogType.AlertKKisOffDialog;
    }

    private void setNegativeButton() {
        this.builder.setNegativeButton(android.R.string.cancel, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                if (AlertKKisOffDialog.this.listener != null) {
                    AlertKKisOffDialog.this.listener.onClickKKDialogNegativeButton(AlertKKisOffDialog.this);
                }
            }
        });
    }

    private void setPositiveButton() {
        this.builder.setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                if (AlertKKisOffDialog.this.listener != null) {
                    AlertKKisOffDialog.this.listener.onClickKKDialogPositiveButton(AlertKKisOffDialog.this);
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
        this.builder.setMessage(R.string.notfast);
    }

    /* access modifiers changed from: package-private */
    public void setListener(IKKDialogOnClickListener iKKDialogOnClickListener) {
        this.listener = iKKDialogOnClickListener;
    }
}
