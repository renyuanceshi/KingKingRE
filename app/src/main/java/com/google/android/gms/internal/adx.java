package com.google.android.gms.internal;

import java.io.IOException;

public final class adx extends ada<adx> implements Cloneable {
    private String[] zzctr = adj.EMPTY_STRING_ARRAY;
    private String[] zzcts = adj.EMPTY_STRING_ARRAY;
    private int[] zzctt = adj.zzcsn;
    private long[] zzctu = adj.zzcso;
    private long[] zzctv = adj.zzcso;

    public adx() {
        this.zzcrZ = null;
        this.zzcsi = -1;
    }

    /* access modifiers changed from: private */
    /* renamed from: zzLY */
    public adx clone() {
        try {
            adx adx = (adx) super.clone();
            if (this.zzctr != null && this.zzctr.length > 0) {
                adx.zzctr = (String[]) this.zzctr.clone();
            }
            if (this.zzcts != null && this.zzcts.length > 0) {
                adx.zzcts = (String[]) this.zzcts.clone();
            }
            if (this.zzctt != null && this.zzctt.length > 0) {
                adx.zzctt = (int[]) this.zzctt.clone();
            }
            if (this.zzctu != null && this.zzctu.length > 0) {
                adx.zzctu = (long[]) this.zzctu.clone();
            }
            if (this.zzctv != null && this.zzctv.length > 0) {
                adx.zzctv = (long[]) this.zzctv.clone();
            }
            return adx;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof adx)) {
            return false;
        }
        adx adx = (adx) obj;
        if (!ade.equals((Object[]) this.zzctr, (Object[]) adx.zzctr)) {
            return false;
        }
        if (!ade.equals((Object[]) this.zzcts, (Object[]) adx.zzcts)) {
            return false;
        }
        if (!ade.equals(this.zzctt, adx.zzctt)) {
            return false;
        }
        if (!ade.equals(this.zzctu, adx.zzctu)) {
            return false;
        }
        if (!ade.equals(this.zzctv, adx.zzctv)) {
            return false;
        }
        return (this.zzcrZ == null || this.zzcrZ.isEmpty()) ? adx.zzcrZ == null || adx.zzcrZ.isEmpty() : this.zzcrZ.equals(adx.zzcrZ);
    }

    public final int hashCode() {
        int hashCode = getClass().getName().hashCode();
        int hashCode2 = ade.hashCode((Object[]) this.zzctr);
        int hashCode3 = ade.hashCode((Object[]) this.zzcts);
        int hashCode4 = ade.hashCode(this.zzctt);
        int hashCode5 = ade.hashCode(this.zzctu);
        return ((this.zzcrZ == null || this.zzcrZ.isEmpty()) ? 0 : this.zzcrZ.hashCode()) + ((((((((((((hashCode + 527) * 31) + hashCode2) * 31) + hashCode3) * 31) + hashCode4) * 31) + hashCode5) * 31) + ade.hashCode(this.zzctv)) * 31);
    }

    public final /* synthetic */ ada zzLL() throws CloneNotSupportedException {
        return (adx) clone();
    }

    public final /* synthetic */ adg zzLM() throws CloneNotSupportedException {
        return (adx) clone();
    }

    public final /* synthetic */ adg zza(acx acx) throws IOException {
        while (true) {
            int zzLy = acx.zzLy();
            switch (zzLy) {
                case 0:
                    break;
                case 10:
                    int zzb = adj.zzb(acx, 10);
                    int length = this.zzctr == null ? 0 : this.zzctr.length;
                    String[] strArr = new String[(zzb + length)];
                    if (length != 0) {
                        System.arraycopy(this.zzctr, 0, strArr, 0, length);
                    }
                    while (length < strArr.length - 1) {
                        strArr[length] = acx.readString();
                        acx.zzLy();
                        length++;
                    }
                    strArr[length] = acx.readString();
                    this.zzctr = strArr;
                    continue;
                case 18:
                    int zzb2 = adj.zzb(acx, 18);
                    int length2 = this.zzcts == null ? 0 : this.zzcts.length;
                    String[] strArr2 = new String[(zzb2 + length2)];
                    if (length2 != 0) {
                        System.arraycopy(this.zzcts, 0, strArr2, 0, length2);
                    }
                    while (length2 < strArr2.length - 1) {
                        strArr2[length2] = acx.readString();
                        acx.zzLy();
                        length2++;
                    }
                    strArr2[length2] = acx.readString();
                    this.zzcts = strArr2;
                    continue;
                case 24:
                    int zzb3 = adj.zzb(acx, 24);
                    int length3 = this.zzctt == null ? 0 : this.zzctt.length;
                    int[] iArr = new int[(zzb3 + length3)];
                    if (length3 != 0) {
                        System.arraycopy(this.zzctt, 0, iArr, 0, length3);
                    }
                    while (length3 < iArr.length - 1) {
                        iArr[length3] = acx.zzLA();
                        acx.zzLy();
                        length3++;
                    }
                    iArr[length3] = acx.zzLA();
                    this.zzctt = iArr;
                    continue;
                case 26:
                    int zzcn = acx.zzcn(acx.zzLD());
                    int position = acx.getPosition();
                    int i = 0;
                    while (acx.zzLI() > 0) {
                        acx.zzLA();
                        i++;
                    }
                    acx.zzcp(position);
                    int length4 = this.zzctt == null ? 0 : this.zzctt.length;
                    int[] iArr2 = new int[(i + length4)];
                    if (length4 != 0) {
                        System.arraycopy(this.zzctt, 0, iArr2, 0, length4);
                    }
                    while (length4 < iArr2.length) {
                        iArr2[length4] = acx.zzLA();
                        length4++;
                    }
                    this.zzctt = iArr2;
                    acx.zzco(zzcn);
                    continue;
                case 32:
                    int zzb4 = adj.zzb(acx, 32);
                    int length5 = this.zzctu == null ? 0 : this.zzctu.length;
                    long[] jArr = new long[(zzb4 + length5)];
                    if (length5 != 0) {
                        System.arraycopy(this.zzctu, 0, jArr, 0, length5);
                    }
                    while (length5 < jArr.length - 1) {
                        jArr[length5] = acx.zzLz();
                        acx.zzLy();
                        length5++;
                    }
                    jArr[length5] = acx.zzLz();
                    this.zzctu = jArr;
                    continue;
                case 34:
                    int zzcn2 = acx.zzcn(acx.zzLD());
                    int position2 = acx.getPosition();
                    int i2 = 0;
                    while (acx.zzLI() > 0) {
                        acx.zzLz();
                        i2++;
                    }
                    acx.zzcp(position2);
                    int length6 = this.zzctu == null ? 0 : this.zzctu.length;
                    long[] jArr2 = new long[(i2 + length6)];
                    if (length6 != 0) {
                        System.arraycopy(this.zzctu, 0, jArr2, 0, length6);
                    }
                    while (length6 < jArr2.length) {
                        jArr2[length6] = acx.zzLz();
                        length6++;
                    }
                    this.zzctu = jArr2;
                    acx.zzco(zzcn2);
                    continue;
                case 40:
                    int zzb5 = adj.zzb(acx, 40);
                    int length7 = this.zzctv == null ? 0 : this.zzctv.length;
                    long[] jArr3 = new long[(zzb5 + length7)];
                    if (length7 != 0) {
                        System.arraycopy(this.zzctv, 0, jArr3, 0, length7);
                    }
                    while (length7 < jArr3.length - 1) {
                        jArr3[length7] = acx.zzLz();
                        acx.zzLy();
                        length7++;
                    }
                    jArr3[length7] = acx.zzLz();
                    this.zzctv = jArr3;
                    continue;
                case 42:
                    int zzcn3 = acx.zzcn(acx.zzLD());
                    int position3 = acx.getPosition();
                    int i3 = 0;
                    while (acx.zzLI() > 0) {
                        acx.zzLz();
                        i3++;
                    }
                    acx.zzcp(position3);
                    int length8 = this.zzctv == null ? 0 : this.zzctv.length;
                    long[] jArr4 = new long[(i3 + length8)];
                    if (length8 != 0) {
                        System.arraycopy(this.zzctv, 0, jArr4, 0, length8);
                    }
                    while (length8 < jArr4.length) {
                        jArr4[length8] = acx.zzLz();
                        length8++;
                    }
                    this.zzctv = jArr4;
                    acx.zzco(zzcn3);
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
        if (this.zzctr != null && this.zzctr.length > 0) {
            for (String str : this.zzctr) {
                if (str != null) {
                    acy.zzl(1, str);
                }
            }
        }
        if (this.zzcts != null && this.zzcts.length > 0) {
            for (String str2 : this.zzcts) {
                if (str2 != null) {
                    acy.zzl(2, str2);
                }
            }
        }
        if (this.zzctt != null && this.zzctt.length > 0) {
            for (int zzr : this.zzctt) {
                acy.zzr(3, zzr);
            }
        }
        if (this.zzctu != null && this.zzctu.length > 0) {
            for (long zzb : this.zzctu) {
                acy.zzb(4, zzb);
            }
        }
        if (this.zzctv != null && this.zzctv.length > 0) {
            for (long zzb2 : this.zzctv) {
                acy.zzb(5, zzb2);
            }
        }
        super.zza(acy);
    }

    /* access modifiers changed from: protected */
    public final int zzn() {
        int i;
        int zzn = super.zzn();
        if (this.zzctr == null || this.zzctr.length <= 0) {
            i = zzn;
        } else {
            int i2 = 0;
            int i3 = 0;
            for (String str : this.zzctr) {
                if (str != null) {
                    i2++;
                    i3 += acy.zzhQ(str);
                }
            }
            i = (i2 * 1) + i3 + zzn;
        }
        if (this.zzcts != null && this.zzcts.length > 0) {
            int i4 = 0;
            int i5 = 0;
            for (String str2 : this.zzcts) {
                if (str2 != null) {
                    i4++;
                    i5 += acy.zzhQ(str2);
                }
            }
            i = i5 + i + (i4 * 1);
        }
        if (this.zzctt != null && this.zzctt.length > 0) {
            int i6 = 0;
            for (int zzcr : this.zzctt) {
                i6 += acy.zzcr(zzcr);
            }
            i = i + i6 + (this.zzctt.length * 1);
        }
        if (this.zzctu != null && this.zzctu.length > 0) {
            int i7 = 0;
            for (long zzaP : this.zzctu) {
                i7 += acy.zzaP(zzaP);
            }
            i = i + i7 + (this.zzctu.length * 1);
        }
        if (this.zzctv == null || this.zzctv.length <= 0) {
            return i;
        }
        int i8 = 0;
        for (long zzaP2 : this.zzctv) {
            i8 += acy.zzaP(zzaP2);
        }
        return i + i8 + (this.zzctv.length * 1);
    }
}
