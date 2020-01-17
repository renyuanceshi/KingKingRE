package org.apache.commons.lang.mutable;

import org.apache.commons.lang.math.NumberUtils;

public class MutableDouble extends Number implements Comparable, Mutable {
    private static final long serialVersionUID = 1587163916;
    private double value;

    public MutableDouble() {
    }

    public MutableDouble(double d) {
        this.value = d;
    }

    public MutableDouble(Number number) {
        this.value = number.doubleValue();
    }

    public MutableDouble(String str) throws NumberFormatException {
        this.value = Double.parseDouble(str);
    }

    public void add(double d) {
        this.value += d;
    }

    public void add(Number number) {
        this.value += number.doubleValue();
    }

    public int compareTo(Object obj) {
        return NumberUtils.compare(this.value, ((MutableDouble) obj).value);
    }

    public void decrement() {
        this.value -= 1.0d;
    }

    public double doubleValue() {
        return this.value;
    }

    public boolean equals(Object obj) {
        return (obj instanceof MutableDouble) && Double.doubleToLongBits(((MutableDouble) obj).value) == Double.doubleToLongBits(this.value);
    }

    public float floatValue() {
        return (float) this.value;
    }

    public Object getValue() {
        return new Double(this.value);
    }

    public int hashCode() {
        long doubleToLongBits = Double.doubleToLongBits(this.value);
        return (int) (doubleToLongBits ^ (doubleToLongBits >>> 32));
    }

    public void increment() {
        this.value += 1.0d;
    }

    public int intValue() {
        return (int) this.value;
    }

    public boolean isInfinite() {
        return Double.isInfinite(this.value);
    }

    public boolean isNaN() {
        return Double.isNaN(this.value);
    }

    public long longValue() {
        return (long) this.value;
    }

    public void setValue(double d) {
        this.value = d;
    }

    public void setValue(Object obj) {
        setValue(((Number) obj).doubleValue());
    }

    public void subtract(double d) {
        this.value -= d;
    }

    public void subtract(Number number) {
        this.value -= number.doubleValue();
    }

    public Double toDouble() {
        return new Double(doubleValue());
    }

    public String toString() {
        return String.valueOf(this.value);
    }
}
