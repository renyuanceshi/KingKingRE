package org.apache.http.impl;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import org.apache.http.Header;
import org.apache.http.HttpConnection;
import org.apache.http.HttpConnectionMetrics;
import org.apache.http.HttpEntity;
import org.apache.http.HttpException;
import org.apache.http.HttpInetConnection;
import org.apache.http.HttpMessage;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.config.MessageConstraints;
import org.apache.http.entity.BasicHttpEntity;
import org.apache.http.entity.ContentLengthStrategy;
import org.apache.http.impl.entity.LaxContentLengthStrategy;
import org.apache.http.impl.entity.StrictContentLengthStrategy;
import org.apache.http.impl.io.ChunkedInputStream;
import org.apache.http.impl.io.ChunkedOutputStream;
import org.apache.http.impl.io.ContentLengthInputStream;
import org.apache.http.impl.io.ContentLengthOutputStream;
import org.apache.http.impl.io.HttpTransportMetricsImpl;
import org.apache.http.impl.io.IdentityInputStream;
import org.apache.http.impl.io.IdentityOutputStream;
import org.apache.http.impl.io.SessionInputBufferImpl;
import org.apache.http.impl.io.SessionOutputBufferImpl;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;
import org.apache.http.util.NetUtils;

@NotThreadSafe
public class BHttpConnectionBase implements HttpConnection, HttpInetConnection {
    private final HttpConnectionMetricsImpl connMetrics;
    private final SessionInputBufferImpl inbuffer;
    private final ContentLengthStrategy incomingContentStrategy;
    private volatile boolean open;
    private final SessionOutputBufferImpl outbuffer;
    private final ContentLengthStrategy outgoingContentStrategy;
    private volatile Socket socket;

    protected BHttpConnectionBase(int i, int i2, CharsetDecoder charsetDecoder, CharsetEncoder charsetEncoder, MessageConstraints messageConstraints, ContentLengthStrategy contentLengthStrategy, ContentLengthStrategy contentLengthStrategy2) {
        Args.positive(i, "Buffer size");
        HttpTransportMetricsImpl httpTransportMetricsImpl = new HttpTransportMetricsImpl();
        HttpTransportMetricsImpl httpTransportMetricsImpl2 = new HttpTransportMetricsImpl();
        this.inbuffer = new SessionInputBufferImpl(httpTransportMetricsImpl, i, -1, messageConstraints != null ? messageConstraints : MessageConstraints.DEFAULT, charsetDecoder);
        this.outbuffer = new SessionOutputBufferImpl(httpTransportMetricsImpl2, i, i2, charsetEncoder);
        this.connMetrics = new HttpConnectionMetricsImpl(httpTransportMetricsImpl, httpTransportMetricsImpl2);
        this.incomingContentStrategy = contentLengthStrategy == null ? LaxContentLengthStrategy.INSTANCE : contentLengthStrategy;
        this.outgoingContentStrategy = contentLengthStrategy2 == null ? StrictContentLengthStrategy.INSTANCE : contentLengthStrategy2;
    }

    /* JADX INFO: finally extract failed */
    private int fillInputBuffer(int i) throws IOException {
        int soTimeout = this.socket.getSoTimeout();
        try {
            this.socket.setSoTimeout(i);
            int fillBuffer = this.inbuffer.fillBuffer();
            this.socket.setSoTimeout(soTimeout);
            return fillBuffer;
        } catch (Throwable th) {
            this.socket.setSoTimeout(soTimeout);
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public boolean awaitInput(int i) throws IOException {
        if (this.inbuffer.hasBufferedData()) {
            return true;
        }
        fillInputBuffer(i);
        return this.inbuffer.hasBufferedData();
    }

    /* access modifiers changed from: protected */
    public void bind(Socket socket2) throws IOException {
        Args.notNull(socket2, "Socket");
        this.socket = socket2;
        this.open = true;
        this.inbuffer.bind((InputStream) null);
        this.outbuffer.bind((OutputStream) null);
    }

    public void close() throws IOException {
        if (this.open) {
            this.open = false;
            Socket socket2 = this.socket;
            try {
                this.inbuffer.clear();
                this.outbuffer.flush();
                try {
                    socket2.shutdownOutput();
                } catch (IOException e) {
                }
                try {
                    socket2.shutdownInput();
                } catch (IOException | UnsupportedOperationException e2) {
                }
            } finally {
                socket2.close();
            }
        }
    }

    /* access modifiers changed from: protected */
    public InputStream createInputStream(long j, SessionInputBuffer sessionInputBuffer) {
        return j == -2 ? new ChunkedInputStream(sessionInputBuffer) : j == -1 ? new IdentityInputStream(sessionInputBuffer) : new ContentLengthInputStream(sessionInputBuffer, j);
    }

    /* access modifiers changed from: protected */
    public OutputStream createOutputStream(long j, SessionOutputBuffer sessionOutputBuffer) {
        return j == -2 ? new ChunkedOutputStream(2048, sessionOutputBuffer) : j == -1 ? new IdentityOutputStream(sessionOutputBuffer) : new ContentLengthOutputStream(sessionOutputBuffer, j);
    }

    /* access modifiers changed from: protected */
    public void doFlush() throws IOException {
        this.outbuffer.flush();
    }

    /* access modifiers changed from: protected */
    public void ensureOpen() throws IOException {
        Asserts.check(this.open, "Connection is not open");
        if (!this.inbuffer.isBound()) {
            this.inbuffer.bind(getSocketInputStream(this.socket));
        }
        if (!this.outbuffer.isBound()) {
            this.outbuffer.bind(getSocketOutputStream(this.socket));
        }
    }

    public InetAddress getLocalAddress() {
        if (this.socket != null) {
            return this.socket.getLocalAddress();
        }
        return null;
    }

    public int getLocalPort() {
        if (this.socket != null) {
            return this.socket.getLocalPort();
        }
        return -1;
    }

    public HttpConnectionMetrics getMetrics() {
        return this.connMetrics;
    }

    public InetAddress getRemoteAddress() {
        if (this.socket != null) {
            return this.socket.getInetAddress();
        }
        return null;
    }

    public int getRemotePort() {
        if (this.socket != null) {
            return this.socket.getPort();
        }
        return -1;
    }

    /* access modifiers changed from: protected */
    public SessionInputBuffer getSessionInputBuffer() {
        return this.inbuffer;
    }

    /* access modifiers changed from: protected */
    public SessionOutputBuffer getSessionOutputBuffer() {
        return this.outbuffer;
    }

    /* access modifiers changed from: protected */
    public Socket getSocket() {
        return this.socket;
    }

    /* access modifiers changed from: protected */
    public InputStream getSocketInputStream(Socket socket2) throws IOException {
        return socket2.getInputStream();
    }

    /* access modifiers changed from: protected */
    public OutputStream getSocketOutputStream(Socket socket2) throws IOException {
        return socket2.getOutputStream();
    }

    public int getSocketTimeout() {
        if (this.socket == null) {
            return -1;
        }
        try {
            return this.socket.getSoTimeout();
        } catch (SocketException e) {
            return -1;
        }
    }

    /* access modifiers changed from: protected */
    public void incrementRequestCount() {
        this.connMetrics.incrementRequestCount();
    }

    /* access modifiers changed from: protected */
    public void incrementResponseCount() {
        this.connMetrics.incrementResponseCount();
    }

    public boolean isOpen() {
        return this.open;
    }

    public boolean isStale() {
        if (isOpen()) {
            try {
                if (fillInputBuffer(1) >= 0) {
                    return false;
                }
            } catch (SocketTimeoutException e) {
                return false;
            } catch (IOException e2) {
                return true;
            }
        }
        return true;
    }

    /* access modifiers changed from: protected */
    public HttpEntity prepareInput(HttpMessage httpMessage) throws HttpException {
        BasicHttpEntity basicHttpEntity = new BasicHttpEntity();
        long determineLength = this.incomingContentStrategy.determineLength(httpMessage);
        InputStream createInputStream = createInputStream(determineLength, this.inbuffer);
        if (determineLength == -2) {
            basicHttpEntity.setChunked(true);
            basicHttpEntity.setContentLength(-1);
            basicHttpEntity.setContent(createInputStream);
        } else if (determineLength == -1) {
            basicHttpEntity.setChunked(false);
            basicHttpEntity.setContentLength(-1);
            basicHttpEntity.setContent(createInputStream);
        } else {
            basicHttpEntity.setChunked(false);
            basicHttpEntity.setContentLength(determineLength);
            basicHttpEntity.setContent(createInputStream);
        }
        Header firstHeader = httpMessage.getFirstHeader("Content-Type");
        if (firstHeader != null) {
            basicHttpEntity.setContentType(firstHeader);
        }
        Header firstHeader2 = httpMessage.getFirstHeader("Content-Encoding");
        if (firstHeader2 != null) {
            basicHttpEntity.setContentEncoding(firstHeader2);
        }
        return basicHttpEntity;
    }

    /* access modifiers changed from: protected */
    public OutputStream prepareOutput(HttpMessage httpMessage) throws HttpException {
        return createOutputStream(this.outgoingContentStrategy.determineLength(httpMessage), this.outbuffer);
    }

    public void setSocketTimeout(int i) {
        if (this.socket != null) {
            try {
                this.socket.setSoTimeout(i);
            } catch (SocketException e) {
            }
        }
    }

    public void shutdown() throws IOException {
        this.open = false;
        Socket socket2 = this.socket;
        if (socket2 != null) {
            socket2.close();
        }
    }

    public String toString() {
        if (this.socket == null) {
            return "[Not bound]";
        }
        StringBuilder sb = new StringBuilder();
        SocketAddress remoteSocketAddress = this.socket.getRemoteSocketAddress();
        SocketAddress localSocketAddress = this.socket.getLocalSocketAddress();
        if (!(remoteSocketAddress == null || localSocketAddress == null)) {
            NetUtils.formatAddress(sb, localSocketAddress);
            sb.append("<->");
            NetUtils.formatAddress(sb, remoteSocketAddress);
        }
        return sb.toString();
    }
}
