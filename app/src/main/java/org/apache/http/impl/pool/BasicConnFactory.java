package org.apache.http.impl.pool;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import javax.net.SocketFactory;
import javax.net.ssl.SSLSocketFactory;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpConnectionFactory;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.SocketConfig;
import org.apache.http.impl.DefaultBHttpClientConnection;
import org.apache.http.impl.DefaultBHttpClientConnectionFactory;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.params.HttpParamConfig;
import org.apache.http.params.HttpParams;
import org.apache.http.pool.ConnFactory;
import org.apache.http.util.Args;

@Immutable
public class BasicConnFactory implements ConnFactory<HttpHost, HttpClientConnection> {
    private final HttpConnectionFactory<? extends HttpClientConnection> connFactory;
    private final int connectTimeout;
    private final SocketFactory plainfactory;
    private final SocketConfig sconfig;
    private final SSLSocketFactory sslfactory;

    public BasicConnFactory() {
        this((SocketFactory) null, (SSLSocketFactory) null, 0, SocketConfig.DEFAULT, ConnectionConfig.DEFAULT);
    }

    public BasicConnFactory(int i, SocketConfig socketConfig, ConnectionConfig connectionConfig) {
        this((SocketFactory) null, (SSLSocketFactory) null, i, socketConfig, connectionConfig);
    }

    public BasicConnFactory(SocketFactory socketFactory, SSLSocketFactory sSLSocketFactory, int i, SocketConfig socketConfig, ConnectionConfig connectionConfig) {
        this.plainfactory = socketFactory;
        this.sslfactory = sSLSocketFactory;
        this.connectTimeout = i;
        this.sconfig = socketConfig == null ? SocketConfig.DEFAULT : socketConfig;
        this.connFactory = new DefaultBHttpClientConnectionFactory(connectionConfig == null ? ConnectionConfig.DEFAULT : connectionConfig);
    }

    @Deprecated
    public BasicConnFactory(SSLSocketFactory sSLSocketFactory, HttpParams httpParams) {
        Args.notNull(httpParams, "HTTP params");
        this.plainfactory = null;
        this.sslfactory = sSLSocketFactory;
        this.connectTimeout = httpParams.getIntParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 0);
        this.sconfig = HttpParamConfig.getSocketConfig(httpParams);
        this.connFactory = new DefaultBHttpClientConnectionFactory(HttpParamConfig.getConnectionConfig(httpParams));
    }

    public BasicConnFactory(SocketConfig socketConfig, ConnectionConfig connectionConfig) {
        this((SocketFactory) null, (SSLSocketFactory) null, 0, socketConfig, connectionConfig);
    }

    @Deprecated
    public BasicConnFactory(HttpParams httpParams) {
        this((SSLSocketFactory) null, httpParams);
    }

    /* access modifiers changed from: protected */
    @Deprecated
    public HttpClientConnection create(Socket socket, HttpParams httpParams) throws IOException {
        DefaultBHttpClientConnection defaultBHttpClientConnection = new DefaultBHttpClientConnection(httpParams.getIntParameter(CoreConnectionPNames.SOCKET_BUFFER_SIZE, 8192));
        defaultBHttpClientConnection.bind(socket);
        return defaultBHttpClientConnection;
    }

    public HttpClientConnection create(HttpHost httpHost) throws IOException {
        Socket socket;
        String schemeName = httpHost.getSchemeName();
        Socket socket2 = null;
        if (HttpHost.DEFAULT_SCHEME_NAME.equalsIgnoreCase(schemeName)) {
            socket2 = this.plainfactory != null ? this.plainfactory.createSocket() : new Socket();
        }
        if ("https".equalsIgnoreCase(schemeName)) {
            socket = (this.sslfactory != null ? this.sslfactory : SSLSocketFactory.getDefault()).createSocket();
        } else {
            socket = socket2;
        }
        if (socket == null) {
            throw new IOException(schemeName + " scheme is not supported");
        }
        String hostName = httpHost.getHostName();
        int port = httpHost.getPort();
        if (port == -1) {
            if (httpHost.getSchemeName().equalsIgnoreCase(HttpHost.DEFAULT_SCHEME_NAME)) {
                port = 80;
            } else if (httpHost.getSchemeName().equalsIgnoreCase("https")) {
                port = 443;
            }
        }
        socket.setSoTimeout(this.sconfig.getSoTimeout());
        socket.connect(new InetSocketAddress(hostName, port), this.connectTimeout);
        socket.setTcpNoDelay(this.sconfig.isTcpNoDelay());
        int soLinger = this.sconfig.getSoLinger();
        if (soLinger >= 0) {
            socket.setSoLinger(soLinger > 0, soLinger);
        }
        socket.setKeepAlive(this.sconfig.isSoKeepAlive());
        return (HttpClientConnection) this.connFactory.createConnection(socket);
    }
}
