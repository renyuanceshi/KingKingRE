package org.apache.commons.lang.math;

import java.io.Serializable;

public final class IntRange extends Range implements Serializable {
    private static final long serialVersionUID = 71849363892730L;
    private transient int hashCode = 0;
    private final int max;
    private transient Integer maxObject = null;
    private final int min;
    private transient Integer minObject = null;
    private transient String toString = null;

    public IntRange(int i) {
        this.min = i;
        this.max = i;
    }

    public IntRange(int i, int i2) {
        if (i2 < i) {
            this.min = i2;
            this.max = i;
            return;
        }
        this.min = i;
        this.max = i2;
    }

    public IntRange(Number number) {
        if (number == null) {
            throw new IllegalArgumentException("The number must not be null");
        }
        this.min = number.intValue();
        this.max = number.intValue();
        if (number instanceof Integer) {
            this.minObject = (Integer) number;
            this.maxObject = (Integer) number;
        }
    }

    public IntRange(Number number, Number number2) {
        if (number == null || number2 == null) {
            throw new IllegalArgumentException("The numbers must not be null");
        }
        int intValue = number.intValue();
        int intValue2 = number2.intValue();
        if (intValue2 < intValue) {
            this.min = intValue2;
            this.max = intValue;
            if (number2 instanceof Integer) {
                this.minObject = (Integer) number2;
            }
            if (number instanceof Integer) {
                this.maxObject = (Integer) number;
                return;
            }
            return;
        }
        this.min = intValue;
        this.max = intValue2;
        if (number instanceof Integer) {
            this.minObject = (Integer) number;
        }
        if (number2 instanceof Integer) {
            this.maxObject = (Integer) number2;
        }
    }

    public boolean containsInteger(int i) {
        return i >= this.min && i <= this.max;
    }

    public boolean containsNumber(Number number) {
        if (number == null) {
            return false;
        }
        return containsInteger(number.intValue());
    }

    public boolean containsRange(Range range) {
        return range != null && containsInteger(range.getMinimumInteger()) && containsInteger(range.getMaximumInteger());
    }

    public boolean equals(Object obj) {
        if (obj != this) {
            if (!(obj instanceof IntRange)) {
                return false;
            }
            IntRange intRange = (IntRange) obj;
            if (!(this.min == intRange.min && this.max == intRange.max)) {
                return false;
            }
        }
        return true;
    }

    public double getMaximumDouble() {
        return (double) this.max;
    }

    public float getMaximumFloat() {
        return (float) this.max;
    }

    public int getMaximumInteger() {
        return this.max;
    }

    public long getMaximumLong() {
        return (long) this.max;
    }

    public Number getMaximumNumber() {
        if (this.maxObject == null) {
            this.maxObject = new Integer(this.max);
        }
        return this.maxObject;
    }

    public double getMinimumDouble() {
        return (double) this.min;
    }

    public float getMinimumFloat() {
        return (float) this.min;
    }

    public int getMinimumInteger() {
        return this.min;
    }

    public long getMinimumLong() {
        return (long) this.min;
    }

    public Number getMinimumNumber() {
        if (this.minObject == null) {
            this.minObject = new Integer(this.min);
        }
        return this.minObject;
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = 17;
            this.hashCode = (this.hashCode * 37) + getClass().hashCode();
            this.hashCode = (this.hashCode * 37) + this.min;
            this.hashCode = (this.hashCode * 37) + this.max;
        }
        return this.hashCode;
    }

    public boolean overlapsRange(Range range) {
        if (range == null) {
            return false;
        }
        return range.containsInteger(this.min) || range.containsInteger(this.max) || containsInteger(range.getMinimumInteger());
    }

    public int[] toArray() {
        int[] iArr = new int[((this.max - this.min) + 1)];
        for (int i = 0; i < iArr.length; i++) {
            iArr[i] = this.min + i;
        }
        return iArr;
    }

    public String toString() {
        if (this.toString == null) {
            StringBuffer stringBuffer = new StringBuffer(32);
            stringBuffer.append("Range[");
            stringBuffer.append(this.min);
            stringBuffer.append(',');
            stringBuffer.append(this.max);
            stringBuffer.append(']');
            this.toString = stringBuffer.toString();
        }
        return this.toString;
    }
}
