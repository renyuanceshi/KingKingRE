package com.pccw.camera.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;

@TargetApi(11)
public class RotateLayout extends ViewGroup implements Rotatable {
    private static final String TAG = "RotateLayout";
    private View mChild;
    private int mOrientation;

    public RotateLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setBackgroundResource(17170445);
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        this.mChild = getChildAt(0);
        this.mChild.setPivotX(0.0f);
        this.mChild.setPivotY(0.0f);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5 = i3 - i;
        int i6 = i4 - i2;
        switch (this.mOrientation) {
            case 0:
            case 180:
                this.mChild.layout(0, 0, i5, i6);
                return;
            case 90:
            case 270:
                this.mChild.layout(0, 0, i6, i5);
                return;
            default:
                return;
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int measuredHeight;
        int measuredWidth;
        switch (this.mOrientation) {
            case 0:
            case 180:
                measureChild(this.mChild, i, i2);
                measuredHeight = this.mChild.getMeasuredWidth();
                measuredWidth = this.mChild.getMeasuredHeight();
                break;
            case 90:
            case 270:
                measureChild(this.mChild, i2, i);
                measuredHeight = this.mChild.getMeasuredHeight();
                measuredWidth = this.mChild.getMeasuredWidth();
                break;
            default:
                measuredHeight = 0;
                measuredWidth = 0;
                break;
        }
        setMeasuredDimension(measuredHeight, measuredWidth);
        switch (this.mOrientation) {
            case 0:
                this.mChild.setTranslationX(0.0f);
                this.mChild.setTranslationY(0.0f);
                break;
            case 90:
                this.mChild.setTranslationX(0.0f);
                this.mChild.setTranslationY((float) measuredWidth);
                break;
            case 180:
                this.mChild.setTranslationX((float) measuredHeight);
                this.mChild.setTranslationY((float) measuredWidth);
                break;
            case 270:
                this.mChild.setTranslationX((float) measuredHeight);
                this.mChild.setTranslationY(0.0f);
                break;
        }
        this.mChild.setRotation((float) (-this.mOrientation));
    }

    public void setOrientation(int i) {
        int i2 = i % 360;
        if (this.mOrientation != i2) {
            this.mOrientation = i2;
            requestLayout();
        }
    }
}
