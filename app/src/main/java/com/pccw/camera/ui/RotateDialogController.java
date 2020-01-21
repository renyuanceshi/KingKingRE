package com.pccw.camera.ui;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;

public class RotateDialogController implements Rotatable {
    private static final long ANIM_DURATION = 150;
    private static final String TAG = "RotateDialogController";
    private Activity mActivity;
    private View mDialogRootLayout;
    private Animation mFadeInAnim;
    private Animation mFadeOutAnim;
    private int mLayoutResourceID;
    private RotateLayout mRotateDialog;
    private TextView mRotateDialogButton1;
    private TextView mRotateDialogButton2;
    private View mRotateDialogButtonLayout;
    private ProgressBar mRotateDialogSpinner;
    private TextView mRotateDialogText;
    private TextView mRotateDialogTitle;
    private View mRotateDialogTitleLayout;

    public RotateDialogController(Activity activity, int i) {
        this.mActivity = activity;
        this.mLayoutResourceID = i;
    }

    private void fadeInDialog() {
        this.mDialogRootLayout.startAnimation(this.mFadeInAnim);
        this.mDialogRootLayout.setVisibility(View.VISIBLE);
    }

    private void fadeOutDialog() {
        this.mDialogRootLayout.startAnimation(this.mFadeOutAnim);
        this.mDialogRootLayout.setVisibility(View.GONE);
    }

    private void inflateDialogLayout() {
        if (this.mDialogRootLayout == null) {
            View inflate = this.mActivity.getLayoutInflater().inflate(this.mLayoutResourceID, (ViewGroup) this.mActivity.getWindow().getDecorView());
            this.mDialogRootLayout = inflate.findViewById(R.id.rotate_dialog_root_layout);
            this.mRotateDialog = (RotateLayout) inflate.findViewById(R.id.rotate_dialog_layout);
            this.mRotateDialogTitleLayout = inflate.findViewById(R.id.rotate_dialog_title_layout);
            this.mRotateDialogButtonLayout = inflate.findViewById(R.id.rotate_dialog_button_layout);
            this.mRotateDialogTitle = (TextView) inflate.findViewById(R.id.rotate_dialog_title);
            this.mRotateDialogSpinner = (ProgressBar) inflate.findViewById(R.id.rotate_dialog_spinner);
            this.mRotateDialogText = (TextView) inflate.findViewById(R.id.rotate_dialog_text);
            this.mRotateDialogButton1 = (Button) inflate.findViewById(R.id.rotate_dialog_button1);
            this.mRotateDialogButton2 = (Button) inflate.findViewById(R.id.rotate_dialog_button2);
            this.mFadeInAnim = AnimationUtils.loadAnimation(this.mActivity, 17432576);
            this.mFadeOutAnim = AnimationUtils.loadAnimation(this.mActivity, 17432577);
            this.mFadeInAnim.setDuration(ANIM_DURATION);
            this.mFadeOutAnim.setDuration(ANIM_DURATION);
        }
    }

    public void dismissDialog() {
        if (this.mDialogRootLayout != null && this.mDialogRootLayout.getVisibility() != 8) {
            fadeOutDialog();
        }
    }

    public void resetRotateDialog() {
        inflateDialogLayout();
        this.mRotateDialogTitleLayout.setVisibility(View.GONE);
        this.mRotateDialogSpinner.setVisibility(View.GONE);
        this.mRotateDialogButton1.setVisibility(View.GONE);
        this.mRotateDialogButton2.setVisibility(View.GONE);
        this.mRotateDialogButtonLayout.setVisibility(View.GONE);
    }

    public void setOrientation(int i) {
        inflateDialogLayout();
        this.mRotateDialog.setOrientation(i);
    }

    public void showAlertDialog(String str, String str2, String str3, final Runnable runnable, String str4, final Runnable runnable2) {
        resetRotateDialog();
        this.mRotateDialogTitle.setText(str);
        this.mRotateDialogTitleLayout.setVisibility(View.VISIBLE);
        this.mRotateDialogText.setText(str2);
        if (str3 != null) {
            this.mRotateDialogButton1.setText(str3);
            this.mRotateDialogButton1.setVisibility(View.VISIBLE);
            this.mRotateDialogButton1.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    if (runnable != null) {
                        runnable.run();
                    }
                    RotateDialogController.this.dismissDialog();
                }
            });
            this.mRotateDialogButtonLayout.setVisibility(View.VISIBLE);
        }
        if (str4 != null) {
            this.mRotateDialogButton2.setText(str4);
            this.mRotateDialogButton2.setVisibility(View.VISIBLE);
            this.mRotateDialogButton2.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    if (runnable2 != null) {
                        runnable2.run();
                    }
                    RotateDialogController.this.dismissDialog();
                }
            });
            this.mRotateDialogButtonLayout.setVisibility(View.VISIBLE);
        }
        fadeInDialog();
    }

    public void showWaitingDialog(String str) {
        resetRotateDialog();
        this.mRotateDialogText.setText(str);
        this.mRotateDialogSpinner.setVisibility(View.VISIBLE);
        fadeInDialog();
    }
}
