package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.google.android.gms.R;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzbd;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.common.internal.zzby;

@Deprecated
public final class zzbdl {
    private static zzbdl zzaEB;
    private static final Object zzuH = new Object();
    private final String mAppId;
    private final Status zzaEC;
    private final boolean zzaED;
    private final boolean zzaEE;

    private zzbdl(Context context) {
        boolean z = true;
        boolean z2 = false;
        Resources resources = context.getResources();
        int identifier = resources.getIdentifier("google_app_measurement_enable", "integer", resources.getResourcePackageName(R.string.common_google_play_services_unknown_issue));
        if (identifier != 0) {
            boolean z3 = resources.getInteger(identifier) != 0;
            this.zzaEE = !z3 ? true : z2;
            z = z3;
        } else {
            this.zzaEE = false;
        }
        this.zzaED = z;
        String zzaD = zzbd.zzaD(context);
        zzaD = zzaD == null ? new zzby(context).getString("google_app_id") : zzaD;
        if (TextUtils.isEmpty(zzaD)) {
            this.zzaEC = new Status(10, "Missing google app id value from from string resources with name google_app_id.");
            this.mAppId = null;
            return;
        }
        this.mAppId = zzaD;
        this.zzaEC = Status.zzaBm;
    }

    public static Status zzaz(Context context) {
        Status status;
        zzbo.zzb(context, (Object) "Context must not be null.");
        synchronized (zzuH) {
            if (zzaEB == null) {
                zzaEB = new zzbdl(context);
            }
            status = zzaEB.zzaEC;
        }
        return status;
    }

    private static zzbdl zzcu(String str) {
        zzbdl zzbdl;
        synchronized (zzuH) {
            if (zzaEB == null) {
                throw new IllegalStateException(new StringBuilder(String.valueOf(str).length() + 34).append("Initialize must be called before ").append(str).append(".").toString());
            }
            zzbdl = zzaEB;
        }
        return zzbdl;
    }

    public static String zzqA() {
        return zzcu("getGoogleAppId").mAppId;
    }

    public static boolean zzqB() {
        return zzcu("isMeasurementExplicitlyDisabled").zzaEE;
    }
}
