package com.pccw.sms.emoji;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.text.style.DynamicDrawableSpan;

public class EmojiIconSpan extends DynamicDrawableSpan {
    private final Context mContext;
    private Drawable mDrawable;
    private final int mResourceId;
    private final int mSize;

    public EmojiIconSpan(Context context, int i, int i2) {
        this.mContext = context;
        this.mResourceId = i;
        this.mSize = i2;
    }

    public Drawable getDrawable() {
        if (this.mDrawable == null) {
            try {
                this.mDrawable = this.mContext.getResources().getDrawable(this.mResourceId);
                int i = this.mSize;
                this.mDrawable.setBounds(0, 0, i, i);
            } catch (Exception e) {
            }
        }
        return this.mDrawable;
    }

    public int getVerticalAlignment() {
        return 1;
    }
}
