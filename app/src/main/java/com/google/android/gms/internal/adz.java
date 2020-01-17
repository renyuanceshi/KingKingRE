package com.google.android.gms.internal;

import java.io.IOException;
import java.util.Arrays;

public final class adz extends ada<adz> implements Cloneable {
    private boolean zzctA = false;
    private byte[] zzctx = adj.zzcst;
    private String zzcty = "";
    private byte[][] zzctz = adj.zzcss;

    public adz() {
        this.zzcrZ = null;
        this.zzcsi = -1;
    }

    /* access modifiers changed from: private */
    /* renamed from: zzMa */
    public adz clone() {
        try {
            adz adz = (adz) super.clone();
            if (this.zzctz != null && this.zzctz.length > 0) {
                adz.zzctz = (byte[][]) this.zzctz.clone();
            }
            return adz;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof adz)) {
            return false;
        }
        adz adz = (adz) obj;
        if (!Arrays.equals(this.zzctx, adz.zzctx)) {
            return false;
        }
        if (this.zzcty == null) {
            if (adz.zzcty != null) {
                return false;
            }
        } else if (!this.zzcty.equals(adz.zzcty)) {
            return false;
        }
        if (!ade.zza(this.zzctz, adz.zzctz)) {
            return false;
        }
        if (this.zzctA != adz.zzctA) {
            return false;
        }
        return (this.zzcrZ == null || this.zzcrZ.isEmpty()) ? adz.zzcrZ == null || adz.zzcrZ.isEmpty() : this.zzcrZ.equals(adz.zzcrZ);
    }

    public final int hashCode() {
        int i = 0;
        int hashCode = getClass().getName().hashCode();
        int hashCode2 = Arrays.hashCode(this.zzctx);
        int hashCode3 = this.zzcty == null ? 0 : this.zzcty.hashCode();
        int zzc = ade.zzc(this.zzctz);
        int i2 = this.zzctA ? 1231 : 1237;
        if (this.zzcrZ != null && !this.zzcrZ.isEmpty()) {
            i = this.zzcrZ.hashCode();
        }
        return ((((((hashCode3 + ((((hashCode + 527) * 31) + hashCode2) * 31)) * 31) + zzc) * 31) + i2) * 31) + i;
    }

    public final /* synthetic */ ada zzLL() throws CloneNotSupportedException {
        return (adz) clone();
    }

    public final /* synthetic */ adg zzLM() throws CloneNotSupportedException {
        return (adz) clone();
    }

    public final /* synthetic */ adg zza(acx acx) throws IOException {
        while (true) {
            int zzLy = acx.zzLy();
            switch (zzLy) {
                case 0:
                    break;
                case 10:
                    this.zzctx = acx.readBytes();
                    continue;
                case 18:
                    int zzb = adj.zzb(acx, 18);
                    int length = this.zzctz == null ? 0 : this.zzctz.length;
                    byte[][] bArr = new byte[(zzb + length)][];
                    if (length != 0) {
                        System.arraycopy(this.zzctz, 0, bArr, 0, length);
                    }
                    while (length < bArr.length - 1) {
                        bArr[length] = acx.readBytes();
                        acx.zzLy();
                        length++;
                    }
                    bArr[length] = acx.readBytes();
                    this.zzctz = bArr;
                    continue;
                case 24:
                    this.zzctA = acx.zzLB();
                    continue;
                case 34:
                    this.zzcty = acx.readString();
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
        if (!Arrays.equals(this.zzctx, adj.zzcst)) {
            acy.zzb(1, this.zzctx);
        }
        if (this.zzctz != null && this.zzctz.length > 0) {
            for (byte[] bArr : this.zzctz) {
                if (bArr != null) {
                    acy.zzb(2, bArr);
                }
            }
        }
        if (this.zzctA) {
            acy.zzk(3, this.zzctA);
        }
        if (this.zzcty != null && !this.zzcty.equals("")) {
            acy.zzl(4, this.zzcty);
        }
        super.zza(acy);
    }

    /* access modifiers changed from: protected */
    public final int zzn() {
        int i;
        int zzn = super.zzn();
        if (!Arrays.equals(this.zzctx, adj.zzcst)) {
            zzn += acy.zzc(1, this.zzctx);
        }
        if (this.zzctz != null && this.zzctz.length > 0) {
            int i2 = 0;
            int i3 = 0;
            int i4 = 0;
            while (i4 < this.zzctz.length) {
                byte[] bArr = this.zzctz[i4];
                if (bArr != null) {
                    i = i3 + 1;
                    i2 += acy.zzJ(bArr);
                } else {
                    i = i3;
                }
                i4++;
                i3 = i;
            }
            zzn = zzn + i2 + (i3 * 1);
        }
        if (this.zzctA) {
            zzn += acy.zzct(3) + 1;
        }
        return (this.zzcty == null || this.zzcty.equals("")) ? zzn : zzn + acy.zzm(4, this.zzcty);
    }
}
