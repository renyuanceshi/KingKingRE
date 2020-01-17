package org.apache.http.entity.mime.content;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MIME;
import org.apache.http.util.Args;

public class InputStreamBody extends AbstractContentBody {
    private final String filename;
    private final InputStream in;

    public InputStreamBody(InputStream inputStream, String str) {
        this(inputStream, ContentType.DEFAULT_BINARY, str);
    }

    @Deprecated
    public InputStreamBody(InputStream inputStream, String str, String str2) {
        this(inputStream, ContentType.create(str), str2);
    }

    public InputStreamBody(InputStream inputStream, ContentType contentType) {
        this(inputStream, contentType, (String) null);
    }

    public InputStreamBody(InputStream inputStream, ContentType contentType, String str) {
        super(contentType);
        Args.notNull(inputStream, "Input stream");
        this.in = inputStream;
        this.filename = str;
    }

    public long getContentLength() {
        return -1;
    }

    public String getFilename() {
        return this.filename;
    }

    public InputStream getInputStream() {
        return this.in;
    }

    public String getTransferEncoding() {
        return MIME.ENC_BINARY;
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        Args.notNull(outputStream, "Output stream");
        try {
            byte[] bArr = new byte[4096];
            while (true) {
                int read = this.in.read(bArr);
                if (read != -1) {
                    outputStream.write(bArr, 0, read);
                } else {
                    outputStream.flush();
                    return;
                }
            }
        } finally {
            this.in.close();
        }
    }
}
