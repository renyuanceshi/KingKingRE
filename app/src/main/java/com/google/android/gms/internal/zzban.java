package com.google.android.gms.internal;

import android.os.DeadObjectException;
import android.support.annotation.NonNull;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzbax;

public final class zzban<A extends zzbax<? extends Result, Api.zzb>> extends zzbal {
    private A zzaBt;

    public zzban(int i, A a) {
        super(i);
        this.zzaBt = a;
    }

    public final void zza(@NonNull zzbbs zzbbs, boolean z) {
        zzbbs.zza((zzbbd<? extends Result>) this.zzaBt, z);
    }

    public final void zza(zzbdc<?> zzbdc) throws DeadObjectException {
        this.zzaBt.zzb(zzbdc.zzpJ());
    }

    public final void zzp(@NonNull Status status) {
        this.zzaBt.zzr(status);
    }
}
