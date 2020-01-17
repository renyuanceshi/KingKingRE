package com.google.android.gms.internal;

import java.io.IOException;

public final class ady extends ada<ady> implements Cloneable {
    private String version = "";
    private int zzbpb = 0;
    private String zzctw = "";

    public ady() {
        this.zzcrZ = null;
        this.zzcsi = -1;
    }

    /* access modifiers changed from: private */
    /* renamed from: zzLZ */
    public ady clone() {
        try {
            return (ady) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof ady)) {
            return false;
        }
        ady ady = (ady) obj;
        if (this.zzbpb != ady.zzbpb) {
            return false;
        }
        if (this.zzctw == null) {
            if (ady.zzctw != null) {
                return false;
            }
        } else if (!this.zzctw.equals(ady.zzctw)) {
            return false;
        }
        if (this.version == null) {
            if (ady.version != null) {
                return false;
            }
        } else if (!this.version.equals(ady.version)) {
            return false;
        }
        return (this.zzcrZ == null || this.zzcrZ.isEmpty()) ? ady.zzcrZ == null || ady.zzcrZ.isEmpty() : this.zzcrZ.equals(ady.zzcrZ);
    }

    public final int hashCode() {
        int i = 0;
        int hashCode = getClass().getName().hashCode();
        int i2 = this.zzbpb;
        int hashCode2 = this.zzctw == null ? 0 : this.zzctw.hashCode();
        int hashCode3 = this.version == null ? 0 : this.version.hashCode();
        if (this.zzcrZ != null && !this.zzcrZ.isEmpty()) {
            i = this.zzcrZ.hashCode();
        }
        return ((((hashCode2 + ((((hashCode + 527) * 31) + i2) * 31)) * 31) + hashCode3) * 31) + i;
    }

    public final /* synthetic */ ada zzLL() throws CloneNotSupportedException {
        return (ady) clone();
    }

    public final /* synthetic */ adg zzLM() throws CloneNotSupportedException {
        return (ady) clone();
    }

    public final /* synthetic */ adg zza(acx acx) throws IOException {
        while (true) {
            int zzLy = acx.zzLy();
            switch (zzLy) {
                case 0:
                    break;
                case 8:
                    this.zzbpb = acx.zzLA();
                    continue;
                case 18:
                    this.zzctw = acx.readString();
                    continue;
                case 26:
                    this.version = acx.readString();
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
        if (this.zzbpb != 0) {
            acy.zzr(1, this.zzbpb);
        }
        if (this.zzctw != null && !this.zzctw.equals("")) {
            acy.zzl(2, this.zzctw);
        }
        if (this.version != null && !this.version.equals("")) {
            acy.zzl(3, this.version);
        }
        super.zza(acy);
    }

    /* access modifiers changed from: protected */
    public final int zzn() {
        int zzn = super.zzn();
        if (this.zzbpb != 0) {
            zzn += acy.zzs(1, this.zzbpb);
        }
        if (this.zzctw != null && !this.zzctw.equals("")) {
            zzn += acy.zzm(2, this.zzctw);
        }
        return (this.version == null || this.version.equals("")) ? zzn : zzn + acy.zzm(3, this.version);
    }
}
