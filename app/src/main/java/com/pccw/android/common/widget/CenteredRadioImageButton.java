package com.pccw.android.common.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.support.v7.widget.AppCompatRadioButton;
import android.util.AttributeSet;
import com.pccw.mobile.sip02.R;

public class CenteredRadioImageButton extends AppCompatRadioButton {
    Drawable image;

    public CenteredRadioImageButton(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (!isInEditMode()) {
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.CompoundButton, 0, 0);
            this.image = obtainStyledAttributes.getDrawable(1);
            setButtonDrawable(17170445);
            obtainStyledAttributes.recycle();
            setTypeface(Typeface.createFromAsset(context.getAssets(), "RobotoCondensed-Bold.ttf"));
        }
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.image != null) {
            this.image.setState(getDrawableState());
            int intrinsicHeight = this.image.getIntrinsicHeight();
            int intrinsicWidth = this.image.getIntrinsicWidth();
            int width = getWidth();
            int height = getHeight();
            float min = (intrinsicWidth > width || intrinsicHeight > height) ? Math.min(((float) width) / ((float) intrinsicWidth), ((float) height) / ((float) intrinsicHeight)) : 1.0f;
            int i = (int) (((((float) width) - (((float) intrinsicWidth) * min)) * 0.5f) + 0.5f);
            int i2 = (int) (((((float) height) - (((float) intrinsicHeight) * min)) * 0.5f) + 0.5f);
            this.image.setBounds(i, i2, (int) ((((float) intrinsicWidth) * min) + ((float) i)), (int) ((min * ((float) intrinsicHeight)) + ((float) i2)));
            this.image.draw(canvas);
        }
    }
}
