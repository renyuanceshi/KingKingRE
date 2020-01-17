package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.os.DeadObjectException;
import android.os.RemoteException;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzbo;

public abstract class zzbax<R extends Result, A extends Api.zzb> extends zzbbd<R> implements zzbay<R> {
    private final Api.zzc<A> zzaBM;
    private final Api<?> zzayW;

    @Deprecated
    protected zzbax(Api.zzc<A> zzc, GoogleApiClient googleApiClient) {
        super((GoogleApiClient) zzbo.zzb(googleApiClient, (Object) "GoogleApiClient must not be null"));
        this.zzaBM = (Api.zzc) zzbo.zzu(zzc);
        this.zzayW = null;
    }

    protected zzbax(Api<?> api, GoogleApiClient googleApiClient) {
        super((GoogleApiClient) zzbo.zzb(googleApiClient, (Object) "GoogleApiClient must not be null"));
        this.zzaBM = api.zzpd();
        this.zzayW = api;
    }

    private final void zzc(RemoteException remoteException) {
        zzr(new Status(8, remoteException.getLocalizedMessage(), (PendingIntent) null));
    }

    public /* bridge */ /* synthetic */ void setResult(Object obj) {
        super.setResult((Result) obj);
    }

    /* access modifiers changed from: protected */
    public abstract void zza(A a) throws RemoteException;

    public final void zzb(A a) throws DeadObjectException {
        try {
            zza(a);
        } catch (DeadObjectException e) {
            zzc(e);
            throw e;
        } catch (RemoteException e2) {
            zzc(e2);
        }
    }

    public final Api.zzc<A> zzpd() {
        return this.zzaBM;
    }

    public final Api<?> zzpg() {
        return this.zzayW;
    }

    public final void zzr(Status status) {
        zzbo.zzb(!status.isSuccess(), (Object) "Failed result must not be success");
        setResult(zzb(status));
    }
}
