package com.google.android.gms.internal;

import android.app.PendingIntent;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.internal.zzj;

final class zzbch extends zzbcx {
    private /* synthetic */ zzj zzaDu;

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    zzbch(zzbcf zzbcf, zzbcv zzbcv, zzj zzj) {
        super(zzbcv);
        this.zzaDu = zzj;
    }

    public final void zzpV() {
        this.zzaDu.zzf(new ConnectionResult(16, (PendingIntent) null));
    }
}
