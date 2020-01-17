package org.apache.commons.lang.mutable;

import java.io.Serializable;
import org.apache.commons.lang.BooleanUtils;

public class MutableBoolean implements Mutable, Serializable, Comparable {
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

    public int compareTo(Object obj) {
        if (this.value == ((MutableBoolean) obj).value) {
            return 0;
        }
        return this.value ? 1 : -1;
    }

    public boolean equals(Object obj) {
        return (obj instanceof MutableBoolean) && this.value == ((MutableBoolean) obj).booleanValue();
    }

    public Object getValue() {
        return BooleanUtils.toBooleanObject(this.value);
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

    public void setValue(Object obj) {
        setValue(((Boolean) obj).booleanValue());
    }

    public void setValue(boolean z) {
        this.value = z;
    }

    public Boolean toBoolean() {
        return BooleanUtils.toBooleanObject(this.value);
    }

    public String toString() {
        return String.valueOf(this.value);
    }
}
