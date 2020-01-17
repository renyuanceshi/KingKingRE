package org.apache.http.impl.conn;

import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpHost;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.client.protocol.ClientContext;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.DnsResolver;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeLayeredSocketFactory;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
@ThreadSafe
public class DefaultClientConnectionOperator implements ClientConnectionOperator {
    protected final DnsResolver dnsResolver;
    private final Log log = LogFactory.getLog(getClass());
    protected final SchemeRegistry schemeRegistry;

    public DefaultClientConnectionOperator(SchemeRegistry schemeRegistry2) {
        Args.notNull(schemeRegistry2, "Scheme registry");
        this.schemeRegistry = schemeRegistry2;
        this.dnsResolver = new SystemDefaultDnsResolver();
    }

    public DefaultClientConnectionOperator(SchemeRegistry schemeRegistry2, DnsResolver dnsResolver2) {
        Args.notNull(schemeRegistry2, "Scheme registry");
        Args.notNull(dnsResolver2, "DNS resolver");
        this.schemeRegistry = schemeRegistry2;
        this.dnsResolver = dnsResolver2;
    }

    private SchemeRegistry getSchemeRegistry(HttpContext httpContext) {
        SchemeRegistry schemeRegistry2 = (SchemeRegistry) httpContext.getAttribute(ClientContext.SCHEME_REGISTRY);
        return schemeRegistry2 == null ? this.schemeRegistry : schemeRegistry2;
    }

    public OperatedClientConnection createConnection() {
        return new DefaultClientConnection();
    }

    /* JADX WARNING: Removed duplicated region for block: B:31:0x00b6  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00da A[SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void openConnection(org.apache.http.conn.OperatedClientConnection r14, org.apache.http.HttpHost r15, java.net.InetAddress r16, org.apache.http.protocol.HttpContext r17, org.apache.http.params.HttpParams r18) throws java.io.IOException {
        /*
            r13 = this;
            java.lang.String r2 = "Connection"
            org.apache.http.util.Args.notNull(r14, r2)
            java.lang.String r2 = "Target host"
            org.apache.http.util.Args.notNull(r15, r2)
            java.lang.String r2 = "HTTP parameters"
            r0 = r18
            org.apache.http.util.Args.notNull(r0, r2)
            boolean r2 = r14.isOpen()
            if (r2 != 0) goto L_0x00a1
            r2 = 1
        L_0x0018:
            java.lang.String r3 = "Connection must not be open"
            org.apache.http.util.Asserts.check(r2, r3)
            r0 = r17
            org.apache.http.conn.scheme.SchemeRegistry r2 = r13.getSchemeRegistry(r0)
            java.lang.String r3 = r15.getSchemeName()
            org.apache.http.conn.scheme.Scheme r2 = r2.getScheme((java.lang.String) r3)
            org.apache.http.conn.scheme.SchemeSocketFactory r6 = r2.getSchemeSocketFactory()
            java.lang.String r3 = r15.getHostName()
            java.net.InetAddress[] r7 = r13.resolveHostname(r3)
            int r3 = r15.getPort()
            int r8 = r2.resolvePort(r3)
            r2 = 0
            r4 = r2
        L_0x0041:
            int r2 = r7.length
            if (r4 >= r2) goto L_0x00a0
            r3 = r7[r4]
            int r2 = r7.length
            int r2 = r2 + -1
            if (r4 != r2) goto L_0x00a4
            r2 = 1
        L_0x004c:
            r0 = r18
            java.net.Socket r5 = r6.createSocket(r0)
            r14.opening(r5, r15)
            org.apache.http.conn.HttpInetSocketAddress r9 = new org.apache.http.conn.HttpInetSocketAddress
            r9.<init>(r15, r3, r8)
            r3 = 0
            if (r16 == 0) goto L_0x0065
            java.net.InetSocketAddress r3 = new java.net.InetSocketAddress
            r10 = 0
            r0 = r16
            r3.<init>(r0, r10)
        L_0x0065:
            org.apache.commons.logging.Log r10 = r13.log
            boolean r10 = r10.isDebugEnabled()
            if (r10 == 0) goto L_0x0085
            org.apache.commons.logging.Log r10 = r13.log
            java.lang.StringBuilder r11 = new java.lang.StringBuilder
            r11.<init>()
            java.lang.String r12 = "Connecting to "
            java.lang.StringBuilder r11 = r11.append(r12)
            java.lang.StringBuilder r11 = r11.append(r9)
            java.lang.String r11 = r11.toString()
            r10.debug(r11)
        L_0x0085:
            r0 = r18
            java.net.Socket r3 = r6.connectSocket(r5, r9, r3, r0)     // Catch:{ ConnectException -> 0x00a6, ConnectTimeoutException -> 0x00aa }
            if (r5 == r3) goto L_0x00df
            r14.opening(r3, r15)     // Catch:{ ConnectException -> 0x00a6, ConnectTimeoutException -> 0x00aa }
        L_0x0090:
            r0 = r17
            r1 = r18
            r13.prepareSocket(r3, r0, r1)     // Catch:{ ConnectException -> 0x00a6, ConnectTimeoutException -> 0x00aa }
            boolean r3 = r6.isSecure(r3)     // Catch:{ ConnectException -> 0x00a6, ConnectTimeoutException -> 0x00aa }
            r0 = r18
            r14.openCompleted(r3, r0)     // Catch:{ ConnectException -> 0x00a6, ConnectTimeoutException -> 0x00aa }
        L_0x00a0:
            return
        L_0x00a1:
            r2 = 0
            goto L_0x0018
        L_0x00a4:
            r2 = 0
            goto L_0x004c
        L_0x00a6:
            r3 = move-exception
            if (r2 == 0) goto L_0x00ae
            throw r3
        L_0x00aa:
            r3 = move-exception
            if (r2 == 0) goto L_0x00ae
            throw r3
        L_0x00ae:
            org.apache.commons.logging.Log r2 = r13.log
            boolean r2 = r2.isDebugEnabled()
            if (r2 == 0) goto L_0x00da
            org.apache.commons.logging.Log r2 = r13.log
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.String r5 = "Connect to "
            java.lang.StringBuilder r3 = r3.append(r5)
            java.lang.StringBuilder r3 = r3.append(r9)
            java.lang.String r5 = " timed out. "
            java.lang.StringBuilder r3 = r3.append(r5)
            java.lang.String r5 = "Connection will be retried using another IP address"
            java.lang.StringBuilder r3 = r3.append(r5)
            java.lang.String r3 = r3.toString()
            r2.debug(r3)
        L_0x00da:
            int r2 = r4 + 1
            r4 = r2
            goto L_0x0041
        L_0x00df:
            r3 = r5
            goto L_0x0090
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.conn.DefaultClientConnectionOperator.openConnection(org.apache.http.conn.OperatedClientConnection, org.apache.http.HttpHost, java.net.InetAddress, org.apache.http.protocol.HttpContext, org.apache.http.params.HttpParams):void");
    }

    /* access modifiers changed from: protected */
    public void prepareSocket(Socket socket, HttpContext httpContext, HttpParams httpParams) throws IOException {
        socket.setTcpNoDelay(HttpConnectionParams.getTcpNoDelay(httpParams));
        socket.setSoTimeout(HttpConnectionParams.getSoTimeout(httpParams));
        int linger = HttpConnectionParams.getLinger(httpParams);
        if (linger >= 0) {
            socket.setSoLinger(linger > 0, linger);
        }
    }

    /* access modifiers changed from: protected */
    public InetAddress[] resolveHostname(String str) throws UnknownHostException {
        return this.dnsResolver.resolve(str);
    }

    public void updateSecureConnection(OperatedClientConnection operatedClientConnection, HttpHost httpHost, HttpContext httpContext, HttpParams httpParams) throws IOException {
        Args.notNull(operatedClientConnection, "Connection");
        Args.notNull(httpHost, "Target host");
        Args.notNull(httpParams, "Parameters");
        Asserts.check(operatedClientConnection.isOpen(), "Connection must be open");
        Scheme scheme = getSchemeRegistry(httpContext).getScheme(httpHost.getSchemeName());
        Asserts.check(scheme.getSchemeSocketFactory() instanceof SchemeLayeredSocketFactory, "Socket factory must implement SchemeLayeredSocketFactory");
        SchemeLayeredSocketFactory schemeLayeredSocketFactory = (SchemeLayeredSocketFactory) scheme.getSchemeSocketFactory();
        Socket createLayeredSocket = schemeLayeredSocketFactory.createLayeredSocket(operatedClientConnection.getSocket(), httpHost.getHostName(), scheme.resolvePort(httpHost.getPort()), httpParams);
        prepareSocket(createLayeredSocket, httpContext, httpParams);
        operatedClientConnection.update(createLayeredSocket, httpHost, schemeLayeredSocketFactory.isSecure(createLayeredSocket), httpParams);
    }
}
