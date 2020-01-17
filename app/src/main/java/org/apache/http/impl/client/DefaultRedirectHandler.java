package org.apache.http.impl.client;

import com.facebook.places.model.PlaceFields;
import java.net.URI;
import java.net.URISyntaxException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.ProtocolException;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.CircularRedirectException;
import org.apache.http.client.RedirectHandler;
import org.apache.http.client.params.ClientPNames;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Immutable
@Deprecated
public class DefaultRedirectHandler implements RedirectHandler {
    private static final String REDIRECT_LOCATIONS = "http.protocol.redirect-locations";
    private final Log log = LogFactory.getLog(getClass());

    public URI getLocationURI(HttpResponse httpResponse, HttpContext httpContext) throws ProtocolException {
        URI uri;
        URI uri2;
        Args.notNull(httpResponse, "HTTP response");
        Header firstHeader = httpResponse.getFirstHeader(PlaceFields.LOCATION);
        if (firstHeader == null) {
            throw new ProtocolException("Received redirect response " + httpResponse.getStatusLine() + " but no location header");
        }
        String value = firstHeader.getValue();
        if (this.log.isDebugEnabled()) {
            this.log.debug("Redirect requested to location '" + value + "'");
        }
        try {
            URI uri3 = new URI(value);
            HttpParams params = httpResponse.getParams();
            if (uri3.isAbsolute()) {
                uri = uri3;
            } else if (params.isParameterTrue(ClientPNames.REJECT_RELATIVE_REDIRECT)) {
                throw new ProtocolException("Relative redirect location '" + uri3 + "' not allowed");
            } else {
                HttpHost httpHost = (HttpHost) httpContext.getAttribute("http.target_host");
                Asserts.notNull(httpHost, "Target host");
                try {
                    uri = URIUtils.resolve(URIUtils.rewriteURI(new URI(((HttpRequest) httpContext.getAttribute("http.request")).getRequestLine().getUri()), httpHost, true), uri3);
                } catch (URISyntaxException e) {
                    throw new ProtocolException(e.getMessage(), e);
                }
            }
            if (params.isParameterFalse(ClientPNames.ALLOW_CIRCULAR_REDIRECTS)) {
                RedirectLocations redirectLocations = (RedirectLocations) httpContext.getAttribute("http.protocol.redirect-locations");
                if (redirectLocations == null) {
                    redirectLocations = new RedirectLocations();
                    httpContext.setAttribute("http.protocol.redirect-locations", redirectLocations);
                }
                if (uri.getFragment() != null) {
                    try {
                        uri2 = URIUtils.rewriteURI(uri, new HttpHost(uri.getHost(), uri.getPort(), uri.getScheme()), true);
                    } catch (URISyntaxException e2) {
                        throw new ProtocolException(e2.getMessage(), e2);
                    }
                } else {
                    uri2 = uri;
                }
                if (redirectLocations.contains(uri2)) {
                    throw new CircularRedirectException("Circular redirect to '" + uri2 + "'");
                }
                redirectLocations.add(uri2);
            }
            return uri;
        } catch (URISyntaxException e3) {
            throw new ProtocolException("Invalid redirect URI: " + value, e3);
        }
    }

    public boolean isRedirectRequested(HttpResponse httpResponse, HttpContext httpContext) {
        Args.notNull(httpResponse, "HTTP response");
        switch (httpResponse.getStatusLine().getStatusCode()) {
            case HttpStatus.SC_MOVED_PERMANENTLY:
            case HttpStatus.SC_MOVED_TEMPORARILY:
            case HttpStatus.SC_TEMPORARY_REDIRECT:
                String method = ((HttpRequest) httpContext.getAttribute("http.request")).getRequestLine().getMethod();
                if (method.equalsIgnoreCase("GET") || method.equalsIgnoreCase("HEAD")) {
                    return true;
                }
            case HttpStatus.SC_SEE_OTHER:
                return true;
            case HttpStatus.SC_NOT_MODIFIED:
            case HttpStatus.SC_USE_PROXY:
            case 306:
                break;
            default:
                return false;
        }
        return false;
    }
}
