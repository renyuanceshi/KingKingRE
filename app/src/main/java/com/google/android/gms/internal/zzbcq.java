package com.google.android.gms.internal;

import android.os.Bundle;
import com.google.android.gms.common.api.GoogleApiClient;
import java.util.concurrent.atomic.AtomicReference;

final class zzbcq implements GoogleApiClient.ConnectionCallbacks {
    private /* synthetic */ zzbco zzaDN;
    private /* synthetic */ AtomicReference zzaDO;
    private /* synthetic */ zzbem zzaDP;

    zzbcq(zzbco zzbco, AtomicReference atomicReference, zzbem zzbem) {
        this.zzaDN = zzbco;
        this.zzaDO = atomicReference;
        this.zzaDP = zzbem;
    }

    public final void onConnected(Bundle bundle) {
        this.zzaDN.zza((GoogleApiClient) this.zzaDO.get(), this.zzaDP, true);
    }

    public final void onConnectionSuspended(int i) {
    }
}
