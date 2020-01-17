package org.apache.http.impl.execchain;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;
import org.apache.http.HttpEntity;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.EofSensorInputStream;
import org.apache.http.conn.EofSensorWatcher;
import org.apache.http.entity.HttpEntityWrapper;

@NotThreadSafe
class ResponseEntityWrapper extends HttpEntityWrapper implements EofSensorWatcher {
    private final ConnectionHolder connReleaseTrigger;

    public ResponseEntityWrapper(HttpEntity httpEntity, ConnectionHolder connectionHolder) {
        super(httpEntity);
        this.connReleaseTrigger = connectionHolder;
    }

    private void cleanup() {
        if (this.connReleaseTrigger != null) {
            this.connReleaseTrigger.abortConnection();
        }
    }

    @Deprecated
    public void consumeContent() throws IOException {
        releaseConnection();
    }

    /* JADX INFO: finally extract failed */
    public boolean eofDetected(InputStream inputStream) throws IOException {
        try {
            inputStream.close();
            releaseConnection();
            cleanup();
            return false;
        } catch (Throwable th) {
            cleanup();
            throw th;
        }
    }

    public InputStream getContent() throws IOException {
        return new EofSensorInputStream(this.wrappedEntity.getContent(), this);
    }

    public boolean isRepeatable() {
        return false;
    }

    public void releaseConnection() throws IOException {
        if (this.connReleaseTrigger != null) {
            try {
                if (this.connReleaseTrigger.isReusable()) {
                    this.connReleaseTrigger.releaseConnection();
                }
            } finally {
                cleanup();
            }
        }
    }

    public boolean streamAbort(InputStream inputStream) throws IOException {
        cleanup();
        return false;
    }

    public boolean streamClosed(InputStream inputStream) throws IOException {
        boolean z;
        try {
            z = this.connReleaseTrigger != null && !this.connReleaseTrigger.isReleased();
            inputStream.close();
            releaseConnection();
        } catch (SocketException e) {
            if (z) {
                throw e;
            }
        } catch (Throwable th) {
            cleanup();
            throw th;
        }
        cleanup();
        return false;
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        try {
            this.wrappedEntity.writeTo(outputStream);
            releaseConnection();
        } finally {
            cleanup();
        }
    }
}
