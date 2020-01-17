package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zzb;

public final class zzbgt implements Parcelable.Creator<zzbgs> {
    public final /* synthetic */ Object createFromParcel(Parcel parcel) {
        int zzd = zzb.zzd(parcel);
        int i = 0;
        Parcel parcel2 = null;
        zzbgn zzbgn = null;
        while (parcel.dataPosition() < zzd) {
            int readInt = parcel.readInt();
            switch (65535 & readInt) {
                case 1:
                    i = zzb.zzg(parcel, readInt);
                    break;
                case 2:
                    parcel2 = zzb.zzD(parcel, readInt);
                    break;
                case 3:
                    zzbgn = (zzbgn) zzb.zza(parcel, readInt, zzbgn.CREATOR);
                    break;
                default:
                    zzb.zzb(parcel, readInt);
                    break;
            }
        }
        zzb.zzF(parcel, zzd);
        return new zzbgs(i, parcel2, zzbgn);
    }

    public final /* synthetic */ Object[] newArray(int i) {
        return new zzbgs[i];
    }
}
