package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.dynamic.zzn;
import com.google.android.gms.dynamite.DynamiteModule;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.flags.ModuleDescriptor;

public final class zzcaa {
    private zzcab zzaXG = null;
    private boolean zzuJ = false;

    public final void initialize(Context context) {
        synchronized (this) {
            if (!this.zzuJ) {
                try {
                    this.zzaXG = zzcac.asInterface(DynamiteModule.zza(context, DynamiteModule.zzaSP, ModuleDescriptor.MODULE_ID).zzcV("com.google.android.gms.flags.impl.FlagProviderImpl"));
                    this.zzaXG.init(zzn.zzw(context));
                    this.zzuJ = true;
                } catch (RemoteException | DynamiteModule.zzc e) {
                    Log.w("FlagValueProvider", "Failed to initialize flags module.", e);
                }
                return;
            }
            return;
        }
    }

    public final <T> T zzb(zzbzt<T> zzbzt) {
        synchronized (this) {
            if (this.zzuJ) {
                return zzbzt.zza(this.zzaXG);
            }
            T zzdI = zzbzt.zzdI();
            return zzdI;
        }
    }
}
