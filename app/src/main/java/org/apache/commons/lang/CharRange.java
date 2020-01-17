package org.apache.commons.lang;

import java.io.Serializable;
import java.util.Iterator;
import java.util.NoSuchElementException;

public final class CharRange implements Serializable {
    private static final long serialVersionUID = 8270183163158333422L;
    private final char end;
    private transient String iToString;
    private final boolean negated;
    private final char start;

    /* renamed from: org.apache.commons.lang.CharRange$1  reason: invalid class name */
    static class AnonymousClass1 {
    }

    private static class CharacterIterator implements Iterator {
        private char current;
        private boolean hasNext;
        private CharRange range;

        private CharacterIterator(CharRange charRange) {
            this.range = charRange;
            this.hasNext = true;
            if (!CharRange.access$100(this.range)) {
                this.current = CharRange.access$200(this.range);
            } else if (CharRange.access$200(this.range) != 0) {
                this.current = (char) 0;
            } else if (CharRange.access$300(this.range) == 65535) {
                this.hasNext = false;
            } else {
                this.current = (char) ((char) (CharRange.access$300(this.range) + 1));
            }
        }

        CharacterIterator(CharRange charRange, AnonymousClass1 r2) {
            this(charRange);
        }

        private void prepareNext() {
            if (CharRange.access$100(this.range)) {
                if (this.current == 65535) {
                    this.hasNext = false;
                } else if (this.current + 1 != CharRange.access$200(this.range)) {
                    this.current = (char) ((char) (this.current + 1));
                } else if (CharRange.access$300(this.range) == 65535) {
                    this.hasNext = false;
                } else {
                    this.current = (char) ((char) (CharRange.access$300(this.range) + 1));
                }
            } else if (this.current < CharRange.access$300(this.range)) {
                this.current = (char) ((char) (this.current + 1));
            } else {
                this.hasNext = false;
            }
        }

        public boolean hasNext() {
            return this.hasNext;
        }

        public Object next() {
            if (!this.hasNext) {
                throw new NoSuchElementException();
            }
            char c = this.current;
            prepareNext();
            return new Character(c);
        }

        public void remove() {
            throw new UnsupportedOperationException();
        }
    }

    public CharRange(char c) {
        this(c, c, false);
    }

    public CharRange(char c, char c2) {
        this(c, c2, false);
    }

    public CharRange(char c, char c2, boolean z) {
        char c3;
        char c4;
        if (c > c2) {
            c3 = c;
            c4 = c2;
        } else {
            c3 = c2;
            c4 = c;
        }
        this.start = (char) c4;
        this.end = (char) c3;
        this.negated = z;
    }

    public CharRange(char c, boolean z) {
        this(c, c, z);
    }

    static boolean access$100(CharRange charRange) {
        return charRange.negated;
    }

    static char access$200(CharRange charRange) {
        return charRange.start;
    }

    static char access$300(CharRange charRange) {
        return charRange.end;
    }

    public static CharRange is(char c) {
        return new CharRange(c, c, false);
    }

    public static CharRange isIn(char c, char c2) {
        return new CharRange(c, c2, false);
    }

    public static CharRange isNot(char c) {
        return new CharRange(c, c, true);
    }

    public static CharRange isNotIn(char c, char c2) {
        return new CharRange(c, c2, true);
    }

    public boolean contains(char c) {
        return (c >= this.start && c <= this.end) != this.negated;
    }

    public boolean contains(CharRange charRange) {
        if (charRange != null) {
            return this.negated ? charRange.negated ? this.start >= charRange.start && this.end <= charRange.end : charRange.end < this.start || charRange.start > this.end : charRange.negated ? this.start == 0 && this.end == 65535 : this.start <= charRange.start && this.end >= charRange.end;
        }
        throw new IllegalArgumentException("The Range must not be null");
    }

    public boolean equals(Object obj) {
        if (obj != this) {
            if (!(obj instanceof CharRange)) {
                return false;
            }
            CharRange charRange = (CharRange) obj;
            if (!(this.start == charRange.start && this.end == charRange.end && this.negated == charRange.negated)) {
                return false;
            }
        }
        return true;
    }

    public char getEnd() {
        return this.end;
    }

    public char getStart() {
        return this.start;
    }

    public int hashCode() {
        return (this.negated ? 1 : 0) + this.start + 'S' + (this.end * 7);
    }

    public boolean isNegated() {
        return this.negated;
    }

    public Iterator iterator() {
        return new CharacterIterator(this, (AnonymousClass1) null);
    }

    public String toString() {
        if (this.iToString == null) {
            StringBuffer stringBuffer = new StringBuffer(4);
            if (isNegated()) {
                stringBuffer.append('^');
            }
            stringBuffer.append(this.start);
            if (this.start != this.end) {
                stringBuffer.append('-');
                stringBuffer.append(this.end);
            }
            this.iToString = stringBuffer.toString();
        }
        return this.iToString;
    }
}
