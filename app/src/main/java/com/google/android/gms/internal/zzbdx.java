package com.google.android.gms.internal;

public final class zzbdx<L> {
    private final L mListener;
    private final String zzaEP;

    zzbdx(L l, String str) {
        this.mListener = l;
        this.zzaEP = str;
    }

    public final boolean equals(Object obj) {
        if (this != obj) {
            if (!(obj instanceof zzbdx)) {
                return false;
            }
            zzbdx zzbdx = (zzbdx) obj;
            if (this.mListener != zzbdx.mListener || !this.zzaEP.equals(zzbdx.zzaEP)) {
                return false;
            }
        }
        return true;
    }

    public final int hashCode() {
        return (System.identityHashCode(this.mListener) * 31) + this.zzaEP.hashCode();
    }
}
