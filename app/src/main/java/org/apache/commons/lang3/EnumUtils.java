package org.apache.commons.lang3;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class EnumUtils {
    private static final String CANNOT_STORE_S_S_VALUES_IN_S_BITS = "Cannot store %s %s values in %s bits";
    private static final String ENUM_CLASS_MUST_BE_DEFINED = "EnumClass must be defined.";
    private static final String NULL_ELEMENTS_NOT_PERMITTED = "null elements not permitted";
    private static final String S_DOES_NOT_SEEM_TO_BE_AN_ENUM_TYPE = "%s does not seem to be an Enum type";

    private static <E extends Enum<E>> Class<E> asEnum(Class<E> cls) {
        Validate.notNull(cls, ENUM_CLASS_MUST_BE_DEFINED, new Object[0]);
        Validate.isTrue(cls.isEnum(), S_DOES_NOT_SEEM_TO_BE_AN_ENUM_TYPE, cls);
        return cls;
    }

    private static <E extends Enum<E>> Class<E> checkBitVectorable(Class<E> cls) {
        Enum[] enumArr = (Enum[]) asEnum(cls).getEnumConstants();
        Validate.isTrue(enumArr.length <= 64, CANNOT_STORE_S_S_VALUES_IN_S_BITS, Integer.valueOf(enumArr.length), cls.getSimpleName(), 64);
        return cls;
    }

    public static <E extends Enum<E>> long generateBitVector(Class<E> cls, Iterable<E> iterable) {
        checkBitVectorable(cls);
        Validate.notNull(iterable);
        long j = 0;
        Iterator<E> it = iterable.iterator();
        while (true) {
            long j2 = j;
            if (!it.hasNext()) {
                return j2;
            }
            Enum enumR = (Enum) it.next();
            Validate.isTrue(enumR != null, NULL_ELEMENTS_NOT_PERMITTED, new Object[0]);
            j = ((long) (1 << enumR.ordinal())) | j2;
        }
    }

    public static <E extends Enum<E>> long generateBitVector(Class<E> cls, E... eArr) {
        Validate.noNullElements((T[]) eArr);
        return generateBitVector(cls, Arrays.asList(eArr));
    }

    public static <E extends Enum<E>> long[] generateBitVectors(Class<E> cls, Iterable<E> iterable) {
        asEnum(cls);
        Validate.notNull(iterable);
        EnumSet<E> noneOf = EnumSet.noneOf(cls);
        for (E e : iterable) {
            Validate.isTrue(e != null, NULL_ELEMENTS_NOT_PERMITTED, new Object[0]);
            noneOf.add(e);
        }
        long[] jArr = new long[(((((Enum[]) cls.getEnumConstants()).length - 1) / 64) + 1)];
        Iterator it = noneOf.iterator();
        while (it.hasNext()) {
            Enum enumR = (Enum) it.next();
            int ordinal = enumR.ordinal() / 64;
            jArr[ordinal] = jArr[ordinal] | ((long) (1 << (enumR.ordinal() % 64)));
        }
        ArrayUtils.reverse(jArr);
        return jArr;
    }

    public static <E extends Enum<E>> long[] generateBitVectors(Class<E> cls, E... eArr) {
        asEnum(cls);
        Validate.noNullElements((T[]) eArr);
        EnumSet<E> noneOf = EnumSet.noneOf(cls);
        Collections.addAll(noneOf, eArr);
        long[] jArr = new long[(((((Enum[]) cls.getEnumConstants()).length - 1) / 64) + 1)];
        Iterator it = noneOf.iterator();
        while (it.hasNext()) {
            Enum enumR = (Enum) it.next();
            int ordinal = enumR.ordinal() / 64;
            jArr[ordinal] = jArr[ordinal] | ((long) (1 << (enumR.ordinal() % 64)));
        }
        ArrayUtils.reverse(jArr);
        return jArr;
    }

    public static <E extends Enum<E>> E getEnum(Class<E> cls, String str) {
        if (str == null) {
            return null;
        }
        try {
            return Enum.valueOf(cls, str);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    public static <E extends Enum<E>> List<E> getEnumList(Class<E> cls) {
        return new ArrayList(Arrays.asList(cls.getEnumConstants()));
    }

    public static <E extends Enum<E>> Map<String, E> getEnumMap(Class<E> cls) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Enum enumR : (Enum[]) cls.getEnumConstants()) {
            linkedHashMap.put(enumR.name(), enumR);
        }
        return linkedHashMap;
    }

    public static <E extends Enum<E>> boolean isValidEnum(Class<E> cls, String str) {
        if (str == null) {
            return false;
        }
        try {
            Enum.valueOf(cls, str);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }

    public static <E extends Enum<E>> EnumSet<E> processBitVector(Class<E> cls, long j) {
        checkBitVectorable(cls).getEnumConstants();
        return processBitVectors(cls, j);
    }

    public static <E extends Enum<E>> EnumSet<E> processBitVectors(Class<E> cls, long... jArr) {
        EnumSet<E> noneOf = EnumSet.noneOf(asEnum(cls));
        long[] clone = ArrayUtils.clone((long[]) Validate.notNull(jArr));
        ArrayUtils.reverse(clone);
        for (Enum enumR : (Enum[]) cls.getEnumConstants()) {
            int ordinal = enumR.ordinal() / 64;
            if (ordinal < clone.length && (clone[ordinal] & ((long) (1 << (enumR.ordinal() % 64)))) != 0) {
                noneOf.add(enumR);
            }
        }
        return noneOf;
    }
}
