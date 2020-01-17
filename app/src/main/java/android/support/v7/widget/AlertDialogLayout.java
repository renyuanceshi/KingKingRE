package android.support.v7.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import android.support.annotation.RestrictTo;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.appcompat.R;
import android.support.v7.widget.LinearLayoutCompat;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;

@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
public class AlertDialogLayout extends LinearLayoutCompat {
    public AlertDialogLayout(@Nullable Context context) {
        super(context);
    }

    public AlertDialogLayout(@Nullable Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    private void forceUniformWidth(int i, int i2) {
        int makeMeasureSpec = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824);
        for (int i3 = 0; i3 < i; i3++) {
            View childAt = getChildAt(i3);
            if (childAt.getVisibility() != 8) {
                LinearLayoutCompat.LayoutParams layoutParams = (LinearLayoutCompat.LayoutParams) childAt.getLayoutParams();
                if (layoutParams.width == -1) {
                    int i4 = layoutParams.height;
                    layoutParams.height = childAt.getMeasuredHeight();
                    measureChildWithMargins(childAt, makeMeasureSpec, 0, i2, 0);
                    layoutParams.height = i4;
                }
            }
        }
    }

    private static int resolveMinimumHeight(View view) {
        int minimumHeight = ViewCompat.getMinimumHeight(view);
        if (minimumHeight > 0) {
            return minimumHeight;
        }
        if (!(view instanceof ViewGroup)) {
            return 0;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        if (viewGroup.getChildCount() == 1) {
            return resolveMinimumHeight(viewGroup.getChildAt(0));
        }
        return 0;
    }

    private void setChildFrame(View view, int i, int i2, int i3, int i4) {
        view.layout(i, i2, i + i3, i2 + i4);
    }

    private boolean tryOnMeasure(int i, int i2) {
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        View view = null;
        View view2 = null;
        View view3 = null;
        int childCount = getChildCount();
        for (int i10 = 0; i10 < childCount; i10++) {
            View childAt = getChildAt(i10);
            if (childAt.getVisibility() != 8) {
                int id = childAt.getId();
                if (id == R.id.topPanel) {
                    view = childAt;
                } else if (id == R.id.buttonPanel) {
                    view2 = childAt;
                } else if ((id != R.id.contentPanel && id != R.id.customPanel) || view3 != null) {
                    return false;
                } else {
                    view3 = childAt;
                }
            }
        }
        int mode = View.MeasureSpec.getMode(i2);
        int size = View.MeasureSpec.getSize(i2);
        int mode2 = View.MeasureSpec.getMode(i);
        int i11 = 0;
        int paddingTop = getPaddingTop() + getPaddingBottom();
        if (view != null) {
            view.measure(i, 0);
            paddingTop += view.getMeasuredHeight();
            i11 = ViewCompat.combineMeasuredStates(0, ViewCompat.getMeasuredState(view));
        }
        int i12 = 0;
        if (view2 != null) {
            view2.measure(i, 0);
            i12 = resolveMinimumHeight(view2);
            paddingTop += i12;
            i11 = ViewCompat.combineMeasuredStates(i11, ViewCompat.getMeasuredState(view2));
            i3 = view2.getMeasuredHeight() - i12;
        } else {
            i3 = 0;
        }
        if (view3 != null) {
            view3.measure(i, mode == 0 ? 0 : View.MeasureSpec.makeMeasureSpec(Math.max(0, size - paddingTop), mode));
            int measuredHeight = view3.getMeasuredHeight();
            paddingTop += measuredHeight;
            i11 = ViewCompat.combineMeasuredStates(i11, ViewCompat.getMeasuredState(view3));
            i4 = measuredHeight;
        } else {
            i4 = 0;
        }
        int i13 = size - paddingTop;
        if (view2 != null) {
            int min = Math.min(i13, i3);
            if (min > 0) {
                i13 -= min;
                i9 = min + i12;
            } else {
                i9 = i12;
            }
            view2.measure(i, View.MeasureSpec.makeMeasureSpec(i9, 1073741824));
            int measuredHeight2 = view2.getMeasuredHeight() + (paddingTop - i12);
            i5 = ViewCompat.combineMeasuredStates(i11, ViewCompat.getMeasuredState(view2));
            i6 = measuredHeight2;
        } else {
            i5 = i11;
            i6 = paddingTop;
        }
        if (view3 == null || i13 <= 0) {
            i7 = i5;
            i8 = i6;
        } else {
            view3.measure(i, View.MeasureSpec.makeMeasureSpec(i13 + i4, mode));
            int measuredHeight3 = view3.getMeasuredHeight() + (i6 - i4);
            i7 = ViewCompat.combineMeasuredStates(i5, ViewCompat.getMeasuredState(view3));
            i8 = measuredHeight3;
        }
        int i14 = 0;
        for (int i15 = 0; i15 < childCount; i15++) {
            View childAt2 = getChildAt(i15);
            if (childAt2.getVisibility() != 8) {
                i14 = Math.max(i14, childAt2.getMeasuredWidth());
            }
        }
        setMeasuredDimension(ViewCompat.resolveSizeAndState(i14 + getPaddingLeft() + getPaddingRight(), i, i7), ViewCompat.resolveSizeAndState(i8, i2, 0));
        if (mode2 != 1073741824) {
            forceUniformWidth(childCount, i2);
        }
        return true;
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int paddingTop;
        int i5;
        int paddingLeft = getPaddingLeft();
        int i6 = i3 - i;
        int paddingRight = getPaddingRight();
        int paddingRight2 = getPaddingRight();
        int measuredHeight = getMeasuredHeight();
        int childCount = getChildCount();
        int gravity = getGravity();
        switch (gravity & 112) {
            case 16:
                paddingTop = (((i4 - i2) - measuredHeight) / 2) + getPaddingTop();
                break;
            case 80:
                paddingTop = ((getPaddingTop() + i4) - i2) - measuredHeight;
                break;
            default:
                paddingTop = getPaddingTop();
                break;
        }
        Drawable dividerDrawable = getDividerDrawable();
        int intrinsicHeight = dividerDrawable == null ? 0 : dividerDrawable.getIntrinsicHeight();
        int i7 = paddingTop;
        for (int i8 = 0; i8 < childCount; i8++) {
            View childAt = getChildAt(i8);
            if (!(childAt == null || childAt.getVisibility() == 8)) {
                int measuredWidth = childAt.getMeasuredWidth();
                int measuredHeight2 = childAt.getMeasuredHeight();
                LinearLayoutCompat.LayoutParams layoutParams = (LinearLayoutCompat.LayoutParams) childAt.getLayoutParams();
                int i9 = layoutParams.gravity;
                if (i9 < 0) {
                    i9 = 8388615 & gravity;
                }
                switch (GravityCompat.getAbsoluteGravity(i9, ViewCompat.getLayoutDirection(this)) & 7) {
                    case 1:
                        i5 = ((((((i6 - paddingLeft) - paddingRight2) - measuredWidth) / 2) + paddingLeft) + layoutParams.leftMargin) - layoutParams.rightMargin;
                        break;
                    case 5:
                        i5 = ((i6 - paddingRight) - measuredWidth) - layoutParams.rightMargin;
                        break;
                    default:
                        i5 = paddingLeft + layoutParams.leftMargin;
                        break;
                }
                int i10 = layoutParams.topMargin + (hasDividerBeforeChildAt(i8) ? i7 + intrinsicHeight : i7);
                setChildFrame(childAt, i5, i10, measuredWidth, measuredHeight2);
                i7 = i10 + layoutParams.bottomMargin + measuredHeight2;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        if (!tryOnMeasure(i, i2)) {
            super.onMeasure(i, i2);
        }
    }
}
