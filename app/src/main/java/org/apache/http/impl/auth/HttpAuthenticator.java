package org.apache.http.impl.auth;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;
import java.util.Queue;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthOption;
import org.apache.http.auth.AuthProtocolState;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthState;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.ContextAwareAuthScheme;
import org.apache.http.auth.Credentials;
import org.apache.http.auth.MalformedChallengeException;
import org.apache.http.client.AuthenticationStrategy;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Asserts;

public class HttpAuthenticator {
    private final Log log;

    public HttpAuthenticator() {
        this((Log) null);
    }

    public HttpAuthenticator(Log log2) {
        this.log = log2 == null ? LogFactory.getLog(getClass()) : log2;
    }

    private Header doAuth(AuthScheme authScheme, Credentials credentials, HttpRequest httpRequest, HttpContext httpContext) throws AuthenticationException {
        return authScheme instanceof ContextAwareAuthScheme ? ((ContextAwareAuthScheme) authScheme).authenticate(credentials, httpRequest, httpContext) : authScheme.authenticate(credentials, httpRequest);
    }

    private void ensureAuthScheme(AuthScheme authScheme) {
        Asserts.notNull(authScheme, "Auth scheme");
    }

    public void generateAuthResponse(HttpRequest httpRequest, AuthState authState, HttpContext httpContext) throws HttpException, IOException {
        AuthScheme authScheme = authState.getAuthScheme();
        Credentials credentials = authState.getCredentials();
        switch (authState.getState()) {
            case CHALLENGED:
                Queue<AuthOption> authOptions = authState.getAuthOptions();
                if (authOptions == null) {
                    ensureAuthScheme(authScheme);
                    break;
                } else {
                    while (!authOptions.isEmpty()) {
                        AuthOption remove = authOptions.remove();
                        AuthScheme authScheme2 = remove.getAuthScheme();
                        Credentials credentials2 = remove.getCredentials();
                        authState.update(authScheme2, credentials2);
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Generating response to an authentication challenge using " + authScheme2.getSchemeName() + " scheme");
                        }
                        try {
                            httpRequest.addHeader(doAuth(authScheme2, credentials2, httpRequest, httpContext));
                            return;
                        } catch (AuthenticationException e) {
                            if (this.log.isWarnEnabled()) {
                                this.log.warn(authScheme2 + " authentication error: " + e.getMessage());
                            }
                        }
                    }
                    return;
                }
            case SUCCESS:
                ensureAuthScheme(authScheme);
                if (authScheme.isConnectionBased()) {
                    return;
                }
                break;
            case FAILURE:
                return;
        }
        if (authScheme != null) {
            try {
                httpRequest.addHeader(doAuth(authScheme, credentials, httpRequest, httpContext));
            } catch (AuthenticationException e2) {
                if (this.log.isErrorEnabled()) {
                    this.log.error(authScheme + " authentication error: " + e2.getMessage());
                }
            }
        }
    }

    public boolean handleAuthChallenge(HttpHost httpHost, HttpResponse httpResponse, AuthenticationStrategy authenticationStrategy, AuthState authState, HttpContext httpContext) {
        try {
            if (this.log.isDebugEnabled()) {
                this.log.debug(httpHost.toHostString() + " requested authentication");
            }
            Map<String, Header> challenges = authenticationStrategy.getChallenges(httpHost, httpResponse, httpContext);
            if (challenges.isEmpty()) {
                this.log.debug("Response contains no authentication challenges");
                return false;
            }
            AuthScheme authScheme = authState.getAuthScheme();
            switch (authState.getState()) {
                case CHALLENGED:
                case HANDSHAKE:
                    if (authScheme == null) {
                        this.log.debug("Auth scheme is null");
                        authenticationStrategy.authFailed(httpHost, (AuthScheme) null, httpContext);
                        authState.reset();
                        authState.setState(AuthProtocolState.FAILURE);
                        return false;
                    }
                    break;
                case SUCCESS:
                    authState.reset();
                    break;
                case FAILURE:
                    return false;
                case UNCHALLENGED:
                    break;
            }
            if (authScheme != null) {
                Header header = challenges.get(authScheme.getSchemeName().toLowerCase(Locale.US));
                if (header != null) {
                    this.log.debug("Authorization challenge processed");
                    authScheme.processChallenge(header);
                    if (authScheme.isComplete()) {
                        this.log.debug("Authentication failed");
                        authenticationStrategy.authFailed(httpHost, authState.getAuthScheme(), httpContext);
                        authState.reset();
                        authState.setState(AuthProtocolState.FAILURE);
                        return false;
                    }
                    authState.setState(AuthProtocolState.HANDSHAKE);
                    return true;
                }
                authState.reset();
            }
            Queue<AuthOption> select = authenticationStrategy.select(challenges, httpHost, httpResponse, httpContext);
            if (select == null || select.isEmpty()) {
                return false;
            }
            if (this.log.isDebugEnabled()) {
                this.log.debug("Selected authentication options: " + select);
            }
            authState.setState(AuthProtocolState.CHALLENGED);
            authState.update(select);
            return true;
        } catch (MalformedChallengeException e) {
            if (this.log.isWarnEnabled()) {
                this.log.warn("Malformed challenge: " + e.getMessage());
            }
            authState.reset();
            return false;
        }
    }

    public boolean isAuthenticationRequested(HttpHost httpHost, HttpResponse httpResponse, AuthenticationStrategy authenticationStrategy, AuthState authState, HttpContext httpContext) {
        if (authenticationStrategy.isAuthenticationRequested(httpHost, httpResponse, httpContext)) {
            this.log.debug("Authentication required");
            if (authState.getState() == AuthProtocolState.SUCCESS) {
                authenticationStrategy.authFailed(httpHost, authState.getAuthScheme(), httpContext);
            }
            return true;
        }
        switch (authState.getState()) {
            case CHALLENGED:
            case HANDSHAKE:
                this.log.debug("Authentication succeeded");
                authState.setState(AuthProtocolState.SUCCESS);
                authenticationStrategy.authSucceeded(httpHost, authState.getAuthScheme(), httpContext);
                break;
            case SUCCESS:
                break;
            default:
                authState.setState(AuthProtocolState.UNCHALLENGED);
                break;
        }
        return false;
    }
}
