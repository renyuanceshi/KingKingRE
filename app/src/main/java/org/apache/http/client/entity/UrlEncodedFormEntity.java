package org.apache.http.client.entity;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.protocol.HTTP;

@NotThreadSafe
public class UrlEncodedFormEntity extends StringEntity {
    public UrlEncodedFormEntity(Iterable<? extends NameValuePair> iterable) {
        this(iterable, (Charset) null);
    }

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public UrlEncodedFormEntity(Iterable<? extends NameValuePair> iterable, Charset charset) {
        super(URLEncodedUtils.format(iterable, charset != null ? charset : HTTP.DEF_CONTENT_CHARSET), ContentType.create(URLEncodedUtils.CONTENT_TYPE, charset));
    }

    public UrlEncodedFormEntity(List<? extends NameValuePair> list) throws UnsupportedEncodingException {
        this((Iterable<? extends NameValuePair>) list, (Charset) null);
    }

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public UrlEncodedFormEntity(List<? extends NameValuePair> list, String str) throws UnsupportedEncodingException {
        super(URLEncodedUtils.format(list, str != null ? str : HTTP.DEF_CONTENT_CHARSET.name()), ContentType.create(URLEncodedUtils.CONTENT_TYPE, str));
    }
}
