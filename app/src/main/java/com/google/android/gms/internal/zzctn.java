package com.google.android.gms.internal;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.zzb;

public final class zzctn implements Parcelable.Creator<zzctm> {
    public final /* synthetic */ Object createFromParcel(Parcel parcel) {
        int zzd = zzb.zzd(parcel);
        Intent intent = null;
        int i = 0;
        int i2 = 0;
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
                    intent = (Intent) zzb.zza(parcel, readInt, Intent.CREATOR);
                    break;
                default:
                    zzb.zzb(parcel, readInt);
                    break;
            }
        }
        zzb.zzF(parcel, zzd);
        return new zzctm(i, i2, intent);
    }

    public final /* synthetic */ Object[] newArray(int i) {
        return new zzctm[i];
    }
}
