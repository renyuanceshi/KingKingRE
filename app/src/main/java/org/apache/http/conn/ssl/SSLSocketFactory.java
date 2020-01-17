package org.apache.http.conn.ssl;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.UnrecoverableKeyException;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import org.apache.http.HttpHost;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.conn.HttpInetSocketAddress;
import org.apache.http.conn.scheme.HostNameResolver;
import org.apache.http.conn.scheme.LayeredSchemeSocketFactory;
import org.apache.http.conn.scheme.LayeredSocketFactory;
import org.apache.http.conn.scheme.SchemeLayeredSocketFactory;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;
import org.apache.http.util.TextUtils;

@Deprecated
@ThreadSafe
public class SSLSocketFactory implements LayeredConnectionSocketFactory, SchemeLayeredSocketFactory, LayeredSchemeSocketFactory, LayeredSocketFactory {
    public static final X509HostnameVerifier ALLOW_ALL_HOSTNAME_VERIFIER = new AllowAllHostnameVerifier();
    public static final X509HostnameVerifier BROWSER_COMPATIBLE_HOSTNAME_VERIFIER = new BrowserCompatHostnameVerifier();
    public static final String SSL = "SSL";
    public static final String SSLV2 = "SSLv2";
    public static final X509HostnameVerifier STRICT_HOSTNAME_VERIFIER = new StrictHostnameVerifier();
    public static final String TLS = "TLS";
    private volatile X509HostnameVerifier hostnameVerifier;
    private final HostNameResolver nameResolver;
    private final javax.net.ssl.SSLSocketFactory socketfactory;
    private final String[] supportedCipherSuites;
    private final String[] supportedProtocols;

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public SSLSocketFactory(String str, KeyStore keyStore, String str2, KeyStore keyStore2, SecureRandom secureRandom, HostNameResolver hostNameResolver) throws NoSuchAlgorithmException, KeyManagementException, KeyStoreException, UnrecoverableKeyException {
        this(SSLContexts.custom().useProtocol(str).setSecureRandom(secureRandom).loadKeyMaterial(keyStore, str2 != null ? str2.toCharArray() : null).loadTrustMaterial(keyStore2).build(), hostNameResolver);
    }

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public SSLSocketFactory(String str, KeyStore keyStore, String str2, KeyStore keyStore2, SecureRandom secureRandom, TrustStrategy trustStrategy, X509HostnameVerifier x509HostnameVerifier) throws NoSuchAlgorithmException, KeyManagementException, KeyStoreException, UnrecoverableKeyException {
        this(SSLContexts.custom().useProtocol(str).setSecureRandom(secureRandom).loadKeyMaterial(keyStore, str2 != null ? str2.toCharArray() : null).loadTrustMaterial(keyStore2, trustStrategy).build(), x509HostnameVerifier);
    }

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public SSLSocketFactory(String str, KeyStore keyStore, String str2, KeyStore keyStore2, SecureRandom secureRandom, X509HostnameVerifier x509HostnameVerifier) throws NoSuchAlgorithmException, KeyManagementException, KeyStoreException, UnrecoverableKeyException {
        this(SSLContexts.custom().useProtocol(str).setSecureRandom(secureRandom).loadKeyMaterial(keyStore, str2 != null ? str2.toCharArray() : null).loadTrustMaterial(keyStore2).build(), x509HostnameVerifier);
    }

    public SSLSocketFactory(KeyStore keyStore) throws NoSuchAlgorithmException, KeyManagementException, KeyStoreException, UnrecoverableKeyException {
        this(SSLContexts.custom().loadTrustMaterial(keyStore).build(), BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public SSLSocketFactory(KeyStore keyStore, String str) throws NoSuchAlgorithmException, KeyManagementException, KeyStoreException, UnrecoverableKeyException {
        this(SSLContexts.custom().loadKeyMaterial(keyStore, str != null ? str.toCharArray() : null).build(), BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public SSLSocketFactory(KeyStore keyStore, String str, KeyStore keyStore2) throws NoSuchAlgorithmException, KeyManagementException, KeyStoreException, UnrecoverableKeyException {
        this(SSLContexts.custom().loadKeyMaterial(keyStore, str != null ? str.toCharArray() : null).loadTrustMaterial(keyStore2).build(), BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    public SSLSocketFactory(SSLContext sSLContext) {
        this(sSLContext, BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    public SSLSocketFactory(SSLContext sSLContext, HostNameResolver hostNameResolver) {
        this.socketfactory = sSLContext.getSocketFactory();
        this.hostnameVerifier = BROWSER_COMPATIBLE_HOSTNAME_VERIFIER;
        this.nameResolver = hostNameResolver;
        this.supportedProtocols = null;
        this.supportedCipherSuites = null;
    }

    public SSLSocketFactory(SSLContext sSLContext, X509HostnameVerifier x509HostnameVerifier) {
        this(((SSLContext) Args.notNull(sSLContext, "SSL context")).getSocketFactory(), (String[]) null, (String[]) null, x509HostnameVerifier);
    }

    public SSLSocketFactory(SSLContext sSLContext, String[] strArr, String[] strArr2, X509HostnameVerifier x509HostnameVerifier) {
        this(((SSLContext) Args.notNull(sSLContext, "SSL context")).getSocketFactory(), strArr, strArr2, x509HostnameVerifier);
    }

    public SSLSocketFactory(javax.net.ssl.SSLSocketFactory sSLSocketFactory, X509HostnameVerifier x509HostnameVerifier) {
        this(sSLSocketFactory, (String[]) null, (String[]) null, x509HostnameVerifier);
    }

    public SSLSocketFactory(javax.net.ssl.SSLSocketFactory sSLSocketFactory, String[] strArr, String[] strArr2, X509HostnameVerifier x509HostnameVerifier) {
        this.socketfactory = (javax.net.ssl.SSLSocketFactory) Args.notNull(sSLSocketFactory, "SSL socket factory");
        this.supportedProtocols = strArr;
        this.supportedCipherSuites = strArr2;
        this.hostnameVerifier = x509HostnameVerifier == null ? BROWSER_COMPATIBLE_HOSTNAME_VERIFIER : x509HostnameVerifier;
        this.nameResolver = null;
    }

    public SSLSocketFactory(TrustStrategy trustStrategy) throws NoSuchAlgorithmException, KeyManagementException, KeyStoreException, UnrecoverableKeyException {
        this(SSLContexts.custom().loadTrustMaterial((KeyStore) null, trustStrategy).build(), BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    public SSLSocketFactory(TrustStrategy trustStrategy, X509HostnameVerifier x509HostnameVerifier) throws NoSuchAlgorithmException, KeyManagementException, KeyStoreException, UnrecoverableKeyException {
        this(SSLContexts.custom().loadTrustMaterial((KeyStore) null, trustStrategy).build(), x509HostnameVerifier);
    }

    public static SSLSocketFactory getSocketFactory() throws SSLInitializationException {
        return new SSLSocketFactory(SSLContexts.createDefault(), BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    public static SSLSocketFactory getSystemSocketFactory() throws SSLInitializationException {
        return new SSLSocketFactory((javax.net.ssl.SSLSocketFactory) javax.net.ssl.SSLSocketFactory.getDefault(), split(System.getProperty("https.protocols")), split(System.getProperty("https.cipherSuites")), BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
    }

    private void internalPrepareSocket(SSLSocket sSLSocket) throws IOException {
        if (this.supportedProtocols != null) {
            sSLSocket.setEnabledProtocols(this.supportedProtocols);
        }
        if (this.supportedCipherSuites != null) {
            sSLSocket.setEnabledCipherSuites(this.supportedCipherSuites);
        }
        prepareSocket(sSLSocket);
    }

    private static String[] split(String str) {
        if (TextUtils.isBlank(str)) {
            return null;
        }
        return str.split(" *, *");
    }

    private void verifyHostname(SSLSocket sSLSocket, String str) throws IOException {
        try {
            this.hostnameVerifier.verify(str, sSLSocket);
        } catch (IOException e) {
            try {
                sSLSocket.close();
            } catch (Exception e2) {
            }
            throw e;
        }
    }

    public Socket connectSocket(int i, Socket socket, HttpHost httpHost, InetSocketAddress inetSocketAddress, InetSocketAddress inetSocketAddress2, HttpContext httpContext) throws IOException {
        Args.notNull(httpHost, "HTTP host");
        Args.notNull(inetSocketAddress, "Remote address");
        Socket createSocket = socket != null ? socket : createSocket(httpContext);
        if (inetSocketAddress2 != null) {
            createSocket.bind(inetSocketAddress2);
        }
        try {
            createSocket.connect(inetSocketAddress, i);
            if (!(createSocket instanceof SSLSocket)) {
                return createLayeredSocket(createSocket, httpHost.getHostName(), inetSocketAddress.getPort(), httpContext);
            }
            SSLSocket sSLSocket = (SSLSocket) createSocket;
            sSLSocket.startHandshake();
            verifyHostname(sSLSocket, httpHost.getHostName());
            return createSocket;
        } catch (IOException e) {
            try {
                createSocket.close();
            } catch (IOException e2) {
            }
            throw e;
        }
    }

    public Socket connectSocket(Socket socket, String str, int i, InetAddress inetAddress, int i2, HttpParams httpParams) throws IOException, UnknownHostException, ConnectTimeoutException {
        InetAddress resolve = this.nameResolver != null ? this.nameResolver.resolve(str) : InetAddress.getByName(str);
        InetSocketAddress inetSocketAddress = null;
        if (inetAddress != null || i2 > 0) {
            if (i2 <= 0) {
                i2 = 0;
            }
            inetSocketAddress = new InetSocketAddress(inetAddress, i2);
        }
        return connectSocket(socket, new HttpInetSocketAddress(new HttpHost(str, i), resolve, i), inetSocketAddress, httpParams);
    }

    public Socket connectSocket(Socket socket, InetSocketAddress inetSocketAddress, InetSocketAddress inetSocketAddress2, HttpParams httpParams) throws IOException, UnknownHostException, ConnectTimeoutException {
        Args.notNull(inetSocketAddress, "Remote address");
        Args.notNull(httpParams, "HTTP parameters");
        return connectSocket(HttpConnectionParams.getConnectionTimeout(httpParams), socket, inetSocketAddress instanceof HttpInetSocketAddress ? ((HttpInetSocketAddress) inetSocketAddress).getHttpHost() : new HttpHost(inetSocketAddress.getHostName(), inetSocketAddress.getPort(), "https"), inetSocketAddress, inetSocketAddress2, (HttpContext) null);
    }

    public Socket createLayeredSocket(Socket socket, String str, int i, HttpParams httpParams) throws IOException, UnknownHostException {
        return createLayeredSocket(socket, str, i, (HttpContext) null);
    }

    public Socket createLayeredSocket(Socket socket, String str, int i, HttpContext httpContext) throws IOException {
        SSLSocket sSLSocket = (SSLSocket) this.socketfactory.createSocket(socket, str, i, true);
        internalPrepareSocket(sSLSocket);
        sSLSocket.startHandshake();
        verifyHostname(sSLSocket, str);
        return sSLSocket;
    }

    public Socket createLayeredSocket(Socket socket, String str, int i, boolean z) throws IOException, UnknownHostException {
        return createLayeredSocket(socket, str, i, (HttpContext) null);
    }

    public Socket createSocket() throws IOException {
        return createSocket((HttpContext) null);
    }

    public Socket createSocket(Socket socket, String str, int i, boolean z) throws IOException, UnknownHostException {
        return createLayeredSocket(socket, str, i, z);
    }

    public Socket createSocket(HttpParams httpParams) throws IOException {
        return createSocket((HttpContext) null);
    }

    public Socket createSocket(HttpContext httpContext) throws IOException {
        SSLSocket sSLSocket = (SSLSocket) this.socketfactory.createSocket();
        internalPrepareSocket(sSLSocket);
        return sSLSocket;
    }

    public X509HostnameVerifier getHostnameVerifier() {
        return this.hostnameVerifier;
    }

    public boolean isSecure(Socket socket) throws IllegalArgumentException {
        Args.notNull(socket, "Socket");
        Asserts.check(socket instanceof SSLSocket, "Socket not created by this factory");
        Asserts.check(!socket.isClosed(), "Socket is closed");
        return true;
    }

    /* access modifiers changed from: protected */
    public void prepareSocket(SSLSocket sSLSocket) throws IOException {
    }

    public void setHostnameVerifier(X509HostnameVerifier x509HostnameVerifier) {
        Args.notNull(x509HostnameVerifier, "Hostname verifier");
        this.hostnameVerifier = x509HostnameVerifier;
    }
}
