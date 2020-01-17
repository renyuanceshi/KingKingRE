package com.google.android.gms.internal;

import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;

final class zzbbt implements PendingResult.zza {
    private /* synthetic */ zzbbd zzaCT;
    private /* synthetic */ zzbbs zzaCU;

    zzbbt(zzbbs zzbbs, zzbbd zzbbd) {
        this.zzaCU = zzbbs;
        this.zzaCT = zzbbd;
    }

    public final void zzo(Status status) {
        this.zzaCU.zzaCR.remove(this.zzaCT);
    }
}
