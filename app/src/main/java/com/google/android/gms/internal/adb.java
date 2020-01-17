package com.google.android.gms.internal;

import com.google.android.gms.internal.ada;
import java.io.IOException;
import java.util.List;

public final class adb<M extends ada<M>, T> {
    public final int tag;
    private int type = 11;
    protected final Class<T> zzcjC;
    protected final boolean zzcsa;

    private adb(int i, Class<T> cls, int i2, boolean z) {
        this.zzcjC = cls;
        this.tag = i2;
        this.zzcsa = false;
    }

    public static <M extends ada<M>, T extends adg> adb<M, T> zza(int i, Class<T> cls, long j) {
        return new adb<>(11, cls, (int) j, false);
    }

    private final Object zzb(acx acx) {
        Class<T> cls = this.zzcjC;
        try {
            switch (this.type) {
                case 10:
                    adg adg = (adg) cls.newInstance();
                    acx.zza(adg, this.tag >>> 3);
                    return adg;
                case 11:
                    adg adg2 = (adg) cls.newInstance();
                    acx.zza(adg2);
                    return adg2;
                default:
                    throw new IllegalArgumentException(new StringBuilder(24).append("Unknown type ").append(this.type).toString());
            }
        } catch (InstantiationException e) {
            String valueOf = String.valueOf(cls);
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf).length() + 33).append("Error creating instance of class ").append(valueOf).toString(), e);
        } catch (IllegalAccessException e2) {
            String valueOf2 = String.valueOf(cls);
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf2).length() + 33).append("Error creating instance of class ").append(valueOf2).toString(), e2);
        } catch (IOException e3) {
            throw new IllegalArgumentException("Error reading extension field", e3);
        }
    }

    public final boolean equals(Object obj) {
        if (this != obj) {
            if (!(obj instanceof adb)) {
                return false;
            }
            adb adb = (adb) obj;
            if (!(this.type == adb.type && this.zzcjC == adb.zzcjC && this.tag == adb.tag)) {
                return false;
            }
        }
        return true;
    }

    public final int hashCode() {
        return (((((this.type + 1147) * 31) + this.zzcjC.hashCode()) * 31) + this.tag) * 31;
    }

    /* access modifiers changed from: package-private */
    public final T zzX(List<adi> list) {
        if (list != null && !list.isEmpty()) {
            return this.zzcjC.cast(zzb(acx.zzH(list.get(list.size() - 1).zzbws)));
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public final void zza(Object obj, acy acy) {
        try {
            acy.zzcu(this.tag);
            switch (this.type) {
                case 10:
                    int i = this.tag;
                    ((adg) obj).zza(acy);
                    acy.zzt(i >>> 3, 4);
                    return;
                case 11:
                    acy.zzb((adg) obj);
                    return;
                default:
                    throw new IllegalArgumentException(new StringBuilder(24).append("Unknown type ").append(this.type).toString());
            }
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
        throw new IllegalStateException(e);
    }

    /* access modifiers changed from: protected */
    public final int zzav(Object obj) {
        int i = this.tag >>> 3;
        switch (this.type) {
            case 10:
                return (acy.zzct(i) << 1) + ((adg) obj).zzLT();
            case 11:
                return acy.zzb(i, (adg) obj);
            default:
                throw new IllegalArgumentException(new StringBuilder(24).append("Unknown type ").append(this.type).toString());
        }
    }
}
