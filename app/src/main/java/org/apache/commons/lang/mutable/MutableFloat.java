package org.apache.commons.lang.mutable;

import org.apache.commons.lang.math.NumberUtils;

public class MutableFloat extends Number implements Comparable, Mutable {
    private static final long serialVersionUID = 5787169186L;
    private float value;

    public MutableFloat() {
    }

    public MutableFloat(float f) {
        this.value = f;
    }

    public MutableFloat(Number number) {
        this.value = number.floatValue();
    }

    public MutableFloat(String str) throws NumberFormatException {
        this.value = Float.parseFloat(str);
    }

    public void add(float f) {
        this.value += f;
    }

    public void add(Number number) {
        this.value += number.floatValue();
    }

    public int compareTo(Object obj) {
        return NumberUtils.compare(this.value, ((MutableFloat) obj).value);
    }

    public void decrement() {
        this.value -= 1.0f;
    }

    public double doubleValue() {
        return (double) this.value;
    }

    public boolean equals(Object obj) {
        return (obj instanceof MutableFloat) && Float.floatToIntBits(((MutableFloat) obj).value) == Float.floatToIntBits(this.value);
    }

    public float floatValue() {
        return this.value;
    }

    public Object getValue() {
        return new Float(this.value);
    }

    public int hashCode() {
        return Float.floatToIntBits(this.value);
    }

    public void increment() {
        this.value += 1.0f;
    }

    public int intValue() {
        return (int) this.value;
    }

    public boolean isInfinite() {
        return Float.isInfinite(this.value);
    }

    public boolean isNaN() {
        return Float.isNaN(this.value);
    }

    public long longValue() {
        return (long) this.value;
    }

    public void setValue(float f) {
        this.value = f;
    }

    public void setValue(Object obj) {
        setValue(((Number) obj).floatValue());
    }

    public void subtract(float f) {
        this.value -= f;
    }

    public void subtract(Number number) {
        this.value -= number.floatValue();
    }

    public Float toFloat() {
        return new Float(floatValue());
    }

    public String toString() {
        return String.valueOf(this.value);
    }
}
