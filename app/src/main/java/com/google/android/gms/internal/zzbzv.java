package com.google.android.gms.internal;

import android.os.RemoteException;

public final class zzbzv extends zzbzt<Boolean> {
    public zzbzv(int i, String str, Boolean bool) {
        super(0, str, bool);
    }

    /* access modifiers changed from: private */
    /* renamed from: zzb */
    public final Boolean zza(zzcab zzcab) {
        try {
            return Boolean.valueOf(zzcab.getBooleanFlagValue(getKey(), ((Boolean) zzdI()).booleanValue(), getSource()));
        } catch (RemoteException e) {
            return (Boolean) zzdI();
        }
    }
}
