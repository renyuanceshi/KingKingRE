package org.apache.http.client.entity;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.GZIPOutputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.entity.HttpEntityWrapper;
import org.apache.http.message.BasicHeader;
import org.apache.http.util.Args;

public class GzipCompressingEntity extends HttpEntityWrapper {
    private static final String GZIP_CODEC = "gzip";

    public GzipCompressingEntity(HttpEntity httpEntity) {
        super(httpEntity);
    }

    public InputStream getContent() throws IOException {
        throw new UnsupportedOperationException();
    }

    public Header getContentEncoding() {
        return new BasicHeader("Content-Encoding", GZIP_CODEC);
    }

    public long getContentLength() {
        return -1;
    }

    public boolean isChunked() {
        return true;
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        Args.notNull(outputStream, "Output stream");
        GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(outputStream);
        try {
            this.wrappedEntity.writeTo(gZIPOutputStream);
        } finally {
            gZIPOutputStream.close();
        }
    }
}
