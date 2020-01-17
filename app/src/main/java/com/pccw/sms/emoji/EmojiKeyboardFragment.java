package com.pccw.sms.emoji;

import android.app.Activity;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.support.v4.app.DialogFragment;
import android.support.v4.view.ViewPager;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.EditText;
import com.pccw.mobile.sip02.R;
import com.pccw.sms.bean.Emojicon;
import com.pccw.sms.emoji.type.Nature;
import com.pccw.sms.emoji.type.Objects;
import com.pccw.sms.emoji.type.People;
import com.pccw.sms.emoji.type.Places;
import com.pccw.sms.emoji.type.Symbols;
import java.util.Arrays;

public class EmojiKeyboardFragment extends DialogFragment implements ViewPager.OnPageChangeListener {
    private int keyboardHeight;
    private int mEmojiTabLastSelectedIndex = -1;
    private View[] mEmojiTabs;
    /* access modifiers changed from: private */
    public OnEmojiconBackspaceClickedListener mOnEmojiconBackspaceClickedListener;
    private OnKeyboardDialogDismissListener mOnKeyboardDialogDismissListener;
    private float popUpheight;

    public interface OnEmojiconBackspaceClickedListener {
        void onEmojiconBackspaceClicked(View view);
    }

    public interface OnKeyboardDialogDismissListener {
        void OnKeyboardDialogDismiss();
    }

    public static class RepeatListener implements View.OnTouchListener {
        /* access modifiers changed from: private */
        public final View.OnClickListener clickListener;
        /* access modifiers changed from: private */
        public View downView;
        /* access modifiers changed from: private */
        public Handler handler = new Handler();
        private Runnable handlerRunnable = new Runnable() {
            public void run() {
                if (RepeatListener.this.downView != null) {
                    RepeatListener.this.handler.removeCallbacksAndMessages(RepeatListener.this.downView);
                    RepeatListener.this.handler.postAtTime(this, RepeatListener.this.downView, SystemClock.uptimeMillis() + ((long) RepeatListener.this.normalInterval));
                    RepeatListener.this.clickListener.onClick(RepeatListener.this.downView);
                }
            }
        };
        private int initialInterval;
        /* access modifiers changed from: private */
        public final int normalInterval;

        public RepeatListener(int i, int i2, View.OnClickListener onClickListener) {
            if (onClickListener == null) {
                throw new IllegalArgumentException("null runnable");
            } else if (i < 0 || i2 < 0) {
                throw new IllegalArgumentException("negative interval");
            } else {
                this.initialInterval = i;
                this.normalInterval = i2;
                this.clickListener = onClickListener;
            }
        }

        public boolean onTouch(View view, MotionEvent motionEvent) {
            switch (motionEvent.getAction()) {
                case 0:
                    this.downView = view;
                    this.handler.removeCallbacks(this.handlerRunnable);
                    this.handler.postAtTime(this.handlerRunnable, this.downView, SystemClock.uptimeMillis() + ((long) this.initialInterval));
                    this.clickListener.onClick(view);
                    return true;
                case 1:
                case 3:
                case 4:
                    this.handler.removeCallbacksAndMessages(this.downView);
                    this.downView = null;
                    return true;
                default:
                    return false;
            }
        }
    }

    public static void backspace(EditText editText) {
        editText.dispatchKeyEvent(new KeyEvent(0, 0, 0, 67, 0, 0, 0, 0, 6));
    }

    private void changeKeyboardHeight(int i) {
        if (i > 100) {
            this.keyboardHeight = i;
        } else {
            this.keyboardHeight = (int) this.popUpheight;
        }
    }

    public static void input(EditText editText, Emojicon emojicon) {
        if (editText != null && emojicon != null) {
            int selectionStart = editText.getSelectionStart();
            int selectionEnd = editText.getSelectionEnd();
            if (selectionStart < 0) {
                editText.append(emojicon.getEmoji());
            } else {
                editText.getText().replace(Math.min(selectionStart, selectionEnd), Math.max(selectionStart, selectionEnd), emojicon.getEmoji(), 0, emojicon.getEmoji().length());
            }
        }
    }

    public static EmojiKeyboardFragment newInstance(int i) {
        EmojiKeyboardFragment emojiKeyboardFragment = new EmojiKeyboardFragment();
        Bundle bundle = new Bundle();
        bundle.putInt("keyboardHeight", i);
        emojiKeyboardFragment.setArguments(bundle);
        return emojiKeyboardFragment;
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        if (getActivity() instanceof OnEmojiconBackspaceClickedListener) {
            this.mOnEmojiconBackspaceClickedListener = (OnEmojiconBackspaceClickedListener) getActivity();
            if (getActivity() instanceof OnKeyboardDialogDismissListener) {
                this.mOnKeyboardDialogDismissListener = (OnKeyboardDialogDismissListener) getActivity();
                return;
            }
            throw new IllegalArgumentException(activity + " must implement interface " + OnKeyboardDialogDismissListener.class.getSimpleName());
        }
        throw new IllegalArgumentException(activity + " must implement interface " + OnEmojiconBackspaceClickedListener.class.getSimpleName());
    }

    public void onCreate(Bundle bundle) {
        setStyle(2, R.style.CustomDialog);
        this.keyboardHeight = getArguments().getInt("keyboardHeight");
        super.onCreate(bundle);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.emoji_keyboard, viewGroup);
        final ViewPager viewPager = (ViewPager) inflate.findViewById(R.id.emoji_pager);
        viewPager.setOnPageChangeListener(this);
        viewPager.setAdapter(new EmojiPagerAdapter(getChildFragmentManager(), Arrays.asList(new EmojiconGridFragment[]{EmojiconGridFragment.newInstance(People.DATA), EmojiconGridFragment.newInstance(Nature.DATA), EmojiconGridFragment.newInstance(Objects.DATA), EmojiconGridFragment.newInstance(Places.DATA), EmojiconGridFragment.newInstance(Symbols.DATA)})));
        this.mEmojiTabs = new View[5];
        this.mEmojiTabs[0] = inflate.findViewById(R.id.emojis_tab_0_people);
        this.mEmojiTabs[1] = inflate.findViewById(R.id.emojis_tab_1_nature);
        this.mEmojiTabs[2] = inflate.findViewById(R.id.emojis_tab_2_objects);
        this.mEmojiTabs[3] = inflate.findViewById(R.id.emojis_tab_3_cars);
        this.mEmojiTabs[4] = inflate.findViewById(R.id.emojis_tab_4_punctuation);
        for (final int i = 0; i < this.mEmojiTabs.length; i++) {
            this.mEmojiTabs[i].setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    EmojiKeyboardFragment.this.onPageSelected(i);
                    viewPager.setCurrentItem(i);
                }
            });
        }
        inflate.findViewById(R.id.emojis_backspace).setOnTouchListener(new RepeatListener(1000, 50, new View.OnClickListener() {
            public void onClick(View view) {
                if (EmojiKeyboardFragment.this.mOnEmojiconBackspaceClickedListener != null) {
                    EmojiKeyboardFragment.this.mOnEmojiconBackspaceClickedListener.onEmojiconBackspaceClicked(view);
                }
            }
        }));
        onPageSelected(0);
        getDialog().getWindow().requestFeature(1);
        return inflate;
    }

    public void onDetach() {
        this.mOnEmojiconBackspaceClickedListener = null;
        this.mOnKeyboardDialogDismissListener = null;
        super.onDetach();
    }

    public void onDismiss(DialogInterface dialogInterface) {
        if (this.mOnKeyboardDialogDismissListener != null) {
            this.mOnKeyboardDialogDismissListener.OnKeyboardDialogDismiss();
        }
        super.onDismiss(dialogInterface);
    }

    public void onPageScrollStateChanged(int i) {
    }

    public void onPageScrolled(int i, float f, int i2) {
    }

    public void onPageSelected(int i) {
        if (this.mEmojiTabLastSelectedIndex != i) {
            switch (i) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                    if (this.mEmojiTabLastSelectedIndex >= 0 && this.mEmojiTabLastSelectedIndex < this.mEmojiTabs.length) {
                        this.mEmojiTabs[this.mEmojiTabLastSelectedIndex].setSelected(false);
                    }
                    this.mEmojiTabs[i].setSelected(true);
                    this.mEmojiTabLastSelectedIndex = i;
                    return;
                default:
                    return;
            }
        }
    }

    public void onStart() {
        super.onStart();
        this.popUpheight = getResources().getDimension(R.dimen.keyboard_height);
        changeKeyboardHeight(this.keyboardHeight);
        Window window = getDialog().getWindow();
        window.setFlags(32, 32);
        window.setFlags(262144, 262144);
        window.setFlags(131072, 131072);
        window.clearFlags(2);
        WindowManager.LayoutParams attributes = window.getAttributes();
        attributes.width = -1;
        attributes.height = this.keyboardHeight;
        attributes.gravity = 83;
        attributes.dimAmount = 0.0f;
        attributes.flags |= 2;
        window.setAttributes(attributes);
        window.setBackgroundDrawableResource(17170445);
    }
}
