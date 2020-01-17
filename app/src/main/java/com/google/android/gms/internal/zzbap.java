package com.google.android.gms.internal;

import android.os.DeadObjectException;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.TaskCompletionSource;

public final class zzbap<TResult> extends zzbal {
    private final zzbep<Api.zzb, TResult> zzaBw;
    private final zzbel zzaBx;
    private final TaskCompletionSource<TResult> zzalE;

    public zzbap(int i, zzbep<Api.zzb, TResult> zzbep, TaskCompletionSource<TResult> taskCompletionSource, zzbel zzbel) {
        super(i);
        this.zzalE = taskCompletionSource;
        this.zzaBw = zzbep;
        this.zzaBx = zzbel;
    }

    public final void zza(@NonNull zzbbs zzbbs, boolean z) {
        zzbbs.zza(this.zzalE, z);
    }

    public final void zza(zzbdc<?> zzbdc) throws DeadObjectException {
        try {
            this.zzaBw.zza(zzbdc.zzpJ(), this.zzalE);
        } catch (DeadObjectException e) {
            throw e;
        } catch (RemoteException e2) {
            zzp(zzbal.zza(e2));
        }
    }

    public final void zzp(@NonNull Status status) {
        this.zzalE.trySetException(this.zzaBx.zzq(status));
    }
}
