package org.apache.http.entity;

import java.io.IOException;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.message.BasicHeader;

@NotThreadSafe
public abstract class AbstractHttpEntity implements HttpEntity {
    protected static final int OUTPUT_BUFFER_SIZE = 4096;
    protected boolean chunked;
    protected Header contentEncoding;
    protected Header contentType;

    protected AbstractHttpEntity() {
    }

    @Deprecated
    public void consumeContent() throws IOException {
    }

    public Header getContentEncoding() {
        return this.contentEncoding;
    }

    public Header getContentType() {
        return this.contentType;
    }

    public boolean isChunked() {
        return this.chunked;
    }

    public void setChunked(boolean z) {
        this.chunked = z;
    }

    public void setContentEncoding(String str) {
        BasicHeader basicHeader = null;
        if (str != null) {
            basicHeader = new BasicHeader("Content-Encoding", str);
        }
        setContentEncoding((Header) basicHeader);
    }

    public void setContentEncoding(Header header) {
        this.contentEncoding = header;
    }

    public void setContentType(String str) {
        BasicHeader basicHeader = null;
        if (str != null) {
            basicHeader = new BasicHeader("Content-Type", str);
        }
        setContentType((Header) basicHeader);
    }

    public void setContentType(Header header) {
        this.contentType = header;
    }
}
