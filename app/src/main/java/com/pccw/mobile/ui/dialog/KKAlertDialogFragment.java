package com.pccw.mobile.ui.dialog;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;

public class KKAlertDialogFragment extends DialogFragment {
    private static final String KEY_DIALOG_ID = "DIALOG_ID";
    String msg;
    DialogInterface.OnClickListener negativeBtnListener;
    String negativeBtnText;
    DialogInterface.OnClickListener neutralBtnListener;
    String neutralBtnText;
    DialogInterface.OnClickListener positiveBtnListener;
    String positiveBtnText;

    public interface KKDialogResponses {
        void doNegativeClick(int i);

        void doNeutralClick(int i);

        void doPositiveClick(int i);
    }

    public static KKAlertDialogFragment newInstance(int i) {
        KKAlertDialogFragment kKAlertDialogFragment = new KKAlertDialogFragment();
        Bundle bundle = new Bundle();
        bundle.putInt(KEY_DIALOG_ID, i);
        kKAlertDialogFragment.setArguments(bundle);
        return kKAlertDialogFragment;
    }

    public Dialog onCreateDialog(Bundle bundle) {
        final int i = getArguments().getInt(KEY_DIALOG_ID);
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setTitle(2131165290);
        builder.setMessage(this.msg);
        if (this.positiveBtnText != null) {
            builder.setPositiveButton(this.positiveBtnText, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    ((KKDialogResponses) KKAlertDialogFragment.this.getTargetFragment()).doPositiveClick(i);
                }
            });
        }
        if (this.negativeBtnText != null) {
            builder.setNegativeButton(this.negativeBtnText, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    ((KKDialogResponses) KKAlertDialogFragment.this.getTargetFragment()).doNegativeClick(i);
                }
            });
        }
        if (this.neutralBtnText != null) {
            builder.setNeutralButton(this.negativeBtnText, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    ((KKDialogResponses) KKAlertDialogFragment.this.getTargetFragment()).doNeutralClick(i);
                }
            });
        }
        return builder.create();
    }

    public void setMessage(int i) {
        this.msg = getString(i);
    }

    public void setMessage(String str) {
        this.msg = str;
    }

    public void setNegativeButton(int i) {
        this.negativeBtnText = getString(i);
    }

    public void setNegativeButton(String str) {
        this.negativeBtnText = str;
    }

    public void setNeutralButton(int i) {
        this.neutralBtnText = getString(i);
    }

    public void setNeutralButton(String str) {
        this.neutralBtnText = str;
    }

    public void setPositiveButton(int i) {
        this.positiveBtnText = getString(i);
    }

    public void setPositiveButton(String str) {
        this.positiveBtnText = str;
    }

    public void setStyle(int i, int i2) {
        super.setStyle(i, i2);
    }
}
