package org.linphone.component;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageButton;

public class ToggleImageButton extends ImageButton implements View.OnClickListener {
    private static final String namespace = null;
    private boolean checked;
    private OnCheckedChangeListener onCheckedChangeListener;
    private Drawable stateChecked;
    private Drawable stateUnChecked;

    public interface OnCheckedChangeListener {
        void onCheckedChanged(ToggleImageButton toggleImageButton, boolean z);
    }

    public ToggleImageButton(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.stateChecked = getResources().getDrawable(attributeSet.getAttributeResourceValue(namespace, "checked", -1));
        this.stateUnChecked = getResources().getDrawable(attributeSet.getAttributeResourceValue(namespace, "unchecked", -1));
        setBackgroundColor(0);
        setOnClickListener(this);
        handleCheckChanged();
    }

    private void handleCheckChanged() {
        setImageDrawable(this.checked ? this.stateChecked : this.stateUnChecked);
        requestLayout();
        invalidate();
        if (this.onCheckedChangeListener != null) {
            this.onCheckedChangeListener.onCheckedChanged(this, this.checked);
        }
    }

    public boolean isChecked() {
        return this.checked;
    }

    public void onClick(View view) {
        this.checked = !this.checked;
        handleCheckChanged();
    }

    public void setChecked(boolean z) {
        this.checked = z;
        handleCheckChanged();
    }

    public void setOnCheckedChangeListener(OnCheckedChangeListener onCheckedChangeListener2) {
        this.onCheckedChangeListener = onCheckedChangeListener2;
    }
}
