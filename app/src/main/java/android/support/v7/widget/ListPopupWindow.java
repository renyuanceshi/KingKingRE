package android.support.v7.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.support.annotation.AttrRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RestrictTo;
import android.support.annotation.StyleRes;
import android.support.v4.view.PointerIconCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.widget.PopupWindowCompat;
import android.support.v7.appcompat.R;
import android.support.v7.view.menu.ShowableListMenu;
import android.support.v7.widget.ActivityChooserView;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.PopupWindow;
import java.lang.reflect.Method;

public class ListPopupWindow implements ShowableListMenu {
    private static final boolean DEBUG = false;
    static final int EXPAND_LIST_TIMEOUT = 250;
    public static final int INPUT_METHOD_FROM_FOCUSABLE = 0;
    public static final int INPUT_METHOD_NEEDED = 1;
    public static final int INPUT_METHOD_NOT_NEEDED = 2;
    public static final int MATCH_PARENT = -1;
    public static final int POSITION_PROMPT_ABOVE = 0;
    public static final int POSITION_PROMPT_BELOW = 1;
    private static final String TAG = "ListPopupWindow";
    public static final int WRAP_CONTENT = -2;
    private static Method sClipToWindowEnabledMethod;
    private static Method sGetMaxAvailableHeightMethod;
    private static Method sSetEpicenterBoundsMethod;
    private ListAdapter mAdapter;
    private Context mContext;
    private boolean mDropDownAlwaysVisible;
    private View mDropDownAnchorView;
    private int mDropDownGravity;
    private int mDropDownHeight;
    private int mDropDownHorizontalOffset;
    DropDownListView mDropDownList;
    private Drawable mDropDownListHighlight;
    private int mDropDownVerticalOffset;
    private boolean mDropDownVerticalOffsetSet;
    private int mDropDownWidth;
    private int mDropDownWindowLayoutType;
    private Rect mEpicenterBounds;
    private boolean mForceIgnoreOutsideTouch;
    final Handler mHandler;
    private final ListSelectorHider mHideSelector;
    private boolean mIsAnimatedFromAnchor;
    private AdapterView.OnItemClickListener mItemClickListener;
    private AdapterView.OnItemSelectedListener mItemSelectedListener;
    int mListItemExpandMaximum;
    private boolean mModal;
    private DataSetObserver mObserver;
    PopupWindow mPopup;
    private int mPromptPosition;
    private View mPromptView;
    final ResizePopupRunnable mResizePopupRunnable;
    private final PopupScrollListener mScrollListener;
    private Runnable mShowDropDownRunnable;
    private final Rect mTempRect;
    private final PopupTouchInterceptor mTouchInterceptor;

    private class ListSelectorHider implements Runnable {
        ListSelectorHider() {
        }

        public void run() {
            ListPopupWindow.this.clearListSelection();
        }
    }

    private class PopupDataSetObserver extends DataSetObserver {
        PopupDataSetObserver() {
        }

        public void onChanged() {
            if (ListPopupWindow.this.isShowing()) {
                ListPopupWindow.this.show();
            }
        }

        public void onInvalidated() {
            ListPopupWindow.this.dismiss();
        }
    }

    private class PopupScrollListener implements AbsListView.OnScrollListener {
        PopupScrollListener() {
        }

        public void onScroll(AbsListView absListView, int i, int i2, int i3) {
        }

        public void onScrollStateChanged(AbsListView absListView, int i) {
            if (i == 1 && !ListPopupWindow.this.isInputMethodNotNeeded() && ListPopupWindow.this.mPopup.getContentView() != null) {
                ListPopupWindow.this.mHandler.removeCallbacks(ListPopupWindow.this.mResizePopupRunnable);
                ListPopupWindow.this.mResizePopupRunnable.run();
            }
        }
    }

    private class PopupTouchInterceptor implements View.OnTouchListener {
        PopupTouchInterceptor() {
        }

        public boolean onTouch(View view, MotionEvent motionEvent) {
            int action = motionEvent.getAction();
            int x = (int) motionEvent.getX();
            int y = (int) motionEvent.getY();
            if (action == 0 && ListPopupWindow.this.mPopup != null && ListPopupWindow.this.mPopup.isShowing() && x >= 0 && x < ListPopupWindow.this.mPopup.getWidth() && y >= 0 && y < ListPopupWindow.this.mPopup.getHeight()) {
                ListPopupWindow.this.mHandler.postDelayed(ListPopupWindow.this.mResizePopupRunnable, 250);
                return false;
            } else if (action != 1) {
                return false;
            } else {
                ListPopupWindow.this.mHandler.removeCallbacks(ListPopupWindow.this.mResizePopupRunnable);
                return false;
            }
        }
    }

    private class ResizePopupRunnable implements Runnable {
        ResizePopupRunnable() {
        }

        public void run() {
            if (ListPopupWindow.this.mDropDownList != null && ViewCompat.isAttachedToWindow(ListPopupWindow.this.mDropDownList) && ListPopupWindow.this.mDropDownList.getCount() > ListPopupWindow.this.mDropDownList.getChildCount() && ListPopupWindow.this.mDropDownList.getChildCount() <= ListPopupWindow.this.mListItemExpandMaximum) {
                ListPopupWindow.this.mPopup.setInputMethodMode(2);
                ListPopupWindow.this.show();
            }
        }
    }

    static {
        Class<PopupWindow> cls = PopupWindow.class;
        try {
            sClipToWindowEnabledMethod = cls.getDeclaredMethod("setClipToScreenEnabled", new Class[]{Boolean.TYPE});
        } catch (NoSuchMethodException e) {
            Log.i(TAG, "Could not find method setClipToScreenEnabled() on PopupWindow. Oh well.");
        }
        Class<PopupWindow> cls2 = PopupWindow.class;
        try {
            sGetMaxAvailableHeightMethod = cls2.getDeclaredMethod("getMaxAvailableHeight", new Class[]{View.class, Integer.TYPE, Boolean.TYPE});
        } catch (NoSuchMethodException e2) {
            Log.i(TAG, "Could not find method getMaxAvailableHeight(View, int, boolean) on PopupWindow. Oh well.");
        }
        try {
            sSetEpicenterBoundsMethod = PopupWindow.class.getDeclaredMethod("setEpicenterBounds", new Class[]{Rect.class});
        } catch (NoSuchMethodException e3) {
            Log.i(TAG, "Could not find method setEpicenterBounds(Rect) on PopupWindow. Oh well.");
        }
    }

    public ListPopupWindow(@NonNull Context context) {
        this(context, (AttributeSet) null, R.attr.listPopupWindowStyle);
    }

    public ListPopupWindow(@NonNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, R.attr.listPopupWindowStyle);
    }

    public ListPopupWindow(@NonNull Context context, @Nullable AttributeSet attributeSet, @AttrRes int i) {
        this(context, attributeSet, i, 0);
    }

    public ListPopupWindow(@NonNull Context context, @Nullable AttributeSet attributeSet, @AttrRes int i, @StyleRes int i2) {
        this.mDropDownHeight = -2;
        this.mDropDownWidth = -2;
        this.mDropDownWindowLayoutType = PointerIconCompat.TYPE_HAND;
        this.mIsAnimatedFromAnchor = true;
        this.mDropDownGravity = 0;
        this.mDropDownAlwaysVisible = false;
        this.mForceIgnoreOutsideTouch = false;
        this.mListItemExpandMaximum = ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
        this.mPromptPosition = 0;
        this.mResizePopupRunnable = new ResizePopupRunnable();
        this.mTouchInterceptor = new PopupTouchInterceptor();
        this.mScrollListener = new PopupScrollListener();
        this.mHideSelector = new ListSelectorHider();
        this.mTempRect = new Rect();
        this.mContext = context;
        this.mHandler = new Handler(context.getMainLooper());
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.ListPopupWindow, i, i2);
        this.mDropDownHorizontalOffset = obtainStyledAttributes.getDimensionPixelOffset(R.styleable.ListPopupWindow_android_dropDownHorizontalOffset, 0);
        this.mDropDownVerticalOffset = obtainStyledAttributes.getDimensionPixelOffset(R.styleable.ListPopupWindow_android_dropDownVerticalOffset, 0);
        if (this.mDropDownVerticalOffset != 0) {
            this.mDropDownVerticalOffsetSet = true;
        }
        obtainStyledAttributes.recycle();
        if (Build.VERSION.SDK_INT >= 11) {
            this.mPopup = new AppCompatPopupWindow(context, attributeSet, i, i2);
        } else {
            this.mPopup = new AppCompatPopupWindow(context, attributeSet, i);
        }
        this.mPopup.setInputMethodMode(1);
    }

    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v47, resolved type: android.support.v7.widget.DropDownListView} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v48, resolved type: android.support.v7.widget.DropDownListView} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r6v12, resolved type: android.widget.LinearLayout} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v56, resolved type: android.support.v7.widget.DropDownListView} */
    /* JADX WARNING: Multi-variable type inference failed */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private int buildDropDown() {
        /*
            r10 = this;
            r9 = 1073741824(0x40000000, float:2.0)
            r5 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = -1
            r1 = 1
            r2 = 0
            android.support.v7.widget.DropDownListView r0 = r10.mDropDownList
            if (r0 != 0) goto L_0x010b
            android.content.Context r4 = r10.mContext
            android.support.v7.widget.ListPopupWindow$2 r0 = new android.support.v7.widget.ListPopupWindow$2
            r0.<init>()
            r10.mShowDropDownRunnable = r0
            boolean r0 = r10.mModal
            if (r0 != 0) goto L_0x00f7
            r0 = r1
        L_0x0019:
            android.support.v7.widget.DropDownListView r0 = r10.createDropDownListView(r4, r0)
            r10.mDropDownList = r0
            android.graphics.drawable.Drawable r0 = r10.mDropDownListHighlight
            if (r0 == 0) goto L_0x002a
            android.support.v7.widget.DropDownListView r0 = r10.mDropDownList
            android.graphics.drawable.Drawable r6 = r10.mDropDownListHighlight
            r0.setSelector(r6)
        L_0x002a:
            android.support.v7.widget.DropDownListView r0 = r10.mDropDownList
            android.widget.ListAdapter r6 = r10.mAdapter
            r0.setAdapter(r6)
            android.support.v7.widget.DropDownListView r0 = r10.mDropDownList
            android.widget.AdapterView$OnItemClickListener r6 = r10.mItemClickListener
            r0.setOnItemClickListener(r6)
            android.support.v7.widget.DropDownListView r0 = r10.mDropDownList
            r0.setFocusable(r1)
            android.support.v7.widget.DropDownListView r0 = r10.mDropDownList
            r0.setFocusableInTouchMode(r1)
            android.support.v7.widget.DropDownListView r0 = r10.mDropDownList
            android.support.v7.widget.ListPopupWindow$3 r6 = new android.support.v7.widget.ListPopupWindow$3
            r6.<init>()
            r0.setOnItemSelectedListener(r6)
            android.support.v7.widget.DropDownListView r0 = r10.mDropDownList
            android.support.v7.widget.ListPopupWindow$PopupScrollListener r6 = r10.mScrollListener
            r0.setOnScrollListener(r6)
            android.widget.AdapterView$OnItemSelectedListener r0 = r10.mItemSelectedListener
            if (r0 == 0) goto L_0x005e
            android.support.v7.widget.DropDownListView r0 = r10.mDropDownList
            android.widget.AdapterView$OnItemSelectedListener r6 = r10.mItemSelectedListener
            r0.setOnItemSelectedListener(r6)
        L_0x005e:
            android.support.v7.widget.DropDownListView r0 = r10.mDropDownList
            android.view.View r7 = r10.mPromptView
            if (r7 == 0) goto L_0x0194
            android.widget.LinearLayout r6 = new android.widget.LinearLayout
            r6.<init>(r4)
            r6.setOrientation(r1)
            android.widget.LinearLayout$LayoutParams r4 = new android.widget.LinearLayout$LayoutParams
            r8 = 1065353216(0x3f800000, float:1.0)
            r4.<init>(r3, r2, r8)
            int r8 = r10.mPromptPosition
            switch(r8) {
                case 0: goto L_0x0101;
                case 1: goto L_0x00fa;
                default: goto L_0x0078;
            }
        L_0x0078:
            java.lang.String r0 = "ListPopupWindow"
            java.lang.StringBuilder r4 = new java.lang.StringBuilder
            r4.<init>()
            java.lang.String r8 = "Invalid hint position "
            java.lang.StringBuilder r4 = r4.append(r8)
            int r8 = r10.mPromptPosition
            java.lang.StringBuilder r4 = r4.append(r8)
            java.lang.String r4 = r4.toString()
            android.util.Log.e(r0, r4)
        L_0x0092:
            int r0 = r10.mDropDownWidth
            if (r0 < 0) goto L_0x0108
            int r0 = r10.mDropDownWidth
            r4 = r5
        L_0x0099:
            int r0 = android.view.View.MeasureSpec.makeMeasureSpec(r0, r4)
            r7.measure(r0, r2)
            android.view.ViewGroup$LayoutParams r0 = r7.getLayoutParams()
            android.widget.LinearLayout$LayoutParams r0 = (android.widget.LinearLayout.LayoutParams) r0
            int r4 = r7.getMeasuredHeight()
            int r7 = r0.topMargin
            int r4 = r4 + r7
            int r0 = r0.bottomMargin
            int r4 = r4 + r0
            r0 = r6
        L_0x00b1:
            android.widget.PopupWindow r6 = r10.mPopup
            r6.setContentView(r0)
            r6 = r4
        L_0x00b7:
            android.widget.PopupWindow r0 = r10.mPopup
            android.graphics.drawable.Drawable r0 = r0.getBackground()
            if (r0 == 0) goto L_0x0129
            android.graphics.Rect r4 = r10.mTempRect
            r0.getPadding(r4)
            android.graphics.Rect r0 = r10.mTempRect
            int r0 = r0.top
            android.graphics.Rect r4 = r10.mTempRect
            int r4 = r4.bottom
            int r0 = r0 + r4
            boolean r4 = r10.mDropDownVerticalOffsetSet
            if (r4 != 0) goto L_0x018e
            android.graphics.Rect r4 = r10.mTempRect
            int r4 = r4.top
            int r4 = -r4
            r10.mDropDownVerticalOffset = r4
            r7 = r0
        L_0x00d9:
            android.widget.PopupWindow r0 = r10.mPopup
            int r0 = r0.getInputMethodMode()
            r4 = 2
            if (r0 != r4) goto L_0x0130
        L_0x00e2:
            android.view.View r0 = r10.getAnchorView()
            int r4 = r10.mDropDownVerticalOffset
            int r4 = r10.getMaxAvailableHeight(r0, r4, r1)
            boolean r0 = r10.mDropDownAlwaysVisible
            if (r0 != 0) goto L_0x00f4
            int r0 = r10.mDropDownHeight
            if (r0 != r3) goto L_0x0132
        L_0x00f4:
            int r0 = r4 + r7
        L_0x00f6:
            return r0
        L_0x00f7:
            r0 = r2
            goto L_0x0019
        L_0x00fa:
            r6.addView(r0, r4)
            r6.addView(r7)
            goto L_0x0092
        L_0x0101:
            r6.addView(r7)
            r6.addView(r0, r4)
            goto L_0x0092
        L_0x0108:
            r0 = r2
            r4 = r2
            goto L_0x0099
        L_0x010b:
            android.widget.PopupWindow r0 = r10.mPopup
            android.view.View r0 = r0.getContentView()
            android.view.ViewGroup r0 = (android.view.ViewGroup) r0
            android.view.View r4 = r10.mPromptView
            if (r4 == 0) goto L_0x0191
            android.view.ViewGroup$LayoutParams r0 = r4.getLayoutParams()
            android.widget.LinearLayout$LayoutParams r0 = (android.widget.LinearLayout.LayoutParams) r0
            int r4 = r4.getMeasuredHeight()
            int r6 = r0.topMargin
            int r4 = r4 + r6
            int r0 = r0.bottomMargin
            int r4 = r4 + r0
            r6 = r4
            goto L_0x00b7
        L_0x0129:
            android.graphics.Rect r0 = r10.mTempRect
            r0.setEmpty()
            r7 = r2
            goto L_0x00d9
        L_0x0130:
            r1 = r2
            goto L_0x00e2
        L_0x0132:
            int r0 = r10.mDropDownWidth
            switch(r0) {
                case -2: goto L_0x0158;
                case -1: goto L_0x0173;
                default: goto L_0x0137;
            }
        L_0x0137:
            int r0 = r10.mDropDownWidth
            int r1 = android.view.View.MeasureSpec.makeMeasureSpec(r0, r9)
        L_0x013d:
            android.support.v7.widget.DropDownListView r0 = r10.mDropDownList
            int r4 = r4 - r6
            r5 = r3
            int r0 = r0.measureHeightOfChildrenCompat(r1, r2, r3, r4, r5)
            if (r0 <= 0) goto L_0x0156
            android.support.v7.widget.DropDownListView r1 = r10.mDropDownList
            int r1 = r1.getPaddingTop()
            android.support.v7.widget.DropDownListView r2 = r10.mDropDownList
            int r2 = r2.getPaddingBottom()
            int r1 = r1 + r2
            int r1 = r1 + r7
            int r6 = r6 + r1
        L_0x0156:
            int r0 = r0 + r6
            goto L_0x00f6
        L_0x0158:
            android.content.Context r0 = r10.mContext
            android.content.res.Resources r0 = r0.getResources()
            android.util.DisplayMetrics r0 = r0.getDisplayMetrics()
            int r0 = r0.widthPixels
            android.graphics.Rect r1 = r10.mTempRect
            int r1 = r1.left
            android.graphics.Rect r8 = r10.mTempRect
            int r8 = r8.right
            int r1 = r1 + r8
            int r0 = r0 - r1
            int r1 = android.view.View.MeasureSpec.makeMeasureSpec(r0, r5)
            goto L_0x013d
        L_0x0173:
            android.content.Context r0 = r10.mContext
            android.content.res.Resources r0 = r0.getResources()
            android.util.DisplayMetrics r0 = r0.getDisplayMetrics()
            int r0 = r0.widthPixels
            android.graphics.Rect r1 = r10.mTempRect
            int r1 = r1.left
            android.graphics.Rect r5 = r10.mTempRect
            int r5 = r5.right
            int r1 = r1 + r5
            int r0 = r0 - r1
            int r1 = android.view.View.MeasureSpec.makeMeasureSpec(r0, r9)
            goto L_0x013d
        L_0x018e:
            r7 = r0
            goto L_0x00d9
        L_0x0191:
            r6 = r2
            goto L_0x00b7
        L_0x0194:
            r4 = r2
            goto L_0x00b1
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.widget.ListPopupWindow.buildDropDown():int");
    }

    private int getMaxAvailableHeight(View view, int i, boolean z) {
        if (sGetMaxAvailableHeightMethod != null) {
            try {
                return ((Integer) sGetMaxAvailableHeightMethod.invoke(this.mPopup, new Object[]{view, Integer.valueOf(i), Boolean.valueOf(z)})).intValue();
            } catch (Exception e) {
                Log.i(TAG, "Could not call getMaxAvailableHeightMethod(View, int, boolean) on PopupWindow. Using the public version.");
            }
        }
        return this.mPopup.getMaxAvailableHeight(view, i);
    }

    private static boolean isConfirmKey(int i) {
        return i == 66 || i == 23;
    }

    private void removePromptView() {
        if (this.mPromptView != null) {
            ViewParent parent = this.mPromptView.getParent();
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(this.mPromptView);
            }
        }
    }

    private void setPopupClipToScreenEnabled(boolean z) {
        if (sClipToWindowEnabledMethod != null) {
            try {
                sClipToWindowEnabledMethod.invoke(this.mPopup, new Object[]{Boolean.valueOf(z)});
            } catch (Exception e) {
                Log.i(TAG, "Could not call setClipToScreenEnabled() on PopupWindow. Oh well.");
            }
        }
    }

    public void clearListSelection() {
        DropDownListView dropDownListView = this.mDropDownList;
        if (dropDownListView != null) {
            dropDownListView.setListSelectionHidden(true);
            dropDownListView.requestLayout();
        }
    }

    public View.OnTouchListener createDragToOpenListener(View view) {
        return new ForwardingListener(view) {
            public ListPopupWindow getPopup() {
                return ListPopupWindow.this;
            }
        };
    }

    /* access modifiers changed from: package-private */
    @NonNull
    public DropDownListView createDropDownListView(Context context, boolean z) {
        return new DropDownListView(context, z);
    }

    public void dismiss() {
        this.mPopup.dismiss();
        removePromptView();
        this.mPopup.setContentView((View) null);
        this.mDropDownList = null;
        this.mHandler.removeCallbacks(this.mResizePopupRunnable);
    }

    @Nullable
    public View getAnchorView() {
        return this.mDropDownAnchorView;
    }

    @StyleRes
    public int getAnimationStyle() {
        return this.mPopup.getAnimationStyle();
    }

    @Nullable
    public Drawable getBackground() {
        return this.mPopup.getBackground();
    }

    public int getHeight() {
        return this.mDropDownHeight;
    }

    public int getHorizontalOffset() {
        return this.mDropDownHorizontalOffset;
    }

    public int getInputMethodMode() {
        return this.mPopup.getInputMethodMode();
    }

    @Nullable
    public ListView getListView() {
        return this.mDropDownList;
    }

    public int getPromptPosition() {
        return this.mPromptPosition;
    }

    @Nullable
    public Object getSelectedItem() {
        if (!isShowing()) {
            return null;
        }
        return this.mDropDownList.getSelectedItem();
    }

    public long getSelectedItemId() {
        if (!isShowing()) {
            return Long.MIN_VALUE;
        }
        return this.mDropDownList.getSelectedItemId();
    }

    public int getSelectedItemPosition() {
        if (!isShowing()) {
            return -1;
        }
        return this.mDropDownList.getSelectedItemPosition();
    }

    @Nullable
    public View getSelectedView() {
        if (!isShowing()) {
            return null;
        }
        return this.mDropDownList.getSelectedView();
    }

    public int getSoftInputMode() {
        return this.mPopup.getSoftInputMode();
    }

    public int getVerticalOffset() {
        if (!this.mDropDownVerticalOffsetSet) {
            return 0;
        }
        return this.mDropDownVerticalOffset;
    }

    public int getWidth() {
        return this.mDropDownWidth;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public boolean isDropDownAlwaysVisible() {
        return this.mDropDownAlwaysVisible;
    }

    public boolean isInputMethodNotNeeded() {
        return this.mPopup.getInputMethodMode() == 2;
    }

    public boolean isModal() {
        return this.mModal;
    }

    public boolean isShowing() {
        return this.mPopup.isShowing();
    }

    public boolean onKeyDown(int i, @NonNull KeyEvent keyEvent) {
        if (isShowing() && i != 62 && (this.mDropDownList.getSelectedItemPosition() >= 0 || !isConfirmKey(i))) {
            int selectedItemPosition = this.mDropDownList.getSelectedItemPosition();
            boolean z = !this.mPopup.isAboveAnchor();
            ListAdapter listAdapter = this.mAdapter;
            int i2 = ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
            int i3 = Integer.MIN_VALUE;
            if (listAdapter != null) {
                boolean areAllItemsEnabled = listAdapter.areAllItemsEnabled();
                i2 = areAllItemsEnabled ? 0 : this.mDropDownList.lookForSelectablePosition(0, true);
                i3 = areAllItemsEnabled ? listAdapter.getCount() - 1 : this.mDropDownList.lookForSelectablePosition(listAdapter.getCount() - 1, false);
            }
            if ((!z || i != 19 || selectedItemPosition > i2) && (z || i != 20 || selectedItemPosition < i3)) {
                this.mDropDownList.setListSelectionHidden(false);
                if (this.mDropDownList.onKeyDown(i, keyEvent)) {
                    this.mPopup.setInputMethodMode(2);
                    this.mDropDownList.requestFocusFromTouch();
                    show();
                    switch (i) {
                        case 19:
                        case 20:
                        case 23:
                        case 66:
                            return true;
                    }
                } else if (!z || i != 20) {
                    if (!z && i == 19 && selectedItemPosition == i2) {
                        return true;
                    }
                } else if (selectedItemPosition == i3) {
                    return true;
                }
            } else {
                clearListSelection();
                this.mPopup.setInputMethodMode(1);
                show();
                return true;
            }
        }
        return false;
    }

    public boolean onKeyPreIme(int i, @NonNull KeyEvent keyEvent) {
        if (i == 4 && isShowing()) {
            View view = this.mDropDownAnchorView;
            if (keyEvent.getAction() == 0 && keyEvent.getRepeatCount() == 0) {
                KeyEvent.DispatcherState keyDispatcherState = view.getKeyDispatcherState();
                if (keyDispatcherState == null) {
                    return true;
                }
                keyDispatcherState.startTracking(keyEvent, this);
                return true;
            } else if (keyEvent.getAction() == 1) {
                KeyEvent.DispatcherState keyDispatcherState2 = view.getKeyDispatcherState();
                if (keyDispatcherState2 != null) {
                    keyDispatcherState2.handleUpEvent(keyEvent);
                }
                if (keyEvent.isTracking() && !keyEvent.isCanceled()) {
                    dismiss();
                    return true;
                }
            }
        }
        return false;
    }

    public boolean onKeyUp(int i, @NonNull KeyEvent keyEvent) {
        if (!isShowing() || this.mDropDownList.getSelectedItemPosition() < 0) {
            return false;
        }
        boolean onKeyUp = this.mDropDownList.onKeyUp(i, keyEvent);
        if (!onKeyUp || !isConfirmKey(i)) {
            return onKeyUp;
        }
        dismiss();
        return onKeyUp;
    }

    public boolean performItemClick(int i) {
        if (!isShowing()) {
            return false;
        }
        if (this.mItemClickListener != null) {
            DropDownListView dropDownListView = this.mDropDownList;
            View childAt = dropDownListView.getChildAt(i - dropDownListView.getFirstVisiblePosition());
            ListAdapter adapter = dropDownListView.getAdapter();
            this.mItemClickListener.onItemClick(dropDownListView, childAt, i, adapter.getItemId(i));
        }
        return true;
    }

    public void postShow() {
        this.mHandler.post(this.mShowDropDownRunnable);
    }

    public void setAdapter(@Nullable ListAdapter listAdapter) {
        if (this.mObserver == null) {
            this.mObserver = new PopupDataSetObserver();
        } else if (this.mAdapter != null) {
            this.mAdapter.unregisterDataSetObserver(this.mObserver);
        }
        this.mAdapter = listAdapter;
        if (this.mAdapter != null) {
            listAdapter.registerDataSetObserver(this.mObserver);
        }
        if (this.mDropDownList != null) {
            this.mDropDownList.setAdapter(this.mAdapter);
        }
    }

    public void setAnchorView(@Nullable View view) {
        this.mDropDownAnchorView = view;
    }

    public void setAnimationStyle(@StyleRes int i) {
        this.mPopup.setAnimationStyle(i);
    }

    public void setBackgroundDrawable(@Nullable Drawable drawable) {
        this.mPopup.setBackgroundDrawable(drawable);
    }

    public void setContentWidth(int i) {
        Drawable background = this.mPopup.getBackground();
        if (background != null) {
            background.getPadding(this.mTempRect);
            this.mDropDownWidth = this.mTempRect.left + this.mTempRect.right + i;
            return;
        }
        setWidth(i);
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void setDropDownAlwaysVisible(boolean z) {
        this.mDropDownAlwaysVisible = z;
    }

    public void setDropDownGravity(int i) {
        this.mDropDownGravity = i;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void setEpicenterBounds(Rect rect) {
        this.mEpicenterBounds = rect;
    }

    @RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
    public void setForceIgnoreOutsideTouch(boolean z) {
        this.mForceIgnoreOutsideTouch = z;
    }

    public void setHeight(int i) {
        this.mDropDownHeight = i;
    }

    public void setHorizontalOffset(int i) {
        this.mDropDownHorizontalOffset = i;
    }

    public void setInputMethodMode(int i) {
        this.mPopup.setInputMethodMode(i);
    }

    /* access modifiers changed from: package-private */
    public void setListItemExpandMax(int i) {
        this.mListItemExpandMaximum = i;
    }

    public void setListSelector(Drawable drawable) {
        this.mDropDownListHighlight = drawable;
    }

    public void setModal(boolean z) {
        this.mModal = z;
        this.mPopup.setFocusable(z);
    }

    public void setOnDismissListener(@Nullable PopupWindow.OnDismissListener onDismissListener) {
        this.mPopup.setOnDismissListener(onDismissListener);
    }

    public void setOnItemClickListener(@Nullable AdapterView.OnItemClickListener onItemClickListener) {
        this.mItemClickListener = onItemClickListener;
    }

    public void setOnItemSelectedListener(@Nullable AdapterView.OnItemSelectedListener onItemSelectedListener) {
        this.mItemSelectedListener = onItemSelectedListener;
    }

    public void setPromptPosition(int i) {
        this.mPromptPosition = i;
    }

    public void setPromptView(@Nullable View view) {
        boolean isShowing = isShowing();
        if (isShowing) {
            removePromptView();
        }
        this.mPromptView = view;
        if (isShowing) {
            show();
        }
    }

    public void setSelection(int i) {
        DropDownListView dropDownListView = this.mDropDownList;
        if (isShowing() && dropDownListView != null) {
            dropDownListView.setListSelectionHidden(false);
            dropDownListView.setSelection(i);
            if (Build.VERSION.SDK_INT >= 11 && dropDownListView.getChoiceMode() != 0) {
                dropDownListView.setItemChecked(i, true);
            }
        }
    }

    public void setSoftInputMode(int i) {
        this.mPopup.setSoftInputMode(i);
    }

    public void setVerticalOffset(int i) {
        this.mDropDownVerticalOffset = i;
        this.mDropDownVerticalOffsetSet = true;
    }

    public void setWidth(int i) {
        this.mDropDownWidth = i;
    }

    public void setWindowLayoutType(int i) {
        this.mDropDownWindowLayoutType = i;
    }

    public void show() {
        boolean z = true;
        boolean z2 = false;
        int i = -1;
        int buildDropDown = buildDropDown();
        boolean isInputMethodNotNeeded = isInputMethodNotNeeded();
        PopupWindowCompat.setWindowLayoutType(this.mPopup, this.mDropDownWindowLayoutType);
        if (this.mPopup.isShowing()) {
            int width = this.mDropDownWidth == -1 ? -1 : this.mDropDownWidth == -2 ? getAnchorView().getWidth() : this.mDropDownWidth;
            if (this.mDropDownHeight == -1) {
                if (!isInputMethodNotNeeded) {
                    buildDropDown = -1;
                }
                if (isInputMethodNotNeeded) {
                    this.mPopup.setWidth(this.mDropDownWidth == -1 ? -1 : 0);
                    this.mPopup.setHeight(0);
                } else {
                    this.mPopup.setWidth(this.mDropDownWidth == -1 ? -1 : 0);
                    this.mPopup.setHeight(-1);
                }
            } else if (this.mDropDownHeight != -2) {
                buildDropDown = this.mDropDownHeight;
            }
            PopupWindow popupWindow = this.mPopup;
            if (!this.mForceIgnoreOutsideTouch && !this.mDropDownAlwaysVisible) {
                z2 = true;
            }
            popupWindow.setOutsideTouchable(z2);
            PopupWindow popupWindow2 = this.mPopup;
            View anchorView = getAnchorView();
            int i2 = this.mDropDownHorizontalOffset;
            int i3 = this.mDropDownVerticalOffset;
            if (width < 0) {
                width = -1;
            }
            if (buildDropDown >= 0) {
                i = buildDropDown;
            }
            popupWindow2.update(anchorView, i2, i3, width, i);
            return;
        }
        int width2 = this.mDropDownWidth == -1 ? -1 : this.mDropDownWidth == -2 ? getAnchorView().getWidth() : this.mDropDownWidth;
        if (this.mDropDownHeight == -1) {
            buildDropDown = -1;
        } else if (this.mDropDownHeight != -2) {
            buildDropDown = this.mDropDownHeight;
        }
        this.mPopup.setWidth(width2);
        this.mPopup.setHeight(buildDropDown);
        setPopupClipToScreenEnabled(true);
        PopupWindow popupWindow3 = this.mPopup;
        if (this.mForceIgnoreOutsideTouch || this.mDropDownAlwaysVisible) {
            z = false;
        }
        popupWindow3.setOutsideTouchable(z);
        this.mPopup.setTouchInterceptor(this.mTouchInterceptor);
        if (sSetEpicenterBoundsMethod != null) {
            try {
                sSetEpicenterBoundsMethod.invoke(this.mPopup, new Object[]{this.mEpicenterBounds});
            } catch (Exception e) {
                Log.e(TAG, "Could not invoke setEpicenterBounds on PopupWindow", e);
            }
        }
        PopupWindowCompat.showAsDropDown(this.mPopup, getAnchorView(), this.mDropDownHorizontalOffset, this.mDropDownVerticalOffset, this.mDropDownGravity);
        this.mDropDownList.setSelection(-1);
        if (!this.mModal || this.mDropDownList.isInTouchMode()) {
            clearListSelection();
        }
        if (!this.mModal) {
            this.mHandler.post(this.mHideSelector);
        }
    }
}
