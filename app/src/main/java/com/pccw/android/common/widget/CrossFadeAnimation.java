package com.pccw.android.common.widget;

import android.content.Context;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.TranslateAnimation;

public class CrossFadeAnimation {
    private static final int IS_ANIMATING_TAG_ID = "isAnimating".hashCode();
    private AnimationSet animation;
    private Context context;
    private AlphaAnimation fadeAnimation = new AlphaAnimation(1.0f, 0.0f);
    /* access modifiers changed from: private */
    public CrossFadeAnimationListener listener;
    private int mShortAnimationDuration;
    private TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, 0.0f, 0.0f, -20.0f);
    private View view;

    public interface CrossFadeAnimationListener {
        void animationEnds();
    }

    public CrossFadeAnimation(Context context2, View view2, CrossFadeAnimationListener crossFadeAnimationListener) {
        this.context = context2;
        this.view = view2;
        this.listener = crossFadeAnimationListener;
        initializeAnimation();
    }

    private void initializeAnimation() {
        this.mShortAnimationDuration = this.context.getResources().getInteger(17694720);
        setAnimatingFlag(false);
        this.fadeAnimation.setDuration((long) this.mShortAnimationDuration);
        this.fadeAnimation.setInterpolator(new DecelerateInterpolator());
        this.fadeAnimation.setRepeatMode(2);
        this.fadeAnimation.setRepeatCount(1);
        this.fadeAnimation.setFillAfter(true);
        this.translateAnimation.setDuration((long) this.mShortAnimationDuration);
        this.translateAnimation.setInterpolator(new DecelerateInterpolator());
        this.translateAnimation.setRepeatMode(2);
        this.translateAnimation.setRepeatCount(1);
        this.translateAnimation.setStartOffset(0);
        this.translateAnimation.setFillAfter(true);
        this.animation = new AnimationSet(false);
        this.animation.addAnimation(this.fadeAnimation);
        this.animation.addAnimation(this.translateAnimation);
        this.animation.setRepeatCount(0);
        this.fadeAnimation.setAnimationListener(new Animation.AnimationListener() {
            public void onAnimationEnd(Animation animation) {
            }

            public void onAnimationRepeat(Animation animation) {
                CrossFadeAnimation.this.listener.animationEnds();
            }

            public void onAnimationStart(Animation animation) {
            }
        });
        this.animation.setAnimationListener(new Animation.AnimationListener() {
            public void onAnimationEnd(Animation animation) {
                CrossFadeAnimation.this.setAnimatingFlag(false);
            }

            public void onAnimationRepeat(Animation animation) {
                CrossFadeAnimation.this.setAnimatingFlag(true);
            }

            public void onAnimationStart(Animation animation) {
                CrossFadeAnimation.this.setAnimatingFlag(true);
            }
        });
    }

    private boolean isAnimating() {
        return ((Boolean) this.view.getTag(IS_ANIMATING_TAG_ID)).booleanValue();
    }

    /* access modifiers changed from: private */
    public void setAnimatingFlag(boolean z) {
        this.view.setTag(IS_ANIMATING_TAG_ID, Boolean.valueOf(z));
    }

    public void fadeOut() {
        if (this.view.getVisibility() == 0 && !isAnimating()) {
            this.view.startAnimation(this.animation);
        }
    }
}
