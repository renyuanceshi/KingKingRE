package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.Nullable;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import java.util.concurrent.atomic.AtomicReference;

public abstract class zzbaz extends zzbdr implements DialogInterface.OnCancelListener {
    protected volatile boolean mStarted;
    protected final AtomicReference<zzbba> zzaBN;
    private final Handler zzaBO;
    protected final GoogleApiAvailability zzaBd;

    protected zzbaz(zzbds zzbds) {
        this(zzbds, GoogleApiAvailability.getInstance());
    }

    private zzbaz(zzbds zzbds, GoogleApiAvailability googleApiAvailability) {
        super(zzbds);
        this.zzaBN = new AtomicReference<>((Object) null);
        this.zzaBO = new Handler(Looper.getMainLooper());
        this.zzaBd = googleApiAvailability;
    }

    private static int zza(@Nullable zzbba zzbba) {
        if (zzbba == null) {
            return -1;
        }
        return zzbba.zzpy();
    }

    public final void onActivityResult(int i, int i2, Intent intent) {
        int i3 = 13;
        boolean z = false;
        zzbba zzbba = this.zzaBN.get();
        switch (i) {
            case 1:
                if (i2 != -1) {
                    if (i2 == 0) {
                        if (intent != null) {
                            i3 = intent.getIntExtra("<<ResolutionFailureErrorDetail>>", 13);
                        }
                        zzbba zzbba2 = new zzbba(new ConnectionResult(i3, (PendingIntent) null), zza(zzbba));
                        this.zzaBN.set(zzbba2);
                        zzbba = zzbba2;
                        break;
                    }
                } else {
                    z = true;
                    break;
                }
                break;
            case 2:
                int isGooglePlayServicesAvailable = this.zzaBd.isGooglePlayServicesAvailable(getActivity());
                boolean z2 = isGooglePlayServicesAvailable == 0;
                if (zzbba == null) {
                    return;
                }
                if (zzbba.zzpz().getErrorCode() != 18 || isGooglePlayServicesAvailable != 18) {
                    z = z2;
                    break;
                } else {
                    return;
                }
        }
        if (z) {
            zzpx();
        } else if (zzbba != null) {
            zza(zzbba.zzpz(), zzbba.zzpy());
        }
    }

    public void onCancel(DialogInterface dialogInterface) {
        zza(new ConnectionResult(13, (PendingIntent) null), zza(this.zzaBN.get()));
        zzpx();
    }

    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.zzaBN.set(bundle.getBoolean("resolving_error", false) ? new zzbba(new ConnectionResult(bundle.getInt("failed_status"), (PendingIntent) bundle.getParcelable("failed_resolution")), bundle.getInt("failed_client_id", -1)) : null);
        }
    }

    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        zzbba zzbba = this.zzaBN.get();
        if (zzbba != null) {
            bundle.putBoolean("resolving_error", true);
            bundle.putInt("failed_client_id", zzbba.zzpy());
            bundle.putInt("failed_status", zzbba.zzpz().getErrorCode());
            bundle.putParcelable("failed_resolution", zzbba.zzpz().getResolution());
        }
    }

    public void onStart() {
        super.onStart();
        this.mStarted = true;
    }

    public void onStop() {
        super.onStop();
        this.mStarted = false;
    }

    /* access modifiers changed from: protected */
    public abstract void zza(ConnectionResult connectionResult, int i);

    public final void zzb(ConnectionResult connectionResult, int i) {
        zzbba zzbba = new zzbba(connectionResult, i);
        if (this.zzaBN.compareAndSet((Object) null, zzbba)) {
            this.zzaBO.post(new zzbbb(this, zzbba));
        }
    }

    /* access modifiers changed from: protected */
    public abstract void zzps();

    /* access modifiers changed from: protected */
    public final void zzpx() {
        this.zzaBN.set((Object) null);
        zzps();
    }
}
