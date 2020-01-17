package com.google.android.gms.internal;

import android.os.Bundle;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import java.util.Collections;

public final class zzbcn implements zzbcv {
    private final zzbcw zzaCZ;

    public zzbcn(zzbcw zzbcw) {
        this.zzaCZ = zzbcw;
    }

    public final void begin() {
        for (Api.zze disconnect : this.zzaCZ.zzaDF.values()) {
            disconnect.disconnect();
        }
        this.zzaCZ.zzaCl.zzaDG = Collections.emptySet();
    }

    public final void connect() {
        this.zzaCZ.zzqh();
    }

    public final boolean disconnect() {
        return true;
    }

    public final void onConnected(Bundle bundle) {
    }

    public final void onConnectionSuspended(int i) {
    }

    public final void zza(ConnectionResult connectionResult, Api<?> api, boolean z) {
    }

    public final <A extends Api.zzb, R extends Result, T extends zzbax<R, A>> T zzd(T t) {
        this.zzaCZ.zzaCl.zzaCJ.add(t);
        return t;
    }

    public final <A extends Api.zzb, T extends zzbax<? extends Result, A>> T zze(T t) {
        throw new IllegalStateException("GoogleApiClient is not connected yet.");
    }
}
