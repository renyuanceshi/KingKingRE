package org.apache.commons.lang;

public class IllegalClassException extends IllegalArgumentException {
    private static final long serialVersionUID = 8063272569377254819L;

    public IllegalClassException(Class cls, Class cls2) {
        super(new StringBuffer().append("Expected: ").append(safeGetClassName(cls)).append(", actual: ").append(safeGetClassName(cls2)).toString());
    }

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public IllegalClassException(Class cls, Object obj) {
        super(new StringBuffer().append("Expected: ").append(safeGetClassName(cls)).append(", actual: ").append(obj == null ? "null" : obj.getClass().getName()).toString());
    }

    public IllegalClassException(String str) {
        super(str);
    }

    private static final String safeGetClassName(Class cls) {
        if (cls == null) {
            return null;
        }
        return cls.getName();
    }
}
