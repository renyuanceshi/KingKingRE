package com.google.android.gms.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

public final class zzbdj extends BroadcastReceiver {
    private Context mContext;
    private final zzbdk zzaEA;

    public zzbdj(zzbdk zzbdk) {
        this.zzaEA = zzbdk;
    }

    public final void onReceive(Context context, Intent intent) {
        Uri data = intent.getData();
        String str = null;
        if (data != null) {
            str = data.getSchemeSpecificPart();
        }
        if ("com.google.android.gms".equals(str)) {
            this.zzaEA.zzpA();
            unregister();
        }
    }

    public final void setContext(Context context) {
        this.mContext = context;
    }

    public final void unregister() {
        synchronized (this) {
            if (this.mContext != null) {
                this.mContext.unregisterReceiver(this);
            }
            this.mContext = null;
        }
    }
}
