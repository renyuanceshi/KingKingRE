package com.google.android.gms.internal;

import android.app.Activity;
import android.app.PendingIntent;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzb;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.TaskCompletionSource;
import java.util.concurrent.CancellationException;

public class zzbea extends zzbaz {
    private TaskCompletionSource<Void> zzalE = new TaskCompletionSource<>();

    private zzbea(zzbds zzbds) {
        super(zzbds);
        this.zzaEG.zza("GmsAvailabilityHelper", (zzbdr) this);
    }

    public static zzbea zzp(Activity activity) {
        zzbds zzn = zzn(activity);
        zzbea zzbea = (zzbea) zzn.zza("GmsAvailabilityHelper", zzbea.class);
        if (zzbea == null) {
            return new zzbea(zzn);
        }
        if (!zzbea.zzalE.getTask().isComplete()) {
            return zzbea;
        }
        zzbea.zzalE = new TaskCompletionSource<>();
        return zzbea;
    }

    public final Task<Void> getTask() {
        return this.zzalE.getTask();
    }

    public final void onDestroy() {
        super.onDestroy();
        this.zzalE.setException(new CancellationException("Host activity was destroyed before Google Play services could be made available."));
    }

    /* access modifiers changed from: protected */
    public final void zza(ConnectionResult connectionResult, int i) {
        this.zzalE.setException(zzb.zzx(new Status(connectionResult.getErrorCode(), connectionResult.getErrorMessage(), connectionResult.getResolution())));
    }

    /* access modifiers changed from: protected */
    public final void zzps() {
        int isGooglePlayServicesAvailable = this.zzaBd.isGooglePlayServicesAvailable(this.zzaEG.zzqF());
        if (isGooglePlayServicesAvailable == 0) {
            this.zzalE.setResult(null);
        } else if (!this.zzalE.getTask().isComplete()) {
            zzb(new ConnectionResult(isGooglePlayServicesAvailable, (PendingIntent) null), 0);
        }
    }
}
