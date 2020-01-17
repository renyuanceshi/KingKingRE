package com.pccw.sms.emoji;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;

public class EmojiFlowLayout extends ViewGroup {
    private List<List<View>> mAllViews = new ArrayList();
    private List<Integer> mLineHeight = new ArrayList();

    public EmojiFlowLayout(Context context) {
        super(context);
    }

    public EmojiFlowLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public EmojiFlowLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new ViewGroup.MarginLayoutParams(getContext(), attributeSet);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int measuredWidth;
        this.mAllViews.clear();
        this.mLineHeight.clear();
        int width = getWidth();
        int i5 = 0;
        ArrayList arrayList = new ArrayList();
        int childCount = getChildCount();
        int i6 = 0;
        int i7 = 0;
        while (i6 < childCount) {
            View childAt = getChildAt(i6);
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) childAt.getLayoutParams();
            int measuredWidth2 = childAt.getMeasuredWidth();
            int measuredHeight = childAt.getMeasuredHeight();
            if (marginLayoutParams.leftMargin + measuredWidth2 + marginLayoutParams.rightMargin + i5 > width) {
                this.mLineHeight.add(Integer.valueOf(i7));
                this.mAllViews.add(arrayList);
                i5 = 0;
                arrayList = new ArrayList();
            }
            i5 += measuredWidth2 + marginLayoutParams.leftMargin + marginLayoutParams.rightMargin;
            int max = Math.max(i7, marginLayoutParams.bottomMargin + marginLayoutParams.topMargin + measuredHeight);
            arrayList.add(childAt);
            i6++;
            i7 = max;
        }
        this.mLineHeight.add(Integer.valueOf(i7));
        this.mAllViews.add(arrayList);
        int i8 = 0;
        int size = this.mAllViews.size();
        int i9 = 0;
        while (true) {
            int i10 = i8;
            int i11 = i9;
            if (i11 < size) {
                List list = this.mAllViews.get(i11);
                int intValue = this.mLineHeight.get(i11).intValue();
                int i12 = 0;
                for (int i13 = 0; i13 < list.size(); i13++) {
                    View view = (View) list.get(i13);
                    if (view.getVisibility() == 8) {
                        measuredWidth = i12;
                    } else {
                        ViewGroup.MarginLayoutParams marginLayoutParams2 = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
                        int i14 = marginLayoutParams2.leftMargin + i12;
                        int i15 = marginLayoutParams2.topMargin + i10;
                        view.layout(i14, i15, view.getMeasuredWidth() + i14, view.getMeasuredHeight() + i15);
                        measuredWidth = view.getMeasuredWidth() + marginLayoutParams2.rightMargin + marginLayoutParams2.leftMargin + i12;
                    }
                    i12 = measuredWidth;
                }
                i8 = i10 + intValue;
                i9 = i11 + 1;
            } else {
                return;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int i3;
        super.onMeasure(i, i2);
        int size = View.MeasureSpec.getSize(i);
        int size2 = View.MeasureSpec.getSize(i2);
        int mode = View.MeasureSpec.getMode(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int i4 = 0;
        int i5 = 0;
        int childCount = getChildCount();
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        while (i6 < childCount) {
            View childAt = getChildAt(i6);
            measureChild(childAt, i, i2);
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) childAt.getLayoutParams();
            int measuredWidth = childAt.getMeasuredWidth() + marginLayoutParams.leftMargin + marginLayoutParams.rightMargin;
            int measuredHeight = childAt.getMeasuredHeight() + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin;
            if (i8 + measuredWidth > size) {
                i4 = Math.max(i8, measuredWidth);
                i3 = i5 + i7;
            } else {
                measuredWidth += i8;
                measuredHeight = Math.max(i7, measuredHeight);
                i3 = i5;
            }
            if (i6 == childCount - 1) {
                i4 = Math.max(i4, measuredWidth);
                i3 += measuredHeight;
            }
            i6++;
            i7 = measuredHeight;
            i8 = measuredWidth;
            i5 = i3;
        }
        if (mode == 1073741824) {
            i4 = size;
        }
        setMeasuredDimension(i4, mode2 == 1073741824 ? size2 : i5);
    }
}
