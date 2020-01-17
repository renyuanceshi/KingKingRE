package com.google.android.gms.internal;

import java.io.IOException;

public final class aeb extends ada<aeb> implements Cloneable {
    private static volatile aeb[] zzctU;
    private String key = "";
    private String value = "";

    public aeb() {
        this.zzcrZ = null;
        this.zzcsi = -1;
    }

    public static aeb[] zzMc() {
        if (zzctU == null) {
            synchronized (ade.zzcsh) {
                if (zzctU == null) {
                    zzctU = new aeb[0];
                }
            }
        }
        return zzctU;
    }

    /* access modifiers changed from: private */
    /* renamed from: zzMd */
    public aeb clone() {
        try {
            return (aeb) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof aeb)) {
            return false;
        }
        aeb aeb = (aeb) obj;
        if (this.key == null) {
            if (aeb.key != null) {
                return false;
            }
        } else if (!this.key.equals(aeb.key)) {
            return false;
        }
        if (this.value == null) {
            if (aeb.value != null) {
                return false;
            }
        } else if (!this.value.equals(aeb.value)) {
            return false;
        }
        return (this.zzcrZ == null || this.zzcrZ.isEmpty()) ? aeb.zzcrZ == null || aeb.zzcrZ.isEmpty() : this.zzcrZ.equals(aeb.zzcrZ);
    }

    public final int hashCode() {
        int i = 0;
        int hashCode = getClass().getName().hashCode();
        int hashCode2 = this.key == null ? 0 : this.key.hashCode();
        int hashCode3 = this.value == null ? 0 : this.value.hashCode();
        if (this.zzcrZ != null && !this.zzcrZ.isEmpty()) {
            i = this.zzcrZ.hashCode();
        }
        return ((((hashCode2 + ((hashCode + 527) * 31)) * 31) + hashCode3) * 31) + i;
    }

    public final /* synthetic */ ada zzLL() throws CloneNotSupportedException {
        return (aeb) clone();
    }

    public final /* synthetic */ adg zzLM() throws CloneNotSupportedException {
        return (aeb) clone();
    }

    public final /* synthetic */ adg zza(acx acx) throws IOException {
        while (true) {
            int zzLy = acx.zzLy();
            switch (zzLy) {
                case 0:
                    break;
                case 10:
                    this.key = acx.readString();
                    continue;
                case 18:
                    this.value = acx.readString();
                    continue;
                default:
                    if (!super.zza(acx, zzLy)) {
                        break;
                    } else {
                        continue;
                    }
            }
        }
        return this;
    }

    public final void zza(acy acy) throws IOException {
        if (this.key != null && !this.key.equals("")) {
            acy.zzl(1, this.key);
        }
        if (this.value != null && !this.value.equals("")) {
            acy.zzl(2, this.value);
        }
        super.zza(acy);
    }

    /* access modifiers changed from: protected */
    public final int zzn() {
        int zzn = super.zzn();
        if (this.key != null && !this.key.equals("")) {
            zzn += acy.zzm(1, this.key);
        }
        return (this.value == null || this.value.equals("")) ? zzn : zzn + acy.zzm(2, this.value);
    }
}
