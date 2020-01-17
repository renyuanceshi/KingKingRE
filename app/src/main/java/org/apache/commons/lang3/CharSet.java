package org.apache.commons.lang3;

import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class CharSet implements Serializable {
    public static final CharSet ASCII_ALPHA = new CharSet("a-zA-Z");
    public static final CharSet ASCII_ALPHA_LOWER = new CharSet("a-z");
    public static final CharSet ASCII_ALPHA_UPPER = new CharSet("A-Z");
    public static final CharSet ASCII_NUMERIC = new CharSet("0-9");
    protected static final Map<String, CharSet> COMMON = Collections.synchronizedMap(new HashMap());
    public static final CharSet EMPTY = new CharSet(null);
    private static final long serialVersionUID = 5947847346149275958L;
    private final Set<CharRange> set = Collections.synchronizedSet(new HashSet());

    static {
        COMMON.put((Object) null, EMPTY);
        COMMON.put("", EMPTY);
        COMMON.put("a-zA-Z", ASCII_ALPHA);
        COMMON.put("A-Za-z", ASCII_ALPHA);
        COMMON.put("a-z", ASCII_ALPHA_LOWER);
        COMMON.put("A-Z", ASCII_ALPHA_UPPER);
        COMMON.put("0-9", ASCII_NUMERIC);
    }

    protected CharSet(String... strArr) {
        for (String add : strArr) {
            add(add);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:4:0x0008, code lost:
        r0 = COMMON.get(r2[0]);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static org.apache.commons.lang3.CharSet getInstance(java.lang.String... r2) {
        /*
            if (r2 != 0) goto L_0x0004
            r0 = 0
        L_0x0003:
            return r0
        L_0x0004:
            int r0 = r2.length
            r1 = 1
            if (r0 != r1) goto L_0x0015
            java.util.Map<java.lang.String, org.apache.commons.lang3.CharSet> r0 = COMMON
            r1 = 0
            r1 = r2[r1]
            java.lang.Object r0 = r0.get(r1)
            org.apache.commons.lang3.CharSet r0 = (org.apache.commons.lang3.CharSet) r0
            if (r0 != 0) goto L_0x0003
        L_0x0015:
            org.apache.commons.lang3.CharSet r0 = new org.apache.commons.lang3.CharSet
            r0.<init>(r2)
            goto L_0x0003
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.CharSet.getInstance(java.lang.String[]):org.apache.commons.lang3.CharSet");
    }

    /* access modifiers changed from: protected */
    public void add(String str) {
        if (str != null) {
            int length = str.length();
            int i = 0;
            while (i < length) {
                int i2 = length - i;
                if (i2 >= 4 && str.charAt(i) == '^' && str.charAt(i + 2) == '-') {
                    this.set.add(CharRange.isNotIn(str.charAt(i + 1), str.charAt(i + 3)));
                    i += 4;
                } else if (i2 >= 3 && str.charAt(i + 1) == '-') {
                    this.set.add(CharRange.isIn(str.charAt(i), str.charAt(i + 2)));
                    i += 3;
                } else if (i2 < 2 || str.charAt(i) != '^') {
                    this.set.add(CharRange.is(str.charAt(i)));
                    i++;
                } else {
                    this.set.add(CharRange.isNot(str.charAt(i + 1)));
                    i += 2;
                }
            }
        }
    }

    public boolean contains(char c) {
        for (CharRange contains : this.set) {
            if (contains.contains(c)) {
                return true;
            }
        }
        return false;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof CharSet)) {
            return false;
        }
        return this.set.equals(((CharSet) obj).set);
    }

    /* access modifiers changed from: package-private */
    public CharRange[] getCharRanges() {
        return (CharRange[]) this.set.toArray(new CharRange[this.set.size()]);
    }

    public int hashCode() {
        return this.set.hashCode() + 89;
    }

    public String toString() {
        return this.set.toString();
    }
}