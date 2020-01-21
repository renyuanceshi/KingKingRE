package com.pccw.android.common.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.util.AttributeSet;

import com.pccw.mobile.sip02.R;

public class TypefacedTextView extends android.support.v7.widget.AppCompatTextView implements CrossFadeAnimation.CrossFadeAnimationListener {
    private CrossFadeAnimation crossFadeAnimation;
    private String textUpdate = "";

    public TypefacedTextView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        if (!isInEditMode()) {
            String str = null;
            Typeface createFromAsset = Typeface.createFromAsset(context.getAssets(), "font/roboto_bold.ttf");
            this.crossFadeAnimation = new CrossFadeAnimation(context, this, this);
            if (attributeSet != null) {
                TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.TypefacedTextView);
                str = obtainStyledAttributes.getString(R.styleable.TypefacedTextView_text);
                obtainStyledAttributes.recycle();
            }
            setTypeface(str != null ? Typeface.createFromAsset(context.getAssets(), str) : createFromAsset);
        }
    }

    public void animationEnds() {
    }

    public void textUpdate(String str) {
        if (!getText().equals(str)) {
            this.textUpdate = str;
            this.crossFadeAnimation.fadeOut();
            setText(this.textUpdate);
        }
    }
}
