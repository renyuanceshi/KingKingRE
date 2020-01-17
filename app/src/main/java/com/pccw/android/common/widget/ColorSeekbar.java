package com.pccw.android.common.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ScaleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.util.AttributeSet;
import android.widget.SeekBar;

public class ColorSeekbar extends SeekBar {
    ColorFilter cf;
    private Drawable mThumb;

    public ColorSeekbar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setBackgroundColor(0);
    }

    private void updateColor() {
        ((ScaleDrawable) ((LayerDrawable) getProgressDrawable()).findDrawableByLayerId(16908301)).setColorFilter(this.cf);
        ((StateListDrawable) getThumb()).getCurrent().setColorFilter(this.cf);
    }

    public Drawable getThumb() {
        return this.mThumb;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        synchronized (this) {
            ((StateListDrawable) getThumb()).getCurrent().setColorFilter(this.cf);
            super.onDraw(canvas);
        }
    }

    public void setIconAttr(ColorFilter colorFilter) {
        this.cf = colorFilter;
        updateColor();
    }

    public void setThumb(Drawable drawable) {
        super.setThumb(drawable);
        this.mThumb = drawable;
    }
}
