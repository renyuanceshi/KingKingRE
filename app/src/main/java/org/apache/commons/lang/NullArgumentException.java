package org.apache.commons.lang;

public class NullArgumentException extends IllegalArgumentException {
    private static final long serialVersionUID = 1174360235354917591L;

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public NullArgumentException(String str) {
        super(new StringBuffer().append(str == null ? "Argument" : str).append(" must not be null.").toString());
    }
}
