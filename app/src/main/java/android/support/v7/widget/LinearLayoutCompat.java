package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.RestrictTo;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.InputDeviceCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.appcompat.R;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class LinearLayoutCompat extends ViewGroup {
    public static final int HORIZONTAL = 0;
    private static final int INDEX_BOTTOM = 2;
    private static final int INDEX_CENTER_VERTICAL = 0;
    private static final int INDEX_FILL = 3;
    private static final int INDEX_TOP = 1;
    public static final int SHOW_DIVIDER_BEGINNING = 1;
    public static final int SHOW_DIVIDER_END = 4;
    public static final int SHOW_DIVIDER_MIDDLE = 2;
    public static final int SHOW_DIVIDER_NONE = 0;
    public static final int VERTICAL = 1;
    private static final int VERTICAL_GRAVITY_COUNT = 4;
    private boolean mBaselineAligned;
    private int mBaselineAlignedChildIndex;
    private int mBaselineChildTop;
    private Drawable mDivider;
    private int mDividerHeight;
    private int mDividerPadding;
    private int mDividerWidth;
    private int mGravity;
    private int[] mMaxAscent;
    private int[] mMaxDescent;
    private int mOrientation;
    private int mShowDividers;
    private int mTotalLength;
    private boolean mUseLargestChild;
    private float mWeightSum;

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    @Retention(RetentionPolicy.SOURCE)
    public @interface DividerMode {
    }

    public static class LayoutParams extends ViewGroup.MarginLayoutParams {
        public int gravity;
        public float weight;

        public LayoutParams(int i, int i2) {
            super(i, i2);
            this.gravity = -1;
            this.weight = 0.0f;
        }

        public LayoutParams(int i, int i2, float f) {
            super(i, i2);
            this.gravity = -1;
            this.weight = f;
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            this.gravity = -1;
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.LinearLayoutCompat_Layout);
            this.weight = obtainStyledAttributes.getFloat(R.styleable.LinearLayoutCompat_Layout_android_layout_weight, 0.0f);
            this.gravity = obtainStyledAttributes.getInt(R.styleable.LinearLayoutCompat_Layout_android_layout_gravity, -1);
            obtainStyledAttributes.recycle();
        }

        public LayoutParams(LayoutParams layoutParams) {
            super(layoutParams);
            this.gravity = -1;
            this.weight = layoutParams.weight;
            this.gravity = layoutParams.gravity;
        }

        public LayoutParams(ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
            this.gravity = -1;
        }

        public LayoutParams(ViewGroup.MarginLayoutParams marginLayoutParams) {
            super(marginLayoutParams);
            this.gravity = -1;
        }
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    @Retention(RetentionPolicy.SOURCE)
    public @interface OrientationMode {
    }

    public LinearLayoutCompat(Context context) {
        this(context, (AttributeSet) null);
    }

    public LinearLayoutCompat(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public LinearLayoutCompat(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mBaselineAligned = true;
        this.mBaselineAlignedChildIndex = -1;
        this.mBaselineChildTop = 0;
        this.mGravity = 8388659;
        TintTypedArray obtainStyledAttributes = TintTypedArray.obtainStyledAttributes(context, attributeSet, R.styleable.LinearLayoutCompat, i, 0);
        int i2 = obtainStyledAttributes.getInt(R.styleable.LinearLayoutCompat_android_orientation, -1);
        if (i2 >= 0) {
            setOrientation(i2);
        }
        int i3 = obtainStyledAttributes.getInt(R.styleable.LinearLayoutCompat_android_gravity, -1);
        if (i3 >= 0) {
            setGravity(i3);
        }
        boolean z = obtainStyledAttributes.getBoolean(R.styleable.LinearLayoutCompat_android_baselineAligned, true);
        if (!z) {
            setBaselineAligned(z);
        }
        this.mWeightSum = obtainStyledAttributes.getFloat(R.styleable.LinearLayoutCompat_android_weightSum, -1.0f);
        this.mBaselineAlignedChildIndex = obtainStyledAttributes.getInt(R.styleable.LinearLayoutCompat_android_baselineAlignedChildIndex, -1);
        this.mUseLargestChild = obtainStyledAttributes.getBoolean(R.styleable.LinearLayoutCompat_measureWithLargestChild, false);
        setDividerDrawable(obtainStyledAttributes.getDrawable(R.styleable.LinearLayoutCompat_divider));
        this.mShowDividers = obtainStyledAttributes.getInt(R.styleable.LinearLayoutCompat_showDividers, 0);
        this.mDividerPadding = obtainStyledAttributes.getDimensionPixelSize(R.styleable.LinearLayoutCompat_dividerPadding, 0);
        obtainStyledAttributes.recycle();
    }

    private void forceUniformHeight(int i, int i2) {
        int makeMeasureSpec = View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), 1073741824);
        for (int i3 = 0; i3 < i; i3++) {
            View virtualChildAt = getVirtualChildAt(i3);
            if (virtualChildAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) virtualChildAt.getLayoutParams();
                if (layoutParams.height == -1) {
                    int i4 = layoutParams.width;
                    layoutParams.width = virtualChildAt.getMeasuredWidth();
                    measureChildWithMargins(virtualChildAt, i2, 0, makeMeasureSpec, 0);
                    layoutParams.width = i4;
                }
            }
        }
    }

    private void forceUniformWidth(int i, int i2) {
        int makeMeasureSpec = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824);
        for (int i3 = 0; i3 < i; i3++) {
            View virtualChildAt = getVirtualChildAt(i3);
            if (virtualChildAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) virtualChildAt.getLayoutParams();
                if (layoutParams.width == -1) {
                    int i4 = layoutParams.height;
                    layoutParams.height = virtualChildAt.getMeasuredHeight();
                    measureChildWithMargins(virtualChildAt, makeMeasureSpec, 0, i2, 0);
                    layoutParams.height = i4;
                }
            }
        }
    }

    private void setChildFrame(View view, int i, int i2, int i3, int i4) {
        view.layout(i, i2, i + i3, i2 + i4);
    }

    /* access modifiers changed from: protected */
    public boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof LayoutParams;
    }

    /* access modifiers changed from: package-private */
    public void drawDividersHorizontal(Canvas canvas) {
        int left;
        int virtualChildCount = getVirtualChildCount();
        boolean isLayoutRtl = ViewUtils.isLayoutRtl(this);
        for (int i = 0; i < virtualChildCount; i++) {
            View virtualChildAt = getVirtualChildAt(i);
            if (!(virtualChildAt == null || virtualChildAt.getVisibility() == 8 || !hasDividerBeforeChildAt(i))) {
                LayoutParams layoutParams = (LayoutParams) virtualChildAt.getLayoutParams();
                drawVerticalDivider(canvas, isLayoutRtl ? layoutParams.rightMargin + virtualChildAt.getRight() : (virtualChildAt.getLeft() - layoutParams.leftMargin) - this.mDividerWidth);
            }
        }
        if (hasDividerBeforeChildAt(virtualChildCount)) {
            View virtualChildAt2 = getVirtualChildAt(virtualChildCount - 1);
            if (virtualChildAt2 == null) {
                left = isLayoutRtl ? getPaddingLeft() : (getWidth() - getPaddingRight()) - this.mDividerWidth;
            } else {
                LayoutParams layoutParams2 = (LayoutParams) virtualChildAt2.getLayoutParams();
                left = isLayoutRtl ? (virtualChildAt2.getLeft() - layoutParams2.leftMargin) - this.mDividerWidth : layoutParams2.rightMargin + virtualChildAt2.getRight();
            }
            drawVerticalDivider(canvas, left);
        }
    }

    /* access modifiers changed from: package-private */
    public void drawDividersVertical(Canvas canvas) {
        int bottom;
        int virtualChildCount = getVirtualChildCount();
        for (int i = 0; i < virtualChildCount; i++) {
            View virtualChildAt = getVirtualChildAt(i);
            if (!(virtualChildAt == null || virtualChildAt.getVisibility() == 8 || !hasDividerBeforeChildAt(i))) {
                drawHorizontalDivider(canvas, (virtualChildAt.getTop() - ((LayoutParams) virtualChildAt.getLayoutParams()).topMargin) - this.mDividerHeight);
            }
        }
        if (hasDividerBeforeChildAt(virtualChildCount)) {
            View virtualChildAt2 = getVirtualChildAt(virtualChildCount - 1);
            if (virtualChildAt2 == null) {
                bottom = (getHeight() - getPaddingBottom()) - this.mDividerHeight;
            } else {
                bottom = ((LayoutParams) virtualChildAt2.getLayoutParams()).bottomMargin + virtualChildAt2.getBottom();
            }
            drawHorizontalDivider(canvas, bottom);
        }
    }

    /* access modifiers changed from: package-private */
    public void drawHorizontalDivider(Canvas canvas, int i) {
        this.mDivider.setBounds(getPaddingLeft() + this.mDividerPadding, i, (getWidth() - getPaddingRight()) - this.mDividerPadding, this.mDividerHeight + i);
        this.mDivider.draw(canvas);
    }

    /* access modifiers changed from: package-private */
    public void drawVerticalDivider(Canvas canvas, int i) {
        this.mDivider.setBounds(i, getPaddingTop() + this.mDividerPadding, this.mDividerWidth + i, (getHeight() - getPaddingBottom()) - this.mDividerPadding);
        this.mDivider.draw(canvas);
    }

    /* access modifiers changed from: protected */
    public LayoutParams generateDefaultLayoutParams() {
        if (this.mOrientation == 0) {
            return new LayoutParams(-2, -2);
        }
        if (this.mOrientation == 1) {
            return new LayoutParams(-1, -2);
        }
        return null;
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    /* access modifiers changed from: protected */
    public LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return new LayoutParams(layoutParams);
    }

    public int getBaseline() {
        int i;
        int i2;
        if (this.mBaselineAlignedChildIndex < 0) {
            return super.getBaseline();
        }
        if (getChildCount() <= this.mBaselineAlignedChildIndex) {
            throw new RuntimeException("mBaselineAlignedChildIndex of LinearLayout set to an index that is out of bounds.");
        }
        View childAt = getChildAt(this.mBaselineAlignedChildIndex);
        int baseline = childAt.getBaseline();
        if (baseline != -1) {
            int i3 = this.mBaselineChildTop;
            if (this.mOrientation == 1 && (i2 = this.mGravity & 112) != 48) {
                switch (i2) {
                    case 16:
                        i = i3 + (((((getBottom() - getTop()) - getPaddingTop()) - getPaddingBottom()) - this.mTotalLength) / 2);
                        break;
                    case 80:
                        i = ((getBottom() - getTop()) - getPaddingBottom()) - this.mTotalLength;
                        break;
                    default:
                        i = i3;
                        break;
                }
            } else {
                i = i3;
            }
            return ((LayoutParams) childAt.getLayoutParams()).topMargin + i + baseline;
        } else if (this.mBaselineAlignedChildIndex == 0) {
            return -1;
        } else {
            throw new RuntimeException("mBaselineAlignedChildIndex of LinearLayout points to a View that doesn't know how to get its baseline.");
        }
    }

    public int getBaselineAlignedChildIndex() {
        return this.mBaselineAlignedChildIndex;
    }

    /* access modifiers changed from: package-private */
    public int getChildrenSkipCount(View view, int i) {
        return 0;
    }

    public Drawable getDividerDrawable() {
        return this.mDivider;
    }

    public int getDividerPadding() {
        return this.mDividerPadding;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public int getDividerWidth() {
        return this.mDividerWidth;
    }

    public int getGravity() {
        return this.mGravity;
    }

    /* access modifiers changed from: package-private */
    public int getLocationOffset(View view) {
        return 0;
    }

    /* access modifiers changed from: package-private */
    public int getNextLocationOffset(View view) {
        return 0;
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public int getShowDividers() {
        return this.mShowDividers;
    }

    /* access modifiers changed from: package-private */
    public View getVirtualChildAt(int i) {
        return getChildAt(i);
    }

    /* access modifiers changed from: package-private */
    public int getVirtualChildCount() {
        return getChildCount();
    }

    public float getWeightSum() {
        return this.mWeightSum;
    }

    /* access modifiers changed from: protected */
    public boolean hasDividerBeforeChildAt(int i) {
        if (i == 0) {
            if ((this.mShowDividers & 1) == 0) {
                return false;
            }
        } else if (i == getChildCount()) {
            if ((this.mShowDividers & 4) == 0) {
                return false;
            }
        } else if ((this.mShowDividers & 2) == 0) {
            return false;
        } else {
            for (int i2 = i - 1; i2 >= 0; i2--) {
                if (getChildAt(i2).getVisibility() != 8) {
                    return true;
                }
            }
            return false;
        }
        return true;
    }

    public boolean isBaselineAligned() {
        return this.mBaselineAligned;
    }

    public boolean isMeasureWithLargestChildEnabled() {
        return this.mUseLargestChild;
    }

    /* access modifiers changed from: package-private */
    public void layoutHorizontal(int i, int i2, int i3, int i4) {
        int paddingLeft;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        boolean isLayoutRtl = ViewUtils.isLayoutRtl(this);
        int paddingTop = getPaddingTop();
        int i10 = i4 - i2;
        int paddingBottom = getPaddingBottom();
        int paddingBottom2 = getPaddingBottom();
        int virtualChildCount = getVirtualChildCount();
        int i11 = this.mGravity;
        int i12 = this.mGravity;
        boolean z = this.mBaselineAligned;
        int[] iArr = this.mMaxAscent;
        int[] iArr2 = this.mMaxDescent;
        switch (GravityCompat.getAbsoluteGravity(i11 & GravityCompat.RELATIVE_HORIZONTAL_GRAVITY_MASK, ViewCompat.getLayoutDirection(this))) {
            case 1:
                paddingLeft = getPaddingLeft() + (((i3 - i) - this.mTotalLength) / 2);
                break;
            case 5:
                paddingLeft = ((getPaddingLeft() + i3) - i) - this.mTotalLength;
                break;
            default:
                paddingLeft = getPaddingLeft();
                break;
        }
        if (isLayoutRtl) {
            i5 = -1;
            i6 = virtualChildCount - 1;
        } else {
            i5 = 1;
            i6 = 0;
        }
        int i13 = 0;
        while (i13 < virtualChildCount) {
            int i14 = i6 + (i5 * i13);
            View virtualChildAt = getVirtualChildAt(i14);
            if (virtualChildAt == null) {
                i8 = paddingLeft + measureNullChild(i14);
                i7 = i13;
            } else if (virtualChildAt.getVisibility() != 8) {
                int measuredWidth = virtualChildAt.getMeasuredWidth();
                int measuredHeight = virtualChildAt.getMeasuredHeight();
                LayoutParams layoutParams = (LayoutParams) virtualChildAt.getLayoutParams();
                int baseline = (!z || layoutParams.height == -1) ? -1 : virtualChildAt.getBaseline();
                int i15 = layoutParams.gravity;
                if (i15 < 0) {
                    i15 = i12 & 112;
                }
                switch (i15 & 112) {
                    case 16:
                        i9 = ((((((i10 - paddingTop) - paddingBottom2) - measuredHeight) / 2) + paddingTop) + layoutParams.topMargin) - layoutParams.bottomMargin;
                        break;
                    case 48:
                        i9 = layoutParams.topMargin + paddingTop;
                        if (baseline != -1) {
                            i9 += iArr[1] - baseline;
                            break;
                        }
                        break;
                    case 80:
                        i9 = ((i10 - paddingBottom) - measuredHeight) - layoutParams.bottomMargin;
                        if (baseline != -1) {
                            i9 -= iArr2[2] - (virtualChildAt.getMeasuredHeight() - baseline);
                            break;
                        }
                        break;
                    default:
                        i9 = paddingTop;
                        break;
                }
                if (hasDividerBeforeChildAt(i14)) {
                    paddingLeft += this.mDividerWidth;
                }
                int i16 = paddingLeft + layoutParams.leftMargin;
                setChildFrame(virtualChildAt, i16 + getLocationOffset(virtualChildAt), i9, measuredWidth, measuredHeight);
                int nextLocationOffset = i16 + layoutParams.rightMargin + measuredWidth + getNextLocationOffset(virtualChildAt);
                i7 = getChildrenSkipCount(virtualChildAt, i14) + i13;
                i8 = nextLocationOffset;
            } else {
                i7 = i13;
                i8 = paddingLeft;
            }
            i13 = i7 + 1;
            paddingLeft = i8;
        }
    }

    /* access modifiers changed from: package-private */
    public void layoutVertical(int i, int i2, int i3, int i4) {
        int paddingTop;
        int i5;
        int i6;
        int i7;
        int paddingLeft = getPaddingLeft();
        int i8 = i3 - i;
        int paddingRight = getPaddingRight();
        int paddingRight2 = getPaddingRight();
        int virtualChildCount = getVirtualChildCount();
        int i9 = this.mGravity;
        int i10 = this.mGravity;
        switch (i9 & 112) {
            case 16:
                paddingTop = getPaddingTop() + (((i4 - i2) - this.mTotalLength) / 2);
                break;
            case 80:
                paddingTop = ((getPaddingTop() + i4) - i2) - this.mTotalLength;
                break;
            default:
                paddingTop = getPaddingTop();
                break;
        }
        int i11 = 0;
        int i12 = paddingTop;
        while (i11 < virtualChildCount) {
            View virtualChildAt = getVirtualChildAt(i11);
            if (virtualChildAt == null) {
                i6 = i12 + measureNullChild(i11);
                i5 = i11;
            } else if (virtualChildAt.getVisibility() != 8) {
                int measuredWidth = virtualChildAt.getMeasuredWidth();
                int measuredHeight = virtualChildAt.getMeasuredHeight();
                LayoutParams layoutParams = (LayoutParams) virtualChildAt.getLayoutParams();
                int i13 = layoutParams.gravity;
                if (i13 < 0) {
                    i13 = 8388615 & i10;
                }
                switch (GravityCompat.getAbsoluteGravity(i13, ViewCompat.getLayoutDirection(this)) & 7) {
                    case 1:
                        i7 = ((((((i8 - paddingLeft) - paddingRight2) - measuredWidth) / 2) + paddingLeft) + layoutParams.leftMargin) - layoutParams.rightMargin;
                        break;
                    case 5:
                        i7 = ((i8 - paddingRight) - measuredWidth) - layoutParams.rightMargin;
                        break;
                    default:
                        i7 = paddingLeft + layoutParams.leftMargin;
                        break;
                }
                if (hasDividerBeforeChildAt(i11)) {
                    i12 += this.mDividerHeight;
                }
                int i14 = i12 + layoutParams.topMargin;
                setChildFrame(virtualChildAt, i7, i14 + getLocationOffset(virtualChildAt), measuredWidth, measuredHeight);
                int nextLocationOffset = i14 + layoutParams.bottomMargin + measuredHeight + getNextLocationOffset(virtualChildAt);
                i5 = getChildrenSkipCount(virtualChildAt, i11) + i11;
                i6 = nextLocationOffset;
            } else {
                i5 = i11;
                i6 = i12;
            }
            i11 = i5 + 1;
            i12 = i6;
        }
    }

    /* access modifiers changed from: package-private */
    public void measureChildBeforeLayout(View view, int i, int i2, int i3, int i4, int i5) {
        measureChildWithMargins(view, i2, i3, i4, i5);
    }

    /* access modifiers changed from: package-private */
    public void measureHorizontal(int i, int i2) {
        int i3;
        int i4;
        float f;
        boolean z;
        int baseline;
        int i5;
        boolean z2;
        int i6;
        boolean z3;
        boolean z4;
        int max;
        int i7;
        boolean z5;
        float f2;
        int baseline2;
        this.mTotalLength = 0;
        int i8 = 0;
        int i9 = 0;
        int i10 = 0;
        int i11 = 0;
        boolean z6 = true;
        float f3 = 0.0f;
        int virtualChildCount = getVirtualChildCount();
        int mode = View.MeasureSpec.getMode(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        boolean z7 = false;
        boolean z8 = false;
        if (this.mMaxAscent == null || this.mMaxDescent == null) {
            this.mMaxAscent = new int[4];
            this.mMaxDescent = new int[4];
        }
        int[] iArr = this.mMaxAscent;
        int[] iArr2 = this.mMaxDescent;
        iArr[3] = -1;
        iArr[2] = -1;
        iArr[1] = -1;
        iArr[0] = -1;
        iArr2[3] = -1;
        iArr2[2] = -1;
        iArr2[1] = -1;
        iArr2[0] = -1;
        boolean z9 = this.mBaselineAligned;
        boolean z10 = this.mUseLargestChild;
        boolean z11 = mode == 1073741824;
        int i12 = Integer.MIN_VALUE;
        int i13 = 0;
        while (i13 < virtualChildCount) {
            View virtualChildAt = getVirtualChildAt(i13);
            if (virtualChildAt == null) {
                this.mTotalLength += measureNullChild(i13);
                i6 = i12;
                z5 = z8;
                z3 = z7;
                f2 = f3;
                z4 = z6;
                i7 = i11;
            } else if (virtualChildAt.getVisibility() == 8) {
                i13 += getChildrenSkipCount(virtualChildAt, i13);
                i6 = i12;
                z5 = z8;
                z3 = z7;
                f2 = f3;
                z4 = z6;
                i7 = i11;
            } else {
                if (hasDividerBeforeChildAt(i13)) {
                    this.mTotalLength += this.mDividerWidth;
                }
                LayoutParams layoutParams = (LayoutParams) virtualChildAt.getLayoutParams();
                float f4 = f3 + layoutParams.weight;
                if (mode == 1073741824 && layoutParams.width == 0 && layoutParams.weight > 0.0f) {
                    if (z11) {
                        this.mTotalLength += layoutParams.leftMargin + layoutParams.rightMargin;
                    } else {
                        int i14 = this.mTotalLength;
                        this.mTotalLength = Math.max(i14, layoutParams.leftMargin + i14 + layoutParams.rightMargin);
                    }
                    if (z9) {
                        int makeMeasureSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
                        virtualChildAt.measure(makeMeasureSpec, makeMeasureSpec);
                        z2 = z8;
                        i6 = i12;
                    } else {
                        z2 = true;
                        i6 = i12;
                    }
                } else {
                    int i15 = Integer.MIN_VALUE;
                    if (layoutParams.width == 0 && layoutParams.weight > 0.0f) {
                        i15 = 0;
                        layoutParams.width = -2;
                    }
                    int i16 = i15;
                    measureChildBeforeLayout(virtualChildAt, i13, i, f4 == 0.0f ? this.mTotalLength : 0, i2, 0);
                    if (i16 != Integer.MIN_VALUE) {
                        layoutParams.width = i16;
                    }
                    int measuredWidth = virtualChildAt.getMeasuredWidth();
                    if (z11) {
                        this.mTotalLength += layoutParams.leftMargin + measuredWidth + layoutParams.rightMargin + getNextLocationOffset(virtualChildAt);
                    } else {
                        int i17 = this.mTotalLength;
                        this.mTotalLength = Math.max(i17, i17 + measuredWidth + layoutParams.leftMargin + layoutParams.rightMargin + getNextLocationOffset(virtualChildAt));
                    }
                    if (z10) {
                        z2 = z8;
                        i6 = Math.max(measuredWidth, i12);
                    } else {
                        z2 = z8;
                        i6 = i12;
                    }
                }
                boolean z12 = false;
                if (mode2 == 1073741824 || layoutParams.height != -1) {
                    z3 = z7;
                } else {
                    z12 = true;
                    z3 = true;
                }
                int i18 = layoutParams.bottomMargin + layoutParams.topMargin;
                int measuredHeight = virtualChildAt.getMeasuredHeight() + i18;
                int combineMeasuredStates = ViewUtils.combineMeasuredStates(i9, ViewCompat.getMeasuredState(virtualChildAt));
                if (z9 && (baseline2 = virtualChildAt.getBaseline()) != -1) {
                    int i19 = ((((layoutParams.gravity < 0 ? this.mGravity : layoutParams.gravity) & 112) >> 4) & -2) >> 1;
                    iArr[i19] = Math.max(iArr[i19], baseline2);
                    iArr2[i19] = Math.max(iArr2[i19], measuredHeight - baseline2);
                }
                int max2 = Math.max(i8, measuredHeight);
                z4 = z6 && layoutParams.height == -1;
                if (layoutParams.weight > 0.0f) {
                    i7 = Math.max(i11, z12 ? i18 : measuredHeight);
                    max = i10;
                } else {
                    if (!z12) {
                        i18 = measuredHeight;
                    }
                    max = Math.max(i10, i18);
                    i7 = i11;
                }
                i13 += getChildrenSkipCount(virtualChildAt, i13);
                z5 = z2;
                f2 = f4;
                i10 = max;
                i9 = combineMeasuredStates;
                i8 = max2;
            }
            i13++;
            i12 = i6;
            z8 = z5;
            z7 = z3;
            f3 = f2;
            z6 = z4;
            i11 = i7;
        }
        if (this.mTotalLength > 0 && hasDividerBeforeChildAt(virtualChildCount)) {
            this.mTotalLength += this.mDividerWidth;
        }
        int max3 = (iArr[1] == -1 && iArr[0] == -1 && iArr[2] == -1 && iArr[3] == -1) ? i8 : Math.max(i8, Math.max(iArr[3], Math.max(iArr[0], Math.max(iArr[1], iArr[2]))) + Math.max(iArr2[3], Math.max(iArr2[0], Math.max(iArr2[1], iArr2[2]))));
        if (z10 && (mode == Integer.MIN_VALUE || mode == 0)) {
            this.mTotalLength = 0;
            int i20 = 0;
            while (i20 < virtualChildCount) {
                View virtualChildAt2 = getVirtualChildAt(i20);
                if (virtualChildAt2 == null) {
                    this.mTotalLength += measureNullChild(i20);
                    i5 = i20;
                } else if (virtualChildAt2.getVisibility() == 8) {
                    i5 = getChildrenSkipCount(virtualChildAt2, i20) + i20;
                } else {
                    LayoutParams layoutParams2 = (LayoutParams) virtualChildAt2.getLayoutParams();
                    if (z11) {
                        this.mTotalLength = layoutParams2.rightMargin + layoutParams2.leftMargin + i12 + getNextLocationOffset(virtualChildAt2) + this.mTotalLength;
                        i5 = i20;
                    } else {
                        int i21 = this.mTotalLength;
                        this.mTotalLength = Math.max(i21, layoutParams2.rightMargin + i21 + i12 + layoutParams2.leftMargin + getNextLocationOffset(virtualChildAt2));
                        i5 = i20;
                    }
                }
                i20 = i5 + 1;
            }
        }
        this.mTotalLength += getPaddingLeft() + getPaddingRight();
        int resolveSizeAndState = ViewCompat.resolveSizeAndState(Math.max(this.mTotalLength, getSuggestedMinimumWidth()), i, 0);
        int i22 = (16777215 & resolveSizeAndState) - this.mTotalLength;
        if (z8 || (i22 != 0 && f3 > 0.0f)) {
            if (this.mWeightSum > 0.0f) {
                f3 = this.mWeightSum;
            }
            iArr[3] = -1;
            iArr[2] = -1;
            iArr[1] = -1;
            iArr[0] = -1;
            iArr2[3] = -1;
            iArr2[2] = -1;
            iArr2[1] = -1;
            iArr2[0] = -1;
            int i23 = -1;
            this.mTotalLength = 0;
            float f5 = f3;
            int i24 = 0;
            boolean z13 = z6;
            int i25 = i10;
            int i26 = i9;
            while (i24 < virtualChildCount) {
                View virtualChildAt3 = getVirtualChildAt(i24);
                if (virtualChildAt3 == null) {
                    f = f5;
                    z = z13;
                } else if (virtualChildAt3.getVisibility() == 8) {
                    f = f5;
                    z = z13;
                } else {
                    LayoutParams layoutParams3 = (LayoutParams) virtualChildAt3.getLayoutParams();
                    float f6 = layoutParams3.weight;
                    if (f6 > 0.0f) {
                        int i27 = (int) ((((float) i22) * f6) / f5);
                        float f7 = f5 - f6;
                        i22 -= i27;
                        int childMeasureSpec = getChildMeasureSpec(i2, getPaddingTop() + getPaddingBottom() + layoutParams3.topMargin + layoutParams3.bottomMargin, layoutParams3.height);
                        if (layoutParams3.width == 0 && mode == 1073741824) {
                            virtualChildAt3.measure(View.MeasureSpec.makeMeasureSpec(i27 > 0 ? i27 : 0, 1073741824), childMeasureSpec);
                        } else {
                            int measuredWidth2 = virtualChildAt3.getMeasuredWidth() + i27;
                            if (measuredWidth2 < 0) {
                                measuredWidth2 = 0;
                            }
                            virtualChildAt3.measure(View.MeasureSpec.makeMeasureSpec(measuredWidth2, 1073741824), childMeasureSpec);
                        }
                        i26 = ViewUtils.combineMeasuredStates(i26, ViewCompat.getMeasuredState(virtualChildAt3) & ViewCompat.MEASURED_STATE_MASK);
                        f5 = f7;
                    }
                    if (z11) {
                        this.mTotalLength += virtualChildAt3.getMeasuredWidth() + layoutParams3.leftMargin + layoutParams3.rightMargin + getNextLocationOffset(virtualChildAt3);
                    } else {
                        int i28 = this.mTotalLength;
                        this.mTotalLength = Math.max(i28, virtualChildAt3.getMeasuredWidth() + i28 + layoutParams3.leftMargin + layoutParams3.rightMargin + getNextLocationOffset(virtualChildAt3));
                    }
                    boolean z14 = mode2 != 1073741824 && layoutParams3.height == -1;
                    int i29 = layoutParams3.topMargin + layoutParams3.bottomMargin;
                    int measuredHeight2 = virtualChildAt3.getMeasuredHeight() + i29;
                    i23 = Math.max(i23, measuredHeight2);
                    i25 = Math.max(i25, z14 ? i29 : measuredHeight2);
                    z = z13 && layoutParams3.height == -1;
                    if (!z9 || (baseline = virtualChildAt3.getBaseline()) == -1) {
                        f = f5;
                    } else {
                        int i30 = ((((layoutParams3.gravity < 0 ? this.mGravity : layoutParams3.gravity) & 112) >> 4) & -2) >> 1;
                        iArr[i30] = Math.max(iArr[i30], baseline);
                        iArr2[i30] = Math.max(iArr2[i30], measuredHeight2 - baseline);
                        f = f5;
                    }
                }
                f5 = f;
                i24++;
                z13 = z;
            }
            this.mTotalLength += getPaddingLeft() + getPaddingRight();
            if (iArr[1] == -1 && iArr[0] == -1 && iArr[2] == -1 && iArr[3] == -1) {
                z6 = z13;
                i9 = i26;
                i3 = i23;
                i4 = i25;
            } else {
                i3 = Math.max(i23, Math.max(iArr[3], Math.max(iArr[0], Math.max(iArr[1], iArr[2]))) + Math.max(iArr2[3], Math.max(iArr2[0], Math.max(iArr2[1], iArr2[2]))));
                z6 = z13;
                i9 = i26;
                i4 = i25;
            }
        } else {
            int max4 = Math.max(i10, i11);
            if (z10 && mode != 1073741824) {
                int i31 = 0;
                while (true) {
                    int i32 = i31;
                    if (i32 >= virtualChildCount) {
                        break;
                    }
                    View virtualChildAt4 = getVirtualChildAt(i32);
                    if (!(virtualChildAt4 == null || virtualChildAt4.getVisibility() == 8 || ((LayoutParams) virtualChildAt4.getLayoutParams()).weight <= 0.0f)) {
                        virtualChildAt4.measure(View.MeasureSpec.makeMeasureSpec(i12, 1073741824), View.MeasureSpec.makeMeasureSpec(virtualChildAt4.getMeasuredHeight(), 1073741824));
                    }
                    i31 = i32 + 1;
                }
            }
            i3 = max3;
            i4 = max4;
        }
        if (z6 || mode2 == 1073741824) {
            i4 = i3;
        }
        setMeasuredDimension((-16777216 & i9) | resolveSizeAndState, ViewCompat.resolveSizeAndState(Math.max(i4 + getPaddingTop() + getPaddingBottom(), getSuggestedMinimumHeight()), i2, i9 << 16));
        if (z7) {
            forceUniformHeight(virtualChildCount, i);
        }
    }

    /* access modifiers changed from: package-private */
    public int measureNullChild(int i) {
        return 0;
    }

    /* access modifiers changed from: package-private */
    public void measureVertical(int i, int i2) {
        int i3;
        int i4;
        int max;
        int i5;
        int i6;
        boolean z;
        int i7;
        boolean z2;
        boolean z3;
        int max2;
        int i8;
        boolean z4;
        float f;
        this.mTotalLength = 0;
        int i9 = 0;
        int i10 = 0;
        int i11 = 0;
        int i12 = 0;
        boolean z5 = true;
        float f2 = 0.0f;
        int virtualChildCount = getVirtualChildCount();
        int mode = View.MeasureSpec.getMode(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        boolean z6 = false;
        boolean z7 = false;
        int i13 = this.mBaselineAlignedChildIndex;
        boolean z8 = this.mUseLargestChild;
        int i14 = Integer.MIN_VALUE;
        int i15 = 0;
        while (i15 < virtualChildCount) {
            View virtualChildAt = getVirtualChildAt(i15);
            if (virtualChildAt == null) {
                this.mTotalLength += measureNullChild(i15);
                i7 = i14;
                z4 = z7;
                z2 = z6;
                f = f2;
                z3 = z5;
                i8 = i12;
            } else if (virtualChildAt.getVisibility() == 8) {
                i15 += getChildrenSkipCount(virtualChildAt, i15);
                i7 = i14;
                z4 = z7;
                z2 = z6;
                f = f2;
                z3 = z5;
                i8 = i12;
            } else {
                if (hasDividerBeforeChildAt(i15)) {
                    this.mTotalLength += this.mDividerHeight;
                }
                LayoutParams layoutParams = (LayoutParams) virtualChildAt.getLayoutParams();
                float f3 = f2 + layoutParams.weight;
                if (mode2 == 1073741824 && layoutParams.height == 0 && layoutParams.weight > 0.0f) {
                    int i16 = this.mTotalLength;
                    this.mTotalLength = Math.max(i16, layoutParams.topMargin + i16 + layoutParams.bottomMargin);
                    z = true;
                    i7 = i14;
                } else {
                    int i17 = Integer.MIN_VALUE;
                    if (layoutParams.height == 0 && layoutParams.weight > 0.0f) {
                        i17 = 0;
                        layoutParams.height = -2;
                    }
                    int i18 = i17;
                    measureChildBeforeLayout(virtualChildAt, i15, i, 0, i2, f3 == 0.0f ? this.mTotalLength : 0);
                    if (i18 != Integer.MIN_VALUE) {
                        layoutParams.height = i18;
                    }
                    int measuredHeight = virtualChildAt.getMeasuredHeight();
                    int i19 = this.mTotalLength;
                    this.mTotalLength = Math.max(i19, i19 + measuredHeight + layoutParams.topMargin + layoutParams.bottomMargin + getNextLocationOffset(virtualChildAt));
                    if (z8) {
                        z = z7;
                        i7 = Math.max(measuredHeight, i14);
                    } else {
                        z = z7;
                        i7 = i14;
                    }
                }
                if (i13 >= 0 && i13 == i15 + 1) {
                    this.mBaselineChildTop = this.mTotalLength;
                }
                if (i15 >= i13 || layoutParams.weight <= 0.0f) {
                    boolean z9 = false;
                    if (mode == 1073741824 || layoutParams.width != -1) {
                        z2 = z6;
                    } else {
                        z9 = true;
                        z2 = true;
                    }
                    int i20 = layoutParams.leftMargin + layoutParams.rightMargin;
                    int measuredWidth = virtualChildAt.getMeasuredWidth() + i20;
                    int max3 = Math.max(i9, measuredWidth);
                    int combineMeasuredStates = ViewUtils.combineMeasuredStates(i10, ViewCompat.getMeasuredState(virtualChildAt));
                    z3 = z5 && layoutParams.width == -1;
                    if (layoutParams.weight > 0.0f) {
                        i8 = Math.max(i12, z9 ? i20 : measuredWidth);
                        max2 = i11;
                    } else {
                        if (z9) {
                            measuredWidth = i20;
                        }
                        max2 = Math.max(i11, measuredWidth);
                        i8 = i12;
                    }
                    i15 += getChildrenSkipCount(virtualChildAt, i15);
                    z4 = z;
                    f = f3;
                    i11 = max2;
                    i10 = combineMeasuredStates;
                    i9 = max3;
                } else {
                    throw new RuntimeException("A child of LinearLayout with index less than mBaselineAlignedChildIndex has weight > 0, which won't work.  Either remove the weight, or don't set mBaselineAlignedChildIndex.");
                }
            }
            i15++;
            i14 = i7;
            z7 = z4;
            z6 = z2;
            f2 = f;
            z5 = z3;
            i12 = i8;
        }
        if (this.mTotalLength > 0 && hasDividerBeforeChildAt(virtualChildCount)) {
            this.mTotalLength += this.mDividerHeight;
        }
        if (z8 && (mode2 == Integer.MIN_VALUE || mode2 == 0)) {
            this.mTotalLength = 0;
            int i21 = 0;
            while (i21 < virtualChildCount) {
                View virtualChildAt2 = getVirtualChildAt(i21);
                if (virtualChildAt2 == null) {
                    this.mTotalLength += measureNullChild(i21);
                    i6 = i21;
                } else if (virtualChildAt2.getVisibility() == 8) {
                    i6 = getChildrenSkipCount(virtualChildAt2, i21) + i21;
                } else {
                    LayoutParams layoutParams2 = (LayoutParams) virtualChildAt2.getLayoutParams();
                    int i22 = this.mTotalLength;
                    this.mTotalLength = Math.max(i22, layoutParams2.bottomMargin + i22 + i14 + layoutParams2.topMargin + getNextLocationOffset(virtualChildAt2));
                    i6 = i21;
                }
                i21 = i6 + 1;
            }
        }
        this.mTotalLength += getPaddingTop() + getPaddingBottom();
        int resolveSizeAndState = ViewCompat.resolveSizeAndState(Math.max(this.mTotalLength, getSuggestedMinimumHeight()), i2, 0);
        int i23 = (16777215 & resolveSizeAndState) - this.mTotalLength;
        if (z7 || (i23 != 0 && f2 > 0.0f)) {
            if (this.mWeightSum > 0.0f) {
                f2 = this.mWeightSum;
            }
            this.mTotalLength = 0;
            int i24 = 0;
            float f4 = f2;
            boolean z10 = z5;
            int i25 = i9;
            int i26 = i11;
            int i27 = i10;
            while (i24 < virtualChildCount) {
                View virtualChildAt3 = getVirtualChildAt(i24);
                if (virtualChildAt3.getVisibility() == 8) {
                    i5 = i27;
                    max = i25;
                } else {
                    LayoutParams layoutParams3 = (LayoutParams) virtualChildAt3.getLayoutParams();
                    float f5 = layoutParams3.weight;
                    if (f5 > 0.0f) {
                        int i28 = (int) ((((float) i23) * f5) / f4);
                        float f6 = f4 - f5;
                        i23 -= i28;
                        int childMeasureSpec = getChildMeasureSpec(i, getPaddingLeft() + getPaddingRight() + layoutParams3.leftMargin + layoutParams3.rightMargin, layoutParams3.width);
                        if (layoutParams3.height == 0 && mode2 == 1073741824) {
                            virtualChildAt3.measure(childMeasureSpec, View.MeasureSpec.makeMeasureSpec(i28 > 0 ? i28 : 0, 1073741824));
                        } else {
                            int measuredHeight2 = virtualChildAt3.getMeasuredHeight() + i28;
                            if (measuredHeight2 < 0) {
                                measuredHeight2 = 0;
                            }
                            virtualChildAt3.measure(childMeasureSpec, View.MeasureSpec.makeMeasureSpec(measuredHeight2, 1073741824));
                        }
                        i27 = ViewUtils.combineMeasuredStates(i27, ViewCompat.getMeasuredState(virtualChildAt3) & InputDeviceCompat.SOURCE_ANY);
                        f4 = f6;
                    }
                    int i29 = layoutParams3.rightMargin + layoutParams3.leftMargin;
                    int measuredWidth2 = virtualChildAt3.getMeasuredWidth() + i29;
                    max = Math.max(i25, measuredWidth2);
                    i26 = Math.max(i26, mode != 1073741824 && layoutParams3.width == -1 ? i29 : measuredWidth2);
                    boolean z11 = z10 && layoutParams3.width == -1;
                    int i30 = this.mTotalLength;
                    this.mTotalLength = Math.max(i30, layoutParams3.bottomMargin + virtualChildAt3.getMeasuredHeight() + i30 + layoutParams3.topMargin + getNextLocationOffset(virtualChildAt3));
                    i5 = i27;
                    z10 = z11;
                }
                i24++;
                i25 = max;
                i27 = i5;
            }
            this.mTotalLength += getPaddingTop() + getPaddingBottom();
            i10 = i27;
            z5 = z10;
            i3 = i25;
            i4 = i26;
        } else {
            int max4 = Math.max(i11, i12);
            if (z8 && mode2 != 1073741824) {
                int i31 = 0;
                while (true) {
                    int i32 = i31;
                    if (i32 >= virtualChildCount) {
                        break;
                    }
                    View virtualChildAt4 = getVirtualChildAt(i32);
                    if (!(virtualChildAt4 == null || virtualChildAt4.getVisibility() == 8 || ((LayoutParams) virtualChildAt4.getLayoutParams()).weight <= 0.0f)) {
                        virtualChildAt4.measure(View.MeasureSpec.makeMeasureSpec(virtualChildAt4.getMeasuredWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(i14, 1073741824));
                    }
                    i31 = i32 + 1;
                }
            }
            i3 = i9;
            i4 = max4;
        }
        if (z5 || mode == 1073741824) {
            i4 = i3;
        }
        setMeasuredDimension(ViewCompat.resolveSizeAndState(Math.max(i4 + getPaddingLeft() + getPaddingRight(), getSuggestedMinimumWidth()), i, i10), resolveSizeAndState);
        if (z6) {
            forceUniformWidth(virtualChildCount, i2);
        }
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        if (this.mDivider != null) {
            if (this.mOrientation == 1) {
                drawDividersVertical(canvas);
            } else {
                drawDividersHorizontal(canvas);
            }
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        if (Build.VERSION.SDK_INT >= 14) {
            super.onInitializeAccessibilityEvent(accessibilityEvent);
            accessibilityEvent.setClassName(LinearLayoutCompat.class.getName());
        }
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        if (Build.VERSION.SDK_INT >= 14) {
            super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
            accessibilityNodeInfo.setClassName(LinearLayoutCompat.class.getName());
        }
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        if (this.mOrientation == 1) {
            layoutVertical(i, i2, i3, i4);
        } else {
            layoutHorizontal(i, i2, i3, i4);
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        if (this.mOrientation == 1) {
            measureVertical(i, i2);
        } else {
            measureHorizontal(i, i2);
        }
    }

    public void setBaselineAligned(boolean z) {
        this.mBaselineAligned = z;
    }

    public void setBaselineAlignedChildIndex(int i) {
        if (i < 0 || i >= getChildCount()) {
            throw new IllegalArgumentException("base aligned child index out of range (0, " + getChildCount() + ")");
        }
        this.mBaselineAlignedChildIndex = i;
    }

    public void setDividerDrawable(Drawable drawable) {
        boolean z = false;
        if (drawable != this.mDivider) {
            this.mDivider = drawable;
            if (drawable != null) {
                this.mDividerWidth = drawable.getIntrinsicWidth();
                this.mDividerHeight = drawable.getIntrinsicHeight();
            } else {
                this.mDividerWidth = 0;
                this.mDividerHeight = 0;
            }
            if (drawable == null) {
                z = true;
            }
            setWillNotDraw(z);
            requestLayout();
        }
    }

    public void setDividerPadding(int i) {
        this.mDividerPadding = i;
    }

    public void setGravity(int i) {
        if (this.mGravity != i) {
            int i2 = (8388615 & i) == 0 ? 8388611 | i : i;
            if ((i2 & 112) == 0) {
                i2 |= 48;
            }
            this.mGravity = i2;
            requestLayout();
        }
    }

    public void setHorizontalGravity(int i) {
        int i2 = i & GravityCompat.RELATIVE_HORIZONTAL_GRAVITY_MASK;
        if ((this.mGravity & GravityCompat.RELATIVE_HORIZONTAL_GRAVITY_MASK) != i2) {
            this.mGravity = i2 | (this.mGravity & -8388616);
            requestLayout();
        }
    }

    public void setMeasureWithLargestChildEnabled(boolean z) {
        this.mUseLargestChild = z;
    }

    public void setOrientation(int i) {
        if (this.mOrientation != i) {
            this.mOrientation = i;
            requestLayout();
        }
    }

    public void setShowDividers(int i) {
        if (i != this.mShowDividers) {
            requestLayout();
        }
        this.mShowDividers = i;
    }

    public void setVerticalGravity(int i) {
        int i2 = i & 112;
        if ((this.mGravity & 112) != i2) {
            this.mGravity = i2 | (this.mGravity & -113);
            requestLayout();
        }
    }

    public void setWeightSum(float f) {
        this.mWeightSum = Math.max(0.0f, f);
    }

    public boolean shouldDelayChildPressedState() {
        return false;
    }
}
