package org.apache.commons.lang3;

import de.timroes.axmlrpc.serializer.SerializerHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.commons.lang3.mutable.MutableObject;

public class ClassUtils {
    public static final String INNER_CLASS_SEPARATOR = String.valueOf('$');
    public static final char INNER_CLASS_SEPARATOR_CHAR = '$';
    public static final String PACKAGE_SEPARATOR = String.valueOf('.');
    public static final char PACKAGE_SEPARATOR_CHAR = '.';
    private static final Map<String, String> abbreviationMap;
    private static final Map<Class<?>, Class<?>> primitiveWrapperMap = new HashMap();
    private static final Map<String, String> reverseAbbreviationMap;
    private static final Map<Class<?>, Class<?>> wrapperPrimitiveMap = new HashMap();

    public enum Interfaces {
        INCLUDE,
        EXCLUDE
    }

    static {
        primitiveWrapperMap.put(Boolean.TYPE, Boolean.class);
        primitiveWrapperMap.put(Byte.TYPE, Byte.class);
        primitiveWrapperMap.put(Character.TYPE, Character.class);
        primitiveWrapperMap.put(Short.TYPE, Short.class);
        primitiveWrapperMap.put(Integer.TYPE, Integer.class);
        primitiveWrapperMap.put(Long.TYPE, Long.class);
        primitiveWrapperMap.put(Double.TYPE, Double.class);
        primitiveWrapperMap.put(Float.TYPE, Float.class);
        primitiveWrapperMap.put(Void.TYPE, Void.TYPE);
        for (Class next : primitiveWrapperMap.keySet()) {
            Class cls = primitiveWrapperMap.get(next);
            if (!next.equals(cls)) {
                wrapperPrimitiveMap.put(cls, next);
            }
        }
        HashMap hashMap = new HashMap();
        hashMap.put(SerializerHandler.TYPE_INT, "I");
        hashMap.put(SerializerHandler.TYPE_BOOLEAN, "Z");
        hashMap.put("float", "F");
        hashMap.put("long", "J");
        hashMap.put("short", "S");
        hashMap.put("byte", "B");
        hashMap.put(SerializerHandler.TYPE_DOUBLE, "D");
        hashMap.put("char", "C");
        hashMap.put("void", "V");
        HashMap hashMap2 = new HashMap();
        for (Map.Entry entry : hashMap.entrySet()) {
            hashMap2.put(entry.getValue(), entry.getKey());
        }
        abbreviationMap = Collections.unmodifiableMap(hashMap);
        reverseAbbreviationMap = Collections.unmodifiableMap(hashMap2);
    }

    public static List<Class<?>> convertClassNamesToClasses(List<String> list) {
        if (list == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(list.size());
        for (String cls : list) {
            try {
                arrayList.add(Class.forName(cls));
            } catch (Exception e) {
                arrayList.add((Object) null);
            }
        }
        return arrayList;
    }

    public static List<String> convertClassesToClassNames(List<Class<?>> list) {
        if (list == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(list.size());
        for (Class next : list) {
            if (next == null) {
                arrayList.add((Object) null);
            } else {
                arrayList.add(next.getName());
            }
        }
        return arrayList;
    }

    public static List<Class<?>> getAllInterfaces(Class<?> cls) {
        if (cls == null) {
            return null;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        getAllInterfaces(cls, linkedHashSet);
        return new ArrayList(linkedHashSet);
    }

    private static void getAllInterfaces(Class<?> cls, HashSet<Class<?>> hashSet) {
        Class<? super Object> cls2;
        while (cls2 != null) {
            for (Class cls3 : cls2.getInterfaces()) {
                if (hashSet.add(cls3)) {
                    getAllInterfaces(cls3, hashSet);
                }
            }
            Class<? super Object> superclass = cls2.getSuperclass();
            cls2 = cls;
            cls2 = superclass;
        }
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [java.lang.Class<?>, java.lang.Class] */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static java.util.List<java.lang.Class<?>> getAllSuperclasses(java.lang.Class<?> r2) {
        /*
            if (r2 != 0) goto L_0x0004
            r0 = 0
        L_0x0003:
            return r0
        L_0x0004:
            java.util.ArrayList r0 = new java.util.ArrayList
            r0.<init>()
            java.lang.Class r1 = r2.getSuperclass()
        L_0x000d:
            if (r1 == 0) goto L_0x0003
            r0.add(r1)
            java.lang.Class r1 = r1.getSuperclass()
            goto L_0x000d
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.ClassUtils.getAllSuperclasses(java.lang.Class):java.util.List");
    }

    private static String getCanonicalName(String str) {
        String str2;
        String deleteWhitespace = StringUtils.deleteWhitespace(str);
        if (deleteWhitespace == null) {
            return null;
        }
        int i = 0;
        String str3 = deleteWhitespace;
        while (str3.startsWith("[")) {
            str3 = str3.substring(1);
            i++;
        }
        if (i < 1) {
            return str3;
        }
        if (str3.startsWith("L")) {
            str2 = str3.substring(1, str3.endsWith(";") ? str3.length() - 1 : str3.length());
        } else {
            str2 = str3.length() > 0 ? reverseAbbreviationMap.get(str3.substring(0, 1)) : str3;
        }
        StringBuilder sb = new StringBuilder(str2);
        for (int i2 = 0; i2 < i; i2++) {
            sb.append("[]");
        }
        return sb.toString();
    }

    public static Class<?> getClass(ClassLoader classLoader, String str) throws ClassNotFoundException {
        return getClass(classLoader, str, true);
    }

    public static Class<?> getClass(ClassLoader classLoader, String str, boolean z) throws ClassNotFoundException {
        try {
            return abbreviationMap.containsKey(str) ? Class.forName("[" + abbreviationMap.get(str), z, classLoader).getComponentType() : Class.forName(toCanonicalName(str), z, classLoader);
        } catch (ClassNotFoundException e) {
            int lastIndexOf = str.lastIndexOf(46);
            if (lastIndexOf != -1) {
                try {
                    return getClass(classLoader, str.substring(0, lastIndexOf) + '$' + str.substring(lastIndexOf + 1), z);
                } catch (ClassNotFoundException e2) {
                }
            }
            throw e;
        }
    }

    public static Class<?> getClass(String str) throws ClassNotFoundException {
        return getClass(str, true);
    }

    public static Class<?> getClass(String str, boolean z) throws ClassNotFoundException {
        ClassLoader contextClassLoader = Thread.currentThread().getContextClassLoader();
        if (contextClassLoader == null) {
            contextClassLoader = ClassUtils.class.getClassLoader();
        }
        return getClass(contextClassLoader, str, z);
    }

    public static String getPackageCanonicalName(Class<?> cls) {
        return cls == null ? "" : getPackageCanonicalName(cls.getName());
    }

    public static String getPackageCanonicalName(Object obj, String str) {
        return obj == null ? str : getPackageCanonicalName(obj.getClass().getName());
    }

    public static String getPackageCanonicalName(String str) {
        return getPackageName(getCanonicalName(str));
    }

    public static String getPackageName(Class<?> cls) {
        return cls == null ? "" : getPackageName(cls.getName());
    }

    public static String getPackageName(Object obj, String str) {
        return obj == null ? str : getPackageName(obj.getClass());
    }

    public static String getPackageName(String str) {
        if (StringUtils.isEmpty(str)) {
            return "";
        }
        while (str.charAt(0) == '[') {
            str = str.substring(1);
        }
        if (str.charAt(0) == 'L' && str.charAt(str.length() - 1) == ';') {
            str = str.substring(1);
        }
        int lastIndexOf = str.lastIndexOf(46);
        return lastIndexOf == -1 ? "" : str.substring(0, lastIndexOf);
    }

    public static Method getPublicMethod(Class<?> cls, String str, Class<?>... clsArr) throws SecurityException, NoSuchMethodException {
        Method method = cls.getMethod(str, clsArr);
        if (!Modifier.isPublic(method.getDeclaringClass().getModifiers())) {
            ArrayList<Class> arrayList = new ArrayList<>();
            arrayList.addAll(getAllInterfaces(cls));
            arrayList.addAll(getAllSuperclasses(cls));
            for (Class cls2 : arrayList) {
                if (Modifier.isPublic(cls2.getModifiers())) {
                    try {
                        method = cls2.getMethod(str, clsArr);
                        if (Modifier.isPublic(method.getDeclaringClass().getModifiers())) {
                        }
                    } catch (NoSuchMethodException e) {
                    }
                }
            }
            throw new NoSuchMethodException("Can't find a public method for " + str + StringUtils.SPACE + ArrayUtils.toString(clsArr));
        }
        return method;
    }

    public static String getShortCanonicalName(Class<?> cls) {
        return cls == null ? "" : getShortCanonicalName(cls.getName());
    }

    public static String getShortCanonicalName(Object obj, String str) {
        return obj == null ? str : getShortCanonicalName(obj.getClass().getName());
    }

    public static String getShortCanonicalName(String str) {
        return getShortClassName(getCanonicalName(str));
    }

    public static String getShortClassName(Class<?> cls) {
        return cls == null ? "" : getShortClassName(cls.getName());
    }

    public static String getShortClassName(Object obj, String str) {
        return obj == null ? str : getShortClassName(obj.getClass());
    }

    public static String getShortClassName(String str) {
        if (StringUtils.isEmpty(str)) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        if (str.startsWith("[")) {
            while (str.charAt(0) == '[') {
                str = str.substring(1);
                sb.append("[]");
            }
            if (str.charAt(0) == 'L' && str.charAt(str.length() - 1) == ';') {
                str = str.substring(1, str.length() - 1);
            }
            if (reverseAbbreviationMap.containsKey(str)) {
                str = reverseAbbreviationMap.get(str);
            }
        }
        int lastIndexOf = str.lastIndexOf(46);
        int indexOf = str.indexOf(36, lastIndexOf == -1 ? 0 : lastIndexOf + 1);
        String substring = str.substring(lastIndexOf + 1);
        if (indexOf != -1) {
            substring = substring.replace('$', '.');
        }
        return substring + sb;
    }

    public static String getSimpleName(Class<?> cls) {
        return cls == null ? "" : cls.getSimpleName();
    }

    public static String getSimpleName(Object obj, String str) {
        return obj == null ? str : getSimpleName(obj.getClass());
    }

    public static Iterable<Class<?>> hierarchy(Class<?> cls) {
        return hierarchy(cls, Interfaces.EXCLUDE);
    }

    public static Iterable<Class<?>> hierarchy(final Class<?> cls, Interfaces interfaces) {
        final AnonymousClass1 r1 = new Iterable<Class<?>>() {
            public Iterator<Class<?>> iterator() {
                final MutableObject mutableObject = new MutableObject(cls);
                return new Iterator<Class<?>>() {
                    public boolean hasNext() {
                        return mutableObject.getValue() != null;
                    }

                    public Class<?> next() {
                        Class<?> cls = (Class) mutableObject.getValue();
                        mutableObject.setValue(cls.getSuperclass());
                        return cls;
                    }

                    public void remove() {
                        throw new UnsupportedOperationException();
                    }
                };
            }
        };
        return interfaces != Interfaces.INCLUDE ? r1 : new Iterable<Class<?>>() {
            public Iterator<Class<?>> iterator() {
                final HashSet hashSet = new HashSet();
                final Iterator it = r1.iterator();
                return new Iterator<Class<?>>() {
                    Iterator<Class<?>> interfaces = Collections.emptySet().iterator();

                    private void walkInterfaces(Set<Class<?>> set, Class<?> cls) {
                        for (Class cls2 : cls.getInterfaces()) {
                            if (!hashSet.contains(cls2)) {
                                set.add(cls2);
                            }
                            walkInterfaces(set, cls2);
                        }
                    }

                    public boolean hasNext() {
                        return this.interfaces.hasNext() || it.hasNext();
                    }

                    public Class<?> next() {
                        if (this.interfaces.hasNext()) {
                            Class<?> next = this.interfaces.next();
                            hashSet.add(next);
                            return next;
                        }
                        Class<?> cls = (Class) it.next();
                        LinkedHashSet linkedHashSet = new LinkedHashSet();
                        walkInterfaces(linkedHashSet, cls);
                        this.interfaces = linkedHashSet.iterator();
                        return cls;
                    }

                    public void remove() {
                        throw new UnsupportedOperationException();
                    }
                };
            }
        };
    }

    public static boolean isAssignable(Class<?> cls, Class<?> cls2) {
        return isAssignable(cls, cls2, SystemUtils.isJavaVersionAtLeast(JavaVersion.JAVA_1_5));
    }

    public static boolean isAssignable(Class<?> cls, Class<?> cls2, boolean z) {
        if (cls2 == null) {
            return false;
        }
        if (cls == null) {
            return !cls2.isPrimitive();
        }
        if (z) {
            if (cls.isPrimitive() && !cls2.isPrimitive() && (cls = primitiveToWrapper(cls)) == null) {
                return false;
            }
            if (cls2.isPrimitive() && !cls.isPrimitive() && (cls = wrapperToPrimitive(cls)) == null) {
                return false;
            }
        }
        if (cls.equals(cls2)) {
            return true;
        }
        if (!cls.isPrimitive()) {
            return cls2.isAssignableFrom(cls);
        }
        if (!cls2.isPrimitive()) {
            return false;
        }
        if (Integer.TYPE.equals(cls)) {
            return Long.TYPE.equals(cls2) || Float.TYPE.equals(cls2) || Double.TYPE.equals(cls2);
        }
        if (Long.TYPE.equals(cls)) {
            return Float.TYPE.equals(cls2) || Double.TYPE.equals(cls2);
        }
        if (Boolean.TYPE.equals(cls) || Double.TYPE.equals(cls)) {
            return false;
        }
        if (Float.TYPE.equals(cls)) {
            return Double.TYPE.equals(cls2);
        }
        if (Character.TYPE.equals(cls)) {
            return Integer.TYPE.equals(cls2) || Long.TYPE.equals(cls2) || Float.TYPE.equals(cls2) || Double.TYPE.equals(cls2);
        }
        if (Short.TYPE.equals(cls)) {
            return Integer.TYPE.equals(cls2) || Long.TYPE.equals(cls2) || Float.TYPE.equals(cls2) || Double.TYPE.equals(cls2);
        }
        if (Byte.TYPE.equals(cls)) {
            return Short.TYPE.equals(cls2) || Integer.TYPE.equals(cls2) || Long.TYPE.equals(cls2) || Float.TYPE.equals(cls2) || Double.TYPE.equals(cls2);
        }
        return false;
    }

    public static boolean isAssignable(Class<?>[] clsArr, Class<?>... clsArr2) {
        return isAssignable(clsArr, clsArr2, SystemUtils.isJavaVersionAtLeast(JavaVersion.JAVA_1_5));
    }

    public static boolean isAssignable(Class<?>[] clsArr, Class<?>[] clsArr2, boolean z) {
        if (!ArrayUtils.isSameLength((Object[]) clsArr, (Object[]) clsArr2)) {
            return false;
        }
        if (clsArr == null) {
            clsArr = ArrayUtils.EMPTY_CLASS_ARRAY;
        }
        if (clsArr2 == null) {
            clsArr2 = ArrayUtils.EMPTY_CLASS_ARRAY;
        }
        for (int i = 0; i < clsArr.length; i++) {
            if (!isAssignable(clsArr[i], clsArr2[i], z)) {
                return false;
            }
        }
        return true;
    }

    public static boolean isInnerClass(Class<?> cls) {
        return (cls == null || cls.getEnclosingClass() == null) ? false : true;
    }

    public static boolean isPrimitiveOrWrapper(Class<?> cls) {
        if (cls == null) {
            return false;
        }
        return cls.isPrimitive() || isPrimitiveWrapper(cls);
    }

    public static boolean isPrimitiveWrapper(Class<?> cls) {
        return wrapperPrimitiveMap.containsKey(cls);
    }

    public static Class<?> primitiveToWrapper(Class<?> cls) {
        return (cls == null || !cls.isPrimitive()) ? cls : primitiveWrapperMap.get(cls);
    }

    public static Class<?>[] primitivesToWrappers(Class<?>... clsArr) {
        if (clsArr == null) {
            return null;
        }
        if (clsArr.length == 0) {
            return clsArr;
        }
        Class<?>[] clsArr2 = new Class[clsArr.length];
        for (int i = 0; i < clsArr.length; i++) {
            clsArr2[i] = primitiveToWrapper(clsArr[i]);
        }
        return clsArr2;
    }

    private static String toCanonicalName(String str) {
        String str2;
        String deleteWhitespace = StringUtils.deleteWhitespace(str);
        if (deleteWhitespace == null) {
            throw new NullPointerException("className must not be null.");
        } else if (!deleteWhitespace.endsWith("[]")) {
            return deleteWhitespace;
        } else {
            StringBuilder sb = new StringBuilder();
            while (true) {
                str2 = deleteWhitespace;
                if (!str2.endsWith("[]")) {
                    break;
                }
                deleteWhitespace = str2.substring(0, str2.length() - 2);
                sb.append("[");
            }
            String str3 = abbreviationMap.get(str2);
            if (str3 != null) {
                sb.append(str3);
            } else {
                sb.append("L").append(str2).append(";");
            }
            return sb.toString();
        }
    }

    public static Class<?>[] toClass(Object... objArr) {
        if (objArr == null) {
            return null;
        }
        if (objArr.length == 0) {
            return ArrayUtils.EMPTY_CLASS_ARRAY;
        }
        Class<?>[] clsArr = new Class[objArr.length];
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= objArr.length) {
                return clsArr;
            }
            clsArr[i2] = objArr[i2] == null ? null : objArr[i2].getClass();
            i = i2 + 1;
        }
    }

    public static Class<?> wrapperToPrimitive(Class<?> cls) {
        return wrapperPrimitiveMap.get(cls);
    }

    public static Class<?>[] wrappersToPrimitives(Class<?>... clsArr) {
        if (clsArr == null) {
            return null;
        }
        if (clsArr.length == 0) {
            return clsArr;
        }
        Class<?>[] clsArr2 = new Class[clsArr.length];
        for (int i = 0; i < clsArr.length; i++) {
            clsArr2[i] = wrapperToPrimitive(clsArr[i]);
        }
        return clsArr2;
    }
}
