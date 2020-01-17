package org.apache.http.entity.mime.content;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import org.apache.http.Consts;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MIME;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;

public class StringBody extends AbstractContentBody {
    private final byte[] content;

    @Deprecated
    public StringBody(String str) throws UnsupportedEncodingException {
        this(str, HTTP.PLAIN_TEXT_TYPE, Consts.ASCII);
    }

    @Deprecated
    public StringBody(String str, String str2, Charset charset) throws UnsupportedEncodingException {
        this(str, ContentType.create(str2, charset));
    }

    @Deprecated
    public StringBody(String str, Charset charset) throws UnsupportedEncodingException {
        this(str, HTTP.PLAIN_TEXT_TYPE, charset);
    }

    public StringBody(String str, ContentType contentType) {
        super(contentType);
        Charset charset = contentType.getCharset();
        String name = charset != null ? charset.name() : Consts.ASCII.name();
        try {
            this.content = str.getBytes(name);
        } catch (UnsupportedEncodingException e) {
            throw new UnsupportedCharsetException(name);
        }
    }

    @Deprecated
    public static StringBody create(String str) throws IllegalArgumentException {
        return create(str, (String) null, (Charset) null);
    }

    @Deprecated
    public static StringBody create(String str, String str2, Charset charset) throws IllegalArgumentException {
        try {
            return new StringBody(str, str2, charset);
        } catch (UnsupportedEncodingException e) {
            throw new IllegalArgumentException("Charset " + charset + " is not supported", e);
        }
    }

    @Deprecated
    public static StringBody create(String str, Charset charset) throws IllegalArgumentException {
        return create(str, (String) null, charset);
    }

    public long getContentLength() {
        return (long) this.content.length;
    }

    public String getFilename() {
        return null;
    }

    public Reader getReader() {
        Charset charset = getContentType().getCharset();
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(this.content);
        if (charset == null) {
            charset = Consts.ASCII;
        }
        return new InputStreamReader(byteArrayInputStream, charset);
    }

    public String getTransferEncoding() {
        return MIME.ENC_8BIT;
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        Args.notNull(outputStream, "Output stream");
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(this.content);
        byte[] bArr = new byte[4096];
        while (true) {
            int read = byteArrayInputStream.read(bArr);
            if (read != -1) {
                outputStream.write(bArr, 0, read);
            } else {
                outputStream.flush();
                return;
            }
        }
    }
}
