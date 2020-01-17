package com.google.android.gms.internal;

import java.lang.ref.WeakReference;

final class zzbcu extends zzbdk {
    private WeakReference<zzbco> zzaDR;

    zzbcu(zzbco zzbco) {
        this.zzaDR = new WeakReference<>(zzbco);
    }

    public final void zzpA() {
        zzbco zzbco = (zzbco) this.zzaDR.get();
        if (zzbco != null) {
            zzbco.resume();
        }
    }
}
