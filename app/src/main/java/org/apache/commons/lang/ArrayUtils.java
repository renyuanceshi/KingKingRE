package org.apache.commons.lang;

import android.support.v7.widget.ActivityChooserView;
import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class ArrayUtils {
    public static final boolean[] EMPTY_BOOLEAN_ARRAY = new boolean[0];
    public static final Boolean[] EMPTY_BOOLEAN_OBJECT_ARRAY = new Boolean[0];
    public static final byte[] EMPTY_BYTE_ARRAY = new byte[0];
    public static final Byte[] EMPTY_BYTE_OBJECT_ARRAY = new Byte[0];
    public static final Character[] EMPTY_CHARACTER_OBJECT_ARRAY = new Character[0];
    public static final char[] EMPTY_CHAR_ARRAY = new char[0];
    public static final Class[] EMPTY_CLASS_ARRAY = new Class[0];
    public static final double[] EMPTY_DOUBLE_ARRAY = new double[0];
    public static final Double[] EMPTY_DOUBLE_OBJECT_ARRAY = new Double[0];
    public static final float[] EMPTY_FLOAT_ARRAY = new float[0];
    public static final Float[] EMPTY_FLOAT_OBJECT_ARRAY = new Float[0];
    public static final Integer[] EMPTY_INTEGER_OBJECT_ARRAY = new Integer[0];
    public static final int[] EMPTY_INT_ARRAY = new int[0];
    public static final long[] EMPTY_LONG_ARRAY = new long[0];
    public static final Long[] EMPTY_LONG_OBJECT_ARRAY = new Long[0];
    public static final Object[] EMPTY_OBJECT_ARRAY = new Object[0];
    public static final short[] EMPTY_SHORT_ARRAY = new short[0];
    public static final Short[] EMPTY_SHORT_OBJECT_ARRAY = new Short[0];
    public static final String[] EMPTY_STRING_ARRAY = new String[0];
    public static final int INDEX_NOT_FOUND = -1;
    static Class class$java$lang$Object;

    private static Object add(Object obj, int i, Object obj2, Class cls) {
        if (obj != null) {
            int length = Array.getLength(obj);
            if (i > length || i < 0) {
                throw new IndexOutOfBoundsException(new StringBuffer().append("Index: ").append(i).append(", Length: ").append(length).toString());
            }
            Object newInstance = Array.newInstance(cls, length + 1);
            System.arraycopy(obj, 0, newInstance, 0, i);
            Array.set(newInstance, i, obj2);
            if (i >= length) {
                return newInstance;
            }
            System.arraycopy(obj, i, newInstance, i + 1, length - i);
            return newInstance;
        } else if (i != 0) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("Index: ").append(i).append(", Length: 0").toString());
        } else {
            Object newInstance2 = Array.newInstance(cls, 1);
            Array.set(newInstance2, 0, obj2);
            return newInstance2;
        }
    }

    public static byte[] add(byte[] bArr, byte b) {
        byte[] bArr2 = (byte[]) copyArrayGrow1(bArr, Byte.TYPE);
        bArr2[bArr2.length - 1] = (byte) b;
        return bArr2;
    }

    public static byte[] add(byte[] bArr, int i, byte b) {
        return (byte[]) add(bArr, i, new Byte(b), Byte.TYPE);
    }

    public static char[] add(char[] cArr, char c) {
        char[] cArr2 = (char[]) copyArrayGrow1(cArr, Character.TYPE);
        cArr2[cArr2.length - 1] = (char) c;
        return cArr2;
    }

    public static char[] add(char[] cArr, int i, char c) {
        return (char[]) add(cArr, i, new Character(c), Character.TYPE);
    }

    public static double[] add(double[] dArr, double d) {
        double[] dArr2 = (double[]) copyArrayGrow1(dArr, Double.TYPE);
        dArr2[dArr2.length - 1] = d;
        return dArr2;
    }

    public static double[] add(double[] dArr, int i, double d) {
        return (double[]) add(dArr, i, new Double(d), Double.TYPE);
    }

    public static float[] add(float[] fArr, float f) {
        float[] fArr2 = (float[]) copyArrayGrow1(fArr, Float.TYPE);
        fArr2[fArr2.length - 1] = f;
        return fArr2;
    }

    public static float[] add(float[] fArr, int i, float f) {
        return (float[]) add(fArr, i, new Float(f), Float.TYPE);
    }

    public static int[] add(int[] iArr, int i) {
        int[] iArr2 = (int[]) copyArrayGrow1(iArr, Integer.TYPE);
        iArr2[iArr2.length - 1] = i;
        return iArr2;
    }

    public static int[] add(int[] iArr, int i, int i2) {
        return (int[]) add(iArr, i, new Integer(i2), Integer.TYPE);
    }

    public static long[] add(long[] jArr, int i, long j) {
        return (long[]) add(jArr, i, new Long(j), Long.TYPE);
    }

    public static long[] add(long[] jArr, long j) {
        long[] jArr2 = (long[]) copyArrayGrow1(jArr, Long.TYPE);
        jArr2[jArr2.length - 1] = j;
        return jArr2;
    }

    public static Object[] add(Object[] objArr, int i, Object obj) {
        Class<?> cls;
        if (objArr != null) {
            cls = objArr.getClass().getComponentType();
        } else if (obj != null) {
            cls = obj.getClass();
        } else {
            return new Object[]{null};
        }
        return (Object[]) add(objArr, i, obj, cls);
    }

    public static Object[] add(Object[] objArr, Object obj) {
        Class<?> cls;
        if (objArr != null) {
            cls = objArr.getClass();
        } else if (obj != null) {
            cls = obj.getClass();
        } else if (class$java$lang$Object == null) {
            cls = class$("java.lang.Object");
            class$java$lang$Object = cls;
        } else {
            cls = class$java$lang$Object;
        }
        Object[] objArr2 = (Object[]) copyArrayGrow1(objArr, cls);
        objArr2[objArr2.length - 1] = obj;
        return objArr2;
    }

    public static short[] add(short[] sArr, int i, short s) {
        return (short[]) add(sArr, i, new Short(s), Short.TYPE);
    }

    public static short[] add(short[] sArr, short s) {
        short[] sArr2 = (short[]) copyArrayGrow1(sArr, Short.TYPE);
        sArr2[sArr2.length - 1] = (short) s;
        return sArr2;
    }

    public static boolean[] add(boolean[] zArr, int i, boolean z) {
        return (boolean[]) add(zArr, i, BooleanUtils.toBooleanObject(z), Boolean.TYPE);
    }

    public static boolean[] add(boolean[] zArr, boolean z) {
        boolean[] zArr2 = (boolean[]) copyArrayGrow1(zArr, Boolean.TYPE);
        zArr2[zArr2.length - 1] = z;
        return zArr2;
    }

    public static byte[] addAll(byte[] bArr, byte[] bArr2) {
        if (bArr == null) {
            return clone(bArr2);
        }
        if (bArr2 == null) {
            return clone(bArr);
        }
        byte[] bArr3 = new byte[(bArr.length + bArr2.length)];
        System.arraycopy(bArr, 0, bArr3, 0, bArr.length);
        System.arraycopy(bArr2, 0, bArr3, bArr.length, bArr2.length);
        return bArr3;
    }

    public static char[] addAll(char[] cArr, char[] cArr2) {
        if (cArr == null) {
            return clone(cArr2);
        }
        if (cArr2 == null) {
            return clone(cArr);
        }
        char[] cArr3 = new char[(cArr.length + cArr2.length)];
        System.arraycopy(cArr, 0, cArr3, 0, cArr.length);
        System.arraycopy(cArr2, 0, cArr3, cArr.length, cArr2.length);
        return cArr3;
    }

    public static double[] addAll(double[] dArr, double[] dArr2) {
        if (dArr == null) {
            return clone(dArr2);
        }
        if (dArr2 == null) {
            return clone(dArr);
        }
        double[] dArr3 = new double[(dArr.length + dArr2.length)];
        System.arraycopy(dArr, 0, dArr3, 0, dArr.length);
        System.arraycopy(dArr2, 0, dArr3, dArr.length, dArr2.length);
        return dArr3;
    }

    public static float[] addAll(float[] fArr, float[] fArr2) {
        if (fArr == null) {
            return clone(fArr2);
        }
        if (fArr2 == null) {
            return clone(fArr);
        }
        float[] fArr3 = new float[(fArr.length + fArr2.length)];
        System.arraycopy(fArr, 0, fArr3, 0, fArr.length);
        System.arraycopy(fArr2, 0, fArr3, fArr.length, fArr2.length);
        return fArr3;
    }

    public static int[] addAll(int[] iArr, int[] iArr2) {
        if (iArr == null) {
            return clone(iArr2);
        }
        if (iArr2 == null) {
            return clone(iArr);
        }
        int[] iArr3 = new int[(iArr.length + iArr2.length)];
        System.arraycopy(iArr, 0, iArr3, 0, iArr.length);
        System.arraycopy(iArr2, 0, iArr3, iArr.length, iArr2.length);
        return iArr3;
    }

    public static long[] addAll(long[] jArr, long[] jArr2) {
        if (jArr == null) {
            return clone(jArr2);
        }
        if (jArr2 == null) {
            return clone(jArr);
        }
        long[] jArr3 = new long[(jArr.length + jArr2.length)];
        System.arraycopy(jArr, 0, jArr3, 0, jArr.length);
        System.arraycopy(jArr2, 0, jArr3, jArr.length, jArr2.length);
        return jArr3;
    }

    public static Object[] addAll(Object[] objArr, Object[] objArr2) {
        if (objArr == null) {
            return clone(objArr2);
        }
        if (objArr2 == null) {
            return clone(objArr);
        }
        Object[] objArr3 = (Object[]) Array.newInstance(objArr.getClass().getComponentType(), objArr.length + objArr2.length);
        System.arraycopy(objArr, 0, objArr3, 0, objArr.length);
        try {
            System.arraycopy(objArr2, 0, objArr3, objArr.length, objArr2.length);
            return objArr3;
        } catch (ArrayStoreException e) {
            Class<?> componentType = objArr.getClass().getComponentType();
            Class<?> componentType2 = objArr2.getClass().getComponentType();
            if (!componentType.isAssignableFrom(componentType2)) {
                throw new IllegalArgumentException(new StringBuffer().append("Cannot store ").append(componentType2.getName()).append(" in an array of ").append(componentType.getName()).toString());
            }
            throw e;
        }
    }

    public static short[] addAll(short[] sArr, short[] sArr2) {
        if (sArr == null) {
            return clone(sArr2);
        }
        if (sArr2 == null) {
            return clone(sArr);
        }
        short[] sArr3 = new short[(sArr.length + sArr2.length)];
        System.arraycopy(sArr, 0, sArr3, 0, sArr.length);
        System.arraycopy(sArr2, 0, sArr3, sArr.length, sArr2.length);
        return sArr3;
    }

    public static boolean[] addAll(boolean[] zArr, boolean[] zArr2) {
        if (zArr == null) {
            return clone(zArr2);
        }
        if (zArr2 == null) {
            return clone(zArr);
        }
        boolean[] zArr3 = new boolean[(zArr.length + zArr2.length)];
        System.arraycopy(zArr, 0, zArr3, 0, zArr.length);
        System.arraycopy(zArr2, 0, zArr3, zArr.length, zArr2.length);
        return zArr3;
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError(e.getMessage());
        }
    }

    public static byte[] clone(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        return (byte[]) bArr.clone();
    }

    public static char[] clone(char[] cArr) {
        if (cArr == null) {
            return null;
        }
        return (char[]) cArr.clone();
    }

    public static double[] clone(double[] dArr) {
        if (dArr == null) {
            return null;
        }
        return (double[]) dArr.clone();
    }

    public static float[] clone(float[] fArr) {
        if (fArr == null) {
            return null;
        }
        return (float[]) fArr.clone();
    }

    public static int[] clone(int[] iArr) {
        if (iArr == null) {
            return null;
        }
        return (int[]) iArr.clone();
    }

    public static long[] clone(long[] jArr) {
        if (jArr == null) {
            return null;
        }
        return (long[]) jArr.clone();
    }

    public static Object[] clone(Object[] objArr) {
        if (objArr == null) {
            return null;
        }
        return (Object[]) objArr.clone();
    }

    public static short[] clone(short[] sArr) {
        if (sArr == null) {
            return null;
        }
        return (short[]) sArr.clone();
    }

    public static boolean[] clone(boolean[] zArr) {
        if (zArr == null) {
            return null;
        }
        return (boolean[]) zArr.clone();
    }

    public static boolean contains(byte[] bArr, byte b) {
        return indexOf(bArr, b) != -1;
    }

    public static boolean contains(char[] cArr, char c) {
        return indexOf(cArr, c) != -1;
    }

    public static boolean contains(double[] dArr, double d) {
        return indexOf(dArr, d) != -1;
    }

    public static boolean contains(double[] dArr, double d, double d2) {
        return indexOf(dArr, d, 0, d2) != -1;
    }

    public static boolean contains(float[] fArr, float f) {
        return indexOf(fArr, f) != -1;
    }

    public static boolean contains(int[] iArr, int i) {
        return indexOf(iArr, i) != -1;
    }

    public static boolean contains(long[] jArr, long j) {
        return indexOf(jArr, j) != -1;
    }

    public static boolean contains(Object[] objArr, Object obj) {
        return indexOf(objArr, obj) != -1;
    }

    public static boolean contains(short[] sArr, short s) {
        return indexOf(sArr, s) != -1;
    }

    public static boolean contains(boolean[] zArr, boolean z) {
        return indexOf(zArr, z) != -1;
    }

    private static Object copyArrayGrow1(Object obj, Class cls) {
        if (obj == null) {
            return Array.newInstance(cls, 1);
        }
        int length = Array.getLength(obj);
        Object newInstance = Array.newInstance(obj.getClass().getComponentType(), length + 1);
        System.arraycopy(obj, 0, newInstance, 0, length);
        return newInstance;
    }

    public static int getLength(Object obj) {
        if (obj == null) {
            return 0;
        }
        return Array.getLength(obj);
    }

    public static int hashCode(Object obj) {
        return new HashCodeBuilder().append(obj).toHashCode();
    }

    public static int indexOf(byte[] bArr, byte b) {
        return indexOf(bArr, b, 0);
    }

    public static int indexOf(byte[] bArr, byte b, int i) {
        if (bArr == null) {
            return -1;
        }
        for (int i2 = i < 0 ? 0 : i; i2 < bArr.length; i2++) {
            if (b == bArr[i2]) {
                return i2;
            }
        }
        return -1;
    }

    public static int indexOf(char[] cArr, char c) {
        return indexOf(cArr, c, 0);
    }

    public static int indexOf(char[] cArr, char c, int i) {
        if (cArr == null) {
            return -1;
        }
        for (int i2 = i < 0 ? 0 : i; i2 < cArr.length; i2++) {
            if (c == cArr[i2]) {
                return i2;
            }
        }
        return -1;
    }

    public static int indexOf(double[] dArr, double d) {
        return indexOf(dArr, d, 0);
    }

    public static int indexOf(double[] dArr, double d, double d2) {
        return indexOf(dArr, d, 0, d2);
    }

    public static int indexOf(double[] dArr, double d, int i) {
        if (isEmpty(dArr)) {
            return -1;
        }
        if (i < 0) {
            i = 0;
        }
        for (int i2 = i; i2 < dArr.length; i2++) {
            if (d == dArr[i2]) {
                return i2;
            }
        }
        return -1;
    }

    public static int indexOf(double[] dArr, double d, int i, double d2) {
        if (isEmpty(dArr)) {
            return -1;
        }
        for (int i2 = i < 0 ? 0 : i; i2 < dArr.length; i2++) {
            if (dArr[i2] >= d - d2 && dArr[i2] <= d + d2) {
                return i2;
            }
        }
        return -1;
    }

    public static int indexOf(float[] fArr, float f) {
        return indexOf(fArr, f, 0);
    }

    public static int indexOf(float[] fArr, float f, int i) {
        if (isEmpty(fArr)) {
            return -1;
        }
        for (int i2 = i < 0 ? 0 : i; i2 < fArr.length; i2++) {
            if (f == fArr[i2]) {
                return i2;
            }
        }
        return -1;
    }

    public static int indexOf(int[] iArr, int i) {
        return indexOf(iArr, i, 0);
    }

    public static int indexOf(int[] iArr, int i, int i2) {
        if (iArr == null) {
            return -1;
        }
        for (int i3 = i2 < 0 ? 0 : i2; i3 < iArr.length; i3++) {
            if (i == iArr[i3]) {
                return i3;
            }
        }
        return -1;
    }

    public static int indexOf(long[] jArr, long j) {
        return indexOf(jArr, j, 0);
    }

    public static int indexOf(long[] jArr, long j, int i) {
        if (jArr == null) {
            return -1;
        }
        if (i < 0) {
            i = 0;
        }
        for (int i2 = i; i2 < jArr.length; i2++) {
            if (j == jArr[i2]) {
                return i2;
            }
        }
        return -1;
    }

    public static int indexOf(Object[] objArr, Object obj) {
        return indexOf(objArr, obj, 0);
    }

    public static int indexOf(Object[] objArr, Object obj, int i) {
        if (objArr == null) {
            return -1;
        }
        int i2 = i < 0 ? 0 : i;
        if (obj == null) {
            while (i2 < objArr.length) {
                if (objArr[i2] != null) {
                    i2++;
                }
            }
            return -1;
        }
        while (i2 < objArr.length) {
            if (!obj.equals(objArr[i2])) {
                i2++;
            }
        }
        return -1;
        return i2;
    }

    public static int indexOf(short[] sArr, short s) {
        return indexOf(sArr, s, 0);
    }

    public static int indexOf(short[] sArr, short s, int i) {
        if (sArr == null) {
            return -1;
        }
        for (int i2 = i < 0 ? 0 : i; i2 < sArr.length; i2++) {
            if (s == sArr[i2]) {
                return i2;
            }
        }
        return -1;
    }

    public static int indexOf(boolean[] zArr, boolean z) {
        return indexOf(zArr, z, 0);
    }

    public static int indexOf(boolean[] zArr, boolean z, int i) {
        if (isEmpty(zArr)) {
            return -1;
        }
        if (i < 0) {
            i = 0;
        }
        for (int i2 = i; i2 < zArr.length; i2++) {
            if (z == zArr[i2]) {
                return i2;
            }
        }
        return -1;
    }

    public static boolean isEmpty(byte[] bArr) {
        return bArr == null || bArr.length == 0;
    }

    public static boolean isEmpty(char[] cArr) {
        return cArr == null || cArr.length == 0;
    }

    public static boolean isEmpty(double[] dArr) {
        return dArr == null || dArr.length == 0;
    }

    public static boolean isEmpty(float[] fArr) {
        return fArr == null || fArr.length == 0;
    }

    public static boolean isEmpty(int[] iArr) {
        return iArr == null || iArr.length == 0;
    }

    public static boolean isEmpty(long[] jArr) {
        return jArr == null || jArr.length == 0;
    }

    public static boolean isEmpty(Object[] objArr) {
        return objArr == null || objArr.length == 0;
    }

    public static boolean isEmpty(short[] sArr) {
        return sArr == null || sArr.length == 0;
    }

    public static boolean isEmpty(boolean[] zArr) {
        return zArr == null || zArr.length == 0;
    }

    public static boolean isEquals(Object obj, Object obj2) {
        return new EqualsBuilder().append(obj, obj2).isEquals();
    }

    public static boolean isNotEmpty(byte[] bArr) {
        return (bArr == null || bArr.length == 0) ? false : true;
    }

    public static boolean isNotEmpty(char[] cArr) {
        return (cArr == null || cArr.length == 0) ? false : true;
    }

    public static boolean isNotEmpty(double[] dArr) {
        return (dArr == null || dArr.length == 0) ? false : true;
    }

    public static boolean isNotEmpty(float[] fArr) {
        return (fArr == null || fArr.length == 0) ? false : true;
    }

    public static boolean isNotEmpty(int[] iArr) {
        return (iArr == null || iArr.length == 0) ? false : true;
    }

    public static boolean isNotEmpty(long[] jArr) {
        return (jArr == null || jArr.length == 0) ? false : true;
    }

    public static boolean isNotEmpty(Object[] objArr) {
        return (objArr == null || objArr.length == 0) ? false : true;
    }

    public static boolean isNotEmpty(short[] sArr) {
        return (sArr == null || sArr.length == 0) ? false : true;
    }

    public static boolean isNotEmpty(boolean[] zArr) {
        return (zArr == null || zArr.length == 0) ? false : true;
    }

    public static boolean isSameLength(byte[] bArr, byte[] bArr2) {
        return (bArr != null || bArr2 == null || bArr2.length <= 0) && (bArr2 != null || bArr == null || bArr.length <= 0) && (bArr == null || bArr2 == null || bArr.length == bArr2.length);
    }

    public static boolean isSameLength(char[] cArr, char[] cArr2) {
        return (cArr != null || cArr2 == null || cArr2.length <= 0) && (cArr2 != null || cArr == null || cArr.length <= 0) && (cArr == null || cArr2 == null || cArr.length == cArr2.length);
    }

    public static boolean isSameLength(double[] dArr, double[] dArr2) {
        return (dArr != null || dArr2 == null || dArr2.length <= 0) && (dArr2 != null || dArr == null || dArr.length <= 0) && (dArr == null || dArr2 == null || dArr.length == dArr2.length);
    }

    public static boolean isSameLength(float[] fArr, float[] fArr2) {
        return (fArr != null || fArr2 == null || fArr2.length <= 0) && (fArr2 != null || fArr == null || fArr.length <= 0) && (fArr == null || fArr2 == null || fArr.length == fArr2.length);
    }

    public static boolean isSameLength(int[] iArr, int[] iArr2) {
        return (iArr != null || iArr2 == null || iArr2.length <= 0) && (iArr2 != null || iArr == null || iArr.length <= 0) && (iArr == null || iArr2 == null || iArr.length == iArr2.length);
    }

    public static boolean isSameLength(long[] jArr, long[] jArr2) {
        return (jArr != null || jArr2 == null || jArr2.length <= 0) && (jArr2 != null || jArr == null || jArr.length <= 0) && (jArr == null || jArr2 == null || jArr.length == jArr2.length);
    }

    public static boolean isSameLength(Object[] objArr, Object[] objArr2) {
        return (objArr != null || objArr2 == null || objArr2.length <= 0) && (objArr2 != null || objArr == null || objArr.length <= 0) && (objArr == null || objArr2 == null || objArr.length == objArr2.length);
    }

    public static boolean isSameLength(short[] sArr, short[] sArr2) {
        return (sArr != null || sArr2 == null || sArr2.length <= 0) && (sArr2 != null || sArr == null || sArr.length <= 0) && (sArr == null || sArr2 == null || sArr.length == sArr2.length);
    }

    public static boolean isSameLength(boolean[] zArr, boolean[] zArr2) {
        return (zArr != null || zArr2 == null || zArr2.length <= 0) && (zArr2 != null || zArr == null || zArr.length <= 0) && (zArr == null || zArr2 == null || zArr.length == zArr2.length);
    }

    public static boolean isSameType(Object obj, Object obj2) {
        if (obj != null && obj2 != null) {
            return obj.getClass().getName().equals(obj2.getClass().getName());
        }
        throw new IllegalArgumentException("The Array must not be null");
    }

    public static int lastIndexOf(byte[] bArr, byte b) {
        return lastIndexOf(bArr, b, (int) ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
    }

    public static int lastIndexOf(byte[] bArr, byte b, int i) {
        if (bArr == null || i < 0) {
            return -1;
        }
        for (int length = i >= bArr.length ? bArr.length - 1 : i; length >= 0; length--) {
            if (b == bArr[length]) {
                return length;
            }
        }
        return -1;
    }

    public static int lastIndexOf(char[] cArr, char c) {
        return lastIndexOf(cArr, c, (int) ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
    }

    public static int lastIndexOf(char[] cArr, char c, int i) {
        if (cArr == null || i < 0) {
            return -1;
        }
        for (int length = i >= cArr.length ? cArr.length - 1 : i; length >= 0; length--) {
            if (c == cArr[length]) {
                return length;
            }
        }
        return -1;
    }

    public static int lastIndexOf(double[] dArr, double d) {
        return lastIndexOf(dArr, d, (int) ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
    }

    public static int lastIndexOf(double[] dArr, double d, double d2) {
        return lastIndexOf(dArr, d, ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED, d2);
    }

    public static int lastIndexOf(double[] dArr, double d, int i) {
        if (isEmpty(dArr) || i < 0) {
            return -1;
        }
        for (int length = i >= dArr.length ? dArr.length - 1 : i; length >= 0; length--) {
            if (d == dArr[length]) {
                return length;
            }
        }
        return -1;
    }

    public static int lastIndexOf(double[] dArr, double d, int i, double d2) {
        if (isEmpty(dArr) || i < 0) {
            return -1;
        }
        for (int length = i >= dArr.length ? dArr.length - 1 : i; length >= 0; length--) {
            if (dArr[length] >= d - d2 && dArr[length] <= d + d2) {
                return length;
            }
        }
        return -1;
    }

    public static int lastIndexOf(float[] fArr, float f) {
        return lastIndexOf(fArr, f, (int) ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
    }

    public static int lastIndexOf(float[] fArr, float f, int i) {
        if (isEmpty(fArr) || i < 0) {
            return -1;
        }
        for (int length = i >= fArr.length ? fArr.length - 1 : i; length >= 0; length--) {
            if (f == fArr[length]) {
                return length;
            }
        }
        return -1;
    }

    public static int lastIndexOf(int[] iArr, int i) {
        return lastIndexOf(iArr, i, (int) ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
    }

    public static int lastIndexOf(int[] iArr, int i, int i2) {
        if (iArr == null || i2 < 0) {
            return -1;
        }
        for (int length = i2 >= iArr.length ? iArr.length - 1 : i2; length >= 0; length--) {
            if (i == iArr[length]) {
                return length;
            }
        }
        return -1;
    }

    public static int lastIndexOf(long[] jArr, long j) {
        return lastIndexOf(jArr, j, (int) ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
    }

    public static int lastIndexOf(long[] jArr, long j, int i) {
        if (jArr == null || i < 0) {
            return -1;
        }
        for (int length = i >= jArr.length ? jArr.length - 1 : i; length >= 0; length--) {
            if (j == jArr[length]) {
                return length;
            }
        }
        return -1;
    }

    public static int lastIndexOf(Object[] objArr, Object obj) {
        return lastIndexOf(objArr, obj, (int) ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
    }

    public static int lastIndexOf(Object[] objArr, Object obj, int i) {
        if (objArr == null || i < 0) {
            return -1;
        }
        int length = i >= objArr.length ? objArr.length - 1 : i;
        if (obj == null) {
            while (length >= 0) {
                if (objArr[length] != null) {
                    length--;
                }
            }
            return -1;
        }
        while (length >= 0) {
            if (!obj.equals(objArr[length])) {
                length--;
            }
        }
        return -1;
        return length;
    }

    public static int lastIndexOf(short[] sArr, short s) {
        return lastIndexOf(sArr, s, (int) ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
    }

    public static int lastIndexOf(short[] sArr, short s, int i) {
        if (sArr == null || i < 0) {
            return -1;
        }
        for (int length = i >= sArr.length ? sArr.length - 1 : i; length >= 0; length--) {
            if (s == sArr[length]) {
                return length;
            }
        }
        return -1;
    }

    public static int lastIndexOf(boolean[] zArr, boolean z) {
        return lastIndexOf(zArr, z, (int) ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
    }

    public static int lastIndexOf(boolean[] zArr, boolean z, int i) {
        if (isEmpty(zArr) || i < 0) {
            return -1;
        }
        for (int length = i >= zArr.length ? zArr.length - 1 : i; length >= 0; length--) {
            if (z == zArr[length]) {
                return length;
            }
        }
        return -1;
    }

    public static byte[] nullToEmpty(byte[] bArr) {
        return (bArr == null || bArr.length == 0) ? EMPTY_BYTE_ARRAY : bArr;
    }

    public static char[] nullToEmpty(char[] cArr) {
        return (cArr == null || cArr.length == 0) ? EMPTY_CHAR_ARRAY : cArr;
    }

    public static double[] nullToEmpty(double[] dArr) {
        return (dArr == null || dArr.length == 0) ? EMPTY_DOUBLE_ARRAY : dArr;
    }

    public static float[] nullToEmpty(float[] fArr) {
        return (fArr == null || fArr.length == 0) ? EMPTY_FLOAT_ARRAY : fArr;
    }

    public static int[] nullToEmpty(int[] iArr) {
        return (iArr == null || iArr.length == 0) ? EMPTY_INT_ARRAY : iArr;
    }

    public static long[] nullToEmpty(long[] jArr) {
        return (jArr == null || jArr.length == 0) ? EMPTY_LONG_ARRAY : jArr;
    }

    public static Boolean[] nullToEmpty(Boolean[] boolArr) {
        return (boolArr == null || boolArr.length == 0) ? EMPTY_BOOLEAN_OBJECT_ARRAY : boolArr;
    }

    public static Byte[] nullToEmpty(Byte[] bArr) {
        return (bArr == null || bArr.length == 0) ? EMPTY_BYTE_OBJECT_ARRAY : bArr;
    }

    public static Character[] nullToEmpty(Character[] chArr) {
        return (chArr == null || chArr.length == 0) ? EMPTY_CHARACTER_OBJECT_ARRAY : chArr;
    }

    public static Double[] nullToEmpty(Double[] dArr) {
        return (dArr == null || dArr.length == 0) ? EMPTY_DOUBLE_OBJECT_ARRAY : dArr;
    }

    public static Float[] nullToEmpty(Float[] fArr) {
        return (fArr == null || fArr.length == 0) ? EMPTY_FLOAT_OBJECT_ARRAY : fArr;
    }

    public static Integer[] nullToEmpty(Integer[] numArr) {
        return (numArr == null || numArr.length == 0) ? EMPTY_INTEGER_OBJECT_ARRAY : numArr;
    }

    public static Long[] nullToEmpty(Long[] lArr) {
        return (lArr == null || lArr.length == 0) ? EMPTY_LONG_OBJECT_ARRAY : lArr;
    }

    public static Object[] nullToEmpty(Object[] objArr) {
        return (objArr == null || objArr.length == 0) ? EMPTY_OBJECT_ARRAY : objArr;
    }

    public static Short[] nullToEmpty(Short[] shArr) {
        return (shArr == null || shArr.length == 0) ? EMPTY_SHORT_OBJECT_ARRAY : shArr;
    }

    public static String[] nullToEmpty(String[] strArr) {
        return (strArr == null || strArr.length == 0) ? EMPTY_STRING_ARRAY : strArr;
    }

    public static short[] nullToEmpty(short[] sArr) {
        return (sArr == null || sArr.length == 0) ? EMPTY_SHORT_ARRAY : sArr;
    }

    public static boolean[] nullToEmpty(boolean[] zArr) {
        return (zArr == null || zArr.length == 0) ? EMPTY_BOOLEAN_ARRAY : zArr;
    }

    private static Object remove(Object obj, int i) {
        int length = getLength(obj);
        if (i < 0 || i >= length) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("Index: ").append(i).append(", Length: ").append(length).toString());
        }
        Object newInstance = Array.newInstance(obj.getClass().getComponentType(), length - 1);
        System.arraycopy(obj, 0, newInstance, 0, i);
        if (i < length - 1) {
            System.arraycopy(obj, i + 1, newInstance, i, (length - i) - 1);
        }
        return newInstance;
    }

    public static byte[] remove(byte[] bArr, int i) {
        return (byte[]) remove((Object) bArr, i);
    }

    public static char[] remove(char[] cArr, int i) {
        return (char[]) remove((Object) cArr, i);
    }

    public static double[] remove(double[] dArr, int i) {
        return (double[]) remove((Object) dArr, i);
    }

    public static float[] remove(float[] fArr, int i) {
        return (float[]) remove((Object) fArr, i);
    }

    public static int[] remove(int[] iArr, int i) {
        return (int[]) remove((Object) iArr, i);
    }

    public static long[] remove(long[] jArr, int i) {
        return (long[]) remove((Object) jArr, i);
    }

    public static Object[] remove(Object[] objArr, int i) {
        return (Object[]) remove((Object) objArr, i);
    }

    public static short[] remove(short[] sArr, int i) {
        return (short[]) remove((Object) sArr, i);
    }

    public static boolean[] remove(boolean[] zArr, int i) {
        return (boolean[]) remove((Object) zArr, i);
    }

    public static byte[] removeElement(byte[] bArr, byte b) {
        int indexOf = indexOf(bArr, b);
        return indexOf == -1 ? clone(bArr) : remove(bArr, indexOf);
    }

    public static char[] removeElement(char[] cArr, char c) {
        int indexOf = indexOf(cArr, c);
        return indexOf == -1 ? clone(cArr) : remove(cArr, indexOf);
    }

    public static double[] removeElement(double[] dArr, double d) {
        int indexOf = indexOf(dArr, d);
        return indexOf == -1 ? clone(dArr) : remove(dArr, indexOf);
    }

    public static float[] removeElement(float[] fArr, float f) {
        int indexOf = indexOf(fArr, f);
        return indexOf == -1 ? clone(fArr) : remove(fArr, indexOf);
    }

    public static int[] removeElement(int[] iArr, int i) {
        int indexOf = indexOf(iArr, i);
        return indexOf == -1 ? clone(iArr) : remove(iArr, indexOf);
    }

    public static long[] removeElement(long[] jArr, long j) {
        int indexOf = indexOf(jArr, j);
        return indexOf == -1 ? clone(jArr) : remove(jArr, indexOf);
    }

    public static Object[] removeElement(Object[] objArr, Object obj) {
        int indexOf = indexOf(objArr, obj);
        return indexOf == -1 ? clone(objArr) : remove(objArr, indexOf);
    }

    public static short[] removeElement(short[] sArr, short s) {
        int indexOf = indexOf(sArr, s);
        return indexOf == -1 ? clone(sArr) : remove(sArr, indexOf);
    }

    public static boolean[] removeElement(boolean[] zArr, boolean z) {
        int indexOf = indexOf(zArr, z);
        return indexOf == -1 ? clone(zArr) : remove(zArr, indexOf);
    }

    public static void reverse(byte[] bArr) {
        if (bArr != null) {
            int length = bArr.length - 1;
            for (int i = 0; length > i; i++) {
                byte b = bArr[length];
                bArr[length] = (byte) bArr[i];
                bArr[i] = (byte) b;
                length--;
            }
        }
    }

    public static void reverse(char[] cArr) {
        if (cArr != null) {
            int length = cArr.length - 1;
            for (int i = 0; length > i; i++) {
                char c = cArr[length];
                cArr[length] = (char) cArr[i];
                cArr[i] = (char) c;
                length--;
            }
        }
    }

    public static void reverse(double[] dArr) {
        if (dArr != null) {
            int length = dArr.length - 1;
            for (int i = 0; length > i; i++) {
                double d = dArr[length];
                dArr[length] = dArr[i];
                dArr[i] = d;
                length--;
            }
        }
    }

    public static void reverse(float[] fArr) {
        if (fArr != null) {
            int length = fArr.length - 1;
            for (int i = 0; length > i; i++) {
                float f = fArr[length];
                fArr[length] = fArr[i];
                fArr[i] = f;
                length--;
            }
        }
    }

    public static void reverse(int[] iArr) {
        if (iArr != null) {
            int length = iArr.length - 1;
            for (int i = 0; length > i; i++) {
                int i2 = iArr[length];
                iArr[length] = iArr[i];
                iArr[i] = i2;
                length--;
            }
        }
    }

    public static void reverse(long[] jArr) {
        if (jArr != null) {
            int length = jArr.length - 1;
            for (int i = 0; length > i; i++) {
                long j = jArr[length];
                jArr[length] = jArr[i];
                jArr[i] = j;
                length--;
            }
        }
    }

    public static void reverse(Object[] objArr) {
        if (objArr != null) {
            int length = objArr.length - 1;
            for (int i = 0; length > i; i++) {
                Object obj = objArr[length];
                objArr[length] = objArr[i];
                objArr[i] = obj;
                length--;
            }
        }
    }

    public static void reverse(short[] sArr) {
        if (sArr != null) {
            int length = sArr.length - 1;
            for (int i = 0; length > i; i++) {
                short s = sArr[length];
                sArr[length] = (short) sArr[i];
                sArr[i] = (short) s;
                length--;
            }
        }
    }

    public static void reverse(boolean[] zArr) {
        if (zArr != null) {
            int length = zArr.length - 1;
            for (int i = 0; length > i; i++) {
                boolean z = zArr[length];
                zArr[length] = zArr[i];
                zArr[i] = z;
                length--;
            }
        }
    }

    public static byte[] subarray(byte[] bArr, int i, int i2) {
        if (bArr == null) {
            return null;
        }
        if (i < 0) {
            i = 0;
        }
        if (i2 > bArr.length) {
            i2 = bArr.length;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return EMPTY_BYTE_ARRAY;
        }
        byte[] bArr2 = new byte[i3];
        System.arraycopy(bArr, i, bArr2, 0, i3);
        return bArr2;
    }

    public static char[] subarray(char[] cArr, int i, int i2) {
        if (cArr == null) {
            return null;
        }
        if (i < 0) {
            i = 0;
        }
        if (i2 > cArr.length) {
            i2 = cArr.length;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return EMPTY_CHAR_ARRAY;
        }
        char[] cArr2 = new char[i3];
        System.arraycopy(cArr, i, cArr2, 0, i3);
        return cArr2;
    }

    public static double[] subarray(double[] dArr, int i, int i2) {
        if (dArr == null) {
            return null;
        }
        if (i < 0) {
            i = 0;
        }
        if (i2 > dArr.length) {
            i2 = dArr.length;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return EMPTY_DOUBLE_ARRAY;
        }
        double[] dArr2 = new double[i3];
        System.arraycopy(dArr, i, dArr2, 0, i3);
        return dArr2;
    }

    public static float[] subarray(float[] fArr, int i, int i2) {
        if (fArr == null) {
            return null;
        }
        if (i < 0) {
            i = 0;
        }
        if (i2 > fArr.length) {
            i2 = fArr.length;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return EMPTY_FLOAT_ARRAY;
        }
        float[] fArr2 = new float[i3];
        System.arraycopy(fArr, i, fArr2, 0, i3);
        return fArr2;
    }

    public static int[] subarray(int[] iArr, int i, int i2) {
        if (iArr == null) {
            return null;
        }
        if (i < 0) {
            i = 0;
        }
        if (i2 > iArr.length) {
            i2 = iArr.length;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return EMPTY_INT_ARRAY;
        }
        int[] iArr2 = new int[i3];
        System.arraycopy(iArr, i, iArr2, 0, i3);
        return iArr2;
    }

    public static long[] subarray(long[] jArr, int i, int i2) {
        if (jArr == null) {
            return null;
        }
        if (i < 0) {
            i = 0;
        }
        if (i2 > jArr.length) {
            i2 = jArr.length;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return EMPTY_LONG_ARRAY;
        }
        long[] jArr2 = new long[i3];
        System.arraycopy(jArr, i, jArr2, 0, i3);
        return jArr2;
    }

    public static Object[] subarray(Object[] objArr, int i, int i2) {
        if (objArr == null) {
            return null;
        }
        if (i < 0) {
            i = 0;
        }
        if (i2 > objArr.length) {
            i2 = objArr.length;
        }
        int i3 = i2 - i;
        Class<?> componentType = objArr.getClass().getComponentType();
        if (i3 <= 0) {
            return (Object[]) Array.newInstance(componentType, 0);
        }
        Object[] objArr2 = (Object[]) Array.newInstance(componentType, i3);
        System.arraycopy(objArr, i, objArr2, 0, i3);
        return objArr2;
    }

    public static short[] subarray(short[] sArr, int i, int i2) {
        if (sArr == null) {
            return null;
        }
        if (i < 0) {
            i = 0;
        }
        if (i2 > sArr.length) {
            i2 = sArr.length;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return EMPTY_SHORT_ARRAY;
        }
        short[] sArr2 = new short[i3];
        System.arraycopy(sArr, i, sArr2, 0, i3);
        return sArr2;
    }

    public static boolean[] subarray(boolean[] zArr, int i, int i2) {
        if (zArr == null) {
            return null;
        }
        if (i < 0) {
            i = 0;
        }
        if (i2 > zArr.length) {
            i2 = zArr.length;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return EMPTY_BOOLEAN_ARRAY;
        }
        boolean[] zArr2 = new boolean[i3];
        System.arraycopy(zArr, i, zArr2, 0, i3);
        return zArr2;
    }

    public static Map toMap(Object[] objArr) {
        if (objArr == null) {
            return null;
        }
        HashMap hashMap = new HashMap((int) (((double) objArr.length) * 1.5d));
        for (int i = 0; i < objArr.length; i++) {
            Map.Entry entry = objArr[i];
            if (entry instanceof Map.Entry) {
                Map.Entry entry2 = entry;
                hashMap.put(entry2.getKey(), entry2.getValue());
            } else if (entry instanceof Object[]) {
                Object[] objArr2 = (Object[]) entry;
                if (objArr2.length < 2) {
                    throw new IllegalArgumentException(new StringBuffer().append("Array element ").append(i).append(", '").append(entry).append("', has a length less than 2").toString());
                }
                hashMap.put(objArr2[0], objArr2[1]);
            } else {
                throw new IllegalArgumentException(new StringBuffer().append("Array element ").append(i).append(", '").append(entry).append("', is neither of type Map.Entry nor an Array").toString());
            }
        }
        return hashMap;
    }

    public static Boolean[] toObject(boolean[] zArr) {
        if (zArr == null) {
            return null;
        }
        if (zArr.length == 0) {
            return EMPTY_BOOLEAN_OBJECT_ARRAY;
        }
        Boolean[] boolArr = new Boolean[zArr.length];
        for (int i = 0; i < zArr.length; i++) {
            boolArr[i] = zArr[i] ? Boolean.TRUE : Boolean.FALSE;
        }
        return boolArr;
    }

    public static Byte[] toObject(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        if (bArr.length == 0) {
            return EMPTY_BYTE_OBJECT_ARRAY;
        }
        Byte[] bArr2 = new Byte[bArr.length];
        for (int i = 0; i < bArr.length; i++) {
            bArr2[i] = new Byte(bArr[i]);
        }
        return bArr2;
    }

    public static Character[] toObject(char[] cArr) {
        if (cArr == null) {
            return null;
        }
        if (cArr.length == 0) {
            return EMPTY_CHARACTER_OBJECT_ARRAY;
        }
        Character[] chArr = new Character[cArr.length];
        for (int i = 0; i < cArr.length; i++) {
            chArr[i] = new Character(cArr[i]);
        }
        return chArr;
    }

    public static Double[] toObject(double[] dArr) {
        if (dArr == null) {
            return null;
        }
        if (dArr.length == 0) {
            return EMPTY_DOUBLE_OBJECT_ARRAY;
        }
        Double[] dArr2 = new Double[dArr.length];
        for (int i = 0; i < dArr.length; i++) {
            dArr2[i] = new Double(dArr[i]);
        }
        return dArr2;
    }

    public static Float[] toObject(float[] fArr) {
        if (fArr == null) {
            return null;
        }
        if (fArr.length == 0) {
            return EMPTY_FLOAT_OBJECT_ARRAY;
        }
        Float[] fArr2 = new Float[fArr.length];
        for (int i = 0; i < fArr.length; i++) {
            fArr2[i] = new Float(fArr[i]);
        }
        return fArr2;
    }

    public static Integer[] toObject(int[] iArr) {
        if (iArr == null) {
            return null;
        }
        if (iArr.length == 0) {
            return EMPTY_INTEGER_OBJECT_ARRAY;
        }
        Integer[] numArr = new Integer[iArr.length];
        for (int i = 0; i < iArr.length; i++) {
            numArr[i] = new Integer(iArr[i]);
        }
        return numArr;
    }

    public static Long[] toObject(long[] jArr) {
        if (jArr == null) {
            return null;
        }
        if (jArr.length == 0) {
            return EMPTY_LONG_OBJECT_ARRAY;
        }
        Long[] lArr = new Long[jArr.length];
        for (int i = 0; i < jArr.length; i++) {
            lArr[i] = new Long(jArr[i]);
        }
        return lArr;
    }

    public static Short[] toObject(short[] sArr) {
        if (sArr == null) {
            return null;
        }
        if (sArr.length == 0) {
            return EMPTY_SHORT_OBJECT_ARRAY;
        }
        Short[] shArr = new Short[sArr.length];
        for (int i = 0; i < sArr.length; i++) {
            shArr[i] = new Short(sArr[i]);
        }
        return shArr;
    }

    public static byte[] toPrimitive(Byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        if (bArr.length == 0) {
            return EMPTY_BYTE_ARRAY;
        }
        byte[] bArr2 = new byte[bArr.length];
        for (int i = 0; i < bArr.length; i++) {
            bArr2[i] = bArr[i].byteValue();
        }
        return bArr2;
    }

    public static byte[] toPrimitive(Byte[] bArr, byte b) {
        if (bArr == null) {
            return null;
        }
        if (bArr.length == 0) {
            return EMPTY_BYTE_ARRAY;
        }
        byte[] bArr2 = new byte[bArr.length];
        for (int i = 0; i < bArr.length; i++) {
            Byte b2 = bArr[i];
            bArr2[i] = (byte) (b2 == null ? b : b2.byteValue());
        }
        return bArr2;
    }

    public static char[] toPrimitive(Character[] chArr) {
        if (chArr == null) {
            return null;
        }
        if (chArr.length == 0) {
            return EMPTY_CHAR_ARRAY;
        }
        char[] cArr = new char[chArr.length];
        for (int i = 0; i < chArr.length; i++) {
            cArr[i] = chArr[i].charValue();
        }
        return cArr;
    }

    public static char[] toPrimitive(Character[] chArr, char c) {
        if (chArr == null) {
            return null;
        }
        if (chArr.length == 0) {
            return EMPTY_CHAR_ARRAY;
        }
        char[] cArr = new char[chArr.length];
        for (int i = 0; i < chArr.length; i++) {
            Character ch = chArr[i];
            cArr[i] = (char) (ch == null ? c : ch.charValue());
        }
        return cArr;
    }

    public static double[] toPrimitive(Double[] dArr) {
        if (dArr == null) {
            return null;
        }
        if (dArr.length == 0) {
            return EMPTY_DOUBLE_ARRAY;
        }
        double[] dArr2 = new double[dArr.length];
        for (int i = 0; i < dArr.length; i++) {
            dArr2[i] = dArr[i].doubleValue();
        }
        return dArr2;
    }

    public static double[] toPrimitive(Double[] dArr, double d) {
        if (dArr == null) {
            return null;
        }
        if (dArr.length == 0) {
            return EMPTY_DOUBLE_ARRAY;
        }
        double[] dArr2 = new double[dArr.length];
        for (int i = 0; i < dArr.length; i++) {
            Double d2 = dArr[i];
            dArr2[i] = d2 == null ? d : d2.doubleValue();
        }
        return dArr2;
    }

    public static float[] toPrimitive(Float[] fArr) {
        if (fArr == null) {
            return null;
        }
        if (fArr.length == 0) {
            return EMPTY_FLOAT_ARRAY;
        }
        float[] fArr2 = new float[fArr.length];
        for (int i = 0; i < fArr.length; i++) {
            fArr2[i] = fArr[i].floatValue();
        }
        return fArr2;
    }

    public static float[] toPrimitive(Float[] fArr, float f) {
        if (fArr == null) {
            return null;
        }
        if (fArr.length == 0) {
            return EMPTY_FLOAT_ARRAY;
        }
        float[] fArr2 = new float[fArr.length];
        for (int i = 0; i < fArr.length; i++) {
            Float f2 = fArr[i];
            fArr2[i] = f2 == null ? f : f2.floatValue();
        }
        return fArr2;
    }

    public static int[] toPrimitive(Integer[] numArr) {
        if (numArr == null) {
            return null;
        }
        if (numArr.length == 0) {
            return EMPTY_INT_ARRAY;
        }
        int[] iArr = new int[numArr.length];
        for (int i = 0; i < numArr.length; i++) {
            iArr[i] = numArr[i].intValue();
        }
        return iArr;
    }

    public static int[] toPrimitive(Integer[] numArr, int i) {
        if (numArr == null) {
            return null;
        }
        if (numArr.length == 0) {
            return EMPTY_INT_ARRAY;
        }
        int[] iArr = new int[numArr.length];
        for (int i2 = 0; i2 < numArr.length; i2++) {
            Integer num = numArr[i2];
            iArr[i2] = num == null ? i : num.intValue();
        }
        return iArr;
    }

    public static long[] toPrimitive(Long[] lArr) {
        if (lArr == null) {
            return null;
        }
        if (lArr.length == 0) {
            return EMPTY_LONG_ARRAY;
        }
        long[] jArr = new long[lArr.length];
        for (int i = 0; i < lArr.length; i++) {
            jArr[i] = lArr[i].longValue();
        }
        return jArr;
    }

    public static long[] toPrimitive(Long[] lArr, long j) {
        if (lArr == null) {
            return null;
        }
        if (lArr.length == 0) {
            return EMPTY_LONG_ARRAY;
        }
        long[] jArr = new long[lArr.length];
        for (int i = 0; i < lArr.length; i++) {
            Long l = lArr[i];
            jArr[i] = l == null ? j : l.longValue();
        }
        return jArr;
    }

    public static short[] toPrimitive(Short[] shArr) {
        if (shArr == null) {
            return null;
        }
        if (shArr.length == 0) {
            return EMPTY_SHORT_ARRAY;
        }
        short[] sArr = new short[shArr.length];
        for (int i = 0; i < shArr.length; i++) {
            sArr[i] = shArr[i].shortValue();
        }
        return sArr;
    }

    public static short[] toPrimitive(Short[] shArr, short s) {
        if (shArr == null) {
            return null;
        }
        if (shArr.length == 0) {
            return EMPTY_SHORT_ARRAY;
        }
        short[] sArr = new short[shArr.length];
        for (int i = 0; i < shArr.length; i++) {
            Short sh = shArr[i];
            sArr[i] = (short) (sh == null ? s : sh.shortValue());
        }
        return sArr;
    }

    public static boolean[] toPrimitive(Boolean[] boolArr) {
        if (boolArr == null) {
            return null;
        }
        if (boolArr.length == 0) {
            return EMPTY_BOOLEAN_ARRAY;
        }
        boolean[] zArr = new boolean[boolArr.length];
        for (int i = 0; i < boolArr.length; i++) {
            zArr[i] = boolArr[i].booleanValue();
        }
        return zArr;
    }

    public static boolean[] toPrimitive(Boolean[] boolArr, boolean z) {
        if (boolArr == null) {
            return null;
        }
        if (boolArr.length == 0) {
            return EMPTY_BOOLEAN_ARRAY;
        }
        boolean[] zArr = new boolean[boolArr.length];
        for (int i = 0; i < boolArr.length; i++) {
            Boolean bool = boolArr[i];
            zArr[i] = bool == null ? z : bool.booleanValue();
        }
        return zArr;
    }

    public static String toString(Object obj) {
        return toString(obj, "{}");
    }

    public static String toString(Object obj, String str) {
        return obj == null ? str : new ToStringBuilder(obj, ToStringStyle.SIMPLE_STYLE).append(obj).toString();
    }
}
