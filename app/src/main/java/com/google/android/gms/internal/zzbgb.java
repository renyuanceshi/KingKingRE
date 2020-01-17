package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zzd;

public final class zzbgb extends zza {
    public static final Parcelable.Creator<zzbgb> CREATOR = new zzbgc();
    private final zzbgd zzaIB;
    private int zzaku;

    zzbgb(int i, zzbgd zzbgd) {
        this.zzaku = i;
        this.zzaIB = zzbgd;
    }

    private zzbgb(zzbgd zzbgd) {
        this.zzaku = 1;
        this.zzaIB = zzbgd;
    }

    public static zzbgb zza(zzbgj<?, ?> zzbgj) {
        if (zzbgj instanceof zzbgd) {
            return new zzbgb((zzbgd) zzbgj);
        }
        throw new IllegalArgumentException("Unsupported safe parcelable field converter class.");
    }

    public final void writeToParcel(Parcel parcel, int i) {
        int zze = zzd.zze(parcel);
        zzd.zzc(parcel, 1, this.zzaku);
        zzd.zza(parcel, 2, (Parcelable) this.zzaIB, i, false);
        zzd.zzI(parcel, zze);
    }

    public final zzbgj<?, ?> zzrK() {
        if (this.zzaIB != null) {
            return this.zzaIB;
        }
        throw new IllegalStateException("There was no converter wrapped in this ConverterWrapper.");
    }
}
