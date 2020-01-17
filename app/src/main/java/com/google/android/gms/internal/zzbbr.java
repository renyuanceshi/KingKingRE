package com.google.android.gms.internal;

import android.support.annotation.NonNull;
import android.support.v4.util.ArrayMap;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.zza;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import java.util.Collections;
import java.util.Map;

final class zzbbr implements OnCompleteListener<Void> {
    private /* synthetic */ zzbbo zzaCP;
    private zzbeh zzaCQ;

    zzbbr(zzbbo zzbbo, zzbeh zzbeh) {
        this.zzaCP = zzbbo;
        this.zzaCQ = zzbeh;
    }

    /* access modifiers changed from: package-private */
    public final void cancel() {
        this.zzaCQ.zzmF();
    }

    public final void onComplete(@NonNull Task<Void> task) {
        this.zzaCP.zzaCv.lock();
        try {
            if (!this.zzaCP.zzaCK) {
                this.zzaCQ.zzmF();
                return;
            }
            if (task.isSuccessful()) {
                Map unused = this.zzaCP.zzaCM = new ArrayMap(this.zzaCP.zzaCC.size());
                for (zzbbn zzph : this.zzaCP.zzaCC.values()) {
                    this.zzaCP.zzaCM.put(zzph.zzph(), ConnectionResult.zzazX);
                }
            } else if (task.getException() instanceof zza) {
                zza zza = (zza) task.getException();
                if (this.zzaCP.zzaCI) {
                    Map unused2 = this.zzaCP.zzaCM = new ArrayMap(this.zzaCP.zzaCC.size());
                    for (zzbbn zzbbn : this.zzaCP.zzaCC.values()) {
                        zzbas zzph2 = zzbbn.zzph();
                        ConnectionResult zza2 = zza.zza(zzbbn);
                        if (this.zzaCP.zza((zzbbn<?>) zzbbn, zza2)) {
                            this.zzaCP.zzaCM.put(zzph2, new ConnectionResult(16));
                        } else {
                            this.zzaCP.zzaCM.put(zzph2, zza2);
                        }
                    }
                } else {
                    Map unused3 = this.zzaCP.zzaCM = zza.zzpf();
                }
            } else {
                Log.e("ConnectionlessGAC", "Unexpected availability exception", task.getException());
                Map unused4 = this.zzaCP.zzaCM = Collections.emptyMap();
            }
            if (this.zzaCP.isConnected()) {
                this.zzaCP.zzaCL.putAll(this.zzaCP.zzaCM);
                if (this.zzaCP.zzpN() == null) {
                    this.zzaCP.zzpL();
                    this.zzaCP.zzpM();
                    this.zzaCP.zzaCG.signalAll();
                }
            }
            this.zzaCQ.zzmF();
            this.zzaCP.zzaCv.unlock();
        } finally {
            this.zzaCP.zzaCv.unlock();
        }
    }
}
