package com.pccw.android.common.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.RelativeLayout;
import com.pccw.mobile.sip02.R;

public class RelativeButtonLayout extends RelativeLayout {
    boolean handledByParent;

    public RelativeButtonLayout(Context context) {
        super(context);
    }

    public RelativeButtonLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.RelativeButtonLayout);
        this.handledByParent = obtainStyledAttributes.getBoolean(0, false);
        obtainStyledAttributes.recycle();
    }

    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        if (this.handledByParent) {
            return true;
        }
        return super.onInterceptTouchEvent(motionEvent);
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        return super.onTouchEvent(motionEvent);
    }
}
