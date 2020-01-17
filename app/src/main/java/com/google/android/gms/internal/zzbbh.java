package com.google.android.gms.internal;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzbo;

public final class zzbbh implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener {
    private final boolean zzaCj;
    private zzbbi zzaCk;
    public final Api<?> zzayW;

    public zzbbh(Api<?> api, boolean z) {
        this.zzayW = api;
        this.zzaCj = z;
    }

    private final void zzpD() {
        zzbo.zzb(this.zzaCk, (Object) "Callbacks must be attached to a ClientConnectionHelper instance before connecting the client.");
    }

    public final void onConnected(@Nullable Bundle bundle) {
        zzpD();
        this.zzaCk.onConnected(bundle);
    }

    public final void onConnectionFailed(@NonNull ConnectionResult connectionResult) {
        zzpD();
        this.zzaCk.zza(connectionResult, this.zzayW, this.zzaCj);
    }

    public final void onConnectionSuspended(int i) {
        zzpD();
        this.zzaCk.onConnectionSuspended(i);
    }

    public final void zza(zzbbi zzbbi) {
        this.zzaCk = zzbbi;
    }
}
