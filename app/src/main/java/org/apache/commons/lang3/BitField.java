package org.apache.commons.lang3;

public class BitField {
    private final int _mask;
    private final int _shift_count;

    public BitField(int i) {
        int i2 = 0;
        this._mask = i;
        if (i != 0) {
            while ((i & 1) == 0) {
                i2++;
                i >>= 1;
            }
        }
        this._shift_count = i2;
    }

    public int clear(int i) {
        return (this._mask ^ -1) & i;
    }

    public byte clearByte(byte b) {
        return (byte) clear(b);
    }

    public short clearShort(short s) {
        return (short) clear(s);
    }

    public int getRawValue(int i) {
        return this._mask & i;
    }

    public short getShortRawValue(short s) {
        return (short) getRawValue(s);
    }

    public short getShortValue(short s) {
        return (short) getValue(s);
    }

    public int getValue(int i) {
        return getRawValue(i) >> this._shift_count;
    }

    public boolean isAllSet(int i) {
        return (this._mask & i) == this._mask;
    }

    public boolean isSet(int i) {
        return (this._mask & i) != 0;
    }

    public int set(int i) {
        return this._mask | i;
    }

    public int setBoolean(int i, boolean z) {
        return z ? set(i) : clear(i);
    }

    public byte setByte(byte b) {
        return (byte) set(b);
    }

    public byte setByteBoolean(byte b, boolean z) {
        return z ? setByte(b) : clearByte(b);
    }

    public short setShort(short s) {
        return (short) set(s);
    }

    public short setShortBoolean(short s, boolean z) {
        return z ? setShort(s) : clearShort(s);
    }

    public short setShortValue(short s, short s2) {
        return (short) setValue(s, s2);
    }

    public int setValue(int i, int i2) {
        return ((this._mask ^ -1) & i) | ((i2 << this._shift_count) & this._mask);
    }
}
