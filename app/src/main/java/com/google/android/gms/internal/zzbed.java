package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.tasks.TaskCompletionSource;

public abstract class zzbed<A extends Api.zzb, L> {
    private final zzbdv<L> zzaEU;

    protected zzbed(zzbdv<L> zzbdv) {
        this.zzaEU = zzbdv;
    }

    /* access modifiers changed from: protected */
    public abstract void zzb(A a, TaskCompletionSource<Void> taskCompletionSource) throws RemoteException;

    public final zzbdx<L> zzqG() {
        return this.zzaEU.zzqG();
    }

    public final void zzqH() {
        this.zzaEU.clear();
    }
}
