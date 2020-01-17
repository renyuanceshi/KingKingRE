package org.apache.commons.lang.reflect;

import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.ClassUtils;
import org.apache.commons.lang.SystemUtils;

abstract class MemberUtils {
    private static final int ACCESS_TEST = 7;
    private static final Method IS_SYNTHETIC;
    private static final Class[] ORDERED_PRIMITIVE_TYPES = {Byte.TYPE, Short.TYPE, Character.TYPE, Integer.TYPE, Long.TYPE, Float.TYPE, Double.TYPE};
    static Class class$java$lang$reflect$Member;

    static {
        Class cls;
        Method method = null;
        if (SystemUtils.isJavaVersionAtLeast(1.5f)) {
            try {
                if (class$java$lang$reflect$Member == null) {
                    cls = class$("java.lang.reflect.Member");
                    class$java$lang$reflect$Member = cls;
                } else {
                    cls = class$java$lang$reflect$Member;
                }
                method = cls.getMethod("isSynthetic", ArrayUtils.EMPTY_CLASS_ARRAY);
            } catch (Exception e) {
            }
        }
        IS_SYNTHETIC = method;
    }

    MemberUtils() {
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError(e.getMessage());
        }
    }

    static int compareParameterTypes(Class[] clsArr, Class[] clsArr2, Class[] clsArr3) {
        float totalTransformationCost = getTotalTransformationCost(clsArr3, clsArr);
        float totalTransformationCost2 = getTotalTransformationCost(clsArr3, clsArr2);
        if (totalTransformationCost < totalTransformationCost2) {
            return -1;
        }
        return totalTransformationCost2 < totalTransformationCost ? 1 : 0;
    }

    private static float getObjectTransformationCost(Class cls, Class cls2) {
        if (cls2.isPrimitive()) {
            return getPrimitivePromotionCost(cls, cls2);
        }
        float f = 0.0f;
        while (true) {
            if (cls2 != null && !cls2.equals(cls)) {
                if (cls2.isInterface() && ClassUtils.isAssignable(cls, cls2)) {
                    f += 0.25f;
                    break;
                }
                f += 1.0f;
                cls2 = cls2.getSuperclass();
            } else {
                break;
            }
        }
        return cls2 == null ? f + 1.5f : f;
    }

    private static float getPrimitivePromotionCost(Class cls, Class cls2) {
        Class cls3;
        float f = 0.0f;
        if (!cls.isPrimitive()) {
            f = 0.0f + 0.1f;
            cls = ClassUtils.wrapperToPrimitive(cls);
        }
        int i = 0;
        float f2 = f;
        Class cls4 = cls;
        while (cls4 != cls2 && i < ORDERED_PRIMITIVE_TYPES.length) {
            if (cls4 == ORDERED_PRIMITIVE_TYPES[i]) {
                f2 += 0.1f;
                if (i < ORDERED_PRIMITIVE_TYPES.length - 1) {
                    cls3 = ORDERED_PRIMITIVE_TYPES[i + 1];
                    i++;
                    cls4 = cls3;
                }
            }
            cls3 = cls4;
            i++;
            cls4 = cls3;
        }
        return f2;
    }

    private static float getTotalTransformationCost(Class[] clsArr, Class[] clsArr2) {
        float f = 0.0f;
        for (int i = 0; i < clsArr.length; i++) {
            f += getObjectTransformationCost(clsArr[i], clsArr2[i]);
        }
        return f;
    }

    static boolean isAccessible(Member member) {
        return member != null && Modifier.isPublic(member.getModifiers()) && !isSynthetic(member);
    }

    static boolean isPackageAccess(int i) {
        return (i & 7) == 0;
    }

    static boolean isSynthetic(Member member) {
        if (IS_SYNTHETIC != null) {
            try {
                return ((Boolean) IS_SYNTHETIC.invoke(member, (Object[]) null)).booleanValue();
            } catch (Exception e) {
            }
        }
        return false;
    }

    static void setAccessibleWorkaround(AccessibleObject accessibleObject) {
        if (accessibleObject != null && !accessibleObject.isAccessible()) {
            Member member = (Member) accessibleObject;
            if (Modifier.isPublic(member.getModifiers()) && isPackageAccess(member.getDeclaringClass().getModifiers())) {
                try {
                    accessibleObject.setAccessible(true);
                } catch (SecurityException e) {
                }
            }
        }
    }
}
