package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.WorkerThread;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions;
import com.google.android.gms.common.api.GoogleApi;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzbo;
import com.google.android.gms.common.internal.zzbx;
import com.google.android.gms.tasks.TaskCompletionSource;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;

public final class zzbdc<O extends Api.ApiOptions> implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener, zzbbi {
    private final zzbas<O> zzaAK;
    private final Api.zze zzaCy;
    private boolean zzaDA;
    private /* synthetic */ zzbda zzaEm;
    private final Queue<zzbal> zzaEn = new LinkedList();
    private final Api.zzb zzaEo;
    private final zzbbs zzaEp;
    private final Set<zzbau> zzaEq = new HashSet();
    private final Map<zzbdx<?>, zzbee> zzaEr = new HashMap();
    private final int zzaEs;
    private final zzbei zzaEt;
    private ConnectionResult zzaEu = null;

    @WorkerThread
    public zzbdc(zzbda zzbda, GoogleApi<O> googleApi) {
        this.zzaEm = zzbda;
        this.zzaCy = googleApi.zza(zzbda.mHandler.getLooper(), (zzbdc<O>) this);
        if (this.zzaCy instanceof zzbx) {
            zzbx zzbx = (zzbx) this.zzaCy;
            this.zzaEo = null;
        } else {
            this.zzaEo = this.zzaCy;
        }
        this.zzaAK = googleApi.zzph();
        this.zzaEp = new zzbbs();
        this.zzaEs = googleApi.getInstanceId();
        if (this.zzaCy.zzmv()) {
            this.zzaEt = googleApi.zza(zzbda.mContext, zzbda.mHandler);
        } else {
            this.zzaEt = null;
        }
    }

    @WorkerThread
    private final void zzb(zzbal zzbal) {
        zzbal.zza(this.zzaEp, zzmv());
        try {
            zzbal.zza((zzbdc<?>) this);
        } catch (DeadObjectException e) {
            onConnectionSuspended(1);
            this.zzaCy.disconnect();
        }
    }

    @WorkerThread
    private final void zzi(ConnectionResult connectionResult) {
        for (zzbau zza : this.zzaEq) {
            zza.zza(this.zzaAK, connectionResult);
        }
        this.zzaEq.clear();
    }

    /* access modifiers changed from: private */
    @WorkerThread
    public final void zzqq() {
        zzqt();
        zzi(ConnectionResult.zzazX);
        zzqv();
        for (zzbee zzbee : this.zzaEr.values()) {
            try {
                zzbee.zzaBu.zzb(this.zzaEo, new TaskCompletionSource());
            } catch (DeadObjectException e) {
                onConnectionSuspended(1);
                this.zzaCy.disconnect();
            } catch (RemoteException e2) {
            }
        }
        while (this.zzaCy.isConnected() && !this.zzaEn.isEmpty()) {
            zzb(this.zzaEn.remove());
        }
        zzqw();
    }

    /* access modifiers changed from: private */
    @WorkerThread
    public final void zzqr() {
        zzqt();
        this.zzaDA = true;
        this.zzaEp.zzpQ();
        this.zzaEm.mHandler.sendMessageDelayed(Message.obtain(this.zzaEm.mHandler, 9, this.zzaAK), this.zzaEm.zzaDC);
        this.zzaEm.mHandler.sendMessageDelayed(Message.obtain(this.zzaEm.mHandler, 11, this.zzaAK), this.zzaEm.zzaDB);
        int unused = this.zzaEm.zzaEg = -1;
    }

    @WorkerThread
    private final void zzqv() {
        if (this.zzaDA) {
            this.zzaEm.mHandler.removeMessages(11, this.zzaAK);
            this.zzaEm.mHandler.removeMessages(9, this.zzaAK);
            this.zzaDA = false;
        }
    }

    private final void zzqw() {
        this.zzaEm.mHandler.removeMessages(12, this.zzaAK);
        this.zzaEm.mHandler.sendMessageDelayed(this.zzaEm.mHandler.obtainMessage(12, this.zzaAK), this.zzaEm.zzaEe);
    }

    @WorkerThread
    public final void connect() {
        zzbo.zza(this.zzaEm.mHandler);
        if (!this.zzaCy.isConnected() && !this.zzaCy.isConnecting()) {
            if (this.zzaCy.zzpe() && this.zzaEm.zzaEg != 0) {
                int unused = this.zzaEm.zzaEg = this.zzaEm.zzaBd.isGooglePlayServicesAvailable(this.zzaEm.mContext);
                if (this.zzaEm.zzaEg != 0) {
                    onConnectionFailed(new ConnectionResult(this.zzaEm.zzaEg, (PendingIntent) null));
                    return;
                }
            }
            zzbdg zzbdg = new zzbdg(this.zzaEm, this.zzaCy, this.zzaAK);
            if (this.zzaCy.zzmv()) {
                this.zzaEt.zza(zzbdg);
            }
            this.zzaCy.zza(zzbdg);
        }
    }

    public final int getInstanceId() {
        return this.zzaEs;
    }

    /* access modifiers changed from: package-private */
    public final boolean isConnected() {
        return this.zzaCy.isConnected();
    }

    public final void onConnected(@Nullable Bundle bundle) {
        if (Looper.myLooper() == this.zzaEm.mHandler.getLooper()) {
            zzqq();
        } else {
            this.zzaEm.mHandler.post(new zzbdd(this));
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:25:0x006c, code lost:
        if (r5.zzaEm.zzc(r6, r5.zzaEs) != false) goto L_?;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x0074, code lost:
        if (r6.getErrorCode() != 18) goto L_0x0079;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x0076, code lost:
        r5.zzaDA = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x007b, code lost:
        if (r5.zzaDA == false) goto L_0x009b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x007d, code lost:
        r5.zzaEm.mHandler.sendMessageDelayed(android.os.Message.obtain(r5.zzaEm.mHandler, 9, r5.zzaAK), r5.zzaEm.zzaDC);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:32:0x009b, code lost:
        r0 = java.lang.String.valueOf(r5.zzaAK.zzpr());
        zzt(new com.google.android.gms.common.api.Status(17, new java.lang.StringBuilder(java.lang.String.valueOf(r0).length() + 38).append("API: ").append(r0).append(" is not available on this device.").toString()));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:38:?, code lost:
        return;
     */
    @android.support.annotation.WorkerThread
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final void onConnectionFailed(@android.support.annotation.NonNull com.google.android.gms.common.ConnectionResult r6) {
        /*
            r5 = this;
            com.google.android.gms.internal.zzbda r0 = r5.zzaEm
            android.os.Handler r0 = r0.mHandler
            com.google.android.gms.common.internal.zzbo.zza(r0)
            com.google.android.gms.internal.zzbei r0 = r5.zzaEt
            if (r0 == 0) goto L_0x0012
            com.google.android.gms.internal.zzbei r0 = r5.zzaEt
            r0.zzqI()
        L_0x0012:
            r5.zzqt()
            com.google.android.gms.internal.zzbda r0 = r5.zzaEm
            r1 = -1
            int unused = r0.zzaEg = r1
            r5.zzi(r6)
            int r0 = r6.getErrorCode()
            r1 = 4
            if (r0 != r1) goto L_0x002d
            com.google.android.gms.common.api.Status r0 = com.google.android.gms.internal.zzbda.zzaEd
            r5.zzt(r0)
        L_0x002c:
            return
        L_0x002d:
            java.util.Queue<com.google.android.gms.internal.zzbal> r0 = r5.zzaEn
            boolean r0 = r0.isEmpty()
            if (r0 == 0) goto L_0x0038
            r5.zzaEu = r6
            goto L_0x002c
        L_0x0038:
            java.lang.Object r1 = com.google.android.gms.internal.zzbda.zzuH
            monitor-enter(r1)
            com.google.android.gms.internal.zzbda r0 = r5.zzaEm     // Catch:{ all -> 0x0060 }
            com.google.android.gms.internal.zzbbv r0 = r0.zzaEj     // Catch:{ all -> 0x0060 }
            if (r0 == 0) goto L_0x0063
            com.google.android.gms.internal.zzbda r0 = r5.zzaEm     // Catch:{ all -> 0x0060 }
            java.util.Set r0 = r0.zzaEk     // Catch:{ all -> 0x0060 }
            com.google.android.gms.internal.zzbas<O> r2 = r5.zzaAK     // Catch:{ all -> 0x0060 }
            boolean r0 = r0.contains(r2)     // Catch:{ all -> 0x0060 }
            if (r0 == 0) goto L_0x0063
            com.google.android.gms.internal.zzbda r0 = r5.zzaEm     // Catch:{ all -> 0x0060 }
            com.google.android.gms.internal.zzbbv r0 = r0.zzaEj     // Catch:{ all -> 0x0060 }
            int r2 = r5.zzaEs     // Catch:{ all -> 0x0060 }
            r0.zzb(r6, r2)     // Catch:{ all -> 0x0060 }
            monitor-exit(r1)     // Catch:{ all -> 0x0060 }
            goto L_0x002c
        L_0x0060:
            r0 = move-exception
            monitor-exit(r1)     // Catch:{ all -> 0x0060 }
            throw r0
        L_0x0063:
            monitor-exit(r1)     // Catch:{ all -> 0x0060 }
            com.google.android.gms.internal.zzbda r0 = r5.zzaEm
            int r1 = r5.zzaEs
            boolean r0 = r0.zzc(r6, r1)
            if (r0 != 0) goto L_0x002c
            int r0 = r6.getErrorCode()
            r1 = 18
            if (r0 != r1) goto L_0x0079
            r0 = 1
            r5.zzaDA = r0
        L_0x0079:
            boolean r0 = r5.zzaDA
            if (r0 == 0) goto L_0x009b
            com.google.android.gms.internal.zzbda r0 = r5.zzaEm
            android.os.Handler r0 = r0.mHandler
            com.google.android.gms.internal.zzbda r1 = r5.zzaEm
            android.os.Handler r1 = r1.mHandler
            r2 = 9
            com.google.android.gms.internal.zzbas<O> r3 = r5.zzaAK
            android.os.Message r1 = android.os.Message.obtain(r1, r2, r3)
            com.google.android.gms.internal.zzbda r2 = r5.zzaEm
            long r2 = r2.zzaDC
            r0.sendMessageDelayed(r1, r2)
            goto L_0x002c
        L_0x009b:
            com.google.android.gms.internal.zzbas<O> r0 = r5.zzaAK
            java.lang.String r0 = r0.zzpr()
            java.lang.String r0 = java.lang.String.valueOf(r0)
            com.google.android.gms.common.api.Status r1 = new com.google.android.gms.common.api.Status
            r2 = 17
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            java.lang.String r4 = java.lang.String.valueOf(r0)
            int r4 = r4.length()
            int r4 = r4 + 38
            r3.<init>(r4)
            java.lang.String r4 = "API: "
            java.lang.StringBuilder r3 = r3.append(r4)
            java.lang.StringBuilder r0 = r3.append(r0)
            java.lang.String r3 = " is not available on this device."
            java.lang.StringBuilder r0 = r0.append(r3)
            java.lang.String r0 = r0.toString()
            r1.<init>(r2, r0)
            r5.zzt(r1)
            goto L_0x002c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzbdc.onConnectionFailed(com.google.android.gms.common.ConnectionResult):void");
    }

    public final void onConnectionSuspended(int i) {
        if (Looper.myLooper() == this.zzaEm.mHandler.getLooper()) {
            zzqr();
        } else {
            this.zzaEm.mHandler.post(new zzbde(this));
        }
    }

    @WorkerThread
    public final void resume() {
        zzbo.zza(this.zzaEm.mHandler);
        if (this.zzaDA) {
            connect();
        }
    }

    @WorkerThread
    public final void signOut() {
        zzbo.zza(this.zzaEm.mHandler);
        zzt(zzbda.zzaEc);
        this.zzaEp.zzpP();
        for (zzbdx<?> zzbaq : this.zzaEr.keySet()) {
            zza((zzbal) new zzbaq(zzbaq, new TaskCompletionSource()));
        }
        zzi(new ConnectionResult(4));
        this.zzaCy.disconnect();
    }

    public final void zza(ConnectionResult connectionResult, Api<?> api, boolean z) {
        if (Looper.myLooper() == this.zzaEm.mHandler.getLooper()) {
            onConnectionFailed(connectionResult);
        } else {
            this.zzaEm.mHandler.post(new zzbdf(this, connectionResult));
        }
    }

    @WorkerThread
    public final void zza(zzbal zzbal) {
        zzbo.zza(this.zzaEm.mHandler);
        if (this.zzaCy.isConnected()) {
            zzb(zzbal);
            zzqw();
            return;
        }
        this.zzaEn.add(zzbal);
        if (this.zzaEu == null || !this.zzaEu.hasResolution()) {
            connect();
        } else {
            onConnectionFailed(this.zzaEu);
        }
    }

    @WorkerThread
    public final void zza(zzbau zzbau) {
        zzbo.zza(this.zzaEm.mHandler);
        this.zzaEq.add(zzbau);
    }

    @WorkerThread
    public final void zzh(@NonNull ConnectionResult connectionResult) {
        zzbo.zza(this.zzaEm.mHandler);
        this.zzaCy.disconnect();
        onConnectionFailed(connectionResult);
    }

    public final boolean zzmv() {
        return this.zzaCy.zzmv();
    }

    public final Api.zze zzpJ() {
        return this.zzaCy;
    }

    @WorkerThread
    public final void zzqd() {
        zzbo.zza(this.zzaEm.mHandler);
        if (this.zzaDA) {
            zzqv();
            zzt(this.zzaEm.zzaBd.isGooglePlayServicesAvailable(this.zzaEm.mContext) == 18 ? new Status(8, "Connection timed out while waiting for Google Play services update to complete.") : new Status(8, "API failed to connect while resuming due to an unknown error."));
            this.zzaCy.disconnect();
        }
    }

    public final Map<zzbdx<?>, zzbee> zzqs() {
        return this.zzaEr;
    }

    @WorkerThread
    public final void zzqt() {
        zzbo.zza(this.zzaEm.mHandler);
        this.zzaEu = null;
    }

    @WorkerThread
    public final ConnectionResult zzqu() {
        zzbo.zza(this.zzaEm.mHandler);
        return this.zzaEu;
    }

    @WorkerThread
    public final void zzqx() {
        zzbo.zza(this.zzaEm.mHandler);
        if (this.zzaCy.isConnected() && this.zzaEr.size() == 0) {
            if (this.zzaEp.zzpO()) {
                zzqw();
            } else {
                this.zzaCy.disconnect();
            }
        }
    }

    /* access modifiers changed from: package-private */
    public final zzctj zzqy() {
        if (this.zzaEt == null) {
            return null;
        }
        return this.zzaEt.zzqy();
    }

    @WorkerThread
    public final void zzt(Status status) {
        zzbo.zza(this.zzaEm.mHandler);
        for (zzbal zzp : this.zzaEn) {
            zzp.zzp(status);
        }
        this.zzaEn.clear();
    }
}
