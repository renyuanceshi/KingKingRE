package org.apache.commons.lang.reflect;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import org.apache.commons.lang.ClassUtils;

public class FieldUtils {
    public static Field getDeclaredField(Class cls, String str) {
        return getDeclaredField(cls, str, false);
    }

    public static Field getDeclaredField(Class cls, String str, boolean z) {
        if (cls == null) {
            throw new IllegalArgumentException("The class must not be null");
        } else if (str == null) {
            throw new IllegalArgumentException("The field name must not be null");
        } else {
            try {
                Field declaredField = cls.getDeclaredField(str);
                if (MemberUtils.isAccessible(declaredField)) {
                    return declaredField;
                }
                if (!z) {
                    return null;
                }
                declaredField.setAccessible(true);
                return declaredField;
            } catch (NoSuchFieldException e) {
                return null;
            }
        }
    }

    public static Field getField(Class cls, String str) {
        Field field = getField(cls, str, false);
        MemberUtils.setAccessibleWorkaround(field);
        return field;
    }

    public static Field getField(Class cls, String str, boolean z) {
        Field field;
        if (cls == null) {
            throw new IllegalArgumentException("The class must not be null");
        } else if (str == null) {
            throw new IllegalArgumentException("The field name must not be null");
        } else {
            Class cls2 = cls;
            while (true) {
                if (cls2 != null) {
                    try {
                        field = cls2.getDeclaredField(str);
                        if (Modifier.isPublic(field.getModifiers())) {
                            break;
                        } else if (z) {
                            field.setAccessible(true);
                            break;
                        } else {
                            cls2 = cls2.getSuperclass();
                        }
                    } catch (NoSuchFieldException e) {
                    }
                } else {
                    field = null;
                    for (Class field2 : ClassUtils.getAllInterfaces(cls)) {
                        try {
                            Field field3 = field2.getField(str);
                            if (field != null) {
                                throw new IllegalArgumentException(new StringBuffer().append("Reference to field ").append(str).append(" is ambiguous relative to ").append(cls).append("; a matching field exists on two or more implemented interfaces.").toString());
                            }
                            field = field3;
                        } catch (NoSuchFieldException e2) {
                        }
                    }
                }
            }
            return field;
        }
    }

    public static Object readDeclaredField(Object obj, String str) throws IllegalAccessException {
        return readDeclaredField(obj, str, false);
    }

    public static Object readDeclaredField(Object obj, String str, boolean z) throws IllegalAccessException {
        if (obj == null) {
            throw new IllegalArgumentException("target object must not be null");
        }
        Class<?> cls = obj.getClass();
        Field declaredField = getDeclaredField(cls, str, z);
        if (declaredField != null) {
            return readField(declaredField, obj);
        }
        throw new IllegalArgumentException(new StringBuffer().append("Cannot locate declared field ").append(cls.getName()).append(".").append(str).toString());
    }

    public static Object readDeclaredStaticField(Class cls, String str) throws IllegalAccessException {
        return readDeclaredStaticField(cls, str, false);
    }

    public static Object readDeclaredStaticField(Class cls, String str, boolean z) throws IllegalAccessException {
        Field declaredField = getDeclaredField(cls, str, z);
        if (declaredField != null) {
            return readStaticField(declaredField, false);
        }
        throw new IllegalArgumentException(new StringBuffer().append("Cannot locate declared field ").append(cls.getName()).append(".").append(str).toString());
    }

    public static Object readField(Object obj, String str) throws IllegalAccessException {
        return readField(obj, str, false);
    }

    public static Object readField(Object obj, String str, boolean z) throws IllegalAccessException {
        if (obj == null) {
            throw new IllegalArgumentException("target object must not be null");
        }
        Class<?> cls = obj.getClass();
        Field field = getField(cls, str, z);
        if (field != null) {
            return readField(field, obj);
        }
        throw new IllegalArgumentException(new StringBuffer().append("Cannot locate field ").append(str).append(" on ").append(cls).toString());
    }

    public static Object readField(Field field, Object obj) throws IllegalAccessException {
        return readField(field, obj, false);
    }

    public static Object readField(Field field, Object obj, boolean z) throws IllegalAccessException {
        if (field == null) {
            throw new IllegalArgumentException("The field must not be null");
        }
        if (!z || field.isAccessible()) {
            MemberUtils.setAccessibleWorkaround(field);
        } else {
            field.setAccessible(true);
        }
        return field.get(obj);
    }

    public static Object readStaticField(Class cls, String str) throws IllegalAccessException {
        return readStaticField(cls, str, false);
    }

    public static Object readStaticField(Class cls, String str, boolean z) throws IllegalAccessException {
        Field field = getField(cls, str, z);
        if (field != null) {
            return readStaticField(field, false);
        }
        throw new IllegalArgumentException(new StringBuffer().append("Cannot locate field ").append(str).append(" on ").append(cls).toString());
    }

    public static Object readStaticField(Field field) throws IllegalAccessException {
        return readStaticField(field, false);
    }

    public static Object readStaticField(Field field, boolean z) throws IllegalAccessException {
        if (field == null) {
            throw new IllegalArgumentException("The field must not be null");
        } else if (Modifier.isStatic(field.getModifiers())) {
            return readField(field, (Object) null, z);
        } else {
            throw new IllegalArgumentException(new StringBuffer().append("The field '").append(field.getName()).append("' is not static").toString());
        }
    }

    public static void writeDeclaredField(Object obj, String str, Object obj2) throws IllegalAccessException {
        writeDeclaredField(obj, str, obj2, false);
    }

    public static void writeDeclaredField(Object obj, String str, Object obj2, boolean z) throws IllegalAccessException {
        if (obj == null) {
            throw new IllegalArgumentException("target object must not be null");
        }
        Class<?> cls = obj.getClass();
        Field declaredField = getDeclaredField(cls, str, z);
        if (declaredField == null) {
            throw new IllegalArgumentException(new StringBuffer().append("Cannot locate declared field ").append(cls.getName()).append(".").append(str).toString());
        }
        writeField(declaredField, obj, obj2);
    }

    public static void writeDeclaredStaticField(Class cls, String str, Object obj) throws IllegalAccessException {
        writeDeclaredStaticField(cls, str, obj, false);
    }

    public static void writeDeclaredStaticField(Class cls, String str, Object obj, boolean z) throws IllegalAccessException {
        Field declaredField = getDeclaredField(cls, str, z);
        if (declaredField == null) {
            throw new IllegalArgumentException(new StringBuffer().append("Cannot locate declared field ").append(cls.getName()).append(".").append(str).toString());
        }
        writeField(declaredField, (Object) null, obj);
    }

    public static void writeField(Object obj, String str, Object obj2) throws IllegalAccessException {
        writeField(obj, str, obj2, false);
    }

    public static void writeField(Object obj, String str, Object obj2, boolean z) throws IllegalAccessException {
        if (obj == null) {
            throw new IllegalArgumentException("target object must not be null");
        }
        Class<?> cls = obj.getClass();
        Field field = getField(cls, str, z);
        if (field == null) {
            throw new IllegalArgumentException(new StringBuffer().append("Cannot locate declared field ").append(cls.getName()).append(".").append(str).toString());
        }
        writeField(field, obj, obj2);
    }

    public static void writeField(Field field, Object obj, Object obj2) throws IllegalAccessException {
        writeField(field, obj, obj2, false);
    }

    public static void writeField(Field field, Object obj, Object obj2, boolean z) throws IllegalAccessException {
        if (field == null) {
            throw new IllegalArgumentException("The field must not be null");
        }
        if (!z || field.isAccessible()) {
            MemberUtils.setAccessibleWorkaround(field);
        } else {
            field.setAccessible(true);
        }
        field.set(obj, obj2);
    }

    public static void writeStaticField(Class cls, String str, Object obj) throws IllegalAccessException {
        writeStaticField(cls, str, obj, false);
    }

    public static void writeStaticField(Class cls, String str, Object obj, boolean z) throws IllegalAccessException {
        Field field = getField(cls, str, z);
        if (field == null) {
            throw new IllegalArgumentException(new StringBuffer().append("Cannot locate field ").append(str).append(" on ").append(cls).toString());
        }
        writeStaticField(field, obj);
    }

    public static void writeStaticField(Field field, Object obj) throws IllegalAccessException {
        writeStaticField(field, obj, false);
    }

    public static void writeStaticField(Field field, Object obj, boolean z) throws IllegalAccessException {
        if (field == null) {
            throw new IllegalArgumentException("The field must not be null");
        } else if (!Modifier.isStatic(field.getModifiers())) {
            throw new IllegalArgumentException(new StringBuffer().append("The field '").append(field.getName()).append("' is not static").toString());
        } else {
            writeField(field, (Object) null, obj, z);
        }
    }
}
