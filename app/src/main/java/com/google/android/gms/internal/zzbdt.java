package com.google.android.gms.internal;

import android.app.Activity;
import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.v4.util.ArrayMap;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

public final class zzbdt extends Fragment implements zzbds {
    private static WeakHashMap<Activity, WeakReference<zzbdt>> zzaEH = new WeakHashMap<>();
    /* access modifiers changed from: private */
    public int zzLg = 0;
    private Map<String, zzbdr> zzaEI = new ArrayMap();
    /* access modifiers changed from: private */
    public Bundle zzaEJ;

    public static zzbdt zzo(Activity activity) {
        zzbdt zzbdt;
        WeakReference weakReference = zzaEH.get(activity);
        if (weakReference == null || (zzbdt = (zzbdt) weakReference.get()) == null) {
            try {
                zzbdt = (zzbdt) activity.getFragmentManager().findFragmentByTag("LifecycleFragmentImpl");
                if (zzbdt == null || zzbdt.isRemoving()) {
                    zzbdt = new zzbdt();
                    activity.getFragmentManager().beginTransaction().add(zzbdt, "LifecycleFragmentImpl").commitAllowingStateLoss();
                }
                zzaEH.put(activity, new WeakReference(zzbdt));
            } catch (ClassCastException e) {
                throw new IllegalStateException("Fragment with tag LifecycleFragmentImpl is not a LifecycleFragmentImpl", e);
            }
        }
        return zzbdt;
    }

    public final void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        super.dump(str, fileDescriptor, printWriter, strArr);
        for (zzbdr dump : this.zzaEI.values()) {
            dump.dump(str, fileDescriptor, printWriter, strArr);
        }
    }

    public final void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        for (zzbdr onActivityResult : this.zzaEI.values()) {
            onActivityResult.onActivityResult(i, i2, intent);
        }
    }

    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.zzLg = 1;
        this.zzaEJ = bundle;
        for (Map.Entry next : this.zzaEI.entrySet()) {
            ((zzbdr) next.getValue()).onCreate(bundle != null ? bundle.getBundle((String) next.getKey()) : null);
        }
    }

    public final void onDestroy() {
        super.onDestroy();
        this.zzLg = 5;
        for (zzbdr onDestroy : this.zzaEI.values()) {
            onDestroy.onDestroy();
        }
    }

    public final void onResume() {
        super.onResume();
        this.zzLg = 3;
        for (zzbdr onResume : this.zzaEI.values()) {
            onResume.onResume();
        }
    }

    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (bundle != null) {
            for (Map.Entry next : this.zzaEI.entrySet()) {
                Bundle bundle2 = new Bundle();
                ((zzbdr) next.getValue()).onSaveInstanceState(bundle2);
                bundle.putBundle((String) next.getKey(), bundle2);
            }
        }
    }

    public final void onStart() {
        super.onStart();
        this.zzLg = 2;
        for (zzbdr onStart : this.zzaEI.values()) {
            onStart.onStart();
        }
    }

    public final void onStop() {
        super.onStop();
        this.zzLg = 4;
        for (zzbdr onStop : this.zzaEI.values()) {
            onStop.onStop();
        }
    }

    public final <T extends zzbdr> T zza(String str, Class<T> cls) {
        return (zzbdr) cls.cast(this.zzaEI.get(str));
    }

    public final void zza(String str, @NonNull zzbdr zzbdr) {
        if (!this.zzaEI.containsKey(str)) {
            this.zzaEI.put(str, zzbdr);
            if (this.zzLg > 0) {
                new Handler(Looper.getMainLooper()).post(new zzbdu(this, zzbdr, str));
                return;
            }
            return;
        }
        throw new IllegalArgumentException(new StringBuilder(String.valueOf(str).length() + 59).append("LifecycleCallback with tag ").append(str).append(" already added to this fragment.").toString());
    }

    public final Activity zzqF() {
        return getActivity();
    }
}
