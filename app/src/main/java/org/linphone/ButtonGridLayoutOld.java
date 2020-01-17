package org.linphone;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import org.apache.http.HttpStatus;
import org.linphone.core.Hacks;

public class ButtonGridLayoutOld extends ViewGroup {
    private static boolean isMeasured = false;
    private final int COLUMNS = 3;
    private final int ROWS = 4;
    private Context context;
    private int mButtonHeight;
    private int mButtonWidth;
    private int mHeight;
    private int mHeightInc;
    private int mPaddingBottom = 6;
    private int mPaddingLeft = 6;
    private int mPaddingRight = 6;
    private int mPaddingTop = 6;
    private int mWidthInc;

    public ButtonGridLayoutOld(Context context2) {
        super(context2);
        this.context = context2;
    }

    public ButtonGridLayoutOld(Context context2, AttributeSet attributeSet) {
        super(context2, attributeSet);
        this.context = context2;
    }

    public ButtonGridLayoutOld(Context context2, AttributeSet attributeSet, int i) {
        super(context2, attributeSet, i);
        this.context = context2;
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5 = 0;
        int i6 = ((i4 - i2) - this.mHeight) + this.mPaddingTop;
        for (int i7 = 0; i7 < 4; i7++) {
            int i8 = this.mPaddingLeft;
            for (int i9 = 0; i9 < 3; i9++) {
                getChildAt(i5).layout(i8, i6, this.mButtonWidth + i8, this.mButtonHeight + i6);
                i8 += this.mWidthInc;
                i5++;
            }
            i6 = this.mHeightInc + i6;
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        WindowManager windowManager = (WindowManager) this.context.getSystemService("window");
        windowManager.getDefaultDisplay().getWidth();
        int height = windowManager.getDefaultDisplay().getHeight();
        View childAt = getChildAt(0);
        childAt.measure(0, 0);
        for (int i3 = 1; i3 < getChildCount(); i3++) {
            getChildAt(i3).measure(0, 0);
        }
        this.mButtonWidth = childAt.getMeasuredWidth();
        this.mButtonHeight = childAt.getMeasuredHeight();
        if (Hacks.isGalaxyTab()) {
            this.mButtonHeight = 120;
            this.mButtonWidth = 180;
            this.mPaddingTop = 10;
            this.mPaddingBottom = 10;
            this.mPaddingLeft = 10;
            this.mPaddingRight = 10;
        } else if (height >= 1500) {
            this.mButtonHeight = 175;
            this.mButtonWidth = HttpStatus.SC_MULTIPLE_CHOICES;
            this.mPaddingTop = 14;
            this.mPaddingBottom = 14;
            this.mPaddingLeft = 16;
            this.mPaddingRight = 16;
        } else if (height >= 1200) {
            this.mButtonHeight = 125;
            this.mButtonWidth = 200;
            this.mPaddingTop = 18;
            this.mPaddingBottom = 18;
            this.mPaddingLeft = 20;
            this.mPaddingRight = 20;
        } else if (height >= 1080) {
            this.mButtonHeight = 100;
            this.mButtonWidth = 170;
            this.mPaddingTop = 10;
            this.mPaddingBottom = 10;
            this.mPaddingLeft = 15;
            this.mPaddingRight = 15;
        } else if (height >= 960) {
            this.mButtonHeight = 85;
            this.mButtonWidth = 160;
            this.mPaddingTop = 8;
            this.mPaddingBottom = 8;
            this.mPaddingLeft = 8;
            this.mPaddingRight = 8;
        } else if (height >= 800) {
            this.mButtonHeight = 70;
            this.mPaddingTop = 6;
            this.mPaddingBottom = 6;
            this.mPaddingLeft = 6;
            this.mPaddingRight = 6;
        } else if (height >= 640) {
            this.mButtonHeight = 55;
            this.mPaddingTop = 4;
            this.mPaddingBottom = 4;
            this.mPaddingLeft = 4;
            this.mPaddingRight = 4;
        } else if (height >= 480) {
            this.mButtonHeight = 44;
            this.mPaddingTop = 2;
            this.mPaddingBottom = 2;
            this.mPaddingLeft = 2;
            this.mPaddingRight = 2;
        } else {
            this.mButtonHeight = 27;
            this.mPaddingTop = 2;
            this.mPaddingBottom = 2;
            this.mPaddingLeft = 2;
            this.mPaddingRight = 2;
        }
        this.mWidthInc = this.mButtonWidth + this.mPaddingLeft + this.mPaddingRight;
        this.mHeightInc = this.mButtonHeight + this.mPaddingTop + this.mPaddingBottom;
        this.mHeight = this.mHeightInc * 4;
        setMeasuredDimension(resolveSize(this.mWidthInc * 3, i), resolveSize(this.mHeight, i2));
    }

    public void setChildrenBackgroundResource(int i) {
        for (int i2 = 0; i2 < 12; i2++) {
            getChildAt(i2).setBackgroundResource(i);
        }
    }
}
