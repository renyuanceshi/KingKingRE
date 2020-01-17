package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zzb;

public final class zzbgl implements Parcelable.Creator<zzbgi> {
    public final /* synthetic */ Object createFromParcel(Parcel parcel) {
        int zzd = zzb.zzd(parcel);
        int i = 0;
        int i2 = 0;
        boolean z = false;
        int i3 = 0;
        boolean z2 = false;
        String str = null;
        String str2 = null;
        int i4 = 0;
        zzbgb zzbgb = null;
        while (parcel.dataPosition() < zzd) {
            int readInt = parcel.readInt();
            switch (65535 & readInt) {
                case 1:
                    i = zzb.zzg(parcel, readInt);
                    break;
                case 2:
                    i2 = zzb.zzg(parcel, readInt);
                    break;
                case 3:
                    z = zzb.zzc(parcel, readInt);
                    break;
                case 4:
                    i3 = zzb.zzg(parcel, readInt);
                    break;
                case 5:
                    z2 = zzb.zzc(parcel, readInt);
                    break;
                case 6:
                    str = zzb.zzq(parcel, readInt);
                    break;
                case 7:
                    i4 = zzb.zzg(parcel, readInt);
                    break;
                case 8:
                    str2 = zzb.zzq(parcel, readInt);
                    break;
                case 9:
                    zzbgb = (zzbgb) zzb.zza(parcel, readInt, zzbgb.CREATOR);
                    break;
                default:
                    zzb.zzb(parcel, readInt);
                    break;
            }
        }
        zzb.zzF(parcel, zzd);
        return new zzbgi(i, i2, z, i3, z2, str, i4, str2, zzbgb);
    }

    public final /* synthetic */ Object[] newArray(int i) {
        return new zzbgi[i];
    }
}
