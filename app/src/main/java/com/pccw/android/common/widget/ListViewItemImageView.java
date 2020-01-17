package com.pccw.android.common.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;

public class ListViewItemImageView extends ImageView {
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
