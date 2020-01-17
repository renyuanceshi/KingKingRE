package org.apache.commons.lang3.tuple;

import java.io.Serializable;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.builder.CompareToBuilder;

public abstract class Triple<L, M, R> implements Comparable<Triple<L, M, R>>, Serializable {
    private static final long serialVersionUID = 1;

    public static <L, M, R> Triple<L, M, R> of(L l, M m, R r) {
        return new ImmutableTriple(l, m, r);
    }

    public int compareTo(Triple<L, M, R> triple) {
        return new CompareToBuilder().append(getLeft(), (Object) triple.getLeft()).append(getMiddle(), (Object) triple.getMiddle()).append(getRight(), (Object) triple.getRight()).toComparison();
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Triple)) {
            return false;
        }
        Triple triple = (Triple) obj;
        return ObjectUtils.equals(getLeft(), triple.getLeft()) && ObjectUtils.equals(getMiddle(), triple.getMiddle()) && ObjectUtils.equals(getRight(), triple.getRight());
    }

    public abstract L getLeft();

    public abstract M getMiddle();

    public abstract R getRight();

    public int hashCode() {
        int i = 0;
        int hashCode = getLeft() == null ? 0 : getLeft().hashCode();
        int hashCode2 = getMiddle() == null ? 0 : getMiddle().hashCode();
        if (getRight() != null) {
            i = getRight().hashCode();
        }
        return (hashCode ^ hashCode2) ^ i;
    }

    public String toString() {
        return new StringBuilder().append('(').append(getLeft()).append(',').append(getMiddle()).append(',').append(getRight()).append(')').toString();
    }

    public String toString(String str) {
        return String.format(str, new Object[]{getLeft(), getMiddle(), getRight()});
    }
}
