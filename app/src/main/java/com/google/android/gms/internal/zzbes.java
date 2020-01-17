package com.google.android.gms.internal;

import android.support.annotation.WorkerThread;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;

final class zzbes implements Runnable {
    private /* synthetic */ Result zzaFh;
    private /* synthetic */ zzber zzaFi;

    zzbes(zzber zzber, Result result) {
        this.zzaFi = zzber;
        this.zzaFh = result;
    }

    @WorkerThread
    public final void run() {
        try {
            zzbbd.zzaBV.set(true);
            this.zzaFi.zzaFf.sendMessage(this.zzaFi.zzaFf.obtainMessage(0, this.zzaFi.zzaFa.onSuccess(this.zzaFh)));
            zzbbd.zzaBV.set(false);
            zzber.zzc(this.zzaFh);
            GoogleApiClient googleApiClient = (GoogleApiClient) this.zzaFi.zzaBY.get();
            if (googleApiClient != null) {
                googleApiClient.zzb(this.zzaFi);
            }
        } catch (RuntimeException e) {
            this.zzaFi.zzaFf.sendMessage(this.zzaFi.zzaFf.obtainMessage(1, e));
            zzbbd.zzaBV.set(false);
            zzber.zzc(this.zzaFh);
            GoogleApiClient googleApiClient2 = (GoogleApiClient) this.zzaFi.zzaBY.get();
            if (googleApiClient2 != null) {
                googleApiClient2.zzb(this.zzaFi);
            }
        } catch (Throwable th) {
            Throwable th2 = th;
            zzbbd.zzaBV.set(false);
            zzber.zzc(this.zzaFh);
            GoogleApiClient googleApiClient3 = (GoogleApiClient) this.zzaFi.zzaBY.get();
            if (googleApiClient3 != null) {
                googleApiClient3.zzb(this.zzaFi);
            }
            throw th2;
        }
    }
}
