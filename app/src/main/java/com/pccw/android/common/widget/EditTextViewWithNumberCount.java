package com.pccw.android.common.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.text.Editable;
import android.text.InputFilter;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.widget.EditText;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.pccw.mobile.sip02.R;

public class EditTextViewWithNumberCount extends RelativeLayout {
    /* access modifiers changed from: private */
    public Context context;
    private EditText input;
    private boolean isFieldValid = false;
    private boolean isMultiLined = false;
    /* access modifiers changed from: private */
    public int maxWordCount = 15;
    /* access modifiers changed from: private */
    public TextValidationWatcher mlistener = null;
    /* access modifiers changed from: private */
    public TextView textCount;
    private Typeface typeface;

    public interface TextValidationWatcher {
        void onValidation(boolean z);
    }

    public EditTextViewWithNumberCount(Context context2, AttributeSet attributeSet) {
        super(context2, attributeSet);
        if (!isInEditMode()) {
            this.context = context2;
            this.typeface = Typeface.createFromAsset(context2.getAssets(), "Roboto-Regular.ttf");
            if (attributeSet != null) {
                TypedArray obtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, R.styleable.EditTextViewWithNumberCount);
                this.maxWordCount = obtainStyledAttributes.getInt(0, this.maxWordCount);
                this.isMultiLined = obtainStyledAttributes.getBoolean(1, this.isMultiLined);
                obtainStyledAttributes.recycle();
            }
            int dimension = (int) context2.getResources().getDimension(R.dimen.horizontal_margin);
            setPadding(dimension, dimension, dimension, dimension);
            init();
        }
    }

    public static int convertPixelsToDp(float f, Context context2) {
        return (int) (f / (((float) context2.getResources().getDisplayMetrics().densityDpi) / 160.0f));
    }

    private void init() {
        this.textCount = new TextView(this.context);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(15);
        layoutParams.addRule(11);
        this.textCount.setTextColor(this.context.getResources().getColor(R.color.mid_blue));
        this.textCount.setBackgroundResource(0);
        this.textCount.setTypeface(this.typeface);
        this.textCount.setText(String.valueOf(this.maxWordCount));
        this.input = new EditText(this.context);
        this.input.setBackgroundResource(0);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(15);
        layoutParams2.addRule(9);
        layoutParams2.setMargins(0, 0, convertPixelsToDp(24.0f, this.context), 0);
        this.input.setEllipsize(TextUtils.TruncateAt.START);
        addView(this.input, layoutParams2);
        addView(this.textCount, layoutParams);
        InputFilter.LengthFilter lengthFilter = new InputFilter.LengthFilter(this.maxWordCount);
        this.input.setFilters(new InputFilter[]{lengthFilter});
        this.input.setSingleLine(this.isMultiLined);
        this.input.addTextChangedListener(new TextWatcher() {
            public void afterTextChanged(Editable editable) {
            }

            public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }

            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                int access$000 = EditTextViewWithNumberCount.this.maxWordCount - charSequence.toString().length();
                EditTextViewWithNumberCount.this.textCount.setText(String.valueOf(access$000));
                if (access$000 != 0) {
                    EditTextViewWithNumberCount.this.textCount.setTextColor(EditTextViewWithNumberCount.this.context.getResources().getColor(R.color.mid_blue));
                } else {
                    EditTextViewWithNumberCount.this.textCount.setTextColor(EditTextViewWithNumberCount.this.context.getResources().getColor(R.color.bg_darkgrey));
                }
                EditTextViewWithNumberCount.this.setFieldValid(access$000 != EditTextViewWithNumberCount.this.maxWordCount);
                if (EditTextViewWithNumberCount.this.mlistener != null) {
                    EditTextViewWithNumberCount.this.mlistener.onValidation(EditTextViewWithNumberCount.this.isFieldValid());
                }
            }
        });
    }

    public void addTextValidationListener(TextValidationWatcher textValidationWatcher) {
        this.mlistener = textValidationWatcher;
    }

    public int getMaxWordCount() {
        return this.maxWordCount;
    }

    public String getText() {
        return this.input.getText().toString().trim();
    }

    public boolean isFieldValid() {
        return this.isFieldValid;
    }

    public void setFieldValid(boolean z) {
        this.isFieldValid = z;
    }

    public void setMaxWordCount(int i) {
        this.maxWordCount = i;
    }

    public void setSelection(int i) {
        this.input.setSelection(i);
    }

    public void setText(String str) {
        this.input.setText(str);
    }
}
