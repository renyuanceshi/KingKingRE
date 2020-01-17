package org.apache.http.impl.conn;

import java.io.IOException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.config.Lookup;
import org.apache.http.conn.DnsResolver;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.conn.SchemePortResolver;
import org.apache.http.conn.UnsupportedSchemeException;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
class HttpClientConnectionOperator {
    static final String SOCKET_FACTORY_REGISTRY = "http.socket-factory-registry";
    private final DnsResolver dnsResolver;
    private final Log log = LogFactory.getLog(getClass());
    private final SchemePortResolver schemePortResolver;
    private final Lookup<ConnectionSocketFactory> socketFactoryRegistry;

    HttpClientConnectionOperator(Lookup<ConnectionSocketFactory> lookup, SchemePortResolver schemePortResolver2, DnsResolver dnsResolver2) {
        Args.notNull(lookup, "Socket factory registry");
        this.socketFactoryRegistry = lookup;
        this.schemePortResolver = schemePortResolver2 == null ? DefaultSchemePortResolver.INSTANCE : schemePortResolver2;
        this.dnsResolver = dnsResolver2 == null ? SystemDefaultDnsResolver.INSTANCE : dnsResolver2;
    }

    private Lookup<ConnectionSocketFactory> getSocketFactoryRegistry(HttpContext httpContext) {
        Lookup<ConnectionSocketFactory> lookup = (Lookup) httpContext.getAttribute("http.socket-factory-registry");
        return lookup == null ? this.socketFactoryRegistry : lookup;
    }

    /* JADX WARNING: Removed duplicated region for block: B:38:0x0103  */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x0127 A[SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void connect(org.apache.http.conn.ManagedHttpClientConnection r13, org.apache.http.HttpHost r14, java.net.InetSocketAddress r15, int r16, org.apache.http.config.SocketConfig r17, org.apache.http.protocol.HttpContext r18) throws java.io.IOException {
        /*
            r12 = this;
            r0 = r18
            org.apache.http.config.Lookup r1 = r12.getSocketFactoryRegistry(r0)
            java.lang.String r2 = r14.getSchemeName()
            java.lang.Object r1 = r1.lookup(r2)
            org.apache.http.conn.socket.ConnectionSocketFactory r1 = (org.apache.http.conn.socket.ConnectionSocketFactory) r1
            if (r1 != 0) goto L_0x002f
            org.apache.http.conn.UnsupportedSchemeException r1 = new org.apache.http.conn.UnsupportedSchemeException
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r2.<init>()
            java.lang.String r3 = r14.getSchemeName()
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r3 = " protocol is not supported"
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r2 = r2.toString()
            r1.<init>(r2)
            throw r1
        L_0x002f:
            org.apache.http.conn.DnsResolver r2 = r12.dnsResolver
            java.lang.String r3 = r14.getHostName()
            java.net.InetAddress[] r10 = r2.resolve(r3)
            org.apache.http.conn.SchemePortResolver r2 = r12.schemePortResolver
            int r11 = r2.resolve(r14)
            r2 = 0
            r8 = r2
        L_0x0041:
            int r2 = r10.length
            if (r8 >= r2) goto L_0x00d0
            r4 = r10[r8]
            int r2 = r10.length
            int r2 = r2 + -1
            if (r8 != r2) goto L_0x00d1
            r2 = 1
            r9 = r2
        L_0x004d:
            r0 = r18
            java.net.Socket r3 = r1.createSocket(r0)
            boolean r2 = r17.isSoReuseAddress()
            r3.setReuseAddress(r2)
            r13.bind(r3)
            java.net.InetSocketAddress r5 = new java.net.InetSocketAddress
            r5.<init>(r4, r11)
            org.apache.commons.logging.Log r2 = r12.log
            boolean r2 = r2.isDebugEnabled()
            if (r2 == 0) goto L_0x0082
            org.apache.commons.logging.Log r2 = r12.log
            java.lang.StringBuilder r4 = new java.lang.StringBuilder
            r4.<init>()
            java.lang.String r6 = "Connecting to "
            java.lang.StringBuilder r4 = r4.append(r6)
            java.lang.StringBuilder r4 = r4.append(r5)
            java.lang.String r4 = r4.toString()
            r2.debug(r4)
        L_0x0082:
            int r2 = r17.getSoTimeout()     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            r3.setSoTimeout(r2)     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            r2 = r16
            r4 = r14
            r6 = r15
            r7 = r18
            java.net.Socket r3 = r1.connectSocket(r2, r3, r4, r5, r6, r7)     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            boolean r2 = r17.isTcpNoDelay()     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            r3.setTcpNoDelay(r2)     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            boolean r2 = r17.isSoKeepAlive()     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            r3.setKeepAlive(r2)     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            int r4 = r17.getSoLinger()     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            if (r4 < 0) goto L_0x00ad
            if (r4 <= 0) goto L_0x00d5
            r2 = 1
        L_0x00aa:
            r3.setSoLinger(r2, r4)     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
        L_0x00ad:
            r13.bind(r3)     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            org.apache.commons.logging.Log r2 = r12.log     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            boolean r2 = r2.isDebugEnabled()     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            if (r2 == 0) goto L_0x00d0
            org.apache.commons.logging.Log r2 = r12.log     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            r3.<init>()     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            java.lang.String r4 = "Connection established "
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            java.lang.StringBuilder r3 = r3.append(r13)     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            java.lang.String r3 = r3.toString()     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
            r2.debug(r3)     // Catch:{ SocketTimeoutException -> 0x00d7, ConnectException -> 0x00e0 }
        L_0x00d0:
            return
        L_0x00d1:
            r2 = 0
            r9 = r2
            goto L_0x004d
        L_0x00d5:
            r2 = 0
            goto L_0x00aa
        L_0x00d7:
            r2 = move-exception
            if (r9 == 0) goto L_0x00fb
            org.apache.http.conn.ConnectTimeoutException r1 = new org.apache.http.conn.ConnectTimeoutException
            r1.<init>(r2, r14, r10)
            throw r1
        L_0x00e0:
            r2 = move-exception
            if (r9 == 0) goto L_0x00fb
            java.lang.String r1 = "Connection timed out"
            java.lang.String r3 = r2.getMessage()
            boolean r1 = r1.equals(r3)
            if (r1 == 0) goto L_0x00f5
            org.apache.http.conn.ConnectTimeoutException r1 = new org.apache.http.conn.ConnectTimeoutException
            r1.<init>(r2, r14, r10)
            throw r1
        L_0x00f5:
            org.apache.http.conn.HttpHostConnectException r1 = new org.apache.http.conn.HttpHostConnectException
            r1.<init>(r2, r14, r10)
            throw r1
        L_0x00fb:
            org.apache.commons.logging.Log r2 = r12.log
            boolean r2 = r2.isDebugEnabled()
            if (r2 == 0) goto L_0x0127
            org.apache.commons.logging.Log r2 = r12.log
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.String r4 = "Connect to "
            java.lang.StringBuilder r3 = r3.append(r4)
            java.lang.StringBuilder r3 = r3.append(r5)
            java.lang.String r4 = " timed out. "
            java.lang.StringBuilder r3 = r3.append(r4)
            java.lang.String r4 = "Connection will be retried using another IP address"
            java.lang.StringBuilder r3 = r3.append(r4)
            java.lang.String r3 = r3.toString()
            r2.debug(r3)
        L_0x0127:
            int r2 = r8 + 1
            r8 = r2
            goto L_0x0041
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.conn.HttpClientConnectionOperator.connect(org.apache.http.conn.ManagedHttpClientConnection, org.apache.http.HttpHost, java.net.InetSocketAddress, int, org.apache.http.config.SocketConfig, org.apache.http.protocol.HttpContext):void");
    }

    public void upgrade(ManagedHttpClientConnection managedHttpClientConnection, HttpHost httpHost, HttpContext httpContext) throws IOException {
        ConnectionSocketFactory lookup = getSocketFactoryRegistry(HttpClientContext.adapt(httpContext)).lookup(httpHost.getSchemeName());
        if (lookup == null) {
            throw new UnsupportedSchemeException(httpHost.getSchemeName() + " protocol is not supported");
        } else if (!(lookup instanceof LayeredConnectionSocketFactory)) {
            throw new UnsupportedSchemeException(httpHost.getSchemeName() + " protocol does not support connection upgrade");
        } else {
            managedHttpClientConnection.bind(((LayeredConnectionSocketFactory) lookup).createLayeredSocket(managedHttpClientConnection.getSocket(), httpHost.getHostName(), this.schemePortResolver.resolve(httpHost), httpContext));
        }
    }
}
