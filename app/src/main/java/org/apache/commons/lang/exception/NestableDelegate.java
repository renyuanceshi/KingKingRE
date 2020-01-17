package org.apache.commons.lang.exception;

import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.Serializable;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class NestableDelegate implements Serializable {
    private static final transient String MUST_BE_THROWABLE = "The Nestable implementation passed to the NestableDelegate(Nestable) constructor must extend java.lang.Throwable";
    static Class class$org$apache$commons$lang$exception$Nestable = null;
    public static boolean matchSubclasses = true;
    private static final long serialVersionUID = 1;
    public static boolean topDown = true;
    public static boolean trimStackFrames = true;
    private Throwable nestable = null;

    public NestableDelegate(Nestable nestable2) {
        if (nestable2 instanceof Throwable) {
            this.nestable = (Throwable) nestable2;
            return;
        }
        throw new IllegalArgumentException(MUST_BE_THROWABLE);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError(e.getMessage());
        }
    }

    public String getMessage(int i) {
        Class cls;
        Throwable throwable = getThrowable(i);
        if (class$org$apache$commons$lang$exception$Nestable == null) {
            cls = class$("org.apache.commons.lang.exception.Nestable");
            class$org$apache$commons$lang$exception$Nestable = cls;
        } else {
            cls = class$org$apache$commons$lang$exception$Nestable;
        }
        return cls.isInstance(throwable) ? ((Nestable) throwable).getMessage(0) : throwable.getMessage();
    }

    public String getMessage(String str) {
        Throwable cause = ExceptionUtils.getCause(this.nestable);
        String message = cause == null ? null : cause.getMessage();
        return (cause == null || message == null) ? str : str != null ? new StringBuffer().append(str).append(": ").append(message).toString() : message;
    }

    public String[] getMessages() {
        Class cls;
        Throwable[] throwables = getThrowables();
        String[] strArr = new String[throwables.length];
        for (int i = 0; i < throwables.length; i++) {
            if (class$org$apache$commons$lang$exception$Nestable == null) {
                cls = class$("org.apache.commons.lang.exception.Nestable");
                class$org$apache$commons$lang$exception$Nestable = cls;
            } else {
                cls = class$org$apache$commons$lang$exception$Nestable;
            }
            strArr[i] = cls.isInstance(throwables[i]) ? ((Nestable) throwables[i]).getMessage(0) : throwables[i].getMessage();
        }
        return strArr;
    }

    /* access modifiers changed from: protected */
    public String[] getStackFrames(Throwable th) {
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter, true);
        if (th instanceof Nestable) {
            ((Nestable) th).printPartialStackTrace(printWriter);
        } else {
            th.printStackTrace(printWriter);
        }
        return ExceptionUtils.getStackFrames(stringWriter.getBuffer().toString());
    }

    public Throwable getThrowable(int i) {
        return i == 0 ? this.nestable : getThrowables()[i];
    }

    public int getThrowableCount() {
        return ExceptionUtils.getThrowableCount(this.nestable);
    }

    public Throwable[] getThrowables() {
        return ExceptionUtils.getThrowables(this.nestable);
    }

    public int indexOfThrowable(Class cls, int i) {
        int i2;
        if (cls == null) {
            return -1;
        }
        if (i < 0) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("The start index was out of bounds: ").append(i).toString());
        }
        Throwable[] throwables = ExceptionUtils.getThrowables(this.nestable);
        if (i >= throwables.length) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("The start index was out of bounds: ").append(i).append(" >= ").append(throwables.length).toString());
        }
        if (matchSubclasses) {
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

    public void printStackTrace() {
        printStackTrace(System.err);
    }

    public void printStackTrace(PrintStream printStream) {
        synchronized (printStream) {
            PrintWriter printWriter = new PrintWriter(printStream, false);
            printStackTrace(printWriter);
            printWriter.flush();
        }
    }

    public void printStackTrace(PrintWriter printWriter) {
        Throwable th = this.nestable;
        if (!ExceptionUtils.isThrowableNested()) {
            ArrayList arrayList = new ArrayList();
            while (th != null) {
                arrayList.add(getStackFrames(th));
                th = ExceptionUtils.getCause(th);
            }
            String str = "Caused by: ";
            if (!topDown) {
                str = "Rethrown as: ";
                Collections.reverse(arrayList);
            }
            String str2 = str;
            if (trimStackFrames) {
                trimStackFrames(arrayList);
            }
            synchronized (printWriter) {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    for (String println : (String[]) it.next()) {
                        printWriter.println(println);
                    }
                    if (it.hasNext()) {
                        printWriter.print(str2);
                    }
                }
            }
        } else if (th instanceof Nestable) {
            ((Nestable) th).printPartialStackTrace(printWriter);
        } else {
            th.printStackTrace(printWriter);
        }
    }

    /* access modifiers changed from: protected */
    public void trimStackFrames(List list) {
        for (int size = list.size() - 1; size > 0; size--) {
            String[] strArr = (String[]) list.get(size);
            ArrayList arrayList = new ArrayList(Arrays.asList(strArr));
            ExceptionUtils.removeCommonFrames(arrayList, new ArrayList(Arrays.asList((String[]) list.get(size - 1))));
            int length = strArr.length - arrayList.size();
            if (length > 0) {
                arrayList.add(new StringBuffer().append("\t... ").append(length).append(" more").toString());
                list.set(size, arrayList.toArray(new String[arrayList.size()]));
            }
        }
    }
}
