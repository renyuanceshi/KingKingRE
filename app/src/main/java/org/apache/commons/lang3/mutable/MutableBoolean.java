package org.apache.commons.lang3.mutable;

import java.io.Serializable;

public class MutableBoolean implements Mutable<Boolean>, Serializable, Comparable<MutableBoolean> {
    private static final long serialVersionUID = -4830728138360036487L;
    private boolean value;

    public MutableBoolean() {
    }

    public MutableBoolean(Boolean bool) {
        this.value = bool.booleanValue();
    }

    public MutableBoolean(boolean z) {
        this.value = z;
    }

    public boolean booleanValue() {
        return this.value;
    }

    public int compareTo(MutableBoolean mutableBoolean) {
        if (this.value == mutableBoolean.value) {
            return 0;
        }
        return this.value ? 1 : -1;
    }

    public boolean equals(Object obj) {
        return (obj instanceof MutableBoolean) && this.value == ((MutableBoolean) obj).booleanValue();
    }

    public Boolean getValue() {
        return Boolean.valueOf(this.value);
    }

    public int hashCode() {
        return this.value ? Boolean.TRUE.hashCode() : Boolean.FALSE.hashCode();
    }

    public boolean isFalse() {
        return !this.value;
    }

    public boolean isTrue() {
        return this.value;
    }

    public void setValue(Boolean bool) {
        this.value = bool.booleanValue();
    }

    public void setValue(boolean z) {
        this.value = z;
    }

    public Boolean toBoolean() {
        return Boolean.valueOf(booleanValue());
    }

    public String toString() {
        return String.valueOf(this.value);
    }
}
