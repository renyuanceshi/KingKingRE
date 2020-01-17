package org.apache.commons.lang.exception;

import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.ClassUtils;
import org.apache.commons.lang.NullArgumentException;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.SystemUtils;

public class ExceptionUtils {
    private static String[] CAUSE_METHOD_NAMES = {"getCause", "getNextException", "getTargetException", "getException", "getSourceException", "getRootCause", "getCausedByException", "getNested", "getLinkedException", "getNestedException", "getLinkedCause", "getThrowable"};
    private static final Object CAUSE_METHOD_NAMES_LOCK = new Object();
    private static final Method THROWABLE_CAUSE_METHOD;
    private static final Method THROWABLE_INITCAUSE_METHOD;
    static final String WRAPPED_MARKER = " [wrapped] ";
    static Class class$java$lang$Throwable;

    static {
        Method method;
        Class cls;
        Class cls2;
        Class cls3;
        Method method2 = null;
        try {
            if (class$java$lang$Throwable == null) {
                cls3 = class$("java.lang.Throwable");
                class$java$lang$Throwable = cls3;
            } else {
                cls3 = class$java$lang$Throwable;
            }
            method = cls3.getMethod("getCause", (Class[]) null);
        } catch (Exception e) {
            method = null;
        }
        THROWABLE_CAUSE_METHOD = method;
        try {
            if (class$java$lang$Throwable == null) {
                Class class$ = class$("java.lang.Throwable");
                class$java$lang$Throwable = class$;
                cls = class$;
            } else {
                cls = class$java$lang$Throwable;
            }
            if (class$java$lang$Throwable == null) {
                cls2 = class$("java.lang.Throwable");
                class$java$lang$Throwable = cls2;
            } else {
                cls2 = class$java$lang$Throwable;
            }
            method2 = cls.getMethod("initCause", new Class[]{cls2});
        } catch (Exception e2) {
        }
        THROWABLE_INITCAUSE_METHOD = method2;
    }

    public static void addCauseMethodName(String str) {
        if (StringUtils.isNotEmpty(str) && !isCauseMethodName(str)) {
            ArrayList causeMethodNameList = getCauseMethodNameList();
            if (causeMethodNameList.add(str)) {
                synchronized (CAUSE_METHOD_NAMES_LOCK) {
                    CAUSE_METHOD_NAMES = toArray(causeMethodNameList);
                }
            }
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError(e.getMessage());
        }
    }

    public static Throwable getCause(Throwable th) {
        Throwable cause;
        synchronized (CAUSE_METHOD_NAMES_LOCK) {
            cause = getCause(th, CAUSE_METHOD_NAMES);
        }
        return cause;
    }

    public static Throwable getCause(Throwable th, String[] strArr) {
        if (th == null) {
            return null;
        }
        Throwable causeUsingWellKnownTypes = getCauseUsingWellKnownTypes(th);
        if (causeUsingWellKnownTypes != null) {
            return causeUsingWellKnownTypes;
        }
        if (strArr == null) {
            synchronized (CAUSE_METHOD_NAMES_LOCK) {
                strArr = CAUSE_METHOD_NAMES;
            }
        }
        int i = 0;
        while (i < strArr.length && ((r2 = strArr[i]) == null || (causeUsingWellKnownTypes = getCauseUsingMethodName(th, r2)) == null)) {
            i++;
        }
        return causeUsingWellKnownTypes == null ? getCauseUsingFieldName(th, "detail") : causeUsingWellKnownTypes;
    }

    private static ArrayList getCauseMethodNameList() {
        ArrayList arrayList;
        synchronized (CAUSE_METHOD_NAMES_LOCK) {
            arrayList = new ArrayList(Arrays.asList(CAUSE_METHOD_NAMES));
        }
        return arrayList;
    }

    private static Throwable getCauseUsingFieldName(Throwable th, String str) {
        Field field;
        Class cls;
        try {
            field = th.getClass().getField(str);
        } catch (NoSuchFieldException e) {
            field = null;
        } catch (SecurityException e2) {
            field = null;
        }
        if (field != null) {
            if (class$java$lang$Throwable == null) {
                cls = class$("java.lang.Throwable");
                class$java$lang$Throwable = cls;
            } else {
                cls = class$java$lang$Throwable;
            }
            if (cls.isAssignableFrom(field.getType())) {
                try {
                    return (Throwable) field.get(th);
                } catch (IllegalAccessException | IllegalArgumentException e3) {
                }
            }
        }
        return null;
    }

    private static Throwable getCauseUsingMethodName(Throwable th, String str) {
        Method method;
        Class cls;
        try {
            method = th.getClass().getMethod(str, (Class[]) null);
        } catch (NoSuchMethodException e) {
            method = null;
        } catch (SecurityException e2) {
            method = null;
        }
        if (method != null) {
            if (class$java$lang$Throwable == null) {
                cls = class$("java.lang.Throwable");
                class$java$lang$Throwable = cls;
            } else {
                cls = class$java$lang$Throwable;
            }
            if (cls.isAssignableFrom(method.getReturnType())) {
                try {
                    return (Throwable) method.invoke(th, ArrayUtils.EMPTY_OBJECT_ARRAY);
                } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e3) {
                }
            }
        }
        return null;
    }

    private static Throwable getCauseUsingWellKnownTypes(Throwable th) {
        if (th instanceof Nestable) {
            return ((Nestable) th).getCause();
        }
        if (th instanceof SQLException) {
            return ((SQLException) th).getNextException();
        }
        if (th instanceof InvocationTargetException) {
            return ((InvocationTargetException) th).getTargetException();
        }
        return null;
    }

    public static String getFullStackTrace(Throwable th) {
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter, true);
        Throwable[] throwables = getThrowables(th);
        for (int i = 0; i < throwables.length; i++) {
            throwables[i].printStackTrace(printWriter);
            if (isNestedThrowable(throwables[i])) {
                break;
            }
        }
        return stringWriter.getBuffer().toString();
    }

    public static String getMessage(Throwable th) {
        if (th == null) {
            return "";
        }
        return new StringBuffer().append(ClassUtils.getShortClassName(th, (String) null)).append(": ").append(StringUtils.defaultString(th.getMessage())).toString();
    }

    public static Throwable getRootCause(Throwable th) {
        List throwableList = getThrowableList(th);
        if (throwableList.size() < 2) {
            return null;
        }
        return (Throwable) throwableList.get(throwableList.size() - 1);
    }

    public static String getRootCauseMessage(Throwable th) {
        Throwable rootCause = getRootCause(th);
        if (rootCause != null) {
            th = rootCause;
        }
        return getMessage(th);
    }

    public static String[] getRootCauseStackTrace(Throwable th) {
        List list;
        if (th == null) {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        Throwable[] throwables = getThrowables(th);
        int length = throwables.length;
        ArrayList arrayList = new ArrayList();
        List stackFrameList = getStackFrameList(throwables[length - 1]);
        int i = length;
        while (true) {
            int i2 = i - 1;
            if (i2 < 0) {
                return (String[]) arrayList.toArray(new String[0]);
            }
            if (i2 != 0) {
                List stackFrameList2 = getStackFrameList(throwables[i2 - 1]);
                removeCommonFrames(stackFrameList, stackFrameList2);
                list = stackFrameList2;
            } else {
                list = stackFrameList;
            }
            if (i2 == length - 1) {
                arrayList.add(throwables[i2].toString());
            } else {
                arrayList.add(new StringBuffer().append(WRAPPED_MARKER).append(throwables[i2].toString()).toString());
            }
            for (int i3 = 0; i3 < stackFrameList.size(); i3++) {
                arrayList.add(stackFrameList.get(i3));
            }
            i = i2;
            stackFrameList = list;
        }
    }

    static List getStackFrameList(Throwable th) {
        StringTokenizer stringTokenizer = new StringTokenizer(getStackTrace(th), SystemUtils.LINE_SEPARATOR);
        ArrayList arrayList = new ArrayList();
        boolean z = false;
        while (stringTokenizer.hasMoreTokens()) {
            String nextToken = stringTokenizer.nextToken();
            int indexOf = nextToken.indexOf("at");
            if (indexOf != -1 && nextToken.substring(0, indexOf).trim().length() == 0) {
                z = true;
                arrayList.add(nextToken);
            } else if (z) {
                break;
            }
        }
        return arrayList;
    }

    static String[] getStackFrames(String str) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, SystemUtils.LINE_SEPARATOR);
        ArrayList arrayList = new ArrayList();
        while (stringTokenizer.hasMoreTokens()) {
            arrayList.add(stringTokenizer.nextToken());
        }
        return toArray(arrayList);
    }

    public static String[] getStackFrames(Throwable th) {
        return th == null ? ArrayUtils.EMPTY_STRING_ARRAY : getStackFrames(getStackTrace(th));
    }

    public static String getStackTrace(Throwable th) {
        StringWriter stringWriter = new StringWriter();
        th.printStackTrace(new PrintWriter(stringWriter, true));
        return stringWriter.getBuffer().toString();
    }

    public static int getThrowableCount(Throwable th) {
        return getThrowableList(th).size();
    }

    public static List getThrowableList(Throwable th) {
        ArrayList arrayList = new ArrayList();
        while (th != null && !arrayList.contains(th)) {
            arrayList.add(th);
            th = getCause(th);
        }
        return arrayList;
    }

    public static Throwable[] getThrowables(Throwable th) {
        List throwableList = getThrowableList(th);
        return (Throwable[]) throwableList.toArray(new Throwable[throwableList.size()]);
    }

    private static int indexOf(Throwable th, Class cls, int i, boolean z) {
        int i2;
        if (th == null || cls == null) {
            return -1;
        }
        if (i < 0) {
            i = 0;
        }
        Throwable[] throwables = getThrowables(th);
        if (i >= throwables.length) {
            return -1;
        }
        if (z) {
            i2 = i;
            while (i2 < throwables.length) {
                if (!cls.isAssignableFrom(throwables[i2].getClass())) {
                    i2++;
                }
            }
            return -1;
        }
        int i3 = i;
        while (i2 < throwables.length) {
            if (!cls.equals(throwables[i2].getClass())) {
                i3 = i2 + 1;
            }
        }
        return -1;
        return i2;
    }

    public static int indexOfThrowable(Throwable th, Class cls) {
        return indexOf(th, cls, 0, false);
    }

    public static int indexOfThrowable(Throwable th, Class cls, int i) {
        return indexOf(th, cls, i, false);
    }

    public static int indexOfType(Throwable th, Class cls) {
        return indexOf(th, cls, 0, true);
    }

    public static int indexOfType(Throwable th, Class cls, int i) {
        return indexOf(th, cls, i, true);
    }

    public static boolean isCauseMethodName(String str) {
        boolean z;
        synchronized (CAUSE_METHOD_NAMES_LOCK) {
            z = ArrayUtils.indexOf((Object[]) CAUSE_METHOD_NAMES, (Object) str) >= 0;
        }
        return z;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:40:0x0059, code lost:
        if (r4.getField("detail") == null) goto L_0x0004;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:?, code lost:
        return false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:?, code lost:
        return false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:?, code lost:
        return true;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean isNestedThrowable(java.lang.Throwable r8) {
        /*
            r1 = 0
            r0 = 1
            if (r8 != 0) goto L_0x0006
        L_0x0004:
            r0 = r1
        L_0x0005:
            return r0
        L_0x0006:
            boolean r2 = r8 instanceof org.apache.commons.lang.exception.Nestable
            if (r2 != 0) goto L_0x0005
            boolean r2 = r8 instanceof java.sql.SQLException
            if (r2 != 0) goto L_0x0005
            boolean r2 = r8 instanceof java.lang.reflect.InvocationTargetException
            if (r2 != 0) goto L_0x0005
            boolean r2 = isThrowableNested()
            if (r2 != 0) goto L_0x0005
            java.lang.Class r4 = r8.getClass()
            java.lang.Object r5 = CAUSE_METHOD_NAMES_LOCK
            monitor-enter(r5)
            java.lang.String[] r2 = CAUSE_METHOD_NAMES     // Catch:{ all -> 0x0048 }
            int r6 = r2.length     // Catch:{ all -> 0x0048 }
            r2 = r1
        L_0x0023:
            if (r2 >= r6) goto L_0x0052
            java.lang.String[] r3 = CAUSE_METHOD_NAMES     // Catch:{ NoSuchMethodException -> 0x004e, SecurityException -> 0x0062 }
            r3 = r3[r2]     // Catch:{ NoSuchMethodException -> 0x004e, SecurityException -> 0x0062 }
            r7 = 0
            java.lang.reflect.Method r7 = r4.getMethod(r3, r7)     // Catch:{ NoSuchMethodException -> 0x004e, SecurityException -> 0x0062 }
            if (r7 == 0) goto L_0x004f
            java.lang.Class r3 = class$java$lang$Throwable     // Catch:{ NoSuchMethodException -> 0x004e, SecurityException -> 0x0062 }
            if (r3 != 0) goto L_0x004b
            java.lang.String r3 = "java.lang.Throwable"
            java.lang.Class r3 = class$(r3)     // Catch:{ NoSuchMethodException -> 0x004e, SecurityException -> 0x0062 }
            class$java$lang$Throwable = r3     // Catch:{ NoSuchMethodException -> 0x004e, SecurityException -> 0x0062 }
        L_0x003c:
            java.lang.Class r7 = r7.getReturnType()     // Catch:{ NoSuchMethodException -> 0x004e, SecurityException -> 0x0062 }
            boolean r3 = r3.isAssignableFrom(r7)     // Catch:{ NoSuchMethodException -> 0x004e, SecurityException -> 0x0062 }
            if (r3 == 0) goto L_0x004f
            monitor-exit(r5)     // Catch:{ all -> 0x0048 }
            goto L_0x0005
        L_0x0048:
            r0 = move-exception
            monitor-exit(r5)     // Catch:{ all -> 0x0048 }
            throw r0
        L_0x004b:
            java.lang.Class r3 = class$java$lang$Throwable     // Catch:{ NoSuchMethodException -> 0x004e, SecurityException -> 0x0062 }
            goto L_0x003c
        L_0x004e:
            r3 = move-exception
        L_0x004f:
            int r2 = r2 + 1
            goto L_0x0023
        L_0x0052:
            monitor-exit(r5)     // Catch:{ all -> 0x0048 }
            java.lang.String r2 = "detail"
            java.lang.reflect.Field r2 = r4.getField(r2)     // Catch:{ NoSuchFieldException -> 0x005f, SecurityException -> 0x005c }
            if (r2 == 0) goto L_0x0004
            goto L_0x0005
        L_0x005c:
            r0 = move-exception
            r0 = r1
            goto L_0x0005
        L_0x005f:
            r0 = move-exception
            r0 = r1
            goto L_0x0005
        L_0x0062:
            r3 = move-exception
            goto L_0x004f
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.exception.ExceptionUtils.isNestedThrowable(java.lang.Throwable):boolean");
    }

    public static boolean isThrowableNested() {
        return THROWABLE_CAUSE_METHOD != null;
    }

    public static void printRootCauseStackTrace(Throwable th) {
        printRootCauseStackTrace(th, System.err);
    }

    public static void printRootCauseStackTrace(Throwable th, PrintStream printStream) {
        if (th != null) {
            if (printStream == null) {
                throw new IllegalArgumentException("The PrintStream must not be null");
            }
            String[] rootCauseStackTrace = getRootCauseStackTrace(th);
            for (String println : rootCauseStackTrace) {
                printStream.println(println);
            }
            printStream.flush();
        }
    }

    public static void printRootCauseStackTrace(Throwable th, PrintWriter printWriter) {
        if (th != null) {
            if (printWriter == null) {
                throw new IllegalArgumentException("The PrintWriter must not be null");
            }
            String[] rootCauseStackTrace = getRootCauseStackTrace(th);
            for (String println : rootCauseStackTrace) {
                printWriter.println(println);
            }
            printWriter.flush();
        }
    }

    public static void removeCauseMethodName(String str) {
        if (StringUtils.isNotEmpty(str)) {
            ArrayList causeMethodNameList = getCauseMethodNameList();
            if (causeMethodNameList.remove(str)) {
                synchronized (CAUSE_METHOD_NAMES_LOCK) {
                    CAUSE_METHOD_NAMES = toArray(causeMethodNameList);
                }
            }
        }
    }

    public static void removeCommonFrames(List list, List list2) {
        if (list == null || list2 == null) {
            throw new IllegalArgumentException("The List must not be null");
        }
        int size = list.size() - 1;
        int size2 = list2.size() - 1;
        for (int i = size; i >= 0 && size2 >= 0; i--) {
            if (((String) list.get(i)).equals((String) list2.get(size2))) {
                list.remove(i);
            }
            size2--;
        }
    }

    public static boolean setCause(Throwable th, Throwable th2) {
        Class cls;
        boolean z = false;
        if (th == null) {
            throw new NullArgumentException("target");
        }
        Object[] objArr = {th2};
        if (THROWABLE_INITCAUSE_METHOD != null) {
            try {
                THROWABLE_INITCAUSE_METHOD.invoke(th, objArr);
                z = true;
            } catch (IllegalAccessException | InvocationTargetException e) {
            }
        }
        try {
            Class<?> cls2 = th.getClass();
            if (class$java$lang$Throwable == null) {
                cls = class$("java.lang.Throwable");
                class$java$lang$Throwable = cls;
            } else {
                cls = class$java$lang$Throwable;
            }
            cls2.getMethod("setCause", new Class[]{cls}).invoke(th, objArr);
            return true;
        } catch (NoSuchMethodException e2) {
            return z;
        } catch (IllegalAccessException e3) {
            return z;
        } catch (InvocationTargetException e4) {
            return z;
        }
    }

    private static String[] toArray(List list) {
        return (String[]) list.toArray(new String[list.size()]);
    }
}
