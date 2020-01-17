package com.pccw.sms.emoji;

import android.annotation.SuppressLint;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import com.pccwmobile.common.utilities.Log;

@SuppressLint({"NewApi"})
public class EmojiLinearLayout extends LinearLayout {
    private onSizeChangedListener mChangedListener;
    private boolean mShowKeyboard = false;

    public interface onSizeChangedListener {
        void onChanged(boolean z);
    }

    public EmojiLinearLayout(Context context) {
        super(context);
    }

    public EmojiLinearLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public EmojiLinearLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        Log.d("onsize", "h=" + i2);
        Log.d("onsize", "oldh=" + i4);
        if (this.mChangedListener != null && i3 != 0 && i4 != 0) {
            if (i2 < i4 || i4 - i2 > 200 || i2 - i4 < 200) {
                this.mShowKeyboard = true;
            } else {
                this.mShowKeyboard = false;
            }
            this.mChangedListener.onChanged(this.mShowKeyboard);
        }
    }

    public void setOnSizeChangedListener(onSizeChangedListener onsizechangedlistener) {
        this.mChangedListener = onsizechangedlistener;
    }
}
