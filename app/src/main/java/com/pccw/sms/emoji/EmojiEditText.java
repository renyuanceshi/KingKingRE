package com.pccw.sms.emoji;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.widget.EditText;
import com.pccw.mobile.sip02.R;
import com.pccw.sms.bean.SMSConstants;

public class EmojiEditText extends EditText {
    private int mEmojiconSize;

    public EmojiEditText(Context context) {
        super(context);
        this.mEmojiconSize = getLineHeight();
    }

    public EmojiEditText(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(attributeSet);
    }

    public EmojiEditText(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(attributeSet);
    }

    private void init(AttributeSet attributeSet) {
        TypedArray obtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, R.styleable.Emojicon);
        this.mEmojiconSize = (int) obtainStyledAttributes.getDimension(0, (float) (getLineHeight() + SMSConstants.dpToPx(3)));
        obtainStyledAttributes.recycle();
        setText(getText());
    }

    /* access modifiers changed from: protected */
    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        EmojiconHandler.addEmojis(getContext(), getText(), this.mEmojiconSize);
    }

    public void setEmojiconSize(int i) {
        this.mEmojiconSize = i;
    }
}
