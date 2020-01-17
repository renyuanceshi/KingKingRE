package com.google.android.gms.internal;

import android.support.annotation.NonNull;
import com.google.android.gms.auth.api.signin.internal.zzy;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;

final class zzbcs implements ResultCallback<Status> {
    private /* synthetic */ zzbco zzaDN;
    private /* synthetic */ zzbem zzaDP;
    private /* synthetic */ boolean zzaDQ;
    private /* synthetic */ GoogleApiClient zzaqW;

    zzbcs(zzbco zzbco, zzbem zzbem, boolean z, GoogleApiClient googleApiClient) {
        this.zzaDN = zzbco;
        this.zzaDP = zzbem;
        this.zzaDQ = z;
        this.zzaqW = googleApiClient;
    }

    public final /* synthetic */ void onResult(@NonNull Result result) {
        Status status = (Status) result;
        zzy.zzaj(this.zzaDN.mContext).zzmP();
        if (status.isSuccess() && this.zzaDN.isConnected()) {
            this.zzaDN.reconnect();
        }
        this.zzaDP.setResult(status);
        if (this.zzaDQ) {
            this.zzaqW.disconnect();
        }
    }
}
