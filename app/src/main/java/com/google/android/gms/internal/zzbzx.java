package com.google.android.gms.internal;

import android.os.RemoteException;

public final class zzbzx extends zzbzt<Long> {
    public zzbzx(int i, String str, Long l) {
        super(0, str, l);
    }

    /* access modifiers changed from: private */
    /* renamed from: zzd */
    public final Long zza(zzcab zzcab) {
        try {
            return Long.valueOf(zzcab.getLongFlagValue(getKey(), ((Long) zzdI()).longValue(), getSource()));
        } catch (RemoteException e) {
            return (Long) zzdI();
        }
    }
}
