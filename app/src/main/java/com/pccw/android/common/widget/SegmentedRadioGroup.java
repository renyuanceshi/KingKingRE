package com.pccw.android.common.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.RadioGroup;

public class SegmentedRadioGroup extends RadioGroup {
    Context context;
    Drawable selector;

    public SegmentedRadioGroup(Context context2) {
        super(context2);
        this.context = context2;
    }

    public SegmentedRadioGroup(Context context2, AttributeSet attributeSet) {
        super(context2, attributeSet);
        this.context = context2;
    }

    private void changeButtonsImages() {
        super.getChildCount();
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        changeButtonsImages();
    }
}
