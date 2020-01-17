package com.google.android.gms.internal;

import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Iterator;

public abstract class zzbgk extends zzbgh implements SafeParcelable {
    public final int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!getClass().isInstance(obj)) {
            return false;
        }
        zzbgh zzbgh = (zzbgh) obj;
        for (zzbgi next : zzrL().values()) {
            if (zza(next)) {
                if (!zzbgh.zza(next)) {
                    return false;
                }
                if (!zzb(next).equals(zzbgh.zzb(next))) {
                    return false;
                }
            } else if (zzbgh.zza(next)) {
                return false;
            }
        }
        return true;
    }

    public int hashCode() {
        Iterator<zzbgi<?, ?>> it = zzrL().values().iterator();
        int i = 0;
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            zzbgi next = it.next();
            i = zza(next) ? zzb(next).hashCode() + (i2 * 31) : i2;
        }
    }

    public Object zzcH(String str) {
        return null;
    }

    public boolean zzcI(String str) {
        return false;
    }
}
