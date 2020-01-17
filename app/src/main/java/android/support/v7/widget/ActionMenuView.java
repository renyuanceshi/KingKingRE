package android.support.v7.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import android.support.annotation.RestrictTo;
import android.support.annotation.StyleRes;
import android.support.v7.view.menu.ActionMenuItemView;
import android.support.v7.view.menu.MenuBuilder;
import android.support.v7.view.menu.MenuItemImpl;
import android.support.v7.view.menu.MenuPresenter;
import android.support.v7.view.menu.MenuView;
import android.support.v7.widget.LinearLayoutCompat;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewDebug;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;

public class ActionMenuView extends LinearLayoutCompat implements MenuBuilder.ItemInvoker, MenuView {
    static final int GENERATED_ITEM_PADDING = 4;
    static final int MIN_CELL_SIZE = 56;
    private static final String TAG = "ActionMenuView";
    private MenuPresenter.Callback mActionMenuPresenterCallback;
    private boolean mFormatItems;
    private int mFormatItemsWidth;
    private int mGeneratedItemPadding;
    private MenuBuilder mMenu;
    MenuBuilder.Callback mMenuBuilderCallback;
    private int mMinCellSize;
    OnMenuItemClickListener mOnMenuItemClickListener;
    private Context mPopupContext;
    private int mPopupTheme;
    private ActionMenuPresenter mPresenter;
    private boolean mReserveOverflow;

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public interface ActionMenuChildView {
        boolean needsDividerAfter();

        boolean needsDividerBefore();
    }

    private class ActionMenuPresenterCallback implements MenuPresenter.Callback {
        ActionMenuPresenterCallback() {
        }

        public void onCloseMenu(MenuBuilder menuBuilder, boolean z) {
        }

        public boolean onOpenSubMenu(MenuBuilder menuBuilder) {
            return false;
        }
    }

    public static class LayoutParams extends LinearLayoutCompat.LayoutParams {
        @ViewDebug.ExportedProperty
        public int cellsUsed;
        @ViewDebug.ExportedProperty
        public boolean expandable;
        boolean expanded;
        @ViewDebug.ExportedProperty
        public int extraPixels;
        @ViewDebug.ExportedProperty
        public boolean isOverflowButton;
        @ViewDebug.ExportedProperty
        public boolean preventEdgeOffset;

        public LayoutParams(int i, int i2) {
            super(i, i2);
            this.isOverflowButton = false;
        }

        LayoutParams(int i, int i2, boolean z) {
            super(i, i2);
            this.isOverflowButton = z;
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        public LayoutParams(LayoutParams layoutParams) {
            super((ViewGroup.LayoutParams) layoutParams);
            this.isOverflowButton = layoutParams.isOverflowButton;
        }

        public LayoutParams(ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
        }
    }

    private class MenuBuilderCallback implements MenuBuilder.Callback {
        MenuBuilderCallback() {
        }

        public boolean onMenuItemSelected(MenuBuilder menuBuilder, MenuItem menuItem) {
            return ActionMenuView.this.mOnMenuItemClickListener != null && ActionMenuView.this.mOnMenuItemClickListener.onMenuItemClick(menuItem);
        }

        public void onMenuModeChange(MenuBuilder menuBuilder) {
            if (ActionMenuView.this.mMenuBuilderCallback != null) {
                ActionMenuView.this.mMenuBuilderCallback.onMenuModeChange(menuBuilder);
            }
        }
    }

    public interface OnMenuItemClickListener {
        boolean onMenuItemClick(MenuItem menuItem);
    }

    public ActionMenuView(Context context) {
        this(context, (AttributeSet) null);
    }

    public ActionMenuView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setBaselineAligned(false);
        float f = context.getResources().getDisplayMetrics().density;
        this.mMinCellSize = (int) (56.0f * f);
        this.mGeneratedItemPadding = (int) (f * 4.0f);
        this.mPopupContext = context;
        this.mPopupTheme = 0;
    }

    static int measureChildForCells(View view, int i, int i2, int i3, int i4) {
        int i5;
        boolean z = false;
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        int makeMeasureSpec = View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(i3) - i4, View.MeasureSpec.getMode(i3));
        ActionMenuItemView actionMenuItemView = view instanceof ActionMenuItemView ? (ActionMenuItemView) view : null;
        boolean z2 = actionMenuItemView != null && actionMenuItemView.hasText();
        if (i2 <= 0 || (z2 && i2 < 2)) {
            i5 = 0;
        } else {
            view.measure(View.MeasureSpec.makeMeasureSpec(i * i2, Integer.MIN_VALUE), makeMeasureSpec);
            int measuredWidth = view.getMeasuredWidth();
            i5 = measuredWidth / i;
            if (measuredWidth % i != 0) {
                i5++;
            }
            if (z2 && i5 < 2) {
                i5 = 2;
            }
        }
        if (!layoutParams.isOverflowButton && z2) {
            z = true;
        }
        layoutParams.expandable = z;
        layoutParams.cellsUsed = i5;
        view.measure(View.MeasureSpec.makeMeasureSpec(i5 * i, 1073741824), makeMeasureSpec);
        return i5;
    }

    /* JADX WARNING: Removed duplicated region for block: B:107:0x0258  */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x01b7  */
    /* JADX WARNING: Removed duplicated region for block: B:85:0x01c6  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void onMeasureExactFormat(int r33, int r34) {
        /*
            r32 = this;
            int r24 = android.view.View.MeasureSpec.getMode(r34)
            int r6 = android.view.View.MeasureSpec.getSize(r33)
            int r20 = android.view.View.MeasureSpec.getSize(r34)
            int r7 = r32.getPaddingLeft()
            int r8 = r32.getPaddingRight()
            int r9 = r32.getPaddingTop()
            int r10 = r32.getPaddingBottom()
            int r18 = r9 + r10
            r9 = -2
            r0 = r34
            r1 = r18
            int r25 = getChildMeasureSpec(r0, r1, r9)
            int r7 = r7 + r8
            int r26 = r6 - r7
            r0 = r32
            int r6 = r0.mMinCellSize
            int r16 = r26 / r6
            r0 = r32
            int r6 = r0.mMinCellSize
            if (r16 != 0) goto L_0x003f
            r6 = 0
            r0 = r32
            r1 = r26
            r0.setMeasuredDimension(r1, r6)
        L_0x003e:
            return
        L_0x003f:
            r0 = r32
            int r7 = r0.mMinCellSize
            int r6 = r26 % r6
            int r6 = r6 / r16
            int r27 = r7 + r6
            r15 = 0
            r14 = 0
            r13 = 0
            r7 = 0
            r9 = 0
            r10 = 0
            int r28 = r32.getChildCount()
            r6 = 0
            r17 = r6
        L_0x0057:
            r0 = r17
            r1 = r28
            if (r0 >= r1) goto L_0x00f0
            r0 = r32
            r1 = r17
            android.view.View r8 = r0.getChildAt(r1)
            int r6 = r8.getVisibility()
            r12 = 8
            if (r6 != r12) goto L_0x0074
            r6 = r9
        L_0x006e:
            int r8 = r17 + 1
            r17 = r8
            r9 = r6
            goto L_0x0057
        L_0x0074:
            boolean r0 = r8 instanceof android.support.v7.view.menu.ActionMenuItemView
            r19 = r0
            int r12 = r7 + 1
            if (r19 == 0) goto L_0x0090
            r0 = r32
            int r6 = r0.mGeneratedItemPadding
            r7 = 0
            r0 = r32
            int r0 = r0.mGeneratedItemPadding
            r21 = r0
            r22 = 0
            r0 = r21
            r1 = r22
            r8.setPadding(r6, r7, r0, r1)
        L_0x0090:
            android.view.ViewGroup$LayoutParams r6 = r8.getLayoutParams()
            android.support.v7.widget.ActionMenuView$LayoutParams r6 = (android.support.v7.widget.ActionMenuView.LayoutParams) r6
            r7 = 0
            r6.expanded = r7
            r7 = 0
            r6.extraPixels = r7
            r7 = 0
            r6.cellsUsed = r7
            r7 = 0
            r6.expandable = r7
            r7 = 0
            r6.leftMargin = r7
            r7 = 0
            r6.rightMargin = r7
            if (r19 == 0) goto L_0x00eb
            r7 = r8
            android.support.v7.view.menu.ActionMenuItemView r7 = (android.support.v7.view.menu.ActionMenuItemView) r7
            boolean r7 = r7.hasText()
            if (r7 == 0) goto L_0x00eb
            r7 = 1
        L_0x00b4:
            r6.preventEdgeOffset = r7
            boolean r7 = r6.isOverflowButton
            if (r7 == 0) goto L_0x00ed
            r7 = 1
        L_0x00bb:
            r0 = r27
            r1 = r25
            r2 = r18
            int r7 = measureChildForCells(r8, r0, r7, r1, r2)
            int r14 = java.lang.Math.max(r14, r7)
            boolean r0 = r6.expandable
            r19 = r0
            if (r19 == 0) goto L_0x00d1
            int r13 = r13 + 1
        L_0x00d1:
            boolean r6 = r6.isOverflowButton
            if (r6 == 0) goto L_0x02f4
            r6 = 1
        L_0x00d6:
            int r16 = r16 - r7
            int r8 = r8.getMeasuredHeight()
            int r15 = java.lang.Math.max(r15, r8)
            r8 = 1
            if (r7 != r8) goto L_0x02f1
            r7 = 1
            int r7 = r7 << r17
            long r8 = (long) r7
            long r8 = r8 | r10
            r10 = r8
            r7 = r12
            goto L_0x006e
        L_0x00eb:
            r7 = 0
            goto L_0x00b4
        L_0x00ed:
            r7 = r16
            goto L_0x00bb
        L_0x00f0:
            if (r9 == 0) goto L_0x0129
            r6 = 2
            if (r7 != r6) goto L_0x0129
            r6 = 1
            r8 = r6
        L_0x00f7:
            r21 = 0
            r22 = r16
            r18 = r10
        L_0x00fd:
            if (r13 <= 0) goto L_0x0151
            if (r22 <= 0) goto L_0x0151
            r10 = 2147483647(0x7fffffff, float:NaN)
            r16 = 0
            r11 = 0
            r6 = 0
            r23 = r6
        L_0x010a:
            r0 = r23
            r1 = r28
            if (r0 >= r1) goto L_0x014b
            r0 = r32
            r1 = r23
            android.view.View r6 = r0.getChildAt(r1)
            android.view.ViewGroup$LayoutParams r6 = r6.getLayoutParams()
            android.support.v7.widget.ActionMenuView$LayoutParams r6 = (android.support.v7.widget.ActionMenuView.LayoutParams) r6
            boolean r12 = r6.expandable
            if (r12 != 0) goto L_0x012c
            r6 = r10
            r12 = r11
        L_0x0124:
            int r23 = r23 + 1
            r11 = r12
            r10 = r6
            goto L_0x010a
        L_0x0129:
            r6 = 0
            r8 = r6
            goto L_0x00f7
        L_0x012c:
            int r12 = r6.cellsUsed
            if (r12 >= r10) goto L_0x013a
            int r6 = r6.cellsUsed
            r10 = 1
            int r10 = r10 << r23
            long r10 = (long) r10
            r12 = 1
            r16 = r10
            goto L_0x0124
        L_0x013a:
            int r6 = r6.cellsUsed
            if (r6 != r10) goto L_0x02ed
            r6 = 1
            int r6 = r6 << r23
            long r0 = (long) r6
            r30 = r0
            long r16 = r16 | r30
            int r11 = r11 + 1
            r6 = r10
            r12 = r11
            goto L_0x0124
        L_0x014b:
            long r18 = r18 | r16
            r0 = r22
            if (r11 <= r0) goto L_0x01d6
        L_0x0151:
            if (r9 != 0) goto L_0x0255
            r6 = 1
            if (r7 != r6) goto L_0x0255
            r6 = 1
        L_0x0157:
            if (r22 <= 0) goto L_0x02a1
            r8 = 0
            int r8 = (r18 > r8 ? 1 : (r18 == r8 ? 0 : -1))
            if (r8 == 0) goto L_0x02a1
            int r7 = r7 + -1
            r0 = r22
            if (r0 < r7) goto L_0x016a
            if (r6 != 0) goto L_0x016a
            r7 = 1
            if (r14 <= r7) goto L_0x02a1
        L_0x016a:
            int r7 = java.lang.Long.bitCount(r18)
            float r7 = (float) r7
            if (r6 != 0) goto L_0x02ea
            r8 = 1
            long r8 = r8 & r18
            r10 = 0
            int r6 = (r8 > r10 ? 1 : (r8 == r10 ? 0 : -1))
            if (r6 == 0) goto L_0x018f
            r6 = 0
            r0 = r32
            android.view.View r6 = r0.getChildAt(r6)
            android.view.ViewGroup$LayoutParams r6 = r6.getLayoutParams()
            android.support.v7.widget.ActionMenuView$LayoutParams r6 = (android.support.v7.widget.ActionMenuView.LayoutParams) r6
            boolean r6 = r6.preventEdgeOffset
            if (r6 != 0) goto L_0x018f
            r6 = 1056964608(0x3f000000, float:0.5)
            float r7 = r7 - r6
        L_0x018f:
            r6 = 1
            int r8 = r28 + -1
            int r6 = r6 << r8
            long r8 = (long) r6
            long r8 = r8 & r18
            r10 = 0
            int r6 = (r8 > r10 ? 1 : (r8 == r10 ? 0 : -1))
            if (r6 == 0) goto L_0x02ea
            int r6 = r28 + -1
            r0 = r32
            android.view.View r6 = r0.getChildAt(r6)
            android.view.ViewGroup$LayoutParams r6 = r6.getLayoutParams()
            android.support.v7.widget.ActionMenuView$LayoutParams r6 = (android.support.v7.widget.ActionMenuView.LayoutParams) r6
            boolean r6 = r6.preventEdgeOffset
            if (r6 != 0) goto L_0x02ea
            r6 = 1056964608(0x3f000000, float:0.5)
            float r6 = r7 - r6
        L_0x01b2:
            r7 = 0
            int r7 = (r6 > r7 ? 1 : (r6 == r7 ? 0 : -1))
            if (r7 <= 0) goto L_0x0258
            int r7 = r22 * r27
            float r7 = (float) r7
            float r6 = r7 / r6
            int r6 = (int) r6
            r7 = r6
        L_0x01be:
            r6 = 0
            r9 = r6
            r8 = r21
        L_0x01c2:
            r0 = r28
            if (r9 >= r0) goto L_0x02a3
            r6 = 1
            int r6 = r6 << r9
            long r10 = (long) r6
            long r10 = r10 & r18
            r12 = 0
            int r6 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r6 != 0) goto L_0x025c
            r6 = r8
        L_0x01d2:
            int r9 = r9 + 1
            r8 = r6
            goto L_0x01c2
        L_0x01d6:
            r6 = 0
            r11 = r22
            r12 = r6
        L_0x01da:
            r0 = r28
            if (r12 >= r0) goto L_0x024f
            r0 = r32
            android.view.View r21 = r0.getChildAt(r12)
            android.view.ViewGroup$LayoutParams r6 = r21.getLayoutParams()
            android.support.v7.widget.ActionMenuView$LayoutParams r6 = (android.support.v7.widget.ActionMenuView.LayoutParams) r6
            r22 = 1
            int r22 = r22 << r12
            r0 = r22
            long r0 = (long) r0
            r22 = r0
            long r22 = r22 & r16
            r30 = 0
            int r22 = (r22 > r30 ? 1 : (r22 == r30 ? 0 : -1))
            if (r22 != 0) goto L_0x020f
            int r6 = r6.cellsUsed
            int r21 = r10 + 1
            r0 = r21
            if (r6 != r0) goto L_0x02e7
            r6 = 1
            int r6 = r6 << r12
            long r0 = (long) r6
            r22 = r0
            long r18 = r18 | r22
            r6 = r11
        L_0x020b:
            int r12 = r12 + 1
            r11 = r6
            goto L_0x01da
        L_0x020f:
            if (r8 == 0) goto L_0x023c
            boolean r0 = r6.preventEdgeOffset
            r22 = r0
            if (r22 == 0) goto L_0x023c
            r22 = 1
            r0 = r22
            if (r11 != r0) goto L_0x023c
            r0 = r32
            int r0 = r0.mGeneratedItemPadding
            r22 = r0
            int r22 = r22 + r27
            r23 = 0
            r0 = r32
            int r0 = r0.mGeneratedItemPadding
            r29 = r0
            r30 = 0
            r0 = r21
            r1 = r22
            r2 = r23
            r3 = r29
            r4 = r30
            r0.setPadding(r1, r2, r3, r4)
        L_0x023c:
            int r0 = r6.cellsUsed
            r21 = r0
            int r21 = r21 + 1
            r0 = r21
            r6.cellsUsed = r0
            r21 = 1
            r0 = r21
            r6.expanded = r0
            int r6 = r11 + -1
            goto L_0x020b
        L_0x024f:
            r21 = 1
            r22 = r11
            goto L_0x00fd
        L_0x0255:
            r6 = 0
            goto L_0x0157
        L_0x0258:
            r6 = 0
            r7 = r6
            goto L_0x01be
        L_0x025c:
            r0 = r32
            android.view.View r10 = r0.getChildAt(r9)
            android.view.ViewGroup$LayoutParams r6 = r10.getLayoutParams()
            android.support.v7.widget.ActionMenuView$LayoutParams r6 = (android.support.v7.widget.ActionMenuView.LayoutParams) r6
            boolean r10 = r10 instanceof android.support.v7.view.menu.ActionMenuItemView
            if (r10 == 0) goto L_0x027f
            r6.extraPixels = r7
            r8 = 1
            r6.expanded = r8
            if (r9 != 0) goto L_0x027c
            boolean r8 = r6.preventEdgeOffset
            if (r8 != 0) goto L_0x027c
            int r8 = -r7
            int r8 = r8 / 2
            r6.leftMargin = r8
        L_0x027c:
            r6 = 1
            goto L_0x01d2
        L_0x027f:
            boolean r10 = r6.isOverflowButton
            if (r10 == 0) goto L_0x0290
            r6.extraPixels = r7
            r8 = 1
            r6.expanded = r8
            int r8 = -r7
            int r8 = r8 / 2
            r6.rightMargin = r8
            r6 = 1
            goto L_0x01d2
        L_0x0290:
            if (r9 == 0) goto L_0x0296
            int r10 = r7 / 2
            r6.leftMargin = r10
        L_0x0296:
            int r10 = r28 + -1
            if (r9 == r10) goto L_0x02e4
            int r10 = r7 / 2
            r6.rightMargin = r10
            r6 = r8
            goto L_0x01d2
        L_0x02a1:
            r8 = r21
        L_0x02a3:
            if (r8 == 0) goto L_0x02d2
            r6 = 0
            r7 = r6
        L_0x02a7:
            r0 = r28
            if (r7 >= r0) goto L_0x02d2
            r0 = r32
            android.view.View r8 = r0.getChildAt(r7)
            android.view.ViewGroup$LayoutParams r6 = r8.getLayoutParams()
            android.support.v7.widget.ActionMenuView$LayoutParams r6 = (android.support.v7.widget.ActionMenuView.LayoutParams) r6
            boolean r9 = r6.expanded
            if (r9 != 0) goto L_0x02bf
        L_0x02bb:
            int r6 = r7 + 1
            r7 = r6
            goto L_0x02a7
        L_0x02bf:
            int r9 = r6.cellsUsed
            int r9 = r9 * r27
            int r6 = r6.extraPixels
            int r6 = r6 + r9
            r9 = 1073741824(0x40000000, float:2.0)
            int r6 = android.view.View.MeasureSpec.makeMeasureSpec(r6, r9)
            r0 = r25
            r8.measure(r6, r0)
            goto L_0x02bb
        L_0x02d2:
            r6 = 1073741824(0x40000000, float:2.0)
            r0 = r24
            if (r0 == r6) goto L_0x02e1
        L_0x02d8:
            r0 = r32
            r1 = r26
            r0.setMeasuredDimension(r1, r15)
            goto L_0x003e
        L_0x02e1:
            r15 = r20
            goto L_0x02d8
        L_0x02e4:
            r6 = r8
            goto L_0x01d2
        L_0x02e7:
            r6 = r11
            goto L_0x020b
        L_0x02ea:
            r6 = r7
            goto L_0x01b2
        L_0x02ed:
            r6 = r10
            r12 = r11
            goto L_0x0124
        L_0x02f1:
            r7 = r12
            goto L_0x006e
        L_0x02f4:
            r6 = r9
            goto L_0x00d6
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.widget.ActionMenuView.onMeasureExactFormat(int, int):void");
    }

    /* access modifiers changed from: protected */
    public boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams != null && (layoutParams instanceof LayoutParams);
    }

    public void dismissPopupMenus() {
        if (this.mPresenter != null) {
            this.mPresenter.dismissPopupMenus();
        }
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        return false;
    }

    /* access modifiers changed from: protected */
    public LayoutParams generateDefaultLayoutParams() {
        LayoutParams layoutParams = new LayoutParams(-2, -2);
        layoutParams.gravity = 16;
        return layoutParams;
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    /* access modifiers changed from: protected */
    public LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        if (layoutParams == null) {
            return generateDefaultLayoutParams();
        }
        LayoutParams layoutParams2 = layoutParams instanceof LayoutParams ? new LayoutParams((LayoutParams) layoutParams) : new LayoutParams(layoutParams);
        if (layoutParams2.gravity > 0) {
            return layoutParams2;
        }
        layoutParams2.gravity = 16;
        return layoutParams2;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public LayoutParams generateOverflowButtonLayoutParams() {
        LayoutParams generateDefaultLayoutParams = generateDefaultLayoutParams();
        generateDefaultLayoutParams.isOverflowButton = true;
        return generateDefaultLayoutParams;
    }

    public Menu getMenu() {
        if (this.mMenu == null) {
            Context context = getContext();
            this.mMenu = new MenuBuilder(context);
            this.mMenu.setCallback(new MenuBuilderCallback());
            this.mPresenter = new ActionMenuPresenter(context);
            this.mPresenter.setReserveOverflow(true);
            this.mPresenter.setCallback(this.mActionMenuPresenterCallback != null ? this.mActionMenuPresenterCallback : new ActionMenuPresenterCallback());
            this.mMenu.addMenuPresenter(this.mPresenter, this.mPopupContext);
            this.mPresenter.setMenuView(this);
        }
        return this.mMenu;
    }

    @Nullable
    public Drawable getOverflowIcon() {
        getMenu();
        return this.mPresenter.getOverflowIcon();
    }

    public int getPopupTheme() {
        return this.mPopupTheme;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public int getWindowAnimations() {
        return 0;
    }

    /* access modifiers changed from: protected */
    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public boolean hasSupportDividerBeforeChildAt(int i) {
        boolean z = false;
        if (i == 0) {
            return false;
        }
        View childAt = getChildAt(i - 1);
        View childAt2 = getChildAt(i);
        if (i < getChildCount() && (childAt instanceof ActionMenuChildView)) {
            z = ((ActionMenuChildView) childAt).needsDividerAfter() | false;
        }
        return (i <= 0 || !(childAt2 instanceof ActionMenuChildView)) ? z : ((ActionMenuChildView) childAt2).needsDividerBefore() | z;
    }

    public boolean hideOverflowMenu() {
        return this.mPresenter != null && this.mPresenter.hideOverflowMenu();
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void initialize(MenuBuilder menuBuilder) {
        this.mMenu = menuBuilder;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public boolean invokeItem(MenuItemImpl menuItemImpl) {
        return this.mMenu.performItemAction(menuItemImpl, 0);
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public boolean isOverflowMenuShowPending() {
        return this.mPresenter != null && this.mPresenter.isOverflowMenuShowPending();
    }

    public boolean isOverflowMenuShowing() {
        return this.mPresenter != null && this.mPresenter.isOverflowMenuShowing();
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public boolean isOverflowReserved() {
        return this.mReserveOverflow;
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.mPresenter != null) {
            this.mPresenter.updateMenuView(false);
            if (this.mPresenter.isOverflowMenuShowing()) {
                this.mPresenter.hideOverflowMenu();
                this.mPresenter.showOverflowMenu();
            }
        }
    }

    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        dismissPopupMenus();
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        boolean z2;
        int width;
        int i7;
        if (!this.mFormatItems) {
            super.onLayout(z, i, i2, i3, i4);
            return;
        }
        int childCount = getChildCount();
        int i8 = (i4 - i2) / 2;
        int dividerWidth = getDividerWidth();
        int i9 = 0;
        int i10 = 0;
        int paddingRight = ((i3 - i) - getPaddingRight()) - getPaddingLeft();
        boolean z3 = false;
        boolean isLayoutRtl = ViewUtils.isLayoutRtl(this);
        int i11 = 0;
        while (i11 < childCount) {
            View childAt = getChildAt(i11);
            if (childAt.getVisibility() == 8) {
                z2 = z3;
            } else {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (layoutParams.isOverflowButton) {
                    int measuredWidth = childAt.getMeasuredWidth();
                    if (hasSupportDividerBeforeChildAt(i11)) {
                        measuredWidth += dividerWidth;
                    }
                    int measuredHeight = childAt.getMeasuredHeight();
                    if (isLayoutRtl) {
                        i7 = layoutParams.leftMargin + getPaddingLeft();
                        width = i7 + measuredWidth;
                    } else {
                        width = (getWidth() - getPaddingRight()) - layoutParams.rightMargin;
                        i7 = width - measuredWidth;
                    }
                    int i12 = i8 - (measuredHeight / 2);
                    childAt.layout(i7, i12, width, measuredHeight + i12);
                    z2 = true;
                    paddingRight -= measuredWidth;
                } else {
                    int measuredWidth2 = layoutParams.rightMargin + childAt.getMeasuredWidth() + layoutParams.leftMargin;
                    i9 += measuredWidth2;
                    paddingRight -= measuredWidth2;
                    if (hasSupportDividerBeforeChildAt(i11)) {
                        i9 += dividerWidth;
                    }
                    i10++;
                    z2 = z3;
                }
            }
            i11++;
            z3 = z2;
        }
        if (childCount != 1 || z3) {
            int i13 = i10 - (z3 ? 0 : 1);
            int max = Math.max(0, i13 > 0 ? paddingRight / i13 : 0);
            if (isLayoutRtl) {
                int width2 = getWidth() - getPaddingRight();
                int i14 = 0;
                while (i14 < childCount) {
                    View childAt2 = getChildAt(i14);
                    LayoutParams layoutParams2 = (LayoutParams) childAt2.getLayoutParams();
                    if (childAt2.getVisibility() == 8) {
                        i6 = width2;
                    } else if (layoutParams2.isOverflowButton) {
                        i6 = width2;
                    } else {
                        int i15 = width2 - layoutParams2.rightMargin;
                        int measuredWidth3 = childAt2.getMeasuredWidth();
                        int measuredHeight2 = childAt2.getMeasuredHeight();
                        int i16 = i8 - (measuredHeight2 / 2);
                        childAt2.layout(i15 - measuredWidth3, i16, i15, measuredHeight2 + i16);
                        i6 = i15 - ((layoutParams2.leftMargin + measuredWidth3) + max);
                    }
                    i14++;
                    width2 = i6;
                }
                return;
            }
            int paddingLeft = getPaddingLeft();
            int i17 = 0;
            while (i17 < childCount) {
                View childAt3 = getChildAt(i17);
                LayoutParams layoutParams3 = (LayoutParams) childAt3.getLayoutParams();
                if (childAt3.getVisibility() == 8) {
                    i5 = paddingLeft;
                } else if (layoutParams3.isOverflowButton) {
                    i5 = paddingLeft;
                } else {
                    int i18 = paddingLeft + layoutParams3.leftMargin;
                    int measuredWidth4 = childAt3.getMeasuredWidth();
                    int measuredHeight3 = childAt3.getMeasuredHeight();
                    int i19 = i8 - (measuredHeight3 / 2);
                    childAt3.layout(i18, i19, i18 + measuredWidth4, measuredHeight3 + i19);
                    i5 = layoutParams3.rightMargin + measuredWidth4 + max + i18;
                }
                i17++;
                paddingLeft = i5;
            }
            return;
        }
        View childAt4 = getChildAt(0);
        int measuredWidth5 = childAt4.getMeasuredWidth();
        int measuredHeight4 = childAt4.getMeasuredHeight();
        int i20 = ((i3 - i) / 2) - (measuredWidth5 / 2);
        int i21 = i8 - (measuredHeight4 / 2);
        childAt4.layout(i20, i21, measuredWidth5 + i20, measuredHeight4 + i21);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        boolean z = this.mFormatItems;
        this.mFormatItems = View.MeasureSpec.getMode(i) == 1073741824;
        if (z != this.mFormatItems) {
            this.mFormatItemsWidth = 0;
        }
        int size = View.MeasureSpec.getSize(i);
        if (!(!this.mFormatItems || this.mMenu == null || size == this.mFormatItemsWidth)) {
            this.mFormatItemsWidth = size;
            this.mMenu.onItemsChanged(true);
        }
        int childCount = getChildCount();
        if (!this.mFormatItems || childCount <= 0) {
            for (int i3 = 0; i3 < childCount; i3++) {
                LayoutParams layoutParams = (LayoutParams) getChildAt(i3).getLayoutParams();
                layoutParams.rightMargin = 0;
                layoutParams.leftMargin = 0;
            }
            super.onMeasure(i, i2);
            return;
        }
        onMeasureExactFormat(i, i2);
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public MenuBuilder peekMenu() {
        return this.mMenu;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void setExpandedActionViewsExclusive(boolean z) {
        this.mPresenter.setExpandedActionViewsExclusive(z);
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void setMenuCallbacks(MenuPresenter.Callback callback, MenuBuilder.Callback callback2) {
        this.mActionMenuPresenterCallback = callback;
        this.mMenuBuilderCallback = callback2;
    }

    public void setOnMenuItemClickListener(OnMenuItemClickListener onMenuItemClickListener) {
        this.mOnMenuItemClickListener = onMenuItemClickListener;
    }

    public void setOverflowIcon(@Nullable Drawable drawable) {
        getMenu();
        this.mPresenter.setOverflowIcon(drawable);
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void setOverflowReserved(boolean z) {
        this.mReserveOverflow = z;
    }

    public void setPopupTheme(@StyleRes int i) {
        if (this.mPopupTheme != i) {
            this.mPopupTheme = i;
            if (i == 0) {
                this.mPopupContext = getContext();
            } else {
                this.mPopupContext = new ContextThemeWrapper(getContext(), i);
            }
        }
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void setPresenter(ActionMenuPresenter actionMenuPresenter) {
        this.mPresenter = actionMenuPresenter;
        this.mPresenter.setMenuView(this);
    }

    public boolean showOverflowMenu() {
        return this.mPresenter != null && this.mPresenter.showOverflowMenu();
    }
}
