package com.google.android.gms.internal;

import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

public final class zzbff extends Drawable implements Drawable.Callback {
    private int mFrom;
    private int zzaGA;
    private boolean zzaGj;
    private int zzaGo;
    private int zzaGp;
    private int zzaGq;
    private int zzaGr;
    private int zzaGs;
    private boolean zzaGt;
    private zzbfj zzaGu;
    private Drawable zzaGv;
    private Drawable zzaGw;
    private boolean zzaGx;
    private boolean zzaGy;
    private boolean zzaGz;
    private long zzagZ;

    public zzbff(Drawable drawable, Drawable drawable2) {
        this((zzbfj) null);
        drawable = drawable == null ? zzbfh.zzaGB : drawable;
        this.zzaGv = drawable;
        drawable.setCallback(this);
        this.zzaGu.zzaGD |= drawable.getChangingConfigurations();
        drawable2 = drawable2 == null ? zzbfh.zzaGB : drawable2;
        this.zzaGw = drawable2;
        drawable2.setCallback(this);
        this.zzaGu.zzaGD |= drawable2.getChangingConfigurations();
    }

    zzbff(zzbfj zzbfj) {
        this.zzaGo = 0;
        this.zzaGq = 255;
        this.zzaGs = 0;
        this.zzaGj = true;
        this.zzaGu = new zzbfj(zzbfj);
    }

    private final boolean canConstantState() {
        if (!this.zzaGx) {
            this.zzaGy = (this.zzaGv.getConstantState() == null || this.zzaGw.getConstantState() == null) ? false : true;
            this.zzaGx = true;
        }
        return this.zzaGy;
    }

    /* JADX WARNING: Can't fix incorrect switch cases order */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final void draw(android.graphics.Canvas r8) {
        /*
            r7 = this;
            r1 = 1
            r6 = 1065353216(0x3f800000, float:1.0)
            r0 = 0
            int r2 = r7.zzaGo
            switch(r2) {
                case 1: goto L_0x0028;
                case 2: goto L_0x0032;
                default: goto L_0x0009;
            }
        L_0x0009:
            r0 = r1
        L_0x000a:
            int r1 = r7.zzaGs
            boolean r2 = r7.zzaGj
            android.graphics.drawable.Drawable r3 = r7.zzaGv
            android.graphics.drawable.Drawable r4 = r7.zzaGw
            if (r0 == 0) goto L_0x005f
            if (r2 == 0) goto L_0x0018
            if (r1 != 0) goto L_0x001b
        L_0x0018:
            r3.draw(r8)
        L_0x001b:
            int r0 = r7.zzaGq
            if (r1 != r0) goto L_0x0027
            int r0 = r7.zzaGq
            r4.setAlpha(r0)
            r4.draw(r8)
        L_0x0027:
            return
        L_0x0028:
            long r2 = android.os.SystemClock.uptimeMillis()
            r7.zzagZ = r2
            r1 = 2
            r7.zzaGo = r1
            goto L_0x000a
        L_0x0032:
            long r2 = r7.zzagZ
            r4 = 0
            int r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r2 < 0) goto L_0x0009
            long r2 = android.os.SystemClock.uptimeMillis()
            long r4 = r7.zzagZ
            long r2 = r2 - r4
            float r2 = (float) r2
            int r3 = r7.zzaGr
            float r3 = (float) r3
            float r2 = r2 / r3
            int r3 = (r2 > r6 ? 1 : (r2 == r6 ? 0 : -1))
            if (r3 < 0) goto L_0x005d
        L_0x004a:
            if (r1 == 0) goto L_0x004e
            r7.zzaGo = r0
        L_0x004e:
            float r0 = java.lang.Math.min(r2, r6)
            int r2 = r7.zzaGp
            float r2 = (float) r2
            float r0 = r0 * r2
            r2 = 0
            float r0 = r0 + r2
            int r0 = (int) r0
            r7.zzaGs = r0
            r0 = r1
            goto L_0x000a
        L_0x005d:
            r1 = r0
            goto L_0x004a
        L_0x005f:
            if (r2 == 0) goto L_0x0067
            int r0 = r7.zzaGq
            int r0 = r0 - r1
            r3.setAlpha(r0)
        L_0x0067:
            r3.draw(r8)
            if (r2 == 0) goto L_0x0071
            int r0 = r7.zzaGq
            r3.setAlpha(r0)
        L_0x0071:
            if (r1 <= 0) goto L_0x007e
            r4.setAlpha(r1)
            r4.draw(r8)
            int r0 = r7.zzaGq
            r4.setAlpha(r0)
        L_0x007e:
            r7.invalidateSelf()
            goto L_0x0027
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzbff.draw(android.graphics.Canvas):void");
    }

    public final int getChangingConfigurations() {
        return super.getChangingConfigurations() | this.zzaGu.mChangingConfigurations | this.zzaGu.zzaGD;
    }

    public final Drawable.ConstantState getConstantState() {
        if (!canConstantState()) {
            return null;
        }
        this.zzaGu.mChangingConfigurations = getChangingConfigurations();
        return this.zzaGu;
    }

    public final int getIntrinsicHeight() {
        return Math.max(this.zzaGv.getIntrinsicHeight(), this.zzaGw.getIntrinsicHeight());
    }

    public final int getIntrinsicWidth() {
        return Math.max(this.zzaGv.getIntrinsicWidth(), this.zzaGw.getIntrinsicWidth());
    }

    public final int getOpacity() {
        if (!this.zzaGz) {
            this.zzaGA = Drawable.resolveOpacity(this.zzaGv.getOpacity(), this.zzaGw.getOpacity());
            this.zzaGz = true;
        }
        return this.zzaGA;
    }

    public final void invalidateDrawable(Drawable drawable) {
        Drawable.Callback callback = getCallback();
        if (callback != null) {
            callback.invalidateDrawable(this);
        }
    }

    public final Drawable mutate() {
        if (!this.zzaGt && super.mutate() == this) {
            if (!canConstantState()) {
                throw new IllegalStateException("One or more children of this LayerDrawable does not have constant state; this drawable cannot be mutated.");
            }
            this.zzaGv.mutate();
            this.zzaGw.mutate();
            this.zzaGt = true;
        }
        return this;
    }

    /* access modifiers changed from: protected */
    public final void onBoundsChange(Rect rect) {
        this.zzaGv.setBounds(rect);
        this.zzaGw.setBounds(rect);
    }

    public final void scheduleDrawable(Drawable drawable, Runnable runnable, long j) {
        Drawable.Callback callback = getCallback();
        if (callback != null) {
            callback.scheduleDrawable(this, runnable, j);
        }
    }

    public final void setAlpha(int i) {
        if (this.zzaGs == this.zzaGq) {
            this.zzaGs = i;
        }
        this.zzaGq = i;
        invalidateSelf();
    }

    public final void setColorFilter(ColorFilter colorFilter) {
        this.zzaGv.setColorFilter(colorFilter);
        this.zzaGw.setColorFilter(colorFilter);
    }

    public final void startTransition(int i) {
        this.mFrom = 0;
        this.zzaGp = this.zzaGq;
        this.zzaGs = 0;
        this.zzaGr = 250;
        this.zzaGo = 1;
        invalidateSelf();
    }

    public final void unscheduleDrawable(Drawable drawable, Runnable runnable) {
        Drawable.Callback callback = getCallback();
        if (callback != null) {
            callback.unscheduleDrawable(this, runnable);
        }
    }

    public final Drawable zzqW() {
        return this.zzaGw;
    }
}
