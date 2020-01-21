package com.pccw.android.common.widget;

import android.app.Service;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Vibrator;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.LinearInterpolator;
import android.view.animation.TranslateAnimation;
import android.widget.ImageView;
import android.widget.TextView;

import com.pccw.mobile.sip02.R;

import org.linphone.BandwidthManager;
import org.linphone.LinphoneService;

public class SlidingTab extends ViewGroup {
    private static final int ANIM_DURATION = 250;
    private static final int ANIM_TARGET_TIME = 500;
    private static final boolean DBG = false;
    private static final int HORIZONTAL = 0;
    private static final String LOG_TAG = "PCCW_MOBILE_SIP";
    private static final float THRESHOLD = 0.6666667f;
    private static final int TRACKING_MARGIN = 50;
    private static final int VERTICAL = 1;
    private static final long VIBRATE_LONG = 40;
    private static final long VIBRATE_SHORT = 30;
    public static AnimationDrawable btnAcceptCallAnimation;
    public static AnimationDrawable btnAcceptVideoAnimation;
    public static AnimationDrawable btnRejectCallAnimation;
    /* access modifiers changed from: private */
    public boolean mAnimating;
    /* access modifiers changed from: private */
    public final Animation.AnimationListener mAnimationDoneListener;
    private Slider mCurrentSlider;
    private float mDensity;
    private int mGrabbedState;
    private boolean mHoldLeftOnTransition;
    private boolean mHoldRightOnTransition;
    private boolean mHoldVideoOnTransition;
    /* access modifiers changed from: private */
    public Slider mLeftSlider;
    private OnTriggerListener mOnTriggerListener;
    private int mOrientation;
    private Slider mOtherSlider;
    private Slider mOtherSlider2;
    /* access modifiers changed from: private */
    public Slider mRightSlider;
    private float mThreshold;
    private Rect mTmpRect;
    private boolean mTracking;
    private boolean mTriggered;
    private Vibrator mVibrator;
    /* access modifiers changed from: private */
    public Slider mVideoSlider;

    public interface OnTriggerListener {
        public static final int LEFT_HANDLE = 1;
        public static final int NO_HANDLE = 0;
        public static final int RIGHT_HANDLE = 2;
        public static final int VIDEO_HANDLE = 3;

        void onGrabbedStateChange(View view, int i);

        void onTrigger(View view, int i);
    }

    private static class Slider {
        public static final int ALIGN_BOTTOM = 3;
        public static final int ALIGN_LEFT = 0;
        public static final int ALIGN_RIGHT = 1;
        public static final int ALIGN_TOP = 2;
        public static final int ALIGN_UNKNOWN = 4;
        private static final int STATE_ACTIVE = 2;
        private static final int STATE_NORMAL = 0;
        private static final int STATE_PRESSED = 1;
        private int alignment = 4;
        private int alignment_value;
        private final ImageView arrow;
        private int currentState = 0;
        /* access modifiers changed from: private */
        public final ImageView tab;
        private final ImageView target;
        /* access modifiers changed from: private */
        public final TextView text;

        Slider(ViewGroup viewGroup, int i, int i2, int i3, int i4) {
            this.tab = new ImageView(viewGroup.getContext());
            this.tab.setBackgroundResource(i);
            this.tab.setScaleType(ImageView.ScaleType.CENTER);
            this.tab.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
            this.arrow = new ImageView(viewGroup.getContext());
            this.arrow.setBackgroundResource(i4);
            this.arrow.setScaleType(ImageView.ScaleType.CENTER);
            this.arrow.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
            this.text = new TextView(viewGroup.getContext());
            this.text.setLayoutParams(new ViewGroup.LayoutParams(-2, -1));
            this.text.setBackgroundResource(i2);
            this.text.setTextAppearance(viewGroup.getContext(), R.style.TextAppearance_SlidingTabNormal);
            this.target = new ImageView(viewGroup.getContext());
            this.target.setImageResource(i3);
            this.target.setScaleType(ImageView.ScaleType.CENTER);
            this.target.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
            this.target.setVisibility(INVISIBLE);
            viewGroup.addView(this.target);
            viewGroup.addView(this.tab);
            viewGroup.addView(this.arrow);
            viewGroup.addView(this.text);
        }

        public int getTabHeight() {
            return this.tab.getMeasuredHeight();
        }

        public int getTabWidth() {
            return this.tab.getMeasuredWidth();
        }

        /* access modifiers changed from: package-private */
        public void hide() {
            int i = 0;
            boolean z = this.alignment == 0 || this.alignment == 1;
            int right = z ? this.alignment == 0 ? this.alignment_value - this.tab.getRight() : this.alignment_value - this.tab.getLeft() : 0;
            if (!z) {
                i = this.alignment == 2 ? this.alignment_value - this.tab.getBottom() : this.alignment_value - this.tab.getTop();
            }
            TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, (float) right, 0.0f, (float) i);
            translateAnimation.setDuration(250);
            translateAnimation.setFillAfter(true);
            this.tab.startAnimation(translateAnimation);
            this.text.startAnimation(translateAnimation);
            this.target.setVisibility(INVISIBLE);
        }

        public void hideTarget() {
            this.target.clearAnimation();
            this.target.setVisibility(INVISIBLE);
        }

        /* access modifiers changed from: package-private */
        public void layout(int i, int i2, int i3, int i4, int i5) {
            this.alignment = i5;
            Drawable background = this.tab.getBackground();
            Drawable background2 = this.arrow.getBackground();
            int intrinsicWidth = background.getIntrinsicWidth();
            int intrinsicWidth2 = background2.getIntrinsicWidth();
            int intrinsicHeight = background.getIntrinsicHeight();
            Drawable drawable = this.target.getDrawable();
            int intrinsicWidth3 = drawable.getIntrinsicWidth();
            int intrinsicHeight2 = drawable.getIntrinsicHeight();
            int i6 = i3 - i;
            int i7 = i4 - i2;
            int i8 = (((int) (SlidingTab.THRESHOLD * ((float) i6))) - intrinsicWidth3) + (intrinsicWidth / 2);
            int i9 = ((int) (0.3333333f * ((float) i6))) - (intrinsicWidth / 2);
            int i10 = (i6 - intrinsicWidth) / 2;
            int i11 = i10 + intrinsicWidth;
            if (i5 == 0 || i5 == 1) {
                int i12 = (i7 - intrinsicHeight2) / 2;
                int i13 = intrinsicHeight2 + i12;
                int i14 = (i7 - intrinsicHeight) / 2;
                int i15 = (intrinsicHeight + i7) / 2;
                if (i5 == 0) {
                    this.tab.layout(0, i14, intrinsicWidth, i15);
                    this.arrow.layout(intrinsicWidth, i14, intrinsicWidth2 + intrinsicWidth, i15);
                    this.target.layout(i8, i12, i8 + intrinsicWidth3, i13);
                    this.alignment_value = i;
                    return;
                }
                this.tab.layout(i6 - intrinsicWidth, i14, i6, i15);
                this.arrow.layout((i6 - intrinsicWidth) - intrinsicWidth2, i14, i6 - intrinsicWidth, i15);
                this.target.layout(i9, i12, i9 + intrinsicWidth3, i13);
                this.alignment_value = i3;
                return;
            }
            int i16 = (i6 - intrinsicWidth3) / 2;
            int i17 = (i6 + intrinsicWidth3) / 2;
            int i18 = (((int) (SlidingTab.THRESHOLD * ((float) i7))) + (intrinsicHeight / 2)) - intrinsicHeight2;
            int i19 = ((int) (0.3333333f * ((float) i7))) - (intrinsicHeight / 2);
            if (i5 == 2) {
                this.tab.layout(i10, 0, i11, intrinsicHeight);
                this.text.layout(i10, 0 - i7, i11, 0);
                this.target.layout(i16, i18, i17, intrinsicHeight2 + i18);
                this.alignment_value = i2;
                return;
            }
            this.tab.layout(i10, i7 - intrinsicHeight, i11, i7);
            this.text.layout(i10, i7, i11, i7 + i7);
            this.target.layout(i16, i19, i17, intrinsicHeight2 + i19);
            this.alignment_value = i4;
        }

        public void measure() {
            this.tab.measure(View.MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED), View.MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED));
            this.arrow.measure(View.MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED), View.MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED));
            this.text.measure(View.MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED), View.MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED));
        }

        /* access modifiers changed from: package-private */
        public void reset(boolean z) {
            setState(0);
            this.text.setVisibility(View.VISIBLE);
            this.text.setTextAppearance(this.text.getContext(), R.style.TextAppearance_SlidingTabNormal);
            this.tab.setVisibility(View.VISIBLE);
            this.arrow.setVisibility(View.VISIBLE);
            this.target.setVisibility(INVISIBLE);
            boolean z2 = this.alignment != 0 ? this.alignment == 1 : true;
            int left = z2 ? this.alignment == 0 ? this.alignment_value - this.tab.getLeft() : this.alignment_value - this.tab.getRight() : 0;
            int top = z2 ? 0 : this.alignment == 2 ? this.alignment_value - this.tab.getTop() : this.alignment_value - this.tab.getBottom();
            if (z) {
                TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, (float) left, 0.0f, (float) top);
                translateAnimation.setDuration(250);
                translateAnimation.setFillAfter(false);
                this.text.startAnimation(translateAnimation);
                this.tab.startAnimation(translateAnimation);
                return;
            }
            if (z2) {
                this.text.offsetLeftAndRight(left);
                this.tab.offsetLeftAndRight(left);
            } else {
                this.text.offsetTopAndBottom(top);
                this.tab.offsetTopAndBottom(top);
            }
            this.text.clearAnimation();
            this.tab.clearAnimation();
            this.target.clearAnimation();
        }

        /* access modifiers changed from: package-private */
        public void setAnimationResource(int i) {
            this.arrow.setBackgroundResource(i);
            if (i == 2130837601) {
                SlidingTab.btnAcceptCallAnimation = (AnimationDrawable) this.arrow.getBackground();
            } else if (i == 2130837628) {
                SlidingTab.btnRejectCallAnimation = (AnimationDrawable) this.arrow.getBackground();
            } else if (i == 2130837602) {
                SlidingTab.btnAcceptVideoAnimation = (AnimationDrawable) this.arrow.getBackground();
            }
        }

        /* access modifiers changed from: package-private */
        public void setBarBackgroundResource(int i) {
            this.text.setBackgroundResource(i);
        }

        /* access modifiers changed from: package-private */
        public void setHintText(int i) {
            this.text.setText(i);
        }

        /* access modifiers changed from: package-private */
        public void setIcon(int i) {
            this.tab.setImageResource(i);
        }

        /* access modifiers changed from: package-private */
        public void setState(int i) {
            this.text.setPressed(i == 1);
            this.tab.setPressed(i == 1);
            if (i == 2) {
                int[] iArr = {16842914};
                if (this.text.getBackground().isStateful()) {
                    this.text.getBackground().setState(iArr);
                }
                if (this.tab.getBackground().isStateful()) {
                    this.tab.getBackground().setState(iArr);
                }
                this.text.setTextAppearance(this.text.getContext(), R.style.TextAppearance_SlidingTabActive);
            } else {
                this.text.setTextAppearance(this.text.getContext(), R.style.TextAppearance_SlidingTabNormal);
            }
            this.currentState = i;
        }

        /* access modifiers changed from: package-private */
        public void setTabBackgroundResource(int i) {
            this.tab.setBackgroundResource(i);
        }

        /* access modifiers changed from: package-private */
        public void setTarget(int i) {
            this.target.setImageResource(i);
        }

        /* access modifiers changed from: package-private */
        public void show(boolean z) {
            int i = 0;
            this.text.setVisibility(View.VISIBLE);
            this.tab.setVisibility(View.VISIBLE);
            this.arrow.setVisibility(View.VISIBLE);
            if (z) {
                boolean z2 = this.alignment != 0 ? this.alignment == 1 : true;
                int width = z2 ? this.alignment == 0 ? this.tab.getWidth() : -this.tab.getWidth() : 0;
                if (!z2) {
                    i = this.alignment == 2 ? this.tab.getHeight() : -this.tab.getHeight();
                }
                TranslateAnimation translateAnimation = new TranslateAnimation((float) (-width), 0.0f, (float) (-i), 0.0f);
                translateAnimation.setDuration(250);
                this.tab.startAnimation(translateAnimation);
                this.arrow.startAnimation(translateAnimation);
                this.text.startAnimation(translateAnimation);
            }
        }

        /* access modifiers changed from: package-private */
        public void showTarget() {
            AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
            alphaAnimation.setDuration(500);
            this.target.startAnimation(alphaAnimation);
            this.target.setVisibility(View.VISIBLE);
        }

        public void startAnimation(Animation animation, Animation animation2) {
            this.tab.startAnimation(animation);
            this.text.startAnimation(animation2);
        }

        public void updateDrawableStates() {
            setState(this.currentState);
        }
    }

    public SlidingTab(Context context) {
        this(context, (AttributeSet) null);
    }

    public SlidingTab(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mHoldLeftOnTransition = true;
        this.mHoldRightOnTransition = true;
        this.mHoldVideoOnTransition = true;
        this.mGrabbedState = 0;
        this.mTriggered = false;
        this.mAnimationDoneListener = new Animation.AnimationListener() {
            public void onAnimationEnd(Animation animation) {
                SlidingTab.this.onAnimationDone();
            }

            public void onAnimationRepeat(Animation animation) {
            }

            public void onAnimationStart(Animation animation) {
            }
        };
        this.mTmpRect = new Rect();
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.SlidingDrawerEx);
        this.mOrientation = obtainStyledAttributes.getInt(R.styleable.SlidingDrawerEx_Orientation, HORIZONTAL);
        obtainStyledAttributes.recycle();
        this.mDensity = getResources().getDisplayMetrics().density;
        this.mLeftSlider = new Slider(this, R.drawable.jog_tab_left_generic, R.drawable.jog_tab_bar_left_generic, R.drawable.jog_tab_target_gray, R.drawable.btn_accept_call_animation);
        this.mRightSlider = new Slider(this, R.drawable.jog_tab_right_generic, R.drawable.jog_tab_bar_right_generic, R.drawable.jog_tab_target_gray, R.drawable.btn_reject_call_animation);
        this.mVideoSlider = new Slider(this, R.drawable.jog_tab_left_generic, R.drawable.jog_tab_bar_left_generic, R.drawable.jog_tab_target_gray, R.drawable.btn_accept_video_animation);
    }

    private void dispatchTriggerEvent(int i) {
        vibrate(VIBRATE_LONG);
        if (this.mOnTriggerListener != null) {
            this.mOnTriggerListener.onTrigger(this, i);
        }
    }

    private int getRelativeLeft(View view) {
        if (view.getParent() == view.getRootView()) {
            return view.getLeft();
        }
        return getRelativeLeft((View) view.getParent()) + view.getLeft();
    }

    private boolean isHorizontal() {
        return this.mOrientation == 0;
    }

    private void log(String str) {
    }

    private void moveHandle(float f, float f2) {
        ImageView access$100 = this.mCurrentSlider.tab;
        TextView access$800 = this.mCurrentSlider.text;
        if (isHorizontal()) {
            int left = (((int) f) - access$100.getLeft()) - (access$100.getWidth() / 2);
            access$100.offsetLeftAndRight(left);
            access$800.offsetLeftAndRight(left);
        } else {
            int top = (((int) f2) - access$100.getTop()) - (access$100.getHeight() / 2);
            access$100.offsetTopAndBottom(top);
            access$800.offsetTopAndBottom(top);
        }
        invalidate();
    }

    /* access modifiers changed from: private */
    public void onAnimationDone() {
        resetView();
        this.mAnimating = false;
    }

    /* access modifiers changed from: private */
    public void resetView() {
        this.mLeftSlider.reset(false);
        this.mRightSlider.reset(false);
        this.mVideoSlider.reset(false);
    }

    private void setGrabbedState(int i) {
        if (i != this.mGrabbedState) {
            this.mGrabbedState = i;
            if (this.mOnTriggerListener != null) {
                this.mOnTriggerListener.onGrabbedStateChange(this, this.mGrabbedState);
            }
        }
    }

    private void vibrate(long j) {
        synchronized (this) {
            if (this.mVibrator == null) {
                this.mVibrator = (Vibrator) getContext().getSystemService(Service.VIBRATOR_SERVICE);
            }
            this.mVibrator.vibrate(j);
        }
    }

    private boolean withinView(float f, float f2, View view) {
        return (isHorizontal() && f > 50.0f && f < ((float) (view.getWidth() + 50))) || (!isHorizontal() && f2 > -50.0f && f2 < ((float) (view.getHeight() + 50)));
    }

    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        float f = THRESHOLD;
        float f2 = 0.3333333f;
        int action = motionEvent.getAction();
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        if (this.mAnimating) {
            return false;
        }
        this.mLeftSlider.tab.getHitRect(this.mTmpRect);
        boolean contains = this.mTmpRect.contains((int) x, (int) y);
        this.mRightSlider.tab.getHitRect(this.mTmpRect);
        boolean contains2 = this.mTmpRect.contains((int) x, (int) y);
        this.mVideoSlider.tab.getHitRect(this.mTmpRect);
        boolean contains3 = this.mTmpRect.contains((int) x, (int) y);
        if (!this.mTracking && !contains && !contains2 && !contains3) {
            return false;
        }
        switch (action) {
            case 0:
                this.mTracking = true;
                this.mTriggered = false;
                vibrate(VIBRATE_SHORT);
                if (contains) {
                    this.mCurrentSlider = this.mLeftSlider;
                    this.mOtherSlider = this.mRightSlider;
                    this.mOtherSlider2 = this.mVideoSlider;
                    this.mThreshold = isHorizontal() ? 0.6666667f : 0.3333333f;
                    setGrabbedState(1);
                } else if (contains2) {
                    this.mCurrentSlider = this.mRightSlider;
                    this.mOtherSlider = this.mLeftSlider;
                    this.mOtherSlider2 = this.mVideoSlider;
                    if (!isHorizontal()) {
                        f2 = 0.6666667f;
                    }
                    this.mThreshold = f2;
                    setGrabbedState(2);
                } else {
                    this.mCurrentSlider = this.mVideoSlider;
                    this.mOtherSlider = this.mLeftSlider;
                    this.mOtherSlider2 = this.mRightSlider;
                    if (!isHorizontal()) {
                        f = 0.3333333f;
                    }
                    this.mThreshold = f;
                    setGrabbedState(3);
                }
                this.mCurrentSlider.setState(1);
                this.mCurrentSlider.showTarget();
                this.mOtherSlider.hide();
                this.mOtherSlider2.hide();
                break;
        }
        return true;
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        if (z) {
            if (!LinphoneService.ShowVideoSlidingTab || !BandwidthManager.isRoamSaveVideoEnable()) {
                this.mLeftSlider.layout(i, i2, i3, i4, isHorizontal() ? 0 : 3);
                this.mRightSlider.layout(i, i2, i3, i4, isHorizontal() ? 1 : 2);
                return;
            }
            this.mRightSlider.layout(i, i2, i3, i4, isHorizontal() ? 1 : 2);
            this.mVideoSlider.layout(i, i2, i3, i4, isHorizontal() ? 0 : 3);
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int max;
        int max2;
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size2 = View.MeasureSpec.getSize(i2);
        if (mode == 0 || mode2 == 0) {
        }
        this.mLeftSlider.measure();
        this.mRightSlider.measure();
        this.mVideoSlider.measure();
        int tabWidth = this.mLeftSlider.getTabWidth();
        int tabWidth2 = this.mRightSlider.getTabWidth();
        this.mVideoSlider.getTabWidth();
        int tabHeight = this.mLeftSlider.getTabHeight();
        int tabHeight2 = this.mRightSlider.getTabHeight();
        int tabHeight3 = this.mVideoSlider.getTabHeight();
        if (isHorizontal()) {
            max = Math.max(size, tabWidth + tabWidth2);
            max2 = Math.max(tabHeight, tabHeight2);
        } else {
            max = Math.max(tabWidth, tabHeight2);
            max2 = Math.max(size2, tabHeight + tabHeight2 + tabHeight3);
        }
        setMeasuredDimension(max, max2);
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (this.mTracking) {
            int action = motionEvent.getAction();
            float x = motionEvent.getX();
            float y = motionEvent.getY();
            switch (action) {
                case 0:
                    btnAcceptCallAnimation.stop();
                    btnAcceptCallAnimation.selectDrawable(0);
                    btnRejectCallAnimation.stop();
                    btnRejectCallAnimation.selectDrawable(0);
                    btnAcceptVideoAnimation.stop();
                    btnAcceptVideoAnimation.selectDrawable(0);
                    break;
                case 2:
                    if (withinView(x, y, this)) {
                        moveHandle(x, y);
                        if (isHorizontal()) {
                            y = x;
                        }
                        float width = ((float) (isHorizontal() ? getWidth() : getHeight())) * this.mThreshold;
                        boolean z = isHorizontal() ? (this.mCurrentSlider == this.mLeftSlider || this.mCurrentSlider == this.mVideoSlider) ? y > width : y < width : (this.mCurrentSlider == this.mLeftSlider || this.mCurrentSlider == this.mVideoSlider) ? y < width : y > width;
                        if (!this.mTriggered && z) {
                            this.mTriggered = true;
                            this.mTracking = false;
                            this.mCurrentSlider.setState(2);
                            if (this.mCurrentSlider == this.mLeftSlider) {
                                dispatchTriggerEvent(1);
                            } else if (this.mCurrentSlider == this.mRightSlider) {
                                dispatchTriggerEvent(2);
                            } else {
                                dispatchTriggerEvent(3);
                            }
                            setGrabbedState(0);
                            break;
                        }
                    }
                    break;
                case 1:
                case 3:
                    this.mTracking = false;
                    this.mTriggered = false;
                    this.mOtherSlider.show(true);
                    this.mOtherSlider2.show(true);
                    this.mCurrentSlider.reset(false);
                    this.mCurrentSlider.hideTarget();
                    this.mCurrentSlider = null;
                    this.mOtherSlider = null;
                    this.mOtherSlider2 = null;
                    setGrabbedState(0);
                    btnAcceptCallAnimation.start();
                    btnRejectCallAnimation.start();
                    btnAcceptVideoAnimation.start();
                    break;
            }
        }
        return this.mTracking || super.onTouchEvent(motionEvent);
    }

    public void reset(boolean z) {
        this.mLeftSlider.reset(z);
        this.mRightSlider.reset(z);
        this.mVideoSlider.reset(z);
    }

    public void setHoldAfterTrigger(boolean z, boolean z2, boolean z3) {
        this.mHoldLeftOnTransition = z;
        this.mHoldRightOnTransition = z2;
        this.mHoldVideoOnTransition = z3;
    }

    public void setLeftHintText(int i) {
        if (isHorizontal()) {
            this.mLeftSlider.setHintText(i);
        }
    }

    public void setLeftTabResources(int i, int i2, int i3, int i4, int i5) {
        this.mLeftSlider.setIcon(i);
        this.mLeftSlider.setTarget(i2);
        this.mLeftSlider.setBarBackgroundResource(i3);
        this.mLeftSlider.setTabBackgroundResource(i4);
        this.mLeftSlider.setAnimationResource(i5);
        this.mLeftSlider.updateDrawableStates();
    }

    public void setOnTriggerListener(OnTriggerListener onTriggerListener) {
        this.mOnTriggerListener = onTriggerListener;
    }

    public void setRightHintText(int i) {
        if (isHorizontal()) {
            this.mRightSlider.setHintText(i);
        }
    }

    public void setRightTabResources(int i, int i2, int i3, int i4, int i5) {
        this.mRightSlider.setIcon(i);
        this.mRightSlider.setTarget(i2);
        this.mRightSlider.setBarBackgroundResource(i3);
        this.mRightSlider.setTabBackgroundResource(i4);
        this.mRightSlider.setAnimationResource(i5);
        this.mRightSlider.updateDrawableStates();
    }

    public void setVideoHintText(int i) {
        if (isHorizontal()) {
            this.mVideoSlider.setHintText(i);
        }
    }

    public void setVideoTabResources(int i, int i2, int i3, int i4, int i5) {
        this.mVideoSlider.setIcon(i);
        this.mVideoSlider.setTarget(i2);
        this.mVideoSlider.setBarBackgroundResource(i3);
        this.mVideoSlider.setTabBackgroundResource(i4);
        this.mVideoSlider.setAnimationResource(i5);
        this.mVideoSlider.updateDrawableStates();
    }

    public void setVisibility(int i) {
        if (i != getVisibility() && (i == 4 || i == 8)) {
            reset(false);
        }
        super.setVisibility(i);
    }

    /* access modifiers changed from: package-private */
    public void startAnimating(final boolean z) {
        final int i;
        final int i2;
        this.mAnimating = true;
        Slider slider = this.mCurrentSlider;
        Slider slider2 = this.mOtherSlider;
        Slider slider3 = this.mOtherSlider2;
        if (isHorizontal()) {
            int right = slider.tab.getRight();
            int width = slider.tab.getWidth();
            int left = slider.tab.getLeft();
            int width2 = getWidth();
            if (z) {
                width = 0;
            }
            i2 = slider == this.mRightSlider ? -((right + width2) - width) : ((width2 - left) + width2) - width;
            i = 0;
        } else {
            int top = slider.tab.getTop();
            int bottom = slider.tab.getBottom();
            int height = slider.tab.getHeight();
            int height2 = getHeight();
            if (z) {
                height = 0;
            }
            i = slider == this.mRightSlider ? (top + height2) - height : -(((height2 - bottom) + height2) - height);
            i2 = 0;
        }
        TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, (float) i2, 0.0f, (float) i);
        translateAnimation.setDuration(250);
        translateAnimation.setInterpolator(new LinearInterpolator());
        translateAnimation.setFillAfter(true);
        TranslateAnimation translateAnimation2 = new TranslateAnimation(0.0f, (float) i2, 0.0f, (float) i);
        translateAnimation2.setDuration(250);
        translateAnimation2.setInterpolator(new LinearInterpolator());
        translateAnimation2.setFillAfter(true);
        translateAnimation.setAnimationListener(new Animation.AnimationListener() {
            public void onAnimationEnd(Animation animation) {
                Animation alphaAnimation;
                if (z) {
                    alphaAnimation = new TranslateAnimation((float) i2, (float) i2, (float) i, (float) i);
                    alphaAnimation.setDuration(1000);
                    boolean unused = SlidingTab.this.mAnimating = false;
                } else {
                    alphaAnimation = new AlphaAnimation(0.5f, 1.0f);
                    alphaAnimation.setDuration(250);
                    SlidingTab.this.resetView();
                }
                alphaAnimation.setAnimationListener(SlidingTab.this.mAnimationDoneListener);
                SlidingTab.this.mLeftSlider.startAnimation(alphaAnimation, alphaAnimation);
                SlidingTab.this.mRightSlider.startAnimation(alphaAnimation, alphaAnimation);
                SlidingTab.this.mVideoSlider.startAnimation(alphaAnimation, alphaAnimation);
            }

            public void onAnimationRepeat(Animation animation) {
            }

            public void onAnimationStart(Animation animation) {
            }
        });
        slider.hideTarget();
        slider.startAnimation(translateAnimation, translateAnimation2);
    }
}
