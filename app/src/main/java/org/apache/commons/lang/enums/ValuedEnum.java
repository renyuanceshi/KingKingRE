package org.apache.commons.lang.enums;

import java.lang.reflect.InvocationTargetException;
import org.apache.commons.lang.ClassUtils;

public abstract class ValuedEnum extends Enum {
    private static final long serialVersionUID = -7129650521543789085L;
    private final int iValue;

    protected ValuedEnum(String str, int i) {
        super(str);
        this.iValue = i;
    }

    protected static Enum getEnum(Class cls, int i) {
        if (cls == null) {
            throw new IllegalArgumentException("The Enum Class must not be null");
        }
        for (ValuedEnum valuedEnum : Enum.getEnumList(cls)) {
            if (valuedEnum.getValue() == i) {
                return valuedEnum;
            }
        }
        return null;
    }

    private int getValueInOtherClassLoader(Object obj) {
        try {
            return ((Integer) obj.getClass().getMethod("getValue", (Class[]) null).invoke(obj, (Object[]) null)).intValue();
        } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException e) {
            throw new IllegalStateException("This should not happen");
        }
    }

    public int compareTo(Object obj) {
        if (obj == this) {
            return 0;
        }
        if (obj.getClass() == getClass()) {
            return this.iValue - ((ValuedEnum) obj).iValue;
        }
        if (obj.getClass().getName().equals(getClass().getName())) {
            return this.iValue - getValueInOtherClassLoader(obj);
        }
        throw new ClassCastException(new StringBuffer().append("Different enum class '").append(ClassUtils.getShortClassName((Class) obj.getClass())).append("'").toString());
    }

    public final int getValue() {
        return this.iValue;
    }

    public String toString() {
        if (this.iToString == null) {
            this.iToString = new StringBuffer().append(ClassUtils.getShortClassName(getEnumClass())).append("[").append(getName()).append("=").append(getValue()).append("]").toString();
        }
        return this.iToString;
    }
}
