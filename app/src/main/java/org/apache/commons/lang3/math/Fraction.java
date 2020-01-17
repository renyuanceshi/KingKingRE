package org.apache.commons.lang3.math;

import java.math.BigInteger;
import org.linphone.CallerInfo;

public final class Fraction extends Number implements Comparable<Fraction> {
    public static final Fraction FOUR_FIFTHS = new Fraction(4, 5);
    public static final Fraction ONE = new Fraction(1, 1);
    public static final Fraction ONE_FIFTH = new Fraction(1, 5);
    public static final Fraction ONE_HALF = new Fraction(1, 2);
    public static final Fraction ONE_QUARTER = new Fraction(1, 4);
    public static final Fraction ONE_THIRD = new Fraction(1, 3);
    public static final Fraction THREE_FIFTHS = new Fraction(3, 5);
    public static final Fraction THREE_QUARTERS = new Fraction(3, 4);
    public static final Fraction TWO_FIFTHS = new Fraction(2, 5);
    public static final Fraction TWO_QUARTERS = new Fraction(2, 4);
    public static final Fraction TWO_THIRDS = new Fraction(2, 3);
    public static final Fraction ZERO = new Fraction(0, 1);
    private static final long serialVersionUID = 65382027393090L;
    private final int denominator;
    private transient int hashCode = 0;
    private final int numerator;
    private transient String toProperString = null;
    private transient String toString = null;

    private Fraction(int i, int i2) {
        this.numerator = i;
        this.denominator = i2;
    }

    private static int addAndCheck(int i, int i2) {
        long j = ((long) i) + ((long) i2);
        if (j >= -2147483648L && j <= 2147483647L) {
            return (int) j;
        }
        throw new ArithmeticException("overflow: add");
    }

    private Fraction addSub(Fraction fraction, boolean z) {
        if (fraction == null) {
            throw new IllegalArgumentException("The fraction must not be null");
        } else if (this.numerator == 0) {
            return z ? fraction : fraction.negate();
        } else {
            if (fraction.numerator == 0) {
                return this;
            }
            int greatestCommonDivisor = greatestCommonDivisor(this.denominator, fraction.denominator);
            if (greatestCommonDivisor == 1) {
                int mulAndCheck = mulAndCheck(this.numerator, fraction.denominator);
                int mulAndCheck2 = mulAndCheck(fraction.numerator, this.denominator);
                return new Fraction(z ? addAndCheck(mulAndCheck, mulAndCheck2) : subAndCheck(mulAndCheck, mulAndCheck2), mulPosAndCheck(this.denominator, fraction.denominator));
            }
            BigInteger multiply = BigInteger.valueOf((long) this.numerator).multiply(BigInteger.valueOf((long) (fraction.denominator / greatestCommonDivisor)));
            BigInteger multiply2 = BigInteger.valueOf((long) fraction.numerator).multiply(BigInteger.valueOf((long) (this.denominator / greatestCommonDivisor)));
            BigInteger add = z ? multiply.add(multiply2) : multiply.subtract(multiply2);
            int intValue = add.mod(BigInteger.valueOf((long) greatestCommonDivisor)).intValue();
            int greatestCommonDivisor2 = intValue == 0 ? greatestCommonDivisor : greatestCommonDivisor(intValue, greatestCommonDivisor);
            BigInteger divide = add.divide(BigInteger.valueOf((long) greatestCommonDivisor2));
            if (divide.bitLength() <= 31) {
                return new Fraction(divide.intValue(), mulPosAndCheck(this.denominator / greatestCommonDivisor, fraction.denominator / greatestCommonDivisor2));
            }
            throw new ArithmeticException("overflow: numerator too large after multiply");
        }
    }

    public static Fraction getFraction(double d) {
        int i = d < 0.0d ? -1 : 1;
        double abs = Math.abs(d);
        if (abs > 2.147483647E9d || Double.isNaN(abs)) {
            throw new ArithmeticException("The value must not be greater than Integer.MAX_VALUE or NaN");
        }
        int i2 = (int) abs;
        double d2 = abs - ((double) i2);
        int i3 = 0;
        int i4 = (int) d2;
        double d3 = d2 - ((double) i4);
        double d4 = Double.MAX_VALUE;
        int i5 = 1;
        double d5 = 1.0d;
        int i6 = 0;
        int i7 = 1;
        int i8 = 1;
        while (true) {
            int i9 = (int) (d5 / d3);
            int i10 = (i4 * i7) + i3;
            int i11 = (i4 * i6) + i8;
            double abs2 = Math.abs(d2 - (((double) i10) / ((double) i11)));
            double d6 = d5 - (((double) i9) * d3);
            i5++;
            if (d4 > abs2 && i11 <= 10000 && i11 > 0 && i5 < 25) {
                d4 = abs2;
                d5 = d3;
                i4 = i9;
                i8 = i6;
                i3 = i7;
                i6 = i11;
                i7 = i10;
                d3 = d6;
            }
        }
        if (i5 != 25) {
            return getReducedFraction(i * ((i2 * i6) + i7), i6);
        }
        throw new ArithmeticException("Unable to convert double to fraction");
    }

    public static Fraction getFraction(int i, int i2) {
        if (i2 == 0) {
            throw new ArithmeticException("The denominator must not be zero");
        }
        if (i2 < 0) {
            if (i == Integer.MIN_VALUE || i2 == Integer.MIN_VALUE) {
                throw new ArithmeticException("overflow: can't negate");
            }
            i = -i;
            i2 = -i2;
        }
        return new Fraction(i, i2);
    }

    public static Fraction getFraction(int i, int i2, int i3) {
        if (i3 == 0) {
            throw new ArithmeticException("The denominator must not be zero");
        } else if (i3 < 0) {
            throw new ArithmeticException("The denominator must not be negative");
        } else if (i2 < 0) {
            throw new ArithmeticException("The numerator must not be negative");
        } else {
            long j = i < 0 ? (((long) i) * ((long) i3)) - ((long) i2) : (((long) i) * ((long) i3)) + ((long) i2);
            if (j >= -2147483648L && j <= 2147483647L) {
                return new Fraction((int) j, i3);
            }
            throw new ArithmeticException("Numerator too large to represent as an Integer.");
        }
    }

    public static Fraction getFraction(String str) {
        if (str == null) {
            throw new IllegalArgumentException("The string must not be null");
        } else if (str.indexOf(46) >= 0) {
            return getFraction(Double.parseDouble(str));
        } else {
            int indexOf = str.indexOf(32);
            if (indexOf > 0) {
                int parseInt = Integer.parseInt(str.substring(0, indexOf));
                String substring = str.substring(indexOf + 1);
                int indexOf2 = substring.indexOf(47);
                if (indexOf2 >= 0) {
                    return getFraction(parseInt, Integer.parseInt(substring.substring(0, indexOf2)), Integer.parseInt(substring.substring(indexOf2 + 1)));
                }
                throw new NumberFormatException("The fraction could not be parsed as the format X Y/Z");
            }
            int indexOf3 = str.indexOf(47);
            return indexOf3 < 0 ? getFraction(Integer.parseInt(str), 1) : getFraction(Integer.parseInt(str.substring(0, indexOf3)), Integer.parseInt(str.substring(indexOf3 + 1)));
        }
    }

    public static Fraction getReducedFraction(int i, int i2) {
        int i3;
        int i4;
        int i5;
        if (i2 == 0) {
            throw new ArithmeticException("The denominator must not be zero");
        } else if (i == 0) {
            return ZERO;
        } else {
            if (i2 == Integer.MIN_VALUE && (i & 1) == 0) {
                i3 = i2 / 2;
                i4 = i / 2;
            } else {
                i3 = i2;
                i4 = i;
            }
            if (i3 >= 0) {
                i5 = i4;
            } else if (i4 == Integer.MIN_VALUE || i3 == Integer.MIN_VALUE) {
                throw new ArithmeticException("overflow: can't negate");
            } else {
                i3 = -i3;
                i5 = -i4;
            }
            int greatestCommonDivisor = greatestCommonDivisor(i5, i3);
            return new Fraction(i5 / greatestCommonDivisor, i3 / greatestCommonDivisor);
        }
    }

    private static int greatestCommonDivisor(int i, int i2) {
        int i3;
        int i4;
        int i5;
        if (i == 0 || i2 == 0) {
            if (i != Integer.MIN_VALUE && i2 != Integer.MIN_VALUE) {
                return Math.abs(i) + Math.abs(i2);
            }
            throw new ArithmeticException("overflow: gcd is 2^31");
        } else if (Math.abs(i) == 1 || Math.abs(i2) == 1) {
            return 1;
        } else {
            int i6 = i > 0 ? -i : i;
            if (i2 > 0) {
                i2 = -i2;
            }
            int i7 = 0;
            int i8 = i2;
            while ((i6 & 1) == 0 && (i8 & 1) == 0 && i7 < 31) {
                i6 /= 2;
                i8 /= 2;
                i7++;
            }
            if (i7 == 31) {
                throw new ArithmeticException("overflow: gcd is 2^31");
            }
            if ((i6 & 1) == 1) {
                i4 = i8;
                i3 = i8;
            } else {
                i3 = -(i6 / 2);
                i4 = i8;
            }
            while (true) {
                if ((i3 & 1) == 0) {
                    i5 = i3 / 2;
                } else {
                    if (i3 > 0) {
                        i6 = -i3;
                    } else {
                        i4 = i3;
                    }
                    i5 = (i4 - i6) / 2;
                    if (i5 == 0) {
                        return (1 << i7) * (-i6);
                    }
                }
            }
        }
    }

    private static int mulAndCheck(int i, int i2) {
        long j = ((long) i) * ((long) i2);
        if (j >= -2147483648L && j <= 2147483647L) {
            return (int) j;
        }
        throw new ArithmeticException("overflow: mul");
    }

    private static int mulPosAndCheck(int i, int i2) {
        long j = ((long) i) * ((long) i2);
        if (j <= 2147483647L) {
            return (int) j;
        }
        throw new ArithmeticException("overflow: mulPos");
    }

    private static int subAndCheck(int i, int i2) {
        long j = ((long) i) - ((long) i2);
        if (j >= -2147483648L && j <= 2147483647L) {
            return (int) j;
        }
        throw new ArithmeticException("overflow: add");
    }

    public Fraction abs() {
        return this.numerator >= 0 ? this : negate();
    }

    public Fraction add(Fraction fraction) {
        return addSub(fraction, true);
    }

    public int compareTo(Fraction fraction) {
        if (this == fraction) {
            return 0;
        }
        if (this.numerator == fraction.numerator && this.denominator == fraction.denominator) {
            return 0;
        }
        long j = ((long) this.numerator) * ((long) fraction.denominator);
        long j2 = ((long) fraction.numerator) * ((long) this.denominator);
        if (j != j2) {
            return j < j2 ? -1 : 1;
        }
        return 0;
    }

    public Fraction divideBy(Fraction fraction) {
        if (fraction == null) {
            throw new IllegalArgumentException("The fraction must not be null");
        } else if (fraction.numerator != 0) {
            return multiplyBy(fraction.invert());
        } else {
            throw new ArithmeticException("The fraction to divide by must not be zero");
        }
    }

    public double doubleValue() {
        return ((double) this.numerator) / ((double) this.denominator);
    }

    public boolean equals(Object obj) {
        if (obj != this) {
            if (!(obj instanceof Fraction)) {
                return false;
            }
            Fraction fraction = (Fraction) obj;
            if (!(getNumerator() == fraction.getNumerator() && getDenominator() == fraction.getDenominator())) {
                return false;
            }
        }
        return true;
    }

    public float floatValue() {
        return ((float) this.numerator) / ((float) this.denominator);
    }

    public int getDenominator() {
        return this.denominator;
    }

    public int getNumerator() {
        return this.numerator;
    }

    public int getProperNumerator() {
        return Math.abs(this.numerator % this.denominator);
    }

    public int getProperWhole() {
        return this.numerator / this.denominator;
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = ((getNumerator() + 629) * 37) + getDenominator();
        }
        return this.hashCode;
    }

    public int intValue() {
        return this.numerator / this.denominator;
    }

    public Fraction invert() {
        if (this.numerator == 0) {
            throw new ArithmeticException("Unable to invert zero.");
        } else if (this.numerator != Integer.MIN_VALUE) {
            return this.numerator < 0 ? new Fraction(-this.denominator, -this.numerator) : new Fraction(this.denominator, this.numerator);
        } else {
            throw new ArithmeticException("overflow: can't negate numerator");
        }
    }

    public long longValue() {
        return ((long) this.numerator) / ((long) this.denominator);
    }

    public Fraction multiplyBy(Fraction fraction) {
        if (fraction == null) {
            throw new IllegalArgumentException("The fraction must not be null");
        } else if (this.numerator == 0 || fraction.numerator == 0) {
            return ZERO;
        } else {
            int greatestCommonDivisor = greatestCommonDivisor(this.numerator, fraction.denominator);
            int greatestCommonDivisor2 = greatestCommonDivisor(fraction.numerator, this.denominator);
            return getReducedFraction(mulAndCheck(this.numerator / greatestCommonDivisor, fraction.numerator / greatestCommonDivisor2), mulPosAndCheck(this.denominator / greatestCommonDivisor2, fraction.denominator / greatestCommonDivisor));
        }
    }

    public Fraction negate() {
        if (this.numerator != Integer.MIN_VALUE) {
            return new Fraction(-this.numerator, this.denominator);
        }
        throw new ArithmeticException("overflow: too large to negate");
    }

    public Fraction pow(int i) {
        if (i == 1) {
            return this;
        }
        if (i == 0) {
            return ONE;
        }
        if (i < 0) {
            return i == Integer.MIN_VALUE ? invert().pow(2).pow(-(i / 2)) : invert().pow(-i);
        }
        Fraction multiplyBy = multiplyBy(this);
        return i % 2 == 0 ? multiplyBy.pow(i / 2) : multiplyBy.pow(i / 2).multiplyBy(this);
    }

    public Fraction reduce() {
        if (this.numerator == 0) {
            return equals(ZERO) ? this : ZERO;
        }
        int greatestCommonDivisor = greatestCommonDivisor(Math.abs(this.numerator), this.denominator);
        return greatestCommonDivisor != 1 ? getFraction(this.numerator / greatestCommonDivisor, this.denominator / greatestCommonDivisor) : this;
    }

    public Fraction subtract(Fraction fraction) {
        return addSub(fraction, false);
    }

    public String toProperString() {
        if (this.toProperString == null) {
            if (this.numerator == 0) {
                this.toProperString = "0";
            } else if (this.numerator == this.denominator) {
                this.toProperString = "1";
            } else if (this.numerator == this.denominator * -1) {
                this.toProperString = CallerInfo.UNKNOWN_NUMBER;
            } else {
                if ((this.numerator > 0 ? -this.numerator : this.numerator) < (-this.denominator)) {
                    int properNumerator = getProperNumerator();
                    if (properNumerator == 0) {
                        this.toProperString = Integer.toString(getProperWhole());
                    } else {
                        this.toProperString = new StringBuilder(32).append(getProperWhole()).append(' ').append(properNumerator).append('/').append(getDenominator()).toString();
                    }
                } else {
                    this.toProperString = new StringBuilder(32).append(getNumerator()).append('/').append(getDenominator()).toString();
                }
            }
        }
        return this.toProperString;
    }

    public String toString() {
        if (this.toString == null) {
            this.toString = new StringBuilder(32).append(getNumerator()).append('/').append(getDenominator()).toString();
        }
        return this.toString;
    }
}
