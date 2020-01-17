package com.google.android.gms.internal;

import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.util.Log;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.TaskCompletionSource;

public final class zzbaq extends zzbam {
    private zzbdx<?> zzaBy;

    public zzbaq(zzbdx<?> zzbdx, TaskCompletionSource<Void> taskCompletionSource) {
        super(4, taskCompletionSource);
        this.zzaBy = zzbdx;
    }

    public final /* bridge */ /* synthetic */ void zza(@NonNull zzbbs zzbbs, boolean z) {
    }

    public final void zzb(zzbdc<?> zzbdc) throws RemoteException {
        zzbee remove = zzbdc.zzqs().remove(this.zzaBy);
        if (remove != null) {
            remove.zzaBv.zzc(zzbdc.zzpJ(), this.zzalE);
            remove.zzaBu.zzqH();
            return;
        }
        Log.wtf("UnregisterListenerTask", "Received call to unregister a listener without a matching registration call.", new Exception());
        this.zzalE.trySetException(new ApiException(Status.zzaBo));
    }

    public final /* bridge */ /* synthetic */ void zzp(@NonNull Status status) {
        super.zzp(status);
    }
}
