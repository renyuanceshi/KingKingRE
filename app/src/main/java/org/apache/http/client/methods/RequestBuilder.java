package org.apache.http.client.methods;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import org.apache.http.Header;
import org.apache.http.HeaderIterator;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpRequest;
import org.apache.http.NameValuePair;
import org.apache.http.ProtocolVersion;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.message.HeaderGroup;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;

@NotThreadSafe
public class RequestBuilder {
    private RequestConfig config;
    private HttpEntity entity;
    private HeaderGroup headergroup;
    private String method;
    private LinkedList<NameValuePair> parameters;
    private URI uri;
    private ProtocolVersion version;

    static class InternalEntityEclosingRequest extends HttpEntityEnclosingRequestBase {
        private final String method;

        InternalEntityEclosingRequest(String str) {
            this.method = str;
        }

        public String getMethod() {
            return this.method;
        }
    }

    static class InternalRequest extends HttpRequestBase {
        private final String method;

        InternalRequest(String str) {
            this.method = str;
        }

        public String getMethod() {
            return this.method;
        }
    }

    RequestBuilder() {
        this((String) null);
    }

    RequestBuilder(String str) {
        this.method = str;
    }

    public static RequestBuilder copy(HttpRequest httpRequest) {
        Args.notNull(httpRequest, "HTTP request");
        return new RequestBuilder().doCopy(httpRequest);
    }

    public static RequestBuilder create(String str) {
        Args.notBlank(str, "HTTP method");
        return new RequestBuilder(str);
    }

    public static RequestBuilder delete() {
        return new RequestBuilder("DELETE");
    }

    private RequestBuilder doCopy(HttpRequest httpRequest) {
        if (httpRequest != null) {
            this.method = httpRequest.getRequestLine().getMethod();
            this.version = httpRequest.getRequestLine().getProtocolVersion();
            if (httpRequest instanceof HttpUriRequest) {
                this.uri = ((HttpUriRequest) httpRequest).getURI();
            } else {
                this.uri = URI.create(httpRequest.getRequestLine().getMethod());
            }
            if (this.headergroup == null) {
                this.headergroup = new HeaderGroup();
            }
            this.headergroup.clear();
            this.headergroup.setHeaders(httpRequest.getAllHeaders());
            if (httpRequest instanceof HttpEntityEnclosingRequest) {
                this.entity = ((HttpEntityEnclosingRequest) httpRequest).getEntity();
            } else {
                this.entity = null;
            }
            if (httpRequest instanceof Configurable) {
                this.config = ((Configurable) httpRequest).getConfig();
            } else {
                this.config = null;
            }
            this.parameters = null;
        }
        return this;
    }

    public static RequestBuilder get() {
        return new RequestBuilder("GET");
    }

    public static RequestBuilder head() {
        return new RequestBuilder("HEAD");
    }

    public static RequestBuilder options() {
        return new RequestBuilder("OPTIONS");
    }

    public static RequestBuilder post() {
        return new RequestBuilder(HttpPost.METHOD_NAME);
    }

    public static RequestBuilder put() {
        return new RequestBuilder("PUT");
    }

    public static RequestBuilder trace() {
        return new RequestBuilder("TRACE");
    }

    public RequestBuilder addHeader(String str, String str2) {
        if (this.headergroup == null) {
            this.headergroup = new HeaderGroup();
        }
        this.headergroup.addHeader(new BasicHeader(str, str2));
        return this;
    }

    public RequestBuilder addHeader(Header header) {
        if (this.headergroup == null) {
            this.headergroup = new HeaderGroup();
        }
        this.headergroup.addHeader(header);
        return this;
    }

    public RequestBuilder addParameter(String str, String str2) {
        return addParameter(new BasicNameValuePair(str, str2));
    }

    public RequestBuilder addParameter(NameValuePair nameValuePair) {
        Args.notNull(nameValuePair, "Name value pair");
        if (this.parameters == null) {
            this.parameters = new LinkedList<>();
        }
        this.parameters.add(nameValuePair);
        return this;
    }

    public RequestBuilder addParameters(NameValuePair... nameValuePairArr) {
        for (NameValuePair addParameter : nameValuePairArr) {
            addParameter(addParameter);
        }
        return this;
    }

    public HttpUriRequest build() {
        URI uri2;
        HttpRequestBase httpRequestBase;
        URI create = this.uri != null ? this.uri : URI.create("/");
        HttpEntity httpEntity = this.entity;
        if (this.parameters == null || this.parameters.isEmpty()) {
            uri2 = create;
        } else if (httpEntity != null || (!HttpPost.METHOD_NAME.equalsIgnoreCase(this.method) && !"PUT".equalsIgnoreCase(this.method))) {
            try {
                uri2 = new URIBuilder(create).addParameters(this.parameters).build();
            } catch (URISyntaxException e) {
                uri2 = create;
            }
        } else {
            httpEntity = new UrlEncodedFormEntity((Iterable<? extends NameValuePair>) this.parameters, HTTP.DEF_CONTENT_CHARSET);
            uri2 = create;
        }
        if (httpEntity == null) {
            httpRequestBase = new InternalRequest(this.method);
        } else {
            InternalEntityEclosingRequest internalEntityEclosingRequest = new InternalEntityEclosingRequest(this.method);
            internalEntityEclosingRequest.setEntity(httpEntity);
            httpRequestBase = internalEntityEclosingRequest;
        }
        httpRequestBase.setProtocolVersion(this.version);
        httpRequestBase.setURI(uri2);
        if (this.headergroup != null) {
            httpRequestBase.setHeaders(this.headergroup.getAllHeaders());
        }
        httpRequestBase.setConfig(this.config);
        return httpRequestBase;
    }

    public RequestConfig getConfig() {
        return this.config;
    }

    public HttpEntity getEntity() {
        return this.entity;
    }

    public Header getFirstHeader(String str) {
        if (this.headergroup != null) {
            return this.headergroup.getFirstHeader(str);
        }
        return null;
    }

    public Header[] getHeaders(String str) {
        if (this.headergroup != null) {
            return this.headergroup.getHeaders(str);
        }
        return null;
    }

    public Header getLastHeader(String str) {
        if (this.headergroup != null) {
            return this.headergroup.getLastHeader(str);
        }
        return null;
    }

    public String getMethod() {
        return this.method;
    }

    public List<NameValuePair> getParameters() {
        return this.parameters != null ? new ArrayList(this.parameters) : new ArrayList();
    }

    public URI getUri() {
        return this.uri;
    }

    public ProtocolVersion getVersion() {
        return this.version;
    }

    public RequestBuilder removeHeader(Header header) {
        if (this.headergroup == null) {
            this.headergroup = new HeaderGroup();
        }
        this.headergroup.removeHeader(header);
        return this;
    }

    public RequestBuilder removeHeaders(String str) {
        if (!(str == null || this.headergroup == null)) {
            HeaderIterator it = this.headergroup.iterator();
            while (it.hasNext()) {
                if (str.equalsIgnoreCase(it.nextHeader().getName())) {
                    it.remove();
                }
            }
        }
        return this;
    }

    public RequestBuilder setConfig(RequestConfig requestConfig) {
        this.config = requestConfig;
        return this;
    }

    public RequestBuilder setEntity(HttpEntity httpEntity) {
        this.entity = httpEntity;
        return this;
    }

    public RequestBuilder setHeader(String str, String str2) {
        if (this.headergroup == null) {
            this.headergroup = new HeaderGroup();
        }
        this.headergroup.updateHeader(new BasicHeader(str, str2));
        return this;
    }

    public RequestBuilder setHeader(Header header) {
        if (this.headergroup == null) {
            this.headergroup = new HeaderGroup();
        }
        this.headergroup.updateHeader(header);
        return this;
    }

    public RequestBuilder setUri(String str) {
        this.uri = str != null ? URI.create(str) : null;
        return this;
    }

    public RequestBuilder setUri(URI uri2) {
        this.uri = uri2;
        return this;
    }

    public RequestBuilder setVersion(ProtocolVersion protocolVersion) {
        this.version = protocolVersion;
        return this;
    }
}
