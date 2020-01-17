package org.apache.http.impl.client.cache;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.SequenceInputStream;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.cache.Resource;
import org.apache.http.entity.AbstractHttpEntity;
import org.apache.http.util.Args;

@NotThreadSafe
class CombinedEntity extends AbstractHttpEntity {
    private final InputStream combinedStream;
    private final Resource resource;

    class ResourceStream extends FilterInputStream {
        protected ResourceStream(InputStream inputStream) {
            super(inputStream);
        }

        public void close() throws IOException {
            try {
                super.close();
            } finally {
                CombinedEntity.this.dispose();
            }
        }
    }

    CombinedEntity(Resource resource2, InputStream inputStream) throws IOException {
        this.resource = resource2;
        this.combinedStream = new SequenceInputStream(new ResourceStream(resource2.getInputStream()), inputStream);
    }

    /* access modifiers changed from: private */
    public void dispose() {
        this.resource.dispose();
    }

    public InputStream getContent() throws IOException, IllegalStateException {
        return this.combinedStream;
    }

    public long getContentLength() {
        return -1;
    }

    public boolean isRepeatable() {
        return false;
    }

    public boolean isStreaming() {
        return true;
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        Args.notNull(outputStream, "Output stream");
        InputStream content = getContent();
        try {
            byte[] bArr = new byte[2048];
            while (true) {
                int read = content.read(bArr);
                if (read != -1) {
                    outputStream.write(bArr, 0, read);
                } else {
                    return;
                }
            }
        } finally {
            content.close();
        }
    }
}
