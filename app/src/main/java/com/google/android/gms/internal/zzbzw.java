package com.google.android.gms.internal;

import android.os.RemoteException;

public final class zzbzw extends zzbzt<Integer> {
    public zzbzw(int i, String str, Integer num) {
        super(0, str, num);
    }

    /* access modifiers changed from: private */
    /* renamed from: zzc */
    public final Integer zza(zzcab zzcab) {
        try {
            return Integer.valueOf(zzcab.getIntFlagValue(getKey(), ((Integer) zzdI()).intValue(), getSource()));
        } catch (RemoteException e) {
            return (Integer) zzdI();
        }
    }
}
