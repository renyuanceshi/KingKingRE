package com.pccw.sms.emoji;

import android.content.Context;
import android.content.res.TypedArray;
import android.text.Layout;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.TextView;
import com.pccw.mobile.sip02.R;
import com.pccw.sms.bean.SMSConstants;

public class EmojiTextView extends TextView {
    private int mEmojiconSize;
    private CharSequence originalText;

    public enum EllipsizeRange {
        ELLIPSIS_AT_START,
        ELLIPSIS_AT_END
    }

    public EmojiTextView(Context context) {
        super(context);
        init((AttributeSet) null);
    }

    public EmojiTextView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(attributeSet);
    }

    public EmojiTextView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(attributeSet);
    }

    private void init(AttributeSet attributeSet) {
        if (attributeSet == null) {
            this.mEmojiconSize = (int) getTextSize();
        } else {
            TypedArray obtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, R.styleable.Emojicon);
            this.mEmojiconSize = (int) obtainStyledAttributes.getDimension(0, (float) (getLineHeight() + SMSConstants.dpToPx(6)));
            obtainStyledAttributes.recycle();
        }
        setText(getText());
    }

    public CharSequence getText() {
        return this.originalText == null ? super.getText() : this.originalText;
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        if (getEllipsize() == TextUtils.TruncateAt.END) {
            Layout layout = getLayout();
            CharSequence ellipsize = TextUtils.ellipsize(layout.getText(), layout.getPaint(), (float) getMeasuredWidth(), TextUtils.TruncateAt.END);
            setText(ellipsize);
            this.originalText = ellipsize;
            requestLayout();
            invalidate();
        }
    }

    public void setEmojiconSize(int i) {
        this.mEmojiconSize = i;
    }

    public void setText(CharSequence charSequence, TextView.BufferType bufferType) {
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(charSequence);
        EmojiconHandler.addEmojis(getContext(), spannableStringBuilder, this.mEmojiconSize);
        super.setText(spannableStringBuilder, bufferType);
    }
}
