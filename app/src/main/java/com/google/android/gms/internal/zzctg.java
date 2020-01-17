package com.google.android.gms.internal;

import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.internal.zzq;

final class zzctg extends Api.zza<zzctt, zzctk> {
    zzctg() {
    }

    public final /* synthetic */ Api.zze zza(Context context, Looper looper, zzq zzq, Object obj, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        zzctk zzctk = (zzctk) obj;
        return new zzctt(context, looper, true, zzq, zzctk == null ? zzctk.zzbCM : zzctk, connectionCallbacks, onConnectionFailedListener);
    }
}
