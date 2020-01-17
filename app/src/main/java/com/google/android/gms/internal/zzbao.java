package com.google.android.gms.internal;

import android.os.RemoteException;
import android.support.annotation.NonNull;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.TaskCompletionSource;

public final class zzbao extends zzbam {
    private zzbed<Api.zzb, ?> zzaBu;
    private zzbex<Api.zzb, ?> zzaBv;

    public zzbao(zzbee zzbee, TaskCompletionSource<Void> taskCompletionSource) {
        super(3, taskCompletionSource);
        this.zzaBu = zzbee.zzaBu;
        this.zzaBv = zzbee.zzaBv;
    }

    public final /* bridge */ /* synthetic */ void zza(@NonNull zzbbs zzbbs, boolean z) {
    }

    public final void zzb(zzbdc<?> zzbdc) throws RemoteException {
        this.zzaBu.zzb(zzbdc.zzpJ(), this.zzalE);
        if (this.zzaBu.zzqG() != null) {
            zzbdc.zzqs().put(this.zzaBu.zzqG(), new zzbee(this.zzaBu, this.zzaBv));
        }
    }

    public final /* bridge */ /* synthetic */ void zzp(@NonNull Status status) {
        super.zzp(status);
    }
}
