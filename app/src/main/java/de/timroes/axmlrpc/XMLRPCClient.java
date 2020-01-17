package de.timroes.axmlrpc;

import de.timroes.axmlrpc.serializer.SerializerHandler;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.SocketException;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.Map;

public class XMLRPCClient {
    static final String CONTENT_LENGTH = "Content-Length";
    static final String CONTENT_TYPE = "Content-Type";
    private static final String DEFAULT_USER_AGENT = "aXMLRPC";
    static final String FAULT = "fault";
    public static final int FLAGS_8BYTE_INT = 2;
    public static final int FLAGS_ENABLE_COOKIES = 4;
    public static final int FLAGS_IGNORE_STATUSCODE = 16;
    public static final int FLAGS_NIL = 8;
    public static final int FLAGS_NONE = 0;
    public static final int FLAGS_STRICT = 1;
    static final String HOST = "Host";
    static final String HTTP_POST = "POST";
    static final String METHOD_CALL = "methodCall";
    static final String METHOD_NAME = "methodName";
    static final String METHOD_RESPONSE = "methodResponse";
    static final String PARAM = "param";
    static final String PARAMS = "params";
    static final String STRUCT_MEMBER = "member";
    static final String TYPE_XML = "text/xml";
    static final String USER_AGENT = "User-Agent";
    static final String VALUE = "value";
    /* access modifiers changed from: private */
    public AuthenticationManager authManager;
    /* access modifiers changed from: private */
    public Map<Long, Caller> backgroundCalls;
    /* access modifiers changed from: private */
    public CookieManager cookieManager;
    private int flags;
    /* access modifiers changed from: private */
    public Map<String, String> httpParameters;
    /* access modifiers changed from: private */
    public ResponseParser responseParser;
    /* access modifiers changed from: private */
    public URL url;

    private class Caller extends Thread {
        private volatile boolean canceled;
        private HttpURLConnection http;
        private XMLRPCCallback listener;
        private String methodName;
        private Object[] params;
        private long threadId;

        public Caller() {
        }

        public Caller(XMLRPCCallback xMLRPCCallback, long j, String str, Object[] objArr) {
            this.listener = xMLRPCCallback;
            this.threadId = j;
            this.methodName = str;
            this.params = objArr;
        }

        public Object call(String str, Object[] objArr) throws XMLRPCException {
            try {
                Call access$100 = XMLRPCClient.this.createCall(str, objArr);
                URLConnection openConnection = XMLRPCClient.this.url.openConnection();
                if (!(openConnection instanceof HttpURLConnection)) {
                    throw new IllegalArgumentException("The URL is not for a http connection.");
                }
                this.http = (HttpURLConnection) openConnection;
                this.http.setRequestMethod("POST");
                this.http.setDoOutput(true);
                this.http.setDoInput(true);
                for (Map.Entry entry : XMLRPCClient.this.httpParameters.entrySet()) {
                    this.http.setRequestProperty((String) entry.getKey(), (String) entry.getValue());
                }
                XMLRPCClient.this.authManager.setAuthentication(this.http);
                XMLRPCClient.this.cookieManager.setCookies(this.http);
                OutputStreamWriter outputStreamWriter = new OutputStreamWriter(this.http.getOutputStream());
                outputStreamWriter.write(access$100.getXML());
                outputStreamWriter.flush();
                outputStreamWriter.close();
                InputStream inputStream = this.http.getInputStream();
                if (!XMLRPCClient.this.isFlagSet(16) && this.http.getResponseCode() != 200) {
                    throw new XMLRPCException("The status code of the http response must be 200.");
                } else if (!XMLRPCClient.this.isFlagSet(1) || this.http.getContentType().startsWith(XMLRPCClient.TYPE_XML)) {
                    XMLRPCClient.this.cookieManager.readCookies(this.http);
                    return XMLRPCClient.this.responseParser.parse(inputStream);
                } else {
                    throw new XMLRPCException("The Content-Type of the response must be text/xml.");
                }
            } catch (SocketException e) {
                if (!this.canceled || this.threadId <= 0) {
                    throw new XMLRPCException((Exception) e);
                }
                throw new CancelException();
            } catch (IOException e2) {
                throw new XMLRPCException((Exception) e2);
            }
        }

        public void cancel() {
            this.canceled = true;
            this.http.disconnect();
        }

        public void run() {
            if (this.listener != null) {
                try {
                    XMLRPCClient.this.backgroundCalls.put(Long.valueOf(this.threadId), this);
                    this.listener.onResponse(this.threadId, call(this.methodName, this.params));
                } catch (CancelException e) {
                } catch (XMLRPCServerException e2) {
                    this.listener.onServerError(this.threadId, e2);
                } catch (XMLRPCException e3) {
                    this.listener.onError(this.threadId, e3);
                } finally {
                    XMLRPCClient.this.backgroundCalls.remove(Long.valueOf(this.threadId));
                }
            }
        }
    }

    private class CancelException extends RuntimeException {
        private CancelException() {
        }
    }

    public XMLRPCClient(URL url2) {
        this(url2, DEFAULT_USER_AGENT, 0);
    }

    public XMLRPCClient(URL url2, int i) {
        this(url2, DEFAULT_USER_AGENT, i);
    }

    public XMLRPCClient(URL url2, String str) {
        this(url2, str, 0);
    }

    public XMLRPCClient(URL url2, String str, int i) {
        this.httpParameters = new HashMap();
        this.backgroundCalls = new HashMap();
        SerializerHandler.initialize(i);
        this.url = url2;
        this.flags = i;
        this.responseParser = new ResponseParser();
        this.cookieManager = new CookieManager(i);
        this.authManager = new AuthenticationManager();
        this.httpParameters.put("Content-Type", TYPE_XML);
        this.httpParameters.put("User-Agent", str);
    }

    /* access modifiers changed from: private */
    public Call createCall(String str, Object[] objArr) {
        if (!isFlagSet(1) || str.matches("^[A-Za-z0-9\\._:/]*$")) {
            return new Call(str, objArr);
        }
        throw new XMLRPCRuntimeException("Method name must only contain A-Z a-z . : _ / ");
    }

    /* access modifiers changed from: private */
    public boolean isFlagSet(int i) {
        return (this.flags & i) != 0;
    }

    public Object call(String str) throws XMLRPCException {
        return call(str, (Object[]) null);
    }

    public Object call(String str, Object obj) throws XMLRPCException {
        return call(str, new Object[]{obj});
    }

    public Object call(String str, Object obj, Object obj2) throws XMLRPCException {
        return call(str, new Object[]{obj, obj2});
    }

    public Object call(String str, Object obj, Object obj2, Object obj3) throws XMLRPCException {
        return call(str, new Object[]{obj, obj2, obj3});
    }

    public Object call(String str, Object obj, Object obj2, Object obj3, Object obj4) throws XMLRPCException {
        return call(str, new Object[]{obj, obj2, obj3, obj4});
    }

    public Object call(String str, Object[] objArr) throws XMLRPCException {
        return new Caller().call(str, objArr);
    }

    public long callAsync(XMLRPCCallback xMLRPCCallback, String str) {
        return callAsync(xMLRPCCallback, str, (Object[]) null);
    }

    public long callAsync(XMLRPCCallback xMLRPCCallback, String str, Object obj) {
        return callAsync(xMLRPCCallback, str, new Object[]{obj});
    }

    public long callAsync(XMLRPCCallback xMLRPCCallback, String str, Object obj, Object obj2) {
        return callAsync(xMLRPCCallback, str, new Object[]{obj, obj2});
    }

    public long callAsync(XMLRPCCallback xMLRPCCallback, String str, Object obj, Object obj2, Object obj3) {
        return callAsync(xMLRPCCallback, str, new Object[]{obj, obj2, obj3});
    }

    public long callAsync(XMLRPCCallback xMLRPCCallback, String str, Object obj, Object obj2, Object obj3, Object obj4) {
        return callAsync(xMLRPCCallback, str, new Object[]{obj, obj2, obj3, obj4});
    }

    public long callAsync(XMLRPCCallback xMLRPCCallback, String str, Object[] objArr) {
        long currentTimeMillis = System.currentTimeMillis();
        new Caller(xMLRPCCallback, currentTimeMillis, str, objArr).start();
        return currentTimeMillis;
    }

    public void cancel(long j) {
        Caller caller = this.backgroundCalls.get(Long.valueOf(j));
        if (caller != null) {
            caller.cancel();
            try {
                caller.join();
            } catch (InterruptedException e) {
            }
        }
    }

    public void clearCookies() {
        this.cookieManager.clearCookies();
    }

    public void setCustomHttpHeader(String str, String str2) {
        if ("Content-Type".equals(str) || "Host".equals(str) || "Content-Length".equals(str)) {
            throw new XMLRPCRuntimeException("You cannot modify the Host, Content-Type or Content-Length header.");
        }
        this.httpParameters.put(str, str2);
    }

    public void setLoginData(String str, String str2) {
        this.authManager.setAuthData(str, str2);
    }

    public void setUserAgentString(String str) {
        this.httpParameters.put("User-Agent", str);
    }
}
