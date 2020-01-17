package com.google.android.gms.internal;

import android.support.annotation.BinderThread;
import java.lang.ref.WeakReference;

final class zzbcj extends zzcto {
    private final WeakReference<zzbcc> zzaDq;

    zzbcj(zzbcc zzbcc) {
        this.zzaDq = new WeakReference<>(zzbcc);
    }

    @BinderThread
    public final void zzb(zzctw zzctw) {
        zzbcc zzbcc = (zzbcc) this.zzaDq.get();
        if (zzbcc != null) {
            zzbcc.zzaCZ.zza((zzbcx) new zzbck(this, zzbcc, zzbcc, zzctw));
        }
    }
}
