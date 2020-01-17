package org.apache.http.client.entity;

import java.io.IOException;
import java.io.InputStream;
import java.io.PushbackInputStream;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import java.util.zip.InflaterInputStream;

public class DeflateInputStream extends InputStream {
    private InputStream sourceStream;

    static class DeflateStream extends InflaterInputStream {
        private boolean closed = false;

        public DeflateStream(InputStream inputStream, Inflater inflater) {
            super(inputStream, inflater);
        }

        public void close() throws IOException {
            if (!this.closed) {
                this.closed = true;
                this.inf.end();
                super.close();
            }
        }
    }

    public DeflateInputStream(InputStream inputStream) throws IOException {
        int inflate;
        byte[] bArr = new byte[6];
        PushbackInputStream pushbackInputStream = new PushbackInputStream(inputStream, bArr.length);
        int read = pushbackInputStream.read(bArr);
        if (read == -1) {
            throw new IOException("Unable to read the response");
        }
        byte[] bArr2 = new byte[1];
        Inflater inflater = new Inflater();
        while (true) {
            try {
                inflate = inflater.inflate(bArr2);
                if (inflate != 0) {
                    break;
                } else if (inflater.finished()) {
                    throw new IOException("Unable to read the response");
                } else if (inflater.needsDictionary()) {
                    break;
                } else if (inflater.needsInput()) {
                    inflater.setInput(bArr);
                }
            } catch (DataFormatException e) {
                pushbackInputStream.unread(bArr, 0, read);
                this.sourceStream = new DeflateStream(pushbackInputStream, new Inflater(true));
                return;
            } finally {
                inflater.end();
            }
        }
        if (inflate == -1) {
            throw new IOException("Unable to read the response");
        }
        pushbackInputStream.unread(bArr, 0, read);
        this.sourceStream = new DeflateStream(pushbackInputStream, new Inflater());
    }

    public int available() throws IOException {
        return this.sourceStream.available();
    }

    public void close() throws IOException {
        this.sourceStream.close();
    }

    public void mark(int i) {
        this.sourceStream.mark(i);
    }

    public boolean markSupported() {
        return this.sourceStream.markSupported();
    }

    public int read() throws IOException {
        return this.sourceStream.read();
    }

    public int read(byte[] bArr) throws IOException {
        return this.sourceStream.read(bArr);
    }

    public int read(byte[] bArr, int i, int i2) throws IOException {
        return this.sourceStream.read(bArr, i, i2);
    }

    public void reset() throws IOException {
        this.sourceStream.reset();
    }

    public long skip(long j) throws IOException {
        return this.sourceStream.skip(j);
    }
}
