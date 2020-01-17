package com.google.android.gms.internal;

import android.os.RemoteException;

public final class zzbzy extends zzbzt<String> {
    public zzbzy(int i, String str, String str2) {
        super(0, str, str2);
    }

    /* access modifiers changed from: private */
    /* renamed from: zze */
    public final String zza(zzcab zzcab) {
        try {
            return zzcab.getStringFlagValue(getKey(), (String) zzdI(), getSource());
        } catch (RemoteException e) {
            return (String) zzdI();
        }
    }
}
