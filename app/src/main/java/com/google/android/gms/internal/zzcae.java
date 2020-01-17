package com.google.android.gms.internal;

public final class zzcae {
    private static zzcae zzaXH;
    private final zzbzz zzaXI = new zzbzz();
    private final zzcaa zzaXJ = new zzcaa();

    static {
        zzcae zzcae = new zzcae();
        synchronized (zzcae.class) {
            try {
                zzaXH = zzcae;
            } catch (Throwable th) {
                Class<zzcae> cls = zzcae.class;
                throw th;
            }
        }
    }

    private zzcae() {
    }

    private static zzcae zzua() {
        zzcae zzcae;
        synchronized (zzcae.class) {
            try {
                zzcae = zzaXH;
            } catch (Throwable th) {
                Class<zzcae> cls = zzcae.class;
                throw th;
            }
        }
        return zzcae;
    }

    public static zzbzz zzub() {
        return zzua().zzaXI;
    }

    public static zzcaa zzuc() {
        return zzua().zzaXJ;
    }
}
