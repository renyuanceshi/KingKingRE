package org.apache.http.client.utils;

import org.apache.http.annotation.Immutable;

@Immutable
public class Punycode {
    private static final Idn impl;

    static {
        Idn rfc3492Idn;
        try {
            rfc3492Idn = new JdkIdn();
        } catch (Exception e) {
            rfc3492Idn = new Rfc3492Idn();
        }
        impl = rfc3492Idn;
    }

    public static String toUnicode(String str) {
        return impl.toUnicode(str);
    }
}
