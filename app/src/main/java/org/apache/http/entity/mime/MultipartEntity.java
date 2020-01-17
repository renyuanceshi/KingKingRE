package org.apache.http.entity.mime;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.Random;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.entity.mime.content.ContentBody;
import org.apache.http.protocol.HTTP;

@Deprecated
public class MultipartEntity implements HttpEntity {
    private static final char[] MULTIPART_CHARS = "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
    private final MultipartEntityBuilder builder;
    private volatile MultipartFormEntity entity;

    public MultipartEntity() {
        this(HttpMultipartMode.STRICT, (String) null, (Charset) null);
    }

    public MultipartEntity(HttpMultipartMode httpMultipartMode) {
        this(httpMultipartMode, (String) null, (Charset) null);
    }

    public MultipartEntity(HttpMultipartMode httpMultipartMode, String str, Charset charset) {
        this.builder = new MultipartEntityBuilder().setMode(httpMultipartMode).setCharset(charset).setBoundary(str);
        this.entity = null;
    }

    private MultipartFormEntity getEntity() {
        if (this.entity == null) {
            this.entity = this.builder.buildEntity();
        }
        return this.entity;
    }

    public void addPart(String str, ContentBody contentBody) {
        addPart(new FormBodyPart(str, contentBody));
    }

    public void addPart(FormBodyPart formBodyPart) {
        this.builder.addPart(formBodyPart);
        this.entity = null;
    }

    public void consumeContent() throws IOException, UnsupportedOperationException {
        if (isStreaming()) {
            throw new UnsupportedOperationException("Streaming entity does not implement #consumeContent()");
        }
    }

    /* access modifiers changed from: protected */
    public String generateBoundary() {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        int nextInt = random.nextInt(11);
        for (int i = 0; i < nextInt + 30; i++) {
            sb.append(MULTIPART_CHARS[random.nextInt(MULTIPART_CHARS.length)]);
        }
        return sb.toString();
    }

    /* access modifiers changed from: protected */
    public String generateContentType(String str, Charset charset) {
        StringBuilder sb = new StringBuilder();
        sb.append("multipart/form-data; boundary=");
        sb.append(str);
        if (charset != null) {
            sb.append(HTTP.CHARSET_PARAM);
            sb.append(charset.name());
        }
        return sb.toString();
    }

    public InputStream getContent() throws IOException, UnsupportedOperationException {
        throw new UnsupportedOperationException("Multipart form entity does not implement #getContent()");
    }

    public Header getContentEncoding() {
        return getEntity().getContentEncoding();
    }

    public long getContentLength() {
        return getEntity().getContentLength();
    }

    public Header getContentType() {
        return getEntity().getContentType();
    }

    public boolean isChunked() {
        return getEntity().isChunked();
    }

    public boolean isRepeatable() {
        return getEntity().isRepeatable();
    }

    public boolean isStreaming() {
        return getEntity().isStreaming();
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        getEntity().writeTo(outputStream);
    }
}
