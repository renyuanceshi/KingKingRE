package org.apache.commons.lang.mutable;

public class MutableShort extends Number implements Comparable, Mutable {
    private static final long serialVersionUID = -2135791679;
    private short value;

    public MutableShort() {
    }

    public MutableShort(Number number) {
        this.value = number.shortValue();
    }

    public MutableShort(String str) throws NumberFormatException {
        this.value = Short.parseShort(str);
    }

    public MutableShort(short s) {
        this.value = (short) s;
    }

    public void add(Number number) {
        this.value = (short) ((short) (this.value + number.shortValue()));
    }

    public void add(short s) {
        this.value = (short) ((short) (this.value + s));
    }

    public int compareTo(Object obj) {
        short s = ((MutableShort) obj).value;
        if (this.value < s) {
            return -1;
        }
        return this.value == s ? 0 : 1;
    }

    public void decrement() {
        this.value = (short) ((short) (this.value - 1));
    }

    public double doubleValue() {
        return (double) this.value;
    }

    public boolean equals(Object obj) {
        return (obj instanceof MutableShort) && this.value == ((MutableShort) obj).shortValue();
    }

    public float floatValue() {
        return (float) this.value;
    }

    public Object getValue() {
        return new Short(this.value);
    }

    public int hashCode() {
        return this.value;
    }

    public void increment() {
        this.value = (short) ((short) (this.value + 1));
    }

    public int intValue() {
        return this.value;
    }

    public long longValue() {
        return (long) this.value;
    }

    public void setValue(Object obj) {
        setValue(((Number) obj).shortValue());
    }

    public void setValue(short s) {
        this.value = (short) s;
    }

    public short shortValue() {
        return this.value;
    }

    public void subtract(Number number) {
        this.value = (short) ((short) (this.value - number.shortValue()));
    }

    public void subtract(short s) {
        this.value = (short) ((short) (this.value - s));
    }

    public Short toShort() {
        return new Short(shortValue());
    }

    public String toString() {
        return String.valueOf(this.value);
    }
}
