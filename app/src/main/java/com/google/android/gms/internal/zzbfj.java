package com.google.android.gms.internal;

import android.graphics.drawable.Drawable;

final class zzbfj extends Drawable.ConstantState {
    int mChangingConfigurations;
    int zzaGD;

    zzbfj(zzbfj zzbfj) {
        if (zzbfj != null) {
            this.mChangingConfigurations = zzbfj.mChangingConfigurations;
            this.zzaGD = zzbfj.zzaGD;
        }
    }

    public final int getChangingConfigurations() {
        return this.mChangingConfigurations;
    }

    public final Drawable newDrawable() {
        return new zzbff(this);
    }
}
