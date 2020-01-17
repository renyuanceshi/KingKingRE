package com.google.android.gms.internal;

import android.support.v4.media.TransportMediator;
import java.io.IOException;
import java.util.Arrays;

public final class aea extends ada<aea> implements Cloneable {
    private String tag = "";
    private boolean zzccZ = false;
    private aec zzcmI = null;
    public long zzctB = 0;
    public long zzctC = 0;
    private long zzctD = 0;
    public int zzctE = 0;
    private aeb[] zzctF = aeb.zzMc();
    private byte[] zzctG = adj.zzcst;
    private ady zzctH = null;
    public byte[] zzctI = adj.zzcst;
    private String zzctJ = "";
    private String zzctK = "";
    private adx zzctL = null;
    private String zzctM = "";
    public long zzctN = 180000;
    private adz zzctO = null;
    public byte[] zzctP = adj.zzcst;
    private String zzctQ = "";
    private int zzctR = 0;
    private int[] zzctS = adj.zzcsn;
    private long zzctT = 0;
    public int zzrD = 0;

    public aea() {
        this.zzcrZ = null;
        this.zzcsi = -1;
    }

    /* access modifiers changed from: private */
    /* renamed from: zzMb */
    public final aea clone() {
        try {
            aea aea = (aea) super.clone();
            if (this.zzctF != null && this.zzctF.length > 0) {
                aea.zzctF = new aeb[this.zzctF.length];
                int i = 0;
                while (true) {
                    int i2 = i;
                    if (i2 >= this.zzctF.length) {
                        break;
                    }
                    if (this.zzctF[i2] != null) {
                        aea.zzctF[i2] = (aeb) this.zzctF[i2].clone();
                    }
                    i = i2 + 1;
                }
            }
            if (this.zzctH != null) {
                aea.zzctH = (ady) this.zzctH.clone();
            }
            if (this.zzctL != null) {
                aea.zzctL = (adx) this.zzctL.clone();
            }
            if (this.zzctO != null) {
                aea.zzctO = (adz) this.zzctO.clone();
            }
            if (this.zzctS != null && this.zzctS.length > 0) {
                aea.zzctS = (int[]) this.zzctS.clone();
            }
            if (this.zzcmI != null) {
                aea.zzcmI = (aec) this.zzcmI.clone();
            }
            return aea;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof aea)) {
            return false;
        }
        aea aea = (aea) obj;
        if (this.zzctB != aea.zzctB) {
            return false;
        }
        if (this.zzctC != aea.zzctC) {
            return false;
        }
        if (this.zzctD != aea.zzctD) {
            return false;
        }
        if (this.tag == null) {
            if (aea.tag != null) {
                return false;
            }
        } else if (!this.tag.equals(aea.tag)) {
            return false;
        }
        if (this.zzctE != aea.zzctE) {
            return false;
        }
        if (this.zzrD != aea.zzrD) {
            return false;
        }
        if (this.zzccZ != aea.zzccZ) {
            return false;
        }
        if (!ade.equals((Object[]) this.zzctF, (Object[]) aea.zzctF)) {
            return false;
        }
        if (!Arrays.equals(this.zzctG, aea.zzctG)) {
            return false;
        }
        if (this.zzctH == null) {
            if (aea.zzctH != null) {
                return false;
            }
        } else if (!this.zzctH.equals(aea.zzctH)) {
            return false;
        }
        if (!Arrays.equals(this.zzctI, aea.zzctI)) {
            return false;
        }
        if (this.zzctJ == null) {
            if (aea.zzctJ != null) {
                return false;
            }
        } else if (!this.zzctJ.equals(aea.zzctJ)) {
            return false;
        }
        if (this.zzctK == null) {
            if (aea.zzctK != null) {
                return false;
            }
        } else if (!this.zzctK.equals(aea.zzctK)) {
            return false;
        }
        if (this.zzctL == null) {
            if (aea.zzctL != null) {
                return false;
            }
        } else if (!this.zzctL.equals(aea.zzctL)) {
            return false;
        }
        if (this.zzctM == null) {
            if (aea.zzctM != null) {
                return false;
            }
        } else if (!this.zzctM.equals(aea.zzctM)) {
            return false;
        }
        if (this.zzctN != aea.zzctN) {
            return false;
        }
        if (this.zzctO == null) {
            if (aea.zzctO != null) {
                return false;
            }
        } else if (!this.zzctO.equals(aea.zzctO)) {
            return false;
        }
        if (!Arrays.equals(this.zzctP, aea.zzctP)) {
            return false;
        }
        if (this.zzctQ == null) {
            if (aea.zzctQ != null) {
                return false;
            }
        } else if (!this.zzctQ.equals(aea.zzctQ)) {
            return false;
        }
        if (this.zzctR != aea.zzctR) {
            return false;
        }
        if (!ade.equals(this.zzctS, aea.zzctS)) {
            return false;
        }
        if (this.zzctT != aea.zzctT) {
            return false;
        }
        if (this.zzcmI == null) {
            if (aea.zzcmI != null) {
                return false;
            }
        } else if (!this.zzcmI.equals(aea.zzcmI)) {
            return false;
        }
        return (this.zzcrZ == null || this.zzcrZ.isEmpty()) ? aea.zzcrZ == null || aea.zzcrZ.isEmpty() : this.zzcrZ.equals(aea.zzcrZ);
    }

    public final int hashCode() {
        int i = 0;
        int hashCode = getClass().getName().hashCode();
        int i2 = (int) (this.zzctB ^ (this.zzctB >>> 32));
        int i3 = (int) (this.zzctC ^ (this.zzctC >>> 32));
        int i4 = (int) (this.zzctD ^ (this.zzctD >>> 32));
        int hashCode2 = this.tag == null ? 0 : this.tag.hashCode();
        int i5 = this.zzctE;
        int i6 = this.zzrD;
        int i7 = this.zzccZ ? 1231 : 1237;
        int hashCode3 = ade.hashCode((Object[]) this.zzctF);
        int hashCode4 = Arrays.hashCode(this.zzctG);
        int hashCode5 = this.zzctH == null ? 0 : this.zzctH.hashCode();
        int hashCode6 = Arrays.hashCode(this.zzctI);
        int hashCode7 = this.zzctJ == null ? 0 : this.zzctJ.hashCode();
        int hashCode8 = this.zzctK == null ? 0 : this.zzctK.hashCode();
        int hashCode9 = this.zzctL == null ? 0 : this.zzctL.hashCode();
        int hashCode10 = this.zzctM == null ? 0 : this.zzctM.hashCode();
        int i8 = (int) (this.zzctN ^ (this.zzctN >>> 32));
        int hashCode11 = this.zzctO == null ? 0 : this.zzctO.hashCode();
        int hashCode12 = Arrays.hashCode(this.zzctP);
        int hashCode13 = this.zzctQ == null ? 0 : this.zzctQ.hashCode();
        int i9 = this.zzctR;
        int hashCode14 = ade.hashCode(this.zzctS);
        int i10 = (int) (this.zzctT ^ (this.zzctT >>> 32));
        int hashCode15 = this.zzcmI == null ? 0 : this.zzcmI.hashCode();
        if (this.zzcrZ != null && !this.zzcrZ.isEmpty()) {
            i = this.zzcrZ.hashCode();
        }
        return ((((((((((((((((((((((((((((((((((((((((hashCode2 + ((((((((hashCode + 527) * 31) + i2) * 31) + i3) * 31) + i4) * 31)) * 31) + i5) * 31) + i6) * 31) + i7) * 31) + hashCode3) * 31) + hashCode4) * 31) + hashCode5) * 31) + hashCode6) * 31) + hashCode7) * 31) + hashCode8) * 31) + hashCode9) * 31) + hashCode10) * 31) + i8) * 31) + hashCode11) * 31) + hashCode12) * 31) + hashCode13) * 31) + i9) * 31) + hashCode14) * 31) + i10) * 31) + hashCode15) * 31) + i;
    }

    public final /* synthetic */ ada zzLL() throws CloneNotSupportedException {
        return (aea) clone();
    }

    public final /* synthetic */ adg zzLM() throws CloneNotSupportedException {
        return (aea) clone();
    }

    public final /* synthetic */ adg zza(acx acx) throws IOException {
        while (true) {
            int zzLy = acx.zzLy();
            switch (zzLy) {
                case 0:
                    break;
                case 8:
                    this.zzctB = acx.zzLz();
                    continue;
                case 18:
                    this.tag = acx.readString();
                    continue;
                case 26:
                    int zzb = adj.zzb(acx, 26);
                    int length = this.zzctF == null ? 0 : this.zzctF.length;
                    aeb[] aebArr = new aeb[(zzb + length)];
                    if (length != 0) {
                        System.arraycopy(this.zzctF, 0, aebArr, 0, length);
                    }
                    while (length < aebArr.length - 1) {
                        aebArr[length] = new aeb();
                        acx.zza(aebArr[length]);
                        acx.zzLy();
                        length++;
                    }
                    aebArr[length] = new aeb();
                    acx.zza(aebArr[length]);
                    this.zzctF = aebArr;
                    continue;
                case 34:
                    this.zzctG = acx.readBytes();
                    continue;
                case 50:
                    this.zzctI = acx.readBytes();
                    continue;
                case 58:
                    if (this.zzctL == null) {
                        this.zzctL = new adx();
                    }
                    acx.zza(this.zzctL);
                    continue;
                case 66:
                    this.zzctJ = acx.readString();
                    continue;
                case 74:
                    if (this.zzctH == null) {
                        this.zzctH = new ady();
                    }
                    acx.zza(this.zzctH);
                    continue;
                case 80:
                    this.zzccZ = acx.zzLB();
                    continue;
                case 88:
                    this.zzctE = acx.zzLA();
                    continue;
                case 96:
                    this.zzrD = acx.zzLA();
                    continue;
                case 106:
                    this.zzctK = acx.readString();
                    continue;
                case 114:
                    this.zzctM = acx.readString();
                    continue;
                case 120:
                    this.zzctN = acx.zzLC();
                    continue;
                case TransportMediator.KEYCODE_MEDIA_RECORD:
                    if (this.zzctO == null) {
                        this.zzctO = new adz();
                    }
                    acx.zza(this.zzctO);
                    continue;
                case 136:
                    this.zzctC = acx.zzLz();
                    continue;
                case 146:
                    this.zzctP = acx.readBytes();
                    continue;
                case 152:
                    int position = acx.getPosition();
                    int zzLA = acx.zzLA();
                    switch (zzLA) {
                        case 0:
                        case 1:
                        case 2:
                            this.zzctR = zzLA;
                            break;
                        default:
                            acx.zzcp(position);
                            zza(acx, zzLy);
                            continue;
                    }
                case 160:
                    int zzb2 = adj.zzb(acx, 160);
                    int length2 = this.zzctS == null ? 0 : this.zzctS.length;
                    int[] iArr = new int[(zzb2 + length2)];
                    if (length2 != 0) {
                        System.arraycopy(this.zzctS, 0, iArr, 0, length2);
                    }
                    while (length2 < iArr.length - 1) {
                        iArr[length2] = acx.zzLA();
                        acx.zzLy();
                        length2++;
                    }
                    iArr[length2] = acx.zzLA();
                    this.zzctS = iArr;
                    continue;
                case 162:
                    int zzcn = acx.zzcn(acx.zzLD());
                    int position2 = acx.getPosition();
                    int i = 0;
                    while (acx.zzLI() > 0) {
                        acx.zzLA();
                        i++;
                    }
                    acx.zzcp(position2);
                    int length3 = this.zzctS == null ? 0 : this.zzctS.length;
                    int[] iArr2 = new int[(i + length3)];
                    if (length3 != 0) {
                        System.arraycopy(this.zzctS, 0, iArr2, 0, length3);
                    }
                    while (length3 < iArr2.length) {
                        iArr2[length3] = acx.zzLA();
                        length3++;
                    }
                    this.zzctS = iArr2;
                    acx.zzco(zzcn);
                    continue;
                case 168:
                    this.zzctD = acx.zzLz();
                    continue;
                case 176:
                    this.zzctT = acx.zzLz();
                    continue;
                case 186:
                    if (this.zzcmI == null) {
                        this.zzcmI = new aec();
                    }
                    acx.zza(this.zzcmI);
                    continue;
                case 194:
                    this.zzctQ = acx.readString();
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
        if (this.zzctB != 0) {
            acy.zzb(1, this.zzctB);
        }
        if (this.tag != null && !this.tag.equals("")) {
            acy.zzl(2, this.tag);
        }
        if (this.zzctF != null && this.zzctF.length > 0) {
            for (aeb aeb : this.zzctF) {
                if (aeb != null) {
                    acy.zza(3, (adg) aeb);
                }
            }
        }
        if (!Arrays.equals(this.zzctG, adj.zzcst)) {
            acy.zzb(4, this.zzctG);
        }
        if (!Arrays.equals(this.zzctI, adj.zzcst)) {
            acy.zzb(6, this.zzctI);
        }
        if (this.zzctL != null) {
            acy.zza(7, (adg) this.zzctL);
        }
        if (this.zzctJ != null && !this.zzctJ.equals("")) {
            acy.zzl(8, this.zzctJ);
        }
        if (this.zzctH != null) {
            acy.zza(9, (adg) this.zzctH);
        }
        if (this.zzccZ) {
            acy.zzk(10, this.zzccZ);
        }
        if (this.zzctE != 0) {
            acy.zzr(11, this.zzctE);
        }
        if (this.zzrD != 0) {
            acy.zzr(12, this.zzrD);
        }
        if (this.zzctK != null && !this.zzctK.equals("")) {
            acy.zzl(13, this.zzctK);
        }
        if (this.zzctM != null && !this.zzctM.equals("")) {
            acy.zzl(14, this.zzctM);
        }
        if (this.zzctN != 180000) {
            acy.zzd(15, this.zzctN);
        }
        if (this.zzctO != null) {
            acy.zza(16, (adg) this.zzctO);
        }
        if (this.zzctC != 0) {
            acy.zzb(17, this.zzctC);
        }
        if (!Arrays.equals(this.zzctP, adj.zzcst)) {
            acy.zzb(18, this.zzctP);
        }
        if (this.zzctR != 0) {
            acy.zzr(19, this.zzctR);
        }
        if (this.zzctS != null && this.zzctS.length > 0) {
            for (int zzr : this.zzctS) {
                acy.zzr(20, zzr);
            }
        }
        if (this.zzctD != 0) {
            acy.zzb(21, this.zzctD);
        }
        if (this.zzctT != 0) {
            acy.zzb(22, this.zzctT);
        }
        if (this.zzcmI != null) {
            acy.zza(23, (adg) this.zzcmI);
        }
        if (this.zzctQ != null && !this.zzctQ.equals("")) {
            acy.zzl(24, this.zzctQ);
        }
        super.zza(acy);
    }

    /* access modifiers changed from: protected */
    public final int zzn() {
        int zzn = super.zzn();
        if (this.zzctB != 0) {
            zzn += acy.zze(1, this.zzctB);
        }
        if (this.tag != null && !this.tag.equals("")) {
            zzn += acy.zzm(2, this.tag);
        }
        if (this.zzctF != null && this.zzctF.length > 0) {
            int i = zzn;
            for (aeb aeb : this.zzctF) {
                if (aeb != null) {
                    i += acy.zzb(3, (adg) aeb);
                }
            }
            zzn = i;
        }
        if (!Arrays.equals(this.zzctG, adj.zzcst)) {
            zzn += acy.zzc(4, this.zzctG);
        }
        if (!Arrays.equals(this.zzctI, adj.zzcst)) {
            zzn += acy.zzc(6, this.zzctI);
        }
        if (this.zzctL != null) {
            zzn += acy.zzb(7, (adg) this.zzctL);
        }
        if (this.zzctJ != null && !this.zzctJ.equals("")) {
            zzn += acy.zzm(8, this.zzctJ);
        }
        if (this.zzctH != null) {
            zzn += acy.zzb(9, (adg) this.zzctH);
        }
        if (this.zzccZ) {
            zzn += acy.zzct(10) + 1;
        }
        if (this.zzctE != 0) {
            zzn += acy.zzs(11, this.zzctE);
        }
        if (this.zzrD != 0) {
            zzn += acy.zzs(12, this.zzrD);
        }
        if (this.zzctK != null && !this.zzctK.equals("")) {
            zzn += acy.zzm(13, this.zzctK);
        }
        if (this.zzctM != null && !this.zzctM.equals("")) {
            zzn += acy.zzm(14, this.zzctM);
        }
        if (this.zzctN != 180000) {
            zzn += acy.zzf(15, this.zzctN);
        }
        if (this.zzctO != null) {
            zzn += acy.zzb(16, (adg) this.zzctO);
        }
        if (this.zzctC != 0) {
            zzn += acy.zze(17, this.zzctC);
        }
        if (!Arrays.equals(this.zzctP, adj.zzcst)) {
            zzn += acy.zzc(18, this.zzctP);
        }
        if (this.zzctR != 0) {
            zzn += acy.zzs(19, this.zzctR);
        }
        if (this.zzctS != null && this.zzctS.length > 0) {
            int i2 = 0;
            int i3 = 0;
            while (i3 < this.zzctS.length) {
                i3++;
                i2 = acy.zzcr(this.zzctS[i3]) + i2;
            }
            zzn = zzn + i2 + (this.zzctS.length * 2);
        }
        if (this.zzctD != 0) {
            zzn += acy.zze(21, this.zzctD);
        }
        if (this.zzctT != 0) {
            zzn += acy.zze(22, this.zzctT);
        }
        if (this.zzcmI != null) {
            zzn += acy.zzb(23, (adg) this.zzcmI);
        }
        return (this.zzctQ == null || this.zzctQ.equals("")) ? zzn : zzn + acy.zzm(24, this.zzctQ);
    }
}
