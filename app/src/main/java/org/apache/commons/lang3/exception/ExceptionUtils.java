package org.apache.commons.lang3.exception;

import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.ClassUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.SystemUtils;

public class ExceptionUtils {
    private static final String[] CAUSE_METHOD_NAMES = {"getCause", "getNextException", "getTargetException", "getException", "getSourceException", "getRootCause", "getCausedByException", "getNested", "getLinkedException", "getNestedException", "getLinkedCause", "getThrowable"};
    static final String WRAPPED_MARKER = " [wrapped] ";

    @Deprecated
    public static Throwable getCause(Throwable th) {
        return getCause(th, CAUSE_METHOD_NAMES);
    }

    @Deprecated
    public static Throwable getCause(Throwable th, String[] strArr) {
        Throwable causeUsingMethodName;
        if (th == null) {
            return null;
        }
        if (strArr == null) {
            strArr = CAUSE_METHOD_NAMES;
        }
        for (String str : strArr) {
            if (str != null && (causeUsingMethodName = getCauseUsingMethodName(th, str)) != null) {
                return causeUsingMethodName;
            }
        }
        return null;
    }

    private static Throwable getCauseUsingMethodName(Throwable th, String str) {
        Method method;
        try {
            method = th.getClass().getMethod(str, new Class[0]);
        } catch (NoSuchMethodException e) {
            method = null;
        } catch (SecurityException e2) {
            method = null;
        }
        if (method != null && Throwable.class.isAssignableFrom(method.getReturnType())) {
            try {
                return (Throwable) method.invoke(th, new Object[0]);
            } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e3) {
            }
        }
        return null;
    }

    @Deprecated
    public static String[] getDefaultCauseMethodNames() {
        return (String[]) ArrayUtils.clone((T[]) CAUSE_METHOD_NAMES);
    }

    public static String getMessage(Throwable th) {
        if (th == null) {
            return "";
        }
        return ClassUtils.getShortClassName(th, (String) null) + ": " + StringUtils.defaultString(th.getMessage());
    }

    public static Throwable getRootCause(Throwable th) {
        List<Throwable> throwableList = getThrowableList(th);
        if (throwableList.size() < 2) {
            return null;
        }
        return throwableList.get(throwableList.size() - 1);
    }

    public static String getRootCauseMessage(Throwable th) {
        Throwable rootCause = getRootCause(th);
        if (rootCause != null) {
            th = rootCause;
        }
        return getMessage(th);
    }

    public static String[] getRootCauseStackTrace(Throwable th) {
        List<String> list;
        if (th == null) {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        Throwable[] throwables = getThrowables(th);
        int length = throwables.length;
        ArrayList arrayList = new ArrayList();
        List<String> stackFrameList = getStackFrameList(throwables[length - 1]);
        int i = length;
        while (true) {
            int i2 = i - 1;
            if (i2 < 0) {
                return (String[]) arrayList.toArray(new String[arrayList.size()]);
            }
            if (i2 != 0) {
                List<String> stackFrameList2 = getStackFrameList(throwables[i2 - 1]);
                removeCommonFrames(stackFrameList, stackFrameList2);
                list = stackFrameList2;
            } else {
                list = stackFrameList;
            }
            if (i2 == length - 1) {
                arrayList.add(throwables[i2].toString());
            } else {
                arrayList.add(WRAPPED_MARKER + throwables[i2].toString());
            }
            for (int i3 = 0; i3 < stackFrameList.size(); i3++) {
                arrayList.add(stackFrameList.get(i3));
            }
            i = i2;
            stackFrameList = list;
        }
    }

    static List<String> getStackFrameList(Throwable th) {
        StringTokenizer stringTokenizer = new StringTokenizer(getStackTrace(th), SystemUtils.LINE_SEPARATOR);
        ArrayList arrayList = new ArrayList();
        boolean z = false;
        while (stringTokenizer.hasMoreTokens()) {
            String nextToken = stringTokenizer.nextToken();
            int indexOf = nextToken.indexOf("at");
            if (indexOf != -1 && nextToken.substring(0, indexOf).trim().isEmpty()) {
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
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
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

    public static List<Throwable> getThrowableList(Throwable th) {
        ArrayList arrayList = new ArrayList();
        while (th != null && !arrayList.contains(th)) {
            arrayList.add(th);
            th = getCause(th);
        }
        return arrayList;
    }

    public static Throwable[] getThrowables(Throwable th) {
        List<Throwable> throwableList = getThrowableList(th);
        return (Throwable[]) throwableList.toArray(new Throwable[throwableList.size()]);
    }

    private static int indexOf(Throwable th, Class<?> cls, int i, boolean z) {
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

    public static int indexOfThrowable(Throwable th, Class<?> cls) {
        return indexOf(th, cls, 0, false);
    }

    public static int indexOfThrowable(Throwable th, Class<?> cls, int i) {
        return indexOf(th, cls, i, false);
    }

    public static int indexOfType(Throwable th, Class<?> cls) {
        return indexOf(th, cls, 0, true);
    }

    public static int indexOfType(Throwable th, Class<?> cls, int i) {
        return indexOf(th, cls, i, true);
    }

    public static void printRootCauseStackTrace(Throwable th) {
        printRootCauseStackTrace(th, System.err);
    }

    public static void printRootCauseStackTrace(Throwable th, PrintStream printStream) {
        if (th != null) {
            if (printStream == null) {
                throw new IllegalArgumentException("The PrintStream must not be null");
            }
            for (String println : getRootCauseStackTrace(th)) {
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
            for (String println : getRootCauseStackTrace(th)) {
                printWriter.println(println);
            }
            printWriter.flush();
        }
    }

    public static void removeCommonFrames(List<String> list, List<String> list2) {
        if (list == null || list2 == null) {
            throw new IllegalArgumentException("The List must not be null");
        }
        int size = list.size() - 1;
        int size2 = list2.size() - 1;
        for (int i = size; i >= 0 && size2 >= 0; i--) {
            if (list.get(i).equals(list2.get(size2))) {
                list.remove(i);
            }
            size2--;
        }
    }
}
