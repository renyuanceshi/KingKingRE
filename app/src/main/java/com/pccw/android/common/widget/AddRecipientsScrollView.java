package com.pccw.android.common.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ScrollView;

public class AddRecipientsScrollView extends ScrollView {
    public AddRecipientsScrollView(Context context) {
        super(context);
    }

    public AddRecipientsScrollView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public AddRecipientsScrollView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        super.onMeasure(i, View.MeasureSpec.makeMeasureSpec(200, MeasureSpec.EXACTLY));
    }
}
