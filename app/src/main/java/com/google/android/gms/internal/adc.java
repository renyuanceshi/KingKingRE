package com.google.android.gms.internal;

public final class adc implements Cloneable {
    private static final add zzcsb = new add();
    private int mSize;
    private boolean zzcsc;
    private int[] zzcsd;
    private add[] zzcse;

    adc() {
        this(10);
    }

    private adc(int i) {
        this.zzcsc = false;
        int idealIntArraySize = idealIntArraySize(i);
        this.zzcsd = new int[idealIntArraySize];
        this.zzcse = new add[idealIntArraySize];
        this.mSize = 0;
    }

    private static int idealIntArraySize(int i) {
        int i2 = i << 2;
        int i3 = 4;
        while (true) {
            if (i3 >= 32) {
                break;
            } else if (i2 <= (1 << i3) - 12) {
                i2 = (1 << i3) - 12;
                break;
            } else {
                i3++;
            }
        }
        return i2 / 4;
    }

    private final int zzcz(int i) {
        int i2 = this.mSize - 1;
        int i3 = 0;
        while (i3 <= i2) {
            int i4 = (i3 + i2) >>> 1;
            int i5 = this.zzcsd[i4];
            if (i5 < i) {
                i3 = i4 + 1;
            } else if (i5 <= i) {
                return i4;
            } else {
                i2 = i4 - 1;
            }
        }
        return i3 ^ -1;
    }

    public final /* synthetic */ Object clone() throws CloneNotSupportedException {
        int i = this.mSize;
        adc adc = new adc(i);
        System.arraycopy(this.zzcsd, 0, adc.zzcsd, 0, i);
        for (int i2 = 0; i2 < i; i2++) {
            if (this.zzcse[i2] != null) {
                adc.zzcse[i2] = (add) this.zzcse[i2].clone();
            }
        }
        adc.mSize = i;
        return adc;
    }

    public final boolean equals(Object obj) {
        boolean z;
        boolean z2;
        if (obj != this) {
            if (!(obj instanceof adc)) {
                return false;
            }
            adc adc = (adc) obj;
            if (this.mSize != adc.mSize) {
                return false;
            }
            int[] iArr = this.zzcsd;
            int[] iArr2 = adc.zzcsd;
            int i = this.mSize;
            int i2 = 0;
            while (true) {
                if (i2 >= i) {
                    z = true;
                    break;
                } else if (iArr[i2] != iArr2[i2]) {
                    z = false;
                    break;
                } else {
                    i2++;
                }
            }
            if (!z) {
                return false;
            }
            add[] addArr = this.zzcse;
            add[] addArr2 = adc.zzcse;
            int i3 = this.mSize;
            int i4 = 0;
            while (true) {
                if (i4 >= i3) {
                    z2 = true;
                    break;
                } else if (!addArr[i4].equals(addArr2[i4])) {
                    z2 = false;
                    break;
                } else {
                    i4++;
                }
            }
            if (!z2) {
                return false;
            }
        }
        return true;
    }

    public final int hashCode() {
        int i = 17;
        for (int i2 = 0; i2 < this.mSize; i2++) {
            i = (((i * 31) + this.zzcsd[i2]) * 31) + this.zzcse[i2].hashCode();
        }
        return i;
    }

    public final boolean isEmpty() {
        return this.mSize == 0;
    }

    /* access modifiers changed from: package-private */
    public final int size() {
        return this.mSize;
    }

    /* access modifiers changed from: package-private */
    public final void zza(int i, add add) {
        int zzcz = zzcz(i);
        if (zzcz >= 0) {
            this.zzcse[zzcz] = add;
            return;
        }
        int i2 = zzcz ^ -1;
        if (i2 >= this.mSize || this.zzcse[i2] != zzcsb) {
            if (this.mSize >= this.zzcsd.length) {
                int idealIntArraySize = idealIntArraySize(this.mSize + 1);
                int[] iArr = new int[idealIntArraySize];
                add[] addArr = new add[idealIntArraySize];
                System.arraycopy(this.zzcsd, 0, iArr, 0, this.zzcsd.length);
                System.arraycopy(this.zzcse, 0, addArr, 0, this.zzcse.length);
                this.zzcsd = iArr;
                this.zzcse = addArr;
            }
            if (this.mSize - i2 != 0) {
                System.arraycopy(this.zzcsd, i2, this.zzcsd, i2 + 1, this.mSize - i2);
                System.arraycopy(this.zzcse, i2, this.zzcse, i2 + 1, this.mSize - i2);
            }
            this.zzcsd[i2] = i;
            this.zzcse[i2] = add;
            this.mSize++;
            return;
        }
        this.zzcsd[i2] = i;
        this.zzcse[i2] = add;
    }

    /* access modifiers changed from: package-private */
    public final add zzcx(int i) {
        int zzcz = zzcz(i);
        if (zzcz < 0 || this.zzcse[zzcz] == zzcsb) {
            return null;
        }
        return this.zzcse[zzcz];
    }

    /* access modifiers changed from: package-private */
    public final add zzcy(int i) {
        return this.zzcse[i];
    }
}
