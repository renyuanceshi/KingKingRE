package org.apache.http.client.entity;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.HttpEntity;
import org.apache.http.entity.HttpEntityWrapper;
import org.apache.http.util.Args;

abstract class DecompressingEntity extends HttpEntityWrapper {
    private static final int BUFFER_SIZE = 2048;
    private InputStream content;

    public DecompressingEntity(HttpEntity httpEntity) {
        super(httpEntity);
    }

    private InputStream getDecompressingStream() throws IOException {
        return new LazyDecompressingInputStream(this.wrappedEntity.getContent(), this);
    }

    /* access modifiers changed from: package-private */
    public abstract InputStream decorate(InputStream inputStream) throws IOException;

    public InputStream getContent() throws IOException {
        if (!this.wrappedEntity.isStreaming()) {
            return getDecompressingStream();
        }
        if (this.content == null) {
            this.content = getDecompressingStream();
        }
        return this.content;
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        Args.notNull(outputStream, "Output stream");
        InputStream content2 = getContent();
        try {
            byte[] bArr = new byte[2048];
            while (true) {
                int read = content2.read(bArr);
                if (read != -1) {
                    outputStream.write(bArr, 0, read);
                } else {
                    return;
                }
            }
        } finally {
            content2.close();
        }
    }
}
