package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.PackageManager;
import com.google.android.gms.common.util.zzq;
import java.lang.reflect.InvocationTargetException;

public final class zzbgx {
    private static Context zzaKh;
    private static Boolean zzaKi;

    public static boolean zzaN(Context context) {
        boolean booleanValue;
        synchronized (zzbgx.class) {
            try {
                Context applicationContext = context.getApplicationContext();
                if (zzaKh == null || zzaKi == null || zzaKh != applicationContext) {
                    zzaKi = null;
                    if (zzq.isAtLeastO()) {
                        zzaKi = (Boolean) PackageManager.class.getDeclaredMethod("isInstantApp", new Class[0]).invoke(applicationContext.getPackageManager(), new Object[0]);
                    } else {
                        try {
                            context.getClassLoader().loadClass("com.google.android.instantapps.supervisor.InstantAppsRuntime");
                            zzaKi = true;
                        } catch (ClassNotFoundException e) {
                            zzaKi = false;
                        }
                    }
                    zzaKh = applicationContext;
                    booleanValue = zzaKi.booleanValue();
                } else {
                    booleanValue = zzaKi.booleanValue();
                }
            } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException e2) {
                zzaKi = false;
            } catch (Throwable th) {
                Class<zzbgx> cls = zzbgx.class;
                throw th;
            }
        }
        return booleanValue;
    }
}
