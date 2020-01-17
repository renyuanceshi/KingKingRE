package com.google.android.gms.internal;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.PowerManager;
import android.os.WorkSource;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.common.util.zzt;
import com.google.android.gms.common.util.zzx;

public final class zzcty {
    private static boolean DEBUG = false;
    private static String TAG = "WakeLock";
    private static String zzbCW = "*gcore*:";
    private final Context mContext;
    private final String zzaJp;
    private final String zzaJr;
    private final PowerManager.WakeLock zzbCX;
    private WorkSource zzbCY;
    private final int zzbCZ;
    private final String zzbDa;
    private boolean zzbDb;
    private int zzbDc;
    private int zzbDd;

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public zzcty(Context context, int i, String str) {
        this(context, 1, str, (String) null, context == null ? null : context.getPackageName());
    }

    @SuppressLint({"UnwrappedWakeLock"})
    private zzcty(Context context, int i, String str, String str2, String str3) {
        this(context, 1, str, (String) null, str3, (String) null);
    }

    @SuppressLint({"UnwrappedWakeLock"})
    private zzcty(Context context, int i, String str, String str2, String str3, String str4) {
        this.zzbDb = true;
        zzbo.zzh(str, "Wake lock name can NOT be empty");
        this.zzbCZ = i;
        this.zzbDa = null;
        this.zzaJr = null;
        this.mContext = context.getApplicationContext();
        if (!"com.google.android.gms".equals(context.getPackageName())) {
            String valueOf = String.valueOf(zzbCW);
            String valueOf2 = String.valueOf(str);
            this.zzaJp = valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
        } else {
            this.zzaJp = str;
        }
        this.zzbCX = ((PowerManager) context.getSystemService("power")).newWakeLock(i, str);
        if (zzx.zzaM(this.mContext)) {
            this.zzbCY = zzx.zzD(context, zzt.zzcL(str3) ? context.getPackageName() : str3);
            WorkSource workSource = this.zzbCY;
            if (workSource != null && zzx.zzaM(this.mContext)) {
                if (this.zzbCY != null) {
                    this.zzbCY.add(workSource);
                } else {
                    this.zzbCY = workSource;
                }
                try {
                    this.zzbCX.setWorkSource(this.zzbCY);
                } catch (IllegalArgumentException e) {
                    Log.wtf(TAG, e.toString());
                }
            }
        }
    }

    private final boolean zzeV(String str) {
        if (TextUtils.isEmpty((CharSequence) null)) {
            return false;
        }
        String str2 = this.zzbDa;
        throw new NullPointerException();
    }

    private final String zzi(String str, boolean z) {
        if (!this.zzbDb) {
            return this.zzbDa;
        }
        if (z) {
            return null;
        }
        return this.zzbDa;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0020, code lost:
        if (r12.zzbDd == 0) goto L_0x0022;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:7:0x0018, code lost:
        if (r0 == false) goto L_0x001a;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final void acquire(long r13) {
        /*
            r12 = this;
            r10 = 1000(0x3e8, double:4.94E-321)
            r1 = 0
            boolean r0 = r12.zzeV(r1)
            java.lang.String r4 = r12.zzi(r1, r0)
            monitor-enter(r12)
            boolean r1 = r12.zzbDb     // Catch:{ all -> 0x004b }
            if (r1 == 0) goto L_0x001a
            int r1 = r12.zzbDc     // Catch:{ all -> 0x004b }
            int r2 = r1 + 1
            r12.zzbDc = r2     // Catch:{ all -> 0x004b }
            if (r1 == 0) goto L_0x0022
            if (r0 != 0) goto L_0x0022
        L_0x001a:
            boolean r0 = r12.zzbDb     // Catch:{ all -> 0x004b }
            if (r0 != 0) goto L_0x0044
            int r0 = r12.zzbDd     // Catch:{ all -> 0x004b }
            if (r0 != 0) goto L_0x0044
        L_0x0022:
            com.google.android.gms.common.stats.zze.zzrX()     // Catch:{ all -> 0x004b }
            android.content.Context r0 = r12.mContext     // Catch:{ all -> 0x004b }
            android.os.PowerManager$WakeLock r1 = r12.zzbCX     // Catch:{ all -> 0x004b }
            java.lang.String r1 = com.google.android.gms.common.stats.zzc.zza(r1, r4)     // Catch:{ all -> 0x004b }
            r2 = 7
            java.lang.String r3 = r12.zzaJp     // Catch:{ all -> 0x004b }
            r5 = 0
            int r6 = r12.zzbCZ     // Catch:{ all -> 0x004b }
            android.os.WorkSource r7 = r12.zzbCY     // Catch:{ all -> 0x004b }
            java.util.List r7 = com.google.android.gms.common.util.zzx.zzb(r7)     // Catch:{ all -> 0x004b }
            r8 = 1000(0x3e8, double:4.94E-321)
            com.google.android.gms.common.stats.zze.zza(r0, r1, r2, r3, r4, r5, r6, r7, r8)     // Catch:{ all -> 0x004b }
            int r0 = r12.zzbDd     // Catch:{ all -> 0x004b }
            int r0 = r0 + 1
            r12.zzbDd = r0     // Catch:{ all -> 0x004b }
        L_0x0044:
            monitor-exit(r12)     // Catch:{ all -> 0x004b }
            android.os.PowerManager$WakeLock r0 = r12.zzbCX
            r0.acquire(r10)
            return
        L_0x004b:
            r0 = move-exception
            monitor-exit(r12)     // Catch:{ all -> 0x004b }
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzcty.acquire(long):void");
    }

    public final boolean isHeld() {
        return this.zzbCX.isHeld();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001f, code lost:
        if (r8.zzbDd == 1) goto L_0x0021;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:7:0x0016, code lost:
        if (r0 == false) goto L_0x0018;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final void release() {
        /*
            r8 = this;
            r1 = 0
            boolean r0 = r8.zzeV(r1)
            java.lang.String r4 = r8.zzi(r1, r0)
            monitor-enter(r8)
            boolean r1 = r8.zzbDb     // Catch:{ all -> 0x0049 }
            if (r1 == 0) goto L_0x0018
            int r1 = r8.zzbDc     // Catch:{ all -> 0x0049 }
            int r1 = r1 + -1
            r8.zzbDc = r1     // Catch:{ all -> 0x0049 }
            if (r1 == 0) goto L_0x0021
            if (r0 != 0) goto L_0x0021
        L_0x0018:
            boolean r0 = r8.zzbDb     // Catch:{ all -> 0x0049 }
            if (r0 != 0) goto L_0x0042
            int r0 = r8.zzbDd     // Catch:{ all -> 0x0049 }
            r1 = 1
            if (r0 != r1) goto L_0x0042
        L_0x0021:
            com.google.android.gms.common.stats.zze.zzrX()     // Catch:{ all -> 0x0049 }
            android.content.Context r0 = r8.mContext     // Catch:{ all -> 0x0049 }
            android.os.PowerManager$WakeLock r1 = r8.zzbCX     // Catch:{ all -> 0x0049 }
            java.lang.String r1 = com.google.android.gms.common.stats.zzc.zza(r1, r4)     // Catch:{ all -> 0x0049 }
            r2 = 8
            java.lang.String r3 = r8.zzaJp     // Catch:{ all -> 0x0049 }
            r5 = 0
            int r6 = r8.zzbCZ     // Catch:{ all -> 0x0049 }
            android.os.WorkSource r7 = r8.zzbCY     // Catch:{ all -> 0x0049 }
            java.util.List r7 = com.google.android.gms.common.util.zzx.zzb(r7)     // Catch:{ all -> 0x0049 }
            com.google.android.gms.common.stats.zze.zza(r0, r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0049 }
            int r0 = r8.zzbDd     // Catch:{ all -> 0x0049 }
            int r0 = r0 + -1
            r8.zzbDd = r0     // Catch:{ all -> 0x0049 }
        L_0x0042:
            monitor-exit(r8)     // Catch:{ all -> 0x0049 }
            android.os.PowerManager$WakeLock r0 = r8.zzbCX
            r0.release()
            return
        L_0x0049:
            r0 = move-exception
            monitor-exit(r8)     // Catch:{ all -> 0x0049 }
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzcty.release():void");
    }

    public final void setReferenceCounted(boolean z) {
        this.zzbCX.setReferenceCounted(false);
        this.zzbDb = false;
    }
}
