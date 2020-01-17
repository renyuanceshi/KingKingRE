package com.google.android.gms.internal;

abstract class zzbcx {
    private final zzbcv zzaDZ;

    protected zzbcx(zzbcv zzbcv) {
        this.zzaDZ = zzbcv;
    }

    public final void zzc(zzbcw zzbcw) {
        zzbcw.zzaCv.lock();
        try {
            if (zzbcw.zzaDV == this.zzaDZ) {
                zzpV();
                zzbcw.zzaCv.unlock();
            }
        } finally {
            zzbcw.zzaCv.unlock();
        }
    }

    /* access modifiers changed from: protected */
    public abstract void zzpV();
}
