package com.orhanobut.logger;

import java.io.StringReader;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class LoggerPrinter implements Printer {
    private static final int JSON_INDENT = 2;
    private final ThreadLocal<String> localTag = new ThreadLocal<>();
    private final List<LogAdapter> logAdapters = new ArrayList();

    LoggerPrinter() {
    }

    private String createMessage(String str, Object... objArr) {
        return (objArr == null || objArr.length == 0) ? str : String.format(str, objArr);
    }

    private String getTag() {
        String str = this.localTag.get();
        if (str == null) {
            return null;
        }
        this.localTag.remove();
        return str;
    }

    private void log(int i, Throwable th, String str, Object... objArr) {
        synchronized (this) {
            log(i, getTag(), createMessage(str, objArr), th);
        }
    }

    public void addAdapter(LogAdapter logAdapter) {
        this.logAdapters.add(logAdapter);
    }

    public void clearLogAdapters() {
        this.logAdapters.clear();
    }

    public void d(Object obj) {
        log(3, (Throwable) null, Utils.toString(obj), new Object[0]);
    }

    public void d(String str, Object... objArr) {
        log(3, (Throwable) null, str, objArr);
    }

    public void e(String str, Object... objArr) {
        e((Throwable) null, str, objArr);
    }

    public void e(Throwable th, String str, Object... objArr) {
        log(6, th, str, objArr);
    }

    public void i(String str, Object... objArr) {
        log(4, (Throwable) null, str, objArr);
    }

    public void json(String str) {
        if (Utils.isEmpty(str)) {
            d("Empty/Null json content");
            return;
        }
        try {
            String trim = str.trim();
            if (trim.startsWith("{")) {
                d(new JSONObject(trim).toString(2));
            } else if (trim.startsWith("[")) {
                d(new JSONArray(trim).toString(2));
            } else {
                e("Invalid Json", new Object[0]);
            }
        } catch (JSONException e) {
            e("Invalid Json", new Object[0]);
        }
    }

    public void log(int i, String str, String str2, Throwable th) {
        synchronized (this) {
            String str3 = (th == null || str2 == null) ? str2 : str2 + " : " + Utils.getStackTraceString(th);
            if (th != null && str3 == null) {
                str3 = Utils.getStackTraceString(th);
            }
            String str4 = Utils.isEmpty(str3) ? "Empty/NULL log message" : str3;
            for (LogAdapter next : this.logAdapters) {
                if (next.isLoggable(i, str)) {
                    next.log(i, str, str4);
                }
            }
        }
    }

    public Printer t(String str) {
        if (str != null) {
            this.localTag.set(str);
        }
        return this;
    }

    public void v(String str, Object... objArr) {
        log(2, (Throwable) null, str, objArr);
    }

    public void w(String str, Object... objArr) {
        log(5, (Throwable) null, str, objArr);
    }

    public void wtf(String str, Object... objArr) {
        log(7, (Throwable) null, str, objArr);
    }

    public void xml(String str) {
        if (Utils.isEmpty(str)) {
            d("Empty/Null xml content");
            return;
        }
        try {
            StreamSource streamSource = new StreamSource(new StringReader(str));
            StreamResult streamResult = new StreamResult(new StringWriter());
            Transformer newTransformer = TransformerFactory.newInstance().newTransformer();
            newTransformer.setOutputProperty("indent", "yes");
            newTransformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
            newTransformer.transform(streamSource, streamResult);
            d(streamResult.getWriter().toString().replaceFirst(">", ">\n"));
        } catch (TransformerException e) {
            e("Invalid xml", new Object[0]);
        }
    }
}
