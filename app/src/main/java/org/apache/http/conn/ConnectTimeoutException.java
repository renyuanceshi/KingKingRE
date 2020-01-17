package org.apache.http.conn;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.InetAddress;
import java.util.Arrays;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;

@Immutable
public class ConnectTimeoutException extends InterruptedIOException {
    private static final long serialVersionUID = -4816682903149535989L;
    private final HttpHost host;

    public ConnectTimeoutException() {
        this.host = null;
    }

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public ConnectTimeoutException(IOException iOException, HttpHost httpHost, InetAddress... inetAddressArr) {
        super("Connect to " + (httpHost != null ? httpHost.toHostString() : "remote host") + ((inetAddressArr == null || inetAddressArr.length <= 0) ? "" : StringUtils.SPACE + Arrays.asList(inetAddressArr)) + ((iOException == null || iOException.getMessage() == null) ? " timed out" : " failed: " + iOException.getMessage()));
        this.host = httpHost;
        initCause(iOException);
    }

    public ConnectTimeoutException(String str) {
        super(str);
        this.host = null;
    }

    public HttpHost getHost() {
        return this.host;
    }
}
