package com.google.android.gms.common;

import android.content.Context;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.internal.zzay;
import com.google.android.gms.common.internal.zzaz;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.dynamic.zzn;
import com.google.android.gms.dynamite.DynamiteModule;

final class zzf {
    private static zzay zzaAd;
    private static final Object zzaAe = new Object();
    private static Context zzaAf;

    static boolean zza(String str, zzg zzg) {
        return zza(str, zzg, false);
    }

    private static boolean zza(String str, zzg zzg, boolean z) {
        if (!zzoX()) {
            return false;
        }
        zzbo.zzu(zzaAf);
        try {
            return zzaAd.zza(new zzm(str, zzg, z), zzn.zzw(zzaAf.getPackageManager()));
        } catch (RemoteException e) {
            Log.e("GoogleCertificates", "Failed to get Google certificates from remote", e);
            return false;
        }
    }

    static void zzav(Context context) {
        synchronized (zzf.class) {
            try {
                if (zzaAf != null) {
                    Log.w("GoogleCertificates", "GoogleCertificates has been initialized already");
                } else if (context != null) {
                    zzaAf = context.getApplicationContext();
                }
            } catch (Throwable th) {
                Class<zzf> cls = zzf.class;
                throw th;
            }
        }
    }

    static boolean zzb(String str, zzg zzg) {
        return zza(str, zzg, true);
    }

    private static boolean zzoX() {
        boolean z = true;
        if (zzaAd == null) {
            zzbo.zzu(zzaAf);
            synchronized (zzaAe) {
                if (zzaAd == null) {
                    try {
                        zzaAd = zzaz.zzJ(DynamiteModule.zza(zzaAf, DynamiteModule.zzaSP, "com.google.android.gms.googlecertificates").zzcV("com.google.android.gms.common.GoogleCertificatesImpl"));
                    } catch (DynamiteModule.zzc e) {
                        Log.e("GoogleCertificates", "Failed to load com.google.android.gms.googlecertificates", e);
                        z = false;
                    }
                }
            }
        }
        return z;
    }
}
