package com.pccw.dialog;

import android.content.DialogInterface;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import com.pccw.dialog.listener.IKKDialogOnClickListener;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip02.R;

public class AlertSMSConsumeDialog extends KKDialog {
    IKKDialogOnClickListener listener;
    /* access modifiers changed from: private */
    public CheckBox notShowSMSConsumeWarmingAgainCkeckBox;

    public AlertSMSConsumeDialog() {
        this.dialogType = EnumKKDialogType.AlertSMSConsumeDialog;
    }

    private void setNegativeButton() {
        this.builder.setNegativeButton(17039360, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                if (AlertSMSConsumeDialog.this.listener != null) {
                    AlertSMSConsumeDialog.this.listener.onClickKKDialogNegativeButton(AlertSMSConsumeDialog.this);
                }
            }
        });
    }

    private void setPositiveButton() {
        this.builder.setPositiveButton(17039370, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                if (AlertSMSConsumeDialog.this.notShowSMSConsumeWarmingAgainCkeckBox.isChecked()) {
                    ClientStateManager.setSMSConsumeWarmingCheckBoxStatus(AlertSMSConsumeDialog.this.activity.getApplicationContext());
                }
                if (AlertSMSConsumeDialog.this.listener != null) {
                    AlertSMSConsumeDialog.this.listener.onClickKKDialogPositiveButton(AlertSMSConsumeDialog.this);
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
        View inflate = this.activity.getLayoutInflater().inflate(R.layout.consume_sms_warming_alert_content, (ViewGroup) null);
        this.notShowSMSConsumeWarmingAgainCkeckBox = (CheckBox) inflate.findViewById(R.id.not_show_again_checkbox);
        this.builder.setCancelable(false);
        this.builder.setView(inflate);
    }

    /* access modifiers changed from: package-private */
    public void setListener(IKKDialogOnClickListener iKKDialogOnClickListener) {
        this.listener = iKKDialogOnClickListener;
    }
}
