package org.apache.commons.lang.mutable;

public class MutableLong extends Number implements Comparable, Mutable {
    private static final long serialVersionUID = 62986528375L;
    private long value;

    public MutableLong() {
    }

    public MutableLong(long j) {
        this.value = j;
    }

    public MutableLong(Number number) {
        this.value = number.longValue();
    }

    public MutableLong(String str) throws NumberFormatException {
        this.value = Long.parseLong(str);
    }

    public void add(long j) {
        this.value += j;
    }

    public void add(Number number) {
        this.value += number.longValue();
    }

    public int compareTo(Object obj) {
        long j = ((MutableLong) obj).value;
        if (this.value < j) {
            return -1;
        }
        return this.value == j ? 0 : 1;
    }

    public void decrement() {
        this.value--;
    }

    public double doubleValue() {
        return (double) this.value;
    }

    public boolean equals(Object obj) {
        return (obj instanceof MutableLong) && this.value == ((MutableLong) obj).longValue();
    }

    public float floatValue() {
        return (float) this.value;
    }

    public Object getValue() {
        return new Long(this.value);
    }

    public int hashCode() {
        return (int) (this.value ^ (this.value >>> 32));
    }

    public void increment() {
        this.value++;
    }

    public int intValue() {
        return (int) this.value;
    }

    public long longValue() {
        return this.value;
    }

    public void setValue(long j) {
        this.value = j;
    }

    public void setValue(Object obj) {
        setValue(((Number) obj).longValue());
    }

    public void subtract(long j) {
        this.value -= j;
    }

    public void subtract(Number number) {
        this.value -= number.longValue();
    }

    public Long toLong() {
        return new Long(longValue());
    }

    public String toString() {
        return String.valueOf(this.value);
    }
}
