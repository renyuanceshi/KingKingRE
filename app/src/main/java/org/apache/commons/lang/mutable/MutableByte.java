package org.apache.commons.lang.mutable;

public class MutableByte extends Number implements Comparable, Mutable {
    private static final long serialVersionUID = -1585823265;
    private byte value;

    public MutableByte() {
    }

    public MutableByte(byte b) {
        this.value = (byte) b;
    }

    public MutableByte(Number number) {
        this.value = number.byteValue();
    }

    public MutableByte(String str) throws NumberFormatException {
        this.value = Byte.parseByte(str);
    }

    public void add(byte b) {
        this.value = (byte) ((byte) (this.value + b));
    }

    public void add(Number number) {
        this.value = (byte) ((byte) (this.value + number.byteValue()));
    }

    public byte byteValue() {
        return this.value;
    }

    public int compareTo(Object obj) {
        byte b = ((MutableByte) obj).value;
        if (this.value < b) {
            return -1;
        }
        return this.value == b ? 0 : 1;
    }

    public void decrement() {
        this.value = (byte) ((byte) (this.value - 1));
    }

    public double doubleValue() {
        return (double) this.value;
    }

    public boolean equals(Object obj) {
        return (obj instanceof MutableByte) && this.value == ((MutableByte) obj).byteValue();
    }

    public float floatValue() {
        return (float) this.value;
    }

    public Object getValue() {
        return new Byte(this.value);
    }

    public int hashCode() {
        return this.value;
    }

    public void increment() {
        this.value = (byte) ((byte) (this.value + 1));
    }

    public int intValue() {
        return this.value;
    }

    public long longValue() {
        return (long) this.value;
    }

    public void setValue(byte b) {
        this.value = (byte) b;
    }

    public void setValue(Object obj) {
        setValue(((Number) obj).byteValue());
    }

    public void subtract(byte b) {
        this.value = (byte) ((byte) (this.value - b));
    }

    public void subtract(Number number) {
        this.value = (byte) ((byte) (this.value - number.byteValue()));
    }

    public Byte toByte() {
        return new Byte(byteValue());
    }

    public String toString() {
        return String.valueOf(this.value);
    }
}
