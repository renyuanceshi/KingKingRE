package com.google.android.gms.auth.api.signin.internal;

public final class zzo {
    private static int zzams = 31;
    private int zzamt = 1;

    public final zzo zzP(boolean z) {
        this.zzamt = (z ? 1 : 0) + (zzams * this.zzamt);
        return this;
    }

    public final int zzmJ() {
        return this.zzamt;
    }

    public final zzo zzo(Object obj) {
        this.zzamt = (obj == null ? 0 : obj.hashCode()) + (zzams * this.zzamt);
        return this;
    }
}
