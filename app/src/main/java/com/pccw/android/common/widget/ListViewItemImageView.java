package com.pccw.android.common.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;

public class ListViewItemImageView extends android.support.v7.widget.AppCompatImageView {
    public ListViewItemImageView(Context context) {
        super(context);
    }

    public ListViewItemImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public ListViewItemImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public void setPressed(boolean z) {
        if (!z || !(getParent() instanceof View) || !((View) getParent()).isPressed()) {
            super.setPressed(z);
        }
    }
}
