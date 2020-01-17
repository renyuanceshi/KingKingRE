package com.google.android.gms.internal;

import android.support.annotation.NonNull;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;

final class zzbcr implements GoogleApiClient.OnConnectionFailedListener {
    private /* synthetic */ zzbem zzaDP;

    zzbcr(zzbco zzbco, zzbem zzbem) {
        this.zzaDP = zzbem;
    }

    public final void onConnectionFailed(@NonNull ConnectionResult connectionResult) {
        this.zzaDP.setResult(new Status(8));
    }
}
