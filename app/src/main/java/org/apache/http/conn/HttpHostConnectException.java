package org.apache.http.conn;

import java.io.IOException;
import java.net.ConnectException;
import java.net.InetAddress;
import java.util.Arrays;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;

@Immutable
public class HttpHostConnectException extends ConnectException {
    private static final long serialVersionUID = -3194482710275220224L;
    private final HttpHost host;

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public HttpHostConnectException(IOException iOException, HttpHost httpHost, InetAddress... inetAddressArr) {
        super("Connect to " + (httpHost != null ? httpHost.toHostString() : "remote host") + ((inetAddressArr == null || inetAddressArr.length <= 0) ? "" : StringUtils.SPACE + Arrays.asList(inetAddressArr)) + ((iOException == null || iOException.getMessage() == null) ? " refused" : " failed: " + iOException.getMessage()));
        this.host = httpHost;
        initCause(iOException);
    }

    @Deprecated
    public HttpHostConnectException(HttpHost httpHost, ConnectException connectException) {
        this(connectException, httpHost, (InetAddress[]) null);
    }

    public HttpHost getHost() {
        return this.host;
    }
}
