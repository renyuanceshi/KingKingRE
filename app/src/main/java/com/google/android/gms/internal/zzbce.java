package com.google.android.gms.internal;

import android.os.Looper;
import android.support.annotation.NonNull;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.common.internal.zzj;
import java.lang.ref.WeakReference;

final class zzbce implements zzj {
    /* access modifiers changed from: private */
    public final boolean zzaCj;
    private final WeakReference<zzbcc> zzaDq;
    private final Api<?> zzayW;

    public zzbce(zzbcc zzbcc, Api<?> api, boolean z) {
        this.zzaDq = new WeakReference<>(zzbcc);
        this.zzayW = api;
        this.zzaCj = z;
    }

    public final void zzf(@NonNull ConnectionResult connectionResult) {
        boolean z = false;
        zzbcc zzbcc = (zzbcc) this.zzaDq.get();
        if (zzbcc != null) {
            if (Looper.myLooper() == zzbcc.zzaCZ.zzaCl.getLooper()) {
                z = true;
            }
            zzbo.zza(z, (Object) "onReportServiceBinding must be called on the GoogleApiClient handler thread");
            zzbcc.zzaCv.lock();
            try {
                if (zzbcc.zzan(0)) {
                    if (!connectionResult.isSuccess()) {
                        zzbcc.zzb(connectionResult, this.zzayW, this.zzaCj);
                    }
                    if (zzbcc.zzpW()) {
                        zzbcc.zzpX();
                    }
                    zzbcc.zzaCv.unlock();
                }
            } finally {
                zzbcc.zzaCv.unlock();
            }
        }
    }
}
