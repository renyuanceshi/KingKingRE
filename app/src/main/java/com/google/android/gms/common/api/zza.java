package com.google.android.gms.common.api;

import android.support.v4.util.ArrayMap;
import android.text.TextUtils;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.internal.zzbas;
import java.util.ArrayList;

public final class zza extends Exception {
    private final ArrayMap<zzbas<?>, ConnectionResult> zzaAB;

    public zza(ArrayMap<zzbas<?>, ConnectionResult> arrayMap) {
        this.zzaAB = arrayMap;
    }

    public final String getMessage() {
        ArrayList arrayList = new ArrayList();
        boolean z = true;
        for (zzbas next : this.zzaAB.keySet()) {
            ConnectionResult connectionResult = this.zzaAB.get(next);
            if (connectionResult.isSuccess()) {
                z = false;
            }
            String valueOf = String.valueOf(next.zzpr());
            String valueOf2 = String.valueOf(connectionResult);
            arrayList.add(new StringBuilder(String.valueOf(valueOf).length() + 2 + String.valueOf(valueOf2).length()).append(valueOf).append(": ").append(valueOf2).toString());
        }
        StringBuilder sb = new StringBuilder();
        if (z) {
            sb.append("None of the queried APIs are available. ");
        } else {
            sb.append("Some of the queried APIs are unavailable. ");
        }
        sb.append(TextUtils.join("; ", arrayList));
        return sb.toString();
    }

    public final ConnectionResult zza(GoogleApi<? extends Api.ApiOptions> googleApi) {
        zzbas<? extends Api.ApiOptions> zzph = googleApi.zzph();
        zzbo.zzb(this.zzaAB.get(zzph) != null, (Object) "The given API was not part of the availability request.");
        return this.zzaAB.get(zzph);
    }

    public final ArrayMap<zzbas<?>, ConnectionResult> zzpf() {
        return this.zzaAB;
    }
}
