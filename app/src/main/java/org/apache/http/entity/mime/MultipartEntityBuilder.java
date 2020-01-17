package org.apache.http.entity.mime;

import java.io.File;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import org.apache.http.HttpEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.content.ByteArrayBody;
import org.apache.http.entity.mime.content.ContentBody;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.InputStreamBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;

public class MultipartEntityBuilder {
    private static final String DEFAULT_SUBTYPE = "form-data";
    private static final char[] MULTIPART_CHARS = "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
    private List<FormBodyPart> bodyParts = null;
    private String boundary = null;
    private Charset charset = null;
    private HttpMultipartMode mode = HttpMultipartMode.STRICT;
    private String subType = DEFAULT_SUBTYPE;

    MultipartEntityBuilder() {
    }

    public static MultipartEntityBuilder create() {
        return new MultipartEntityBuilder();
    }

    private String generateBoundary() {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        int nextInt = random.nextInt(11);
        for (int i = 0; i < nextInt + 30; i++) {
            sb.append(MULTIPART_CHARS[random.nextInt(MULTIPART_CHARS.length)]);
        }
        return sb.toString();
    }

    private String generateContentType(String str, Charset charset2) {
        StringBuilder sb = new StringBuilder();
        sb.append("multipart/form-data; boundary=");
        sb.append(str);
        if (charset2 != null) {
            sb.append(HTTP.CHARSET_PARAM);
            sb.append(charset2.name());
        }
        return sb.toString();
    }

    public MultipartEntityBuilder addBinaryBody(String str, File file) {
        return addBinaryBody(str, file, ContentType.DEFAULT_BINARY, file != null ? file.getName() : null);
    }

    public MultipartEntityBuilder addBinaryBody(String str, File file, ContentType contentType, String str2) {
        return addPart(str, new FileBody(file, contentType, str2));
    }

    public MultipartEntityBuilder addBinaryBody(String str, InputStream inputStream) {
        return addBinaryBody(str, inputStream, ContentType.DEFAULT_BINARY, (String) null);
    }

    public MultipartEntityBuilder addBinaryBody(String str, InputStream inputStream, ContentType contentType, String str2) {
        return addPart(str, new InputStreamBody(inputStream, contentType, str2));
    }

    public MultipartEntityBuilder addBinaryBody(String str, byte[] bArr) {
        return addBinaryBody(str, bArr, ContentType.DEFAULT_BINARY, (String) null);
    }

    public MultipartEntityBuilder addBinaryBody(String str, byte[] bArr, ContentType contentType, String str2) {
        return addPart(str, new ByteArrayBody(bArr, contentType, str2));
    }

    public MultipartEntityBuilder addPart(String str, ContentBody contentBody) {
        Args.notNull(str, "Name");
        Args.notNull(contentBody, "Content body");
        return addPart(new FormBodyPart(str, contentBody));
    }

    /* access modifiers changed from: package-private */
    public MultipartEntityBuilder addPart(FormBodyPart formBodyPart) {
        if (formBodyPart != null) {
            if (this.bodyParts == null) {
                this.bodyParts = new ArrayList();
            }
            this.bodyParts.add(formBodyPart);
        }
        return this;
    }

    public MultipartEntityBuilder addTextBody(String str, String str2) {
        return addTextBody(str, str2, ContentType.DEFAULT_TEXT);
    }

    public MultipartEntityBuilder addTextBody(String str, String str2, ContentType contentType) {
        return addPart(str, new StringBody(str2, contentType));
    }

    public HttpEntity build() {
        return buildEntity();
    }

    /* access modifiers changed from: package-private */
    public MultipartFormEntity buildEntity() {
        AbstractMultipartForm httpRFC6532Multipart;
        String str = this.subType != null ? this.subType : DEFAULT_SUBTYPE;
        Charset charset2 = this.charset;
        String generateBoundary = this.boundary != null ? this.boundary : generateBoundary();
        List arrayList = this.bodyParts != null ? new ArrayList(this.bodyParts) : Collections.emptyList();
        switch (this.mode != null ? this.mode : HttpMultipartMode.STRICT) {
            case BROWSER_COMPATIBLE:
                httpRFC6532Multipart = new HttpBrowserCompatibleMultipart(str, charset2, generateBoundary, arrayList);
                break;
            case RFC6532:
                httpRFC6532Multipart = new HttpRFC6532Multipart(str, charset2, generateBoundary, arrayList);
                break;
            default:
                httpRFC6532Multipart = new HttpStrictMultipart(str, charset2, generateBoundary, arrayList);
                break;
        }
        return new MultipartFormEntity(httpRFC6532Multipart, generateContentType(generateBoundary, charset2), httpRFC6532Multipart.getTotalLength());
    }

    public MultipartEntityBuilder setBoundary(String str) {
        this.boundary = str;
        return this;
    }

    public MultipartEntityBuilder setCharset(Charset charset2) {
        this.charset = charset2;
        return this;
    }

    public MultipartEntityBuilder setLaxMode() {
        this.mode = HttpMultipartMode.BROWSER_COMPATIBLE;
        return this;
    }

    public MultipartEntityBuilder setMode(HttpMultipartMode httpMultipartMode) {
        this.mode = httpMultipartMode;
        return this;
    }

    public MultipartEntityBuilder setStrictMode() {
        this.mode = HttpMultipartMode.STRICT;
        return this;
    }
}
