package org.linphone;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;

public class ButtonGridLayout extends ViewGroup {
    private final int mColumns = 3;
    private int mPaddingBottom = 0;
    private int mPaddingLeft = 0;
    private int mPaddingRight = 0;
    private int mPaddingTop = 0;

    public ButtonGridLayout(Context context) {
        super(context);
    }

    public ButtonGridLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public ButtonGridLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    private int getRows() {
        return ((getChildCount() + 3) - 1) / 3;
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5;
        int i6 = this.mPaddingTop;
        int rows = getRows();
        View childAt = getChildAt(0);
        int height = ((getHeight() - this.mPaddingTop) - this.mPaddingBottom) / rows;
        int width = ((getWidth() - this.mPaddingLeft) - this.mPaddingRight) / 3;
        int measuredWidth = childAt.getMeasuredWidth();
        int measuredHeight = childAt.getMeasuredHeight();
        int i7 = (width - measuredWidth) / 2;
        int i8 = (height - measuredHeight) / 2;
        int i9 = 0;
        int i10 = i6;
        while (i9 < rows) {
            int i11 = this.mPaddingLeft;
            int i12 = 0;
            while (i12 < 3 && (i5 = (i9 * 3) + i12) < getChildCount()) {
                getChildAt(i5).layout(i11 + i7, i10 + i8, i11 + i7 + measuredWidth, i10 + i8 + measuredHeight);
                i11 += width;
                i12++;
            }
            i9++;
            i10 += height;
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int i3 = this.mPaddingLeft;
        int i4 = this.mPaddingRight;
        int i5 = this.mPaddingTop;
        int i6 = this.mPaddingBottom;
        View childAt = getChildAt(0);
        childAt.measure(0, 0);
        int measuredWidth = childAt.getMeasuredWidth();
        int measuredHeight = childAt.getMeasuredHeight();
        for (int i7 = 1; i7 < getChildCount(); i7++) {
            getChildAt(0).measure(0, 0);
        }
        setMeasuredDimension(resolveSize(i3 + i4 + (measuredWidth * 3), i), resolveSize((getRows() * measuredHeight) + i5 + i6, i2));
    }
}
