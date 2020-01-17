package com.google.android.gms.internal;

import com.google.android.gms.common.ConnectionResult;

final class zzbcg extends zzbcx {
    private /* synthetic */ ConnectionResult zzaDs;
    private /* synthetic */ zzbcf zzaDt;

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    zzbcg(zzbcf zzbcf, zzbcv zzbcv, ConnectionResult connectionResult) {
        super(zzbcv);
        this.zzaDt = zzbcf;
        this.zzaDs = connectionResult;
    }

    public final void zzpV() {
        this.zzaDt.zzaDp.zze(this.zzaDs);
    }
}
