package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.tasks.TaskCompletionSource;

public abstract class zzbex<A extends Api.zzb, L> {
    private final zzbdx<L> zzaEN;

    protected zzbex(zzbdx<L> zzbdx) {
        this.zzaEN = zzbdx;
    }

    /* access modifiers changed from: protected */
    public abstract void zzc(A a, TaskCompletionSource<Void> taskCompletionSource) throws RemoteException;

    public final zzbdx<L> zzqG() {
        return this.zzaEN;
    }
}
