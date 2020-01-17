package com.google.android.gms.common.internal;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.util.Log;
import com.google.android.gms.internal.zzbds;

public abstract class zzt implements DialogInterface.OnClickListener {
    public static zzt zza(Activity activity, Intent intent, int i) {
        return new zzu(intent, activity, i);
    }

    public static zzt zza(@NonNull Fragment fragment, Intent intent, int i) {
        return new zzv(intent, fragment, i);
    }

    public static zzt zza(@NonNull zzbds zzbds, Intent intent, int i) {
        return new zzw(intent, zzbds, 2);
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        try {
            zzrv();
        } catch (ActivityNotFoundException e) {
            Log.e("DialogRedirect", "Failed to start resolution intent", e);
        } finally {
            dialogInterface.dismiss();
        }
    }

    /* access modifiers changed from: protected */
    public abstract void zzrv();
}
