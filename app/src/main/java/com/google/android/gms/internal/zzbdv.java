package com.google.android.gms.internal;

import android.os.Looper;
import android.support.annotation.NonNull;
import com.google.android.gms.common.internal.zzbo;

public final class zzbdv<L> {
    private volatile L mListener;
    private final zzbdw zzaEM;
    private final zzbdx<L> zzaEN;

    zzbdv(@NonNull Looper looper, @NonNull L l, @NonNull String str) {
        this.zzaEM = new zzbdw(this, looper);
        this.mListener = zzbo.zzb(l, (Object) "Listener must not be null");
        this.zzaEN = new zzbdx<>(l, zzbo.zzcF(str));
    }

    public final void clear() {
        this.mListener = null;
    }

    public final void zza(zzbdy<? super L> zzbdy) {
        zzbo.zzb(zzbdy, (Object) "Notifier must not be null");
        this.zzaEM.sendMessage(this.zzaEM.obtainMessage(1, zzbdy));
    }

    /* access modifiers changed from: package-private */
    public final void zzb(zzbdy<? super L> zzbdy) {
        L l = this.mListener;
        if (l == null) {
            zzbdy.zzpT();
            return;
        }
        try {
            zzbdy.zzq(l);
        } catch (RuntimeException e) {
            zzbdy.zzpT();
            throw e;
        }
    }

    public final boolean zzoc() {
        return this.mListener != null;
    }

    @NonNull
    public final zzbdx<L> zzqG() {
        return this.zzaEN;
    }
}
