package org.apache.http.entity.mime;

import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.content.AbstractContentBody;
import org.apache.http.entity.mime.content.ContentBody;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;

public class FormBodyPart {
    private final ContentBody body;
    private final Header header = new Header();
    private final String name;

    public FormBodyPart(String str, ContentBody contentBody) {
        Args.notNull(str, "Name");
        Args.notNull(contentBody, "Body");
        this.name = str;
        this.body = contentBody;
        generateContentDisp(contentBody);
        generateContentType(contentBody);
        generateTransferEncoding(contentBody);
    }

    public void addField(String str, String str2) {
        Args.notNull(str, "Field name");
        this.header.addField(new MinimalField(str, str2));
    }

    /* access modifiers changed from: protected */
    public void generateContentDisp(ContentBody contentBody) {
        StringBuilder sb = new StringBuilder();
        sb.append("form-data; name=\"");
        sb.append(getName());
        sb.append("\"");
        if (contentBody.getFilename() != null) {
            sb.append("; filename=\"");
            sb.append(contentBody.getFilename());
            sb.append("\"");
        }
        addField(MIME.CONTENT_DISPOSITION, sb.toString());
    }

    /* access modifiers changed from: protected */
    public void generateContentType(ContentBody contentBody) {
        ContentType contentType = contentBody instanceof AbstractContentBody ? ((AbstractContentBody) contentBody).getContentType() : null;
        if (contentType != null) {
            addField("Content-Type", contentType.toString());
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(contentBody.getMimeType());
        if (contentBody.getCharset() != null) {
            sb.append(HTTP.CHARSET_PARAM);
            sb.append(contentBody.getCharset());
        }
        addField("Content-Type", sb.toString());
    }

    /* access modifiers changed from: protected */
    public void generateTransferEncoding(ContentBody contentBody) {
        addField(MIME.CONTENT_TRANSFER_ENC, contentBody.getTransferEncoding());
    }

    public ContentBody getBody() {
        return this.body;
    }

    public Header getHeader() {
        return this.header;
    }

    public String getName() {
        return this.name;
    }
}
