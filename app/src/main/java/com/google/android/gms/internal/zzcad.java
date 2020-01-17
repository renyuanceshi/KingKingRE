package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.IObjectWrapper;

public final class zzcad extends zzed implements zzcab {
    zzcad(IBinder iBinder) {
        super(iBinder, "com.google.android.gms.flags.IFlagProvider");
    }

    public final boolean getBooleanFlagValue(String str, boolean z, int i) throws RemoteException {
        Parcel zzZ = zzZ();
        zzZ.writeString(str);
        zzef.zza(zzZ, z);
        zzZ.writeInt(i);
        Parcel zza = zza(2, zzZ);
        boolean zza2 = zzef.zza(zza);
        zza.recycle();
        return zza2;
    }

    public final int getIntFlagValue(String str, int i, int i2) throws RemoteException {
        Parcel zzZ = zzZ();
        zzZ.writeString(str);
        zzZ.writeInt(i);
        zzZ.writeInt(i2);
        Parcel zza = zza(3, zzZ);
        int readInt = zza.readInt();
        zza.recycle();
        return readInt;
    }

    public final long getLongFlagValue(String str, long j, int i) throws RemoteException {
        Parcel zzZ = zzZ();
        zzZ.writeString(str);
        zzZ.writeLong(j);
        zzZ.writeInt(i);
        Parcel zza = zza(4, zzZ);
        long readLong = zza.readLong();
        zza.recycle();
        return readLong;
    }

    public final String getStringFlagValue(String str, String str2, int i) throws RemoteException {
        Parcel zzZ = zzZ();
        zzZ.writeString(str);
        zzZ.writeString(str2);
        zzZ.writeInt(i);
        Parcel zza = zza(5, zzZ);
        String readString = zza.readString();
        zza.recycle();
        return readString;
    }

    public final void init(IObjectWrapper iObjectWrapper) throws RemoteException {
        Parcel zzZ = zzZ();
        zzef.zza(zzZ, (IInterface) iObjectWrapper);
        zzb(1, zzZ);
    }
}
