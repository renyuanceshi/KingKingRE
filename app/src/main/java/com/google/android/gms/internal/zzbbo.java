package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApi;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzq;
import com.google.android.gms.common.internal.zzr;
import com.google.android.gms.common.zze;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;

public final class zzbbo implements zzbdo {
    private final zzbda zzaAN;
    private final zzq zzaCA;
    /* access modifiers changed from: private */
    public final Map<Api.zzc<?>, zzbbn<?>> zzaCB = new HashMap();
    /* access modifiers changed from: private */
    public final Map<Api.zzc<?>, zzbbn<?>> zzaCC = new HashMap();
    private final Map<Api<?>, Boolean> zzaCD;
    /* access modifiers changed from: private */
    public final zzbco zzaCE;
    private final zze zzaCF;
    /* access modifiers changed from: private */
    public final Condition zzaCG;
    private final boolean zzaCH;
    /* access modifiers changed from: private */
    public final boolean zzaCI;
    private final Queue<zzbax<?, ?>> zzaCJ = new LinkedList();
    /* access modifiers changed from: private */
    public boolean zzaCK;
    /* access modifiers changed from: private */
    public Map<zzbas<?>, ConnectionResult> zzaCL;
    /* access modifiers changed from: private */
    public Map<zzbas<?>, ConnectionResult> zzaCM;
    private zzbbr zzaCN;
    /* access modifiers changed from: private */
    public ConnectionResult zzaCO;
    /* access modifiers changed from: private */
    public final Lock zzaCv;
    private final Looper zzrO;

    public zzbbo(Context context, Lock lock, Looper looper, zze zze, Map<Api.zzc<?>, Api.zze> map, zzq zzq, Map<Api<?>, Boolean> map2, Api.zza<? extends zzctj, zzctk> zza, ArrayList<zzbbh> arrayList, zzbco zzbco, boolean z) {
        boolean z2;
        boolean z3;
        boolean z4;
        this.zzaCv = lock;
        this.zzrO = looper;
        this.zzaCG = lock.newCondition();
        this.zzaCF = zze;
        this.zzaCE = zzbco;
        this.zzaCD = map2;
        this.zzaCA = zzq;
        this.zzaCH = z;
        HashMap hashMap = new HashMap();
        for (Api next : map2.keySet()) {
            hashMap.put(next.zzpd(), next);
        }
        HashMap hashMap2 = new HashMap();
        ArrayList arrayList2 = arrayList;
        int size = arrayList2.size();
        int i = 0;
        while (i < size) {
            Object obj = arrayList2.get(i);
            i++;
            zzbbh zzbbh = (zzbbh) obj;
            hashMap2.put(zzbbh.zzayW, zzbbh);
        }
        boolean z5 = true;
        boolean z6 = false;
        boolean z7 = false;
        for (Map.Entry next2 : map.entrySet()) {
            Api api = (Api) hashMap.get(next2.getKey());
            Api.zze zze2 = (Api.zze) next2.getValue();
            if (!zze2.zzpe()) {
                z2 = z7;
                z3 = z6;
                z4 = false;
            } else if (!this.zzaCD.get(api).booleanValue()) {
                z2 = true;
                z3 = true;
                z4 = z5;
            } else {
                z2 = true;
                z3 = z6;
                z4 = z5;
            }
            zzbbn zzbbn = new zzbbn(context, api, looper, zze2, (zzbbh) hashMap2.get(api), zzq, zza);
            this.zzaCB.put((Api.zzc) next2.getKey(), zzbbn);
            if (zze2.zzmv()) {
                this.zzaCC.put((Api.zzc) next2.getKey(), zzbbn);
            }
            z7 = z2;
            z6 = z3;
            z5 = z4;
        }
        this.zzaCI = z7 && !z5 && !z6;
        this.zzaAN = zzbda.zzqk();
    }

    /* access modifiers changed from: private */
    public final boolean zza(zzbbn<?> zzbbn, ConnectionResult connectionResult) {
        return !connectionResult.isSuccess() && !connectionResult.hasResolution() && this.zzaCD.get(zzbbn.zzpg()).booleanValue() && zzbbn.zzpJ().zzpe() && this.zzaCF.isUserResolvableError(connectionResult.getErrorCode());
    }

    @Nullable
    private final ConnectionResult zzb(@NonNull Api.zzc<?> zzc) {
        this.zzaCv.lock();
        try {
            zzbbn zzbbn = this.zzaCB.get(zzc);
            if (this.zzaCL != null && zzbbn != null) {
                return this.zzaCL.get(zzbbn.zzph());
            }
            this.zzaCv.unlock();
            return null;
        } finally {
            this.zzaCv.unlock();
        }
    }

    private final <T extends zzbax<? extends Result, ? extends Api.zzb>> boolean zzg(@NonNull T t) {
        Api.zzc zzpd = t.zzpd();
        ConnectionResult zzb = zzb((Api.zzc<?>) zzpd);
        if (zzb == null || zzb.getErrorCode() != 4) {
            return false;
        }
        t.zzr(new Status(4, (String) null, this.zzaAN.zza((zzbas<?>) this.zzaCB.get(zzpd).zzph(), System.identityHashCode(this.zzaCE))));
        return true;
    }

    /* JADX INFO: finally extract failed */
    /* JADX WARNING: Removed duplicated region for block: B:11:0x0025 A[Catch:{ all -> 0x0045 }] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private final boolean zzpK() {
        /*
            r3 = this;
            r1 = 0
            java.util.concurrent.locks.Lock r0 = r3.zzaCv
            r0.lock()
            boolean r0 = r3.zzaCK     // Catch:{ all -> 0x0045 }
            if (r0 == 0) goto L_0x000e
            boolean r0 = r3.zzaCH     // Catch:{ all -> 0x0045 }
            if (r0 != 0) goto L_0x0015
        L_0x000e:
            java.util.concurrent.locks.Lock r0 = r3.zzaCv
            r0.unlock()
            r0 = r1
        L_0x0014:
            return r0
        L_0x0015:
            java.util.Map<com.google.android.gms.common.api.Api$zzc<?>, com.google.android.gms.internal.zzbbn<?>> r0 = r3.zzaCC     // Catch:{ all -> 0x0045 }
            java.util.Set r0 = r0.keySet()     // Catch:{ all -> 0x0045 }
            java.util.Iterator r2 = r0.iterator()     // Catch:{ all -> 0x0045 }
        L_0x001f:
            boolean r0 = r2.hasNext()     // Catch:{ all -> 0x0045 }
            if (r0 == 0) goto L_0x003e
            java.lang.Object r0 = r2.next()     // Catch:{ all -> 0x0045 }
            com.google.android.gms.common.api.Api$zzc r0 = (com.google.android.gms.common.api.Api.zzc) r0     // Catch:{ all -> 0x0045 }
            com.google.android.gms.common.ConnectionResult r0 = r3.zzb((com.google.android.gms.common.api.Api.zzc<?>) r0)     // Catch:{ all -> 0x0045 }
            if (r0 == 0) goto L_0x0037
            boolean r0 = r0.isSuccess()     // Catch:{ all -> 0x0045 }
            if (r0 != 0) goto L_0x001f
        L_0x0037:
            java.util.concurrent.locks.Lock r0 = r3.zzaCv
            r0.unlock()
            r0 = r1
            goto L_0x0014
        L_0x003e:
            java.util.concurrent.locks.Lock r0 = r3.zzaCv
            r0.unlock()
            r0 = 1
            goto L_0x0014
        L_0x0045:
            r0 = move-exception
            java.util.concurrent.locks.Lock r1 = r3.zzaCv
            r1.unlock()
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzbbo.zzpK():boolean");
    }

    /* access modifiers changed from: private */
    public final void zzpL() {
        if (this.zzaCA == null) {
            this.zzaCE.zzaDG = Collections.emptySet();
            return;
        }
        HashSet hashSet = new HashSet(this.zzaCA.zzrn());
        Map<Api<?>, zzr> zzrp = this.zzaCA.zzrp();
        for (Api next : zzrp.keySet()) {
            ConnectionResult connectionResult = getConnectionResult(next);
            if (connectionResult != null && connectionResult.isSuccess()) {
                hashSet.addAll(zzrp.get(next).zzame);
            }
        }
        this.zzaCE.zzaDG = hashSet;
    }

    /* access modifiers changed from: private */
    public final void zzpM() {
        while (!this.zzaCJ.isEmpty()) {
            zze(this.zzaCJ.remove());
        }
        this.zzaCE.zzm((Bundle) null);
    }

    /* access modifiers changed from: private */
    @Nullable
    public final ConnectionResult zzpN() {
        ConnectionResult connectionResult = null;
        int i = 0;
        ConnectionResult connectionResult2 = null;
        int i2 = 0;
        for (zzbbn next : this.zzaCB.values()) {
            Api zzpg = next.zzpg();
            ConnectionResult connectionResult3 = this.zzaCL.get(next.zzph());
            if (!connectionResult3.isSuccess() && (!this.zzaCD.get(zzpg).booleanValue() || connectionResult3.hasResolution() || this.zzaCF.isUserResolvableError(connectionResult3.getErrorCode()))) {
                if (connectionResult3.getErrorCode() != 4 || !this.zzaCH) {
                    int priority = zzpg.zzpb().getPriority();
                    if (connectionResult != null && i <= priority) {
                        connectionResult3 = connectionResult;
                        priority = i;
                    }
                    connectionResult = connectionResult3;
                    i = priority;
                } else {
                    int priority2 = zzpg.zzpb().getPriority();
                    if (connectionResult2 == null || i2 > priority2) {
                        connectionResult2 = connectionResult3;
                        i2 = priority2;
                    }
                }
            }
        }
        return (connectionResult == null || connectionResult2 == null || i <= i2) ? connectionResult : connectionResult2;
    }

    public final ConnectionResult blockingConnect() {
        connect();
        while (isConnecting()) {
            try {
                this.zzaCG.await();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                return new ConnectionResult(15, (PendingIntent) null);
            }
        }
        return isConnected() ? ConnectionResult.zzazX : this.zzaCO != null ? this.zzaCO : new ConnectionResult(13, (PendingIntent) null);
    }

    public final ConnectionResult blockingConnect(long j, TimeUnit timeUnit) {
        connect();
        long nanos = timeUnit.toNanos(j);
        while (isConnecting()) {
            if (nanos <= 0) {
                try {
                    disconnect();
                    return new ConnectionResult(14, (PendingIntent) null);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    return new ConnectionResult(15, (PendingIntent) null);
                }
            } else {
                nanos = this.zzaCG.awaitNanos(nanos);
            }
        }
        return isConnected() ? ConnectionResult.zzazX : this.zzaCO != null ? this.zzaCO : new ConnectionResult(13, (PendingIntent) null);
    }

    public final void connect() {
        this.zzaCv.lock();
        try {
            if (!this.zzaCK) {
                this.zzaCK = true;
                this.zzaCL = null;
                this.zzaCM = null;
                this.zzaCN = null;
                this.zzaCO = null;
                this.zzaAN.zzps();
                this.zzaAN.zza((Iterable<? extends GoogleApi<?>>) this.zzaCB.values()).addOnCompleteListener((Executor) new zzbgu(this.zzrO), new zzbbq(this));
                this.zzaCv.unlock();
            }
        } finally {
            this.zzaCv.unlock();
        }
    }

    public final void disconnect() {
        this.zzaCv.lock();
        try {
            this.zzaCK = false;
            this.zzaCL = null;
            this.zzaCM = null;
            if (this.zzaCN != null) {
                this.zzaCN.cancel();
                this.zzaCN = null;
            }
            this.zzaCO = null;
            while (!this.zzaCJ.isEmpty()) {
                zzbax remove = this.zzaCJ.remove();
                remove.zza((zzbew) null);
                remove.cancel();
            }
            this.zzaCG.signalAll();
        } finally {
            this.zzaCv.unlock();
        }
    }

    public final void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
    }

    @Nullable
    public final ConnectionResult getConnectionResult(@NonNull Api<?> api) {
        return zzb(api.zzpd());
    }

    public final boolean isConnected() {
        this.zzaCv.lock();
        try {
            return this.zzaCL != null && this.zzaCO == null;
        } finally {
            this.zzaCv.unlock();
        }
    }

    public final boolean isConnecting() {
        this.zzaCv.lock();
        try {
            return this.zzaCL == null && this.zzaCK;
        } finally {
            this.zzaCv.unlock();
        }
    }

    /* JADX INFO: finally extract failed */
    public final boolean zza(zzbeh zzbeh) {
        this.zzaCv.lock();
        try {
            if (!this.zzaCK || zzpK()) {
                this.zzaCv.unlock();
                return false;
            }
            this.zzaAN.zzps();
            this.zzaCN = new zzbbr(this, zzbeh);
            this.zzaAN.zza((Iterable<? extends GoogleApi<?>>) this.zzaCC.values()).addOnCompleteListener((Executor) new zzbgu(this.zzrO), this.zzaCN);
            this.zzaCv.unlock();
            return true;
        } catch (Throwable th) {
            this.zzaCv.unlock();
            throw th;
        }
    }

    public final <A extends Api.zzb, R extends Result, T extends zzbax<R, A>> T zzd(@NonNull T t) {
        if (this.zzaCH && zzg(t)) {
            return t;
        }
        if (!isConnected()) {
            this.zzaCJ.add(t);
            return t;
        }
        this.zzaCE.zzaDL.zzb(t);
        return this.zzaCB.get(t.zzpd()).zza(t);
    }

    public final <A extends Api.zzb, T extends zzbax<? extends Result, A>> T zze(@NonNull T t) {
        Api.zzc zzpd = t.zzpd();
        if (this.zzaCH && zzg(t)) {
            return t;
        }
        this.zzaCE.zzaDL.zzb(t);
        return this.zzaCB.get(zzpd).zzb(t);
    }

    public final void zzpE() {
    }

    public final void zzpl() {
        this.zzaCv.lock();
        try {
            this.zzaAN.zzpl();
            if (this.zzaCN != null) {
                this.zzaCN.cancel();
                this.zzaCN = null;
            }
            if (this.zzaCM == null) {
                this.zzaCM = new ArrayMap(this.zzaCC.size());
            }
            ConnectionResult connectionResult = new ConnectionResult(4);
            for (zzbbn<?> zzph : this.zzaCC.values()) {
                this.zzaCM.put(zzph.zzph(), connectionResult);
            }
            if (this.zzaCL != null) {
                this.zzaCL.putAll(this.zzaCM);
            }
        } finally {
            this.zzaCv.unlock();
        }
    }
}
