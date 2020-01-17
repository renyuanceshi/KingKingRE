package org.apache.commons.lang.mutable;

import java.io.Serializable;

public class MutableObject implements Mutable, Serializable {
    private static final long serialVersionUID = 86241875189L;
    private Object value;

    public MutableObject() {
    }

    public MutableObject(Object obj) {
        this.value = obj;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof MutableObject)) {
            return false;
        }
        Object obj2 = ((MutableObject) obj).value;
        return this.value == obj2 || (this.value != null && this.value.equals(obj2));
    }

    public Object getValue() {
        return this.value;
    }

    public int hashCode() {
        if (this.value == null) {
            return 0;
        }
        return this.value.hashCode();
    }

    public void setValue(Object obj) {
        this.value = obj;
    }

    public String toString() {
        return this.value == null ? "null" : this.value.toString();
    }
}
