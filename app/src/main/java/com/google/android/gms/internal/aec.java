package com.google.android.gms.internal;

import java.io.IOException;

public final class aec extends ada<aec> implements Cloneable {
    private int zzctV = -1;
    private int zzctW = 0;

    public aec() {
        this.zzcrZ = null;
        this.zzcsi = -1;
    }

    /* access modifiers changed from: private */
    /* renamed from: zzMe */
    public aec clone() {
        try {
            return (aec) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof aec)) {
            return false;
        }
        aec aec = (aec) obj;
        if (this.zzctV != aec.zzctV) {
            return false;
        }
        if (this.zzctW != aec.zzctW) {
            return false;
        }
        return (this.zzcrZ == null || this.zzcrZ.isEmpty()) ? aec.zzcrZ == null || aec.zzcrZ.isEmpty() : this.zzcrZ.equals(aec.zzcrZ);
    }

    public final int hashCode() {
        int hashCode = getClass().getName().hashCode();
        int i = this.zzctV;
        return ((this.zzcrZ == null || this.zzcrZ.isEmpty()) ? 0 : this.zzcrZ.hashCode()) + ((((((hashCode + 527) * 31) + i) * 31) + this.zzctW) * 31);
    }

    public final /* synthetic */ ada zzLL() throws CloneNotSupportedException {
        return (aec) clone();
    }

    public final /* synthetic */ adg zzLM() throws CloneNotSupportedException {
        return (aec) clone();
    }

    public final /* synthetic */ adg zza(acx acx) throws IOException {
        while (true) {
            int zzLy = acx.zzLy();
            switch (zzLy) {
                case 0:
                    break;
                case 8:
                    int position = acx.getPosition();
                    int zzLA = acx.zzLA();
                    switch (zzLA) {
                        case -1:
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                        case 9:
                        case 10:
                        case 11:
                        case 12:
                        case 13:
                        case 14:
                        case 15:
                        case 16:
                        case 17:
                            this.zzctV = zzLA;
                            break;
                        default:
                            acx.zzcp(position);
                            zza(acx, zzLy);
                            continue;
                    }
                case 16:
                    int position2 = acx.getPosition();
                    int zzLA2 = acx.zzLA();
                    switch (zzLA2) {
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                        case 9:
                        case 10:
                        case 11:
                        case 12:
                        case 13:
                        case 14:
                        case 15:
                        case 16:
                        case 100:
                            this.zzctW = zzLA2;
                            break;
                        default:
                            acx.zzcp(position2);
                            zza(acx, zzLy);
                            continue;
                    }
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
        if (this.zzctV != -1) {
            acy.zzr(1, this.zzctV);
        }
        if (this.zzctW != 0) {
            acy.zzr(2, this.zzctW);
        }
        super.zza(acy);
    }

    /* access modifiers changed from: protected */
    public final int zzn() {
        int zzn = super.zzn();
        if (this.zzctV != -1) {
            zzn += acy.zzs(1, this.zzctV);
        }
        return this.zzctW != 0 ? zzn + acy.zzs(2, this.zzctW) : zzn;
    }
}
