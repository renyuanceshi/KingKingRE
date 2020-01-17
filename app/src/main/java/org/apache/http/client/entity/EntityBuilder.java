package org.apache.http.client.entity;

import java.io.File;
import java.io.InputStream;
import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.entity.AbstractHttpEntity;
import org.apache.http.entity.BasicHttpEntity;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.FileEntity;
import org.apache.http.entity.InputStreamEntity;
import org.apache.http.entity.SerializableEntity;
import org.apache.http.entity.StringEntity;

@NotThreadSafe
public class EntityBuilder {
    private byte[] binary;
    private boolean chunked;
    private String contentEncoding;
    private ContentType contentType;
    private File file;
    private boolean gzipCompress;
    private List<NameValuePair> parameters;
    private Serializable serializable;
    private InputStream stream;
    private String text;

    EntityBuilder() {
    }

    private void clearContent() {
        this.text = null;
        this.binary = null;
        this.stream = null;
        this.parameters = null;
        this.serializable = null;
        this.file = null;
    }

    public static EntityBuilder create() {
        return new EntityBuilder();
    }

    private ContentType getContentOrDefault(ContentType contentType2) {
        return this.contentType != null ? this.contentType : contentType2;
    }

    public HttpEntity build() {
        AbstractHttpEntity fileEntity;
        if (this.text != null) {
            fileEntity = new StringEntity(this.text, getContentOrDefault(ContentType.DEFAULT_TEXT));
        } else if (this.binary != null) {
            fileEntity = new ByteArrayEntity(this.binary, getContentOrDefault(ContentType.DEFAULT_BINARY));
        } else if (this.stream != null) {
            fileEntity = new InputStreamEntity(this.stream, 1, getContentOrDefault(ContentType.DEFAULT_BINARY));
        } else if (this.parameters != null) {
            fileEntity = new UrlEncodedFormEntity((Iterable<? extends NameValuePair>) this.parameters, this.contentType != null ? this.contentType.getCharset() : null);
        } else if (this.serializable != null) {
            fileEntity = new SerializableEntity(this.serializable);
            fileEntity.setContentType(ContentType.DEFAULT_BINARY.toString());
        } else {
            fileEntity = this.file != null ? new FileEntity(this.file, getContentOrDefault(ContentType.DEFAULT_BINARY)) : new BasicHttpEntity();
        }
        if (!(fileEntity.getContentType() == null || this.contentType == null)) {
            fileEntity.setContentType(this.contentType.toString());
        }
        fileEntity.setContentEncoding(this.contentEncoding);
        fileEntity.setChunked(this.chunked);
        return this.gzipCompress ? new GzipCompressingEntity(fileEntity) : fileEntity;
    }

    public EntityBuilder chunked() {
        this.chunked = true;
        return this;
    }

    public byte[] getBinary() {
        return this.binary;
    }

    public String getContentEncoding() {
        return this.contentEncoding;
    }

    public ContentType getContentType() {
        return this.contentType;
    }

    public File getFile() {
        return this.file;
    }

    public List<NameValuePair> getParameters() {
        return this.parameters;
    }

    public Serializable getSerializable() {
        return this.serializable;
    }

    public InputStream getStream() {
        return this.stream;
    }

    public String getText() {
        return this.text;
    }

    public EntityBuilder gzipCompress() {
        this.gzipCompress = true;
        return this;
    }

    public boolean isChunked() {
        return this.chunked;
    }

    public boolean isGzipCompress() {
        return this.gzipCompress;
    }

    public EntityBuilder setBinary(byte[] bArr) {
        clearContent();
        this.binary = bArr;
        return this;
    }

    public EntityBuilder setContentEncoding(String str) {
        this.contentEncoding = str;
        return this;
    }

    public EntityBuilder setContentType(ContentType contentType2) {
        this.contentType = contentType2;
        return this;
    }

    public EntityBuilder setFile(File file2) {
        clearContent();
        this.file = file2;
        return this;
    }

    public EntityBuilder setParameters(List<NameValuePair> list) {
        clearContent();
        this.parameters = list;
        return this;
    }

    public EntityBuilder setParameters(NameValuePair... nameValuePairArr) {
        return setParameters((List<NameValuePair>) Arrays.asList(nameValuePairArr));
    }

    public EntityBuilder setSerializable(Serializable serializable2) {
        clearContent();
        this.serializable = serializable2;
        return this;
    }

    public EntityBuilder setStream(InputStream inputStream) {
        clearContent();
        this.stream = inputStream;
        return this;
    }

    public EntityBuilder setText(String str) {
        clearContent();
        this.text = str;
        return this;
    }
}
