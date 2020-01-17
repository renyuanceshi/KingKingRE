package org.apache.http.client.methods;

import java.net.URI;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.message.BasicRequestLine;
import org.apache.http.params.HttpProtocolParams;

@NotThreadSafe
public abstract class HttpRequestBase extends AbstractExecutionAwareRequest implements HttpUriRequest, Configurable {
    private RequestConfig config;
    private URI uri;
    private ProtocolVersion version;

    public RequestConfig getConfig() {
        return this.config;
    }

    public abstract String getMethod();

    public ProtocolVersion getProtocolVersion() {
        return this.version != null ? this.version : HttpProtocolParams.getVersion(getParams());
    }

    public RequestLine getRequestLine() {
        String method = getMethod();
        ProtocolVersion protocolVersion = getProtocolVersion();
        URI uri2 = getURI();
        String str = null;
        if (uri2 != null) {
            str = uri2.toASCIIString();
        }
        if (str == null || str.length() == 0) {
            str = "/";
        }
        return new BasicRequestLine(method, str, protocolVersion);
    }

    public URI getURI() {
        return this.uri;
    }

    public void releaseConnection() {
        reset();
    }

    public void setConfig(RequestConfig requestConfig) {
        this.config = requestConfig;
    }

    public void setProtocolVersion(ProtocolVersion protocolVersion) {
        this.version = protocolVersion;
    }

    public void setURI(URI uri2) {
        this.uri = uri2;
    }

    public void started() {
    }

    public String toString() {
        return getMethod() + StringUtils.SPACE + getURI() + StringUtils.SPACE + getProtocolVersion();
    }
}
