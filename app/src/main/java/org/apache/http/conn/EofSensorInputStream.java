package org.apache.http.conn;

import java.io.IOException;
import java.io.InputStream;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class EofSensorInputStream extends InputStream implements ConnectionReleaseTrigger {
    private final EofSensorWatcher eofWatcher;
    private boolean selfClosed = false;
    protected InputStream wrappedStream;

    public EofSensorInputStream(InputStream inputStream, EofSensorWatcher eofSensorWatcher) {
        Args.notNull(inputStream, "Wrapped stream");
        this.wrappedStream = inputStream;
        this.eofWatcher = eofSensorWatcher;
    }

    public void abortConnection() throws IOException {
        this.selfClosed = true;
        checkAbort();
    }

    public int available() throws IOException {
        if (!isReadAllowed()) {
            return 0;
        }
        try {
            return this.wrappedStream.available();
        } catch (IOException e) {
            checkAbort();
            throw e;
        }
    }

    /* access modifiers changed from: protected */
    public void checkAbort() throws IOException {
        if (this.wrappedStream != null) {
            boolean z = true;
            try {
                if (this.eofWatcher != null) {
                    z = this.eofWatcher.streamAbort(this.wrappedStream);
                }
                if (z) {
                    this.wrappedStream.close();
                }
            } finally {
                this.wrappedStream = null;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void checkClose() throws IOException {
        if (this.wrappedStream != null) {
            boolean z = true;
            try {
                if (this.eofWatcher != null) {
                    z = this.eofWatcher.streamClosed(this.wrappedStream);
                }
                if (z) {
                    this.wrappedStream.close();
                }
            } finally {
                this.wrappedStream = null;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void checkEOF(int i) throws IOException {
        if (this.wrappedStream != null && i < 0) {
            boolean z = true;
            try {
                if (this.eofWatcher != null) {
                    z = this.eofWatcher.eofDetected(this.wrappedStream);
                }
                if (z) {
                    this.wrappedStream.close();
                }
            } finally {
                this.wrappedStream = null;
            }
        }
    }

    public void close() throws IOException {
        this.selfClosed = true;
        checkClose();
    }

    /* access modifiers changed from: package-private */
    public InputStream getWrappedStream() {
        return this.wrappedStream;
    }

    /* access modifiers changed from: protected */
    public boolean isReadAllowed() throws IOException {
        if (!this.selfClosed) {
            return this.wrappedStream != null;
        }
        throw new IOException("Attempted read on closed stream.");
    }

    /* access modifiers changed from: package-private */
    public boolean isSelfClosed() {
        return this.selfClosed;
    }

    public int read() throws IOException {
        if (!isReadAllowed()) {
            return -1;
        }
        try {
            int read = this.wrappedStream.read();
            checkEOF(read);
            return read;
        } catch (IOException e) {
            checkAbort();
            throw e;
        }
    }

    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    public int read(byte[] bArr, int i, int i2) throws IOException {
        if (!isReadAllowed()) {
            return -1;
        }
        try {
            int read = this.wrappedStream.read(bArr, i, i2);
            checkEOF(read);
            return read;
        } catch (IOException e) {
            checkAbort();
            throw e;
        }
    }

    public void releaseConnection() throws IOException {
        close();
    }
}
