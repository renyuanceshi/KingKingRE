package org.linphone;

import android.content.Context;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class SlidingCardManager implements ViewTreeObserver.OnGlobalLayoutListener {
    private static final boolean DBG = false;
    static final int SLIDE_DOWN_HINT_TOP_LANDSCAPE = 160;
    static final int SLIDE_UP_HINT_TOP_LANDSCAPE = 88;
    boolean first = true;
    int height;
    private CallCard mCallCard;
    private boolean mCallEndedState;
    private boolean mCardAtTop;
    private int mCardPreferredX;
    private int mCardPreferredY;
    private InCallScreen mInCallScreen;
    private ViewGroup mMainFrame;
    private ViewGroup mSlideDown;
    private TextView mSlideDownHint;
    private boolean mSlideInProgress = false;
    private ViewGroup mSlideUp;
    private TextView mSlideUpHint;
    private int[] mTempLocation = new int[2];
    long mTouchDownTime;
    private int mTouchDownY;

    public static class WindowAttachNotifierView extends View {
        private SlidingCardManager mSlidingCardManager;

        public WindowAttachNotifierView(Context context) {
            super(context);
        }

        /* access modifiers changed from: protected */
        public void onAttachedToWindow() {
            super.onAttachedToWindow();
            getViewTreeObserver().addOnGlobalLayoutListener(this.mSlidingCardManager);
        }

        /* access modifiers changed from: protected */
        public void onDetachedFromWindow() {
            super.onDetachedFromWindow();
        }

        public void setSlidingCardManager(SlidingCardManager slidingCardManager) {
            this.mSlidingCardManager = slidingCardManager;
        }
    }

    private void abortSlide() {
        this.mSlideInProgress = false;
        this.mCallCard.update(this.mCardPreferredX, this.mCardPreferredY, -1, -1);
    }

    private void finishSuccessfulSlide() {
        this.mSlideInProgress = false;
        if (this.mCardAtTop) {
        }
    }

    private void log(String str) {
    }

    private void setSlideHints(int i, int i2) {
        int i3 = 0;
        this.mSlideUp.setVisibility(i != 0 ? 0 : 8);
        if (i != 0) {
            this.mSlideUpHint.setText(i);
        }
        ViewGroup viewGroup = this.mSlideDown;
        if (i2 == 0) {
            i3 = 8;
        }
        viewGroup.setVisibility(i3);
        if (i2 != 0) {
            this.mSlideDownHint.setText(i2);
        }
    }

    /* access modifiers changed from: package-private */
    public void clearInCallScreenReference() {
        this.mInCallScreen = null;
    }

    /* access modifiers changed from: package-private */
    public void handleCallCardTouchEvent(MotionEvent motionEvent) {
        if (this.mInCallScreen != null && !this.mInCallScreen.isFinishing()) {
            int action = motionEvent.getAction();
            int rawX = (int) motionEvent.getRawX();
            int rawY = (int) motionEvent.getRawY();
            if (!isSlideInProgress()) {
                switch (action) {
                    case 0:
                        startSliding(rawX, rawY);
                        return;
                    default:
                        return;
                }
            } else if (SystemClock.elapsedRealtime() - this.mTouchDownTime > 1000) {
                abortSlide();
            } else {
                switch (action) {
                    case 1:
                        stopSliding(rawY);
                        return;
                    case 2:
                        updateWhileSliding(rawY);
                        return;
                    case 3:
                        abortSlide();
                        return;
                    default:
                        return;
                }
            }
        }
    }

    public boolean isSlideInProgress() {
        return this.mSlideInProgress;
    }

    public void onGlobalLayout() {
        if (this.first) {
            this.first = false;
            showPopup();
        }
    }

    public void showPopup() {
        updateCardPreferredPosition();
        updateCardSlideHints();
    }

    /* access modifiers changed from: package-private */
    public void startSliding(int i, int i2) {
        if (!this.mCallEndedState) {
            this.mSlideInProgress = true;
            this.mTouchDownY = i2;
            this.mTouchDownTime = SystemClock.elapsedRealtime();
        }
    }

    /* access modifiers changed from: package-private */
    public void stopSliding(int i) {
        int i2 = i - this.mTouchDownY;
        int height2 = this.mMainFrame.getHeight();
        int i3 = this.height;
        if (!this.mCardAtTop) {
            i2 = -i2;
        }
        if (i2 >= (height2 - i3) - 30) {
            finishSuccessfulSlide();
        } else {
            abortSlide();
        }
    }

    public void updateCardPreferredPosition() {
        if (this.mMainFrame.getWindowToken() != null) {
            if (this.mMainFrame.getHeight() == 0) {
                throw new IllegalStateException("updateCardPreferredPosition: main frame not measured yet");
            }
            this.mMainFrame.getLocationInWindow(this.mTempLocation);
            int i = this.mTempLocation[0];
            if (this.height == 0) {
                this.height = this.mCallCard.getHeight();
                RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.mSlideUp.getLayoutParams();
                layoutParams.bottomMargin = this.height;
                this.mSlideUp.setLayoutParams(layoutParams);
                RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) this.mSlideDown.getLayoutParams();
                layoutParams2.topMargin = this.height;
                this.mSlideDown.setLayoutParams(layoutParams2);
                this.height += 10;
            }
            int height2 = (this.mMainFrame.getHeight() + 0) - this.height;
            this.mCardPreferredX = i;
            if (this.mCardAtTop) {
                height2 = 0;
            }
            this.mCardPreferredY = height2;
            this.mCallCard.update(this.mCardPreferredX, this.mCardPreferredY, -1, -1);
        }
    }

    public void updateCardSlideHints() {
        if (!this.mSlideInProgress) {
            setSlideHints(0, 0);
        }
    }

    /* access modifiers changed from: package-private */
    public void updateWhileSliding(int i) {
        int i2 = 0;
        int i3 = this.mTouchDownY;
        this.mMainFrame.getLocationInWindow(this.mTempLocation);
        int i4 = this.mTempLocation[0];
        int height2 = (this.mMainFrame.getHeight() + 0) - this.height;
        int i5 = (i - i3) + this.mCardPreferredY;
        if (i5 >= 0) {
            i2 = i5 > height2 ? height2 : i5;
        }
        this.mCallCard.update(this.mCardPreferredX, i2, -1, -1);
    }
}
