package org.apache.commons.lang3.reflect;

import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Member;
import java.lang.reflect.Modifier;
import org.apache.commons.lang3.ClassUtils;

abstract class MemberUtils {
    private static final int ACCESS_TEST = 7;
    private static final Class<?>[] ORDERED_PRIMITIVE_TYPES = {Byte.TYPE, Short.TYPE, Character.TYPE, Integer.TYPE, Long.TYPE, Float.TYPE, Double.TYPE};

    MemberUtils() {
    }

    static int compareParameterTypes(Class<?>[] clsArr, Class<?>[] clsArr2, Class<?>[] clsArr3) {
        float totalTransformationCost = getTotalTransformationCost(clsArr3, clsArr);
        float totalTransformationCost2 = getTotalTransformationCost(clsArr3, clsArr2);
        if (totalTransformationCost < totalTransformationCost2) {
            return -1;
        }
        return totalTransformationCost2 < totalTransformationCost ? 1 : 0;
    }

    private static float getObjectTransformationCost(Class<?> cls, Class<?> cls2) {
        if (cls2.isPrimitive()) {
            return getPrimitivePromotionCost(cls, cls2);
        }
        float f = 0.0f;
        Class<? super Object> cls3 = cls;
        while (true) {
            if (cls3 != null && !cls2.equals(cls3)) {
                if (cls2.isInterface() && ClassUtils.isAssignable(cls3, cls2)) {
                    f += 0.25f;
                    break;
                }
                f += 1.0f;
                cls3 = cls3.getSuperclass();
            } else {
                break;
            }
        }
        return cls3 == null ? f + 1.5f : f;
    }

    private static float getPrimitivePromotionCost(Class<?> cls, Class<?> cls2) {
        float f = 0.0f;
        if (!cls.isPrimitive()) {
            f = 0.0f + 0.1f;
            cls = ClassUtils.wrapperToPrimitive(cls);
        }
        int i = 0;
        Class<?> cls3 = cls;
        while (cls3 != cls2 && i < ORDERED_PRIMITIVE_TYPES.length) {
            if (cls3 == ORDERED_PRIMITIVE_TYPES[i]) {
                f += 0.1f;
                if (i < ORDERED_PRIMITIVE_TYPES.length - 1) {
                    cls3 = ORDERED_PRIMITIVE_TYPES[i + 1];
                }
            }
            i++;
        }
        return f;
    }

    private static float getTotalTransformationCost(Class<?>[] clsArr, Class<?>[] clsArr2) {
        float f = 0.0f;
        for (int i = 0; i < clsArr.length; i++) {
            f += getObjectTransformationCost(clsArr[i], clsArr2[i]);
        }
        return f;
    }

    static boolean isAccessible(Member member) {
        return member != null && Modifier.isPublic(member.getModifiers()) && !member.isSynthetic();
    }

    static boolean isPackageAccess(int i) {
        return (i & 7) == 0;
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
