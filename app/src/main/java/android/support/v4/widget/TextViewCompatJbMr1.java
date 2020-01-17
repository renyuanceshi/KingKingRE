package android.support.v4.widget;

import android.annotation.TargetApi;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.widget.TextView;

@TargetApi(17)
@RequiresApi(17)
class TextViewCompatJbMr1 {
    TextViewCompatJbMr1() {
    }

    public static Drawable[] getCompoundDrawablesRelative(@NonNull TextView textView) {
        boolean z = true;
        if (textView.getLayoutDirection() != 1) {
            z = false;
        }
        Drawable[] compoundDrawables = textView.getCompoundDrawables();
        if (z) {
            Drawable drawable = compoundDrawables[2];
            Drawable drawable2 = compoundDrawables[0];
            compoundDrawables[0] = drawable;
            compoundDrawables[2] = drawable2;
        }
        return compoundDrawables;
    }

    public static void setCompoundDrawablesRelative(@NonNull TextView textView, @Nullable Drawable drawable, @Nullable Drawable drawable2, @Nullable Drawable drawable3, @Nullable Drawable drawable4) {
        boolean z = textView.getLayoutDirection() == 1;
        Drawable drawable5 = z ? drawable3 : drawable;
        if (z) {
            drawable3 = drawable;
        }
        textView.setCompoundDrawables(drawable5, drawable2, drawable3, drawable4);
    }

    public static void setCompoundDrawablesRelativeWithIntrinsicBounds(@NonNull TextView textView, int i, int i2, int i3, int i4) {
        boolean z = textView.getLayoutDirection() == 1;
        int i5 = z ? i3 : i;
        if (z) {
            i3 = i;
        }
        textView.setCompoundDrawablesWithIntrinsicBounds(i5, i2, i3, i4);
    }

    public static void setCompoundDrawablesRelativeWithIntrinsicBounds(@NonNull TextView textView, @Nullable Drawable drawable, @Nullable Drawable drawable2, @Nullable Drawable drawable3, @Nullable Drawable drawable4) {
        boolean z = textView.getLayoutDirection() == 1;
        Drawable drawable5 = z ? drawable3 : drawable;
        if (z) {
            drawable3 = drawable;
        }
        textView.setCompoundDrawablesWithIntrinsicBounds(drawable5, drawable2, drawable3, drawable4);
    }
}
