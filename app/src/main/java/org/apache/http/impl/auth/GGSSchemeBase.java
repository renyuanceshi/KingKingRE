package org.apache.http.impl.auth;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.Credentials;
import org.apache.http.auth.InvalidCredentialsException;
import org.apache.http.auth.MalformedChallengeException;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.message.BufferedHeader;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;
import org.ietf.jgss.GSSContext;
import org.ietf.jgss.GSSCredential;
import org.ietf.jgss.GSSException;
import org.ietf.jgss.GSSManager;
import org.ietf.jgss.GSSName;
import org.ietf.jgss.Oid;

@NotThreadSafe
public abstract class GGSSchemeBase extends AuthSchemeBase {
    private final Base64 base64codec;
    private final Log log;
    private State state;
    private final boolean stripPort;
    private byte[] token;

    enum State {
        UNINITIATED,
        CHALLENGE_RECEIVED,
        TOKEN_GENERATED,
        FAILED
    }

    GGSSchemeBase() {
        this(false);
    }

    GGSSchemeBase(boolean z) {
        this.log = LogFactory.getLog(getClass());
        this.base64codec = new Base64(0);
        this.stripPort = z;
        this.state = State.UNINITIATED;
    }

    @Deprecated
    public Header authenticate(Credentials credentials, HttpRequest httpRequest) throws AuthenticationException {
        return authenticate(credentials, httpRequest, (HttpContext) null);
    }

    public Header authenticate(Credentials credentials, HttpRequest httpRequest, HttpContext httpContext) throws AuthenticationException {
        HttpHost targetHost;
        Args.notNull(httpRequest, "HTTP request");
        switch (this.state) {
            case UNINITIATED:
                throw new AuthenticationException(getSchemeName() + " authentication has not been initiated");
            case FAILED:
                throw new AuthenticationException(getSchemeName() + " authentication has failed");
            case CHALLENGE_RECEIVED:
                try {
                    HttpRoute httpRoute = (HttpRoute) httpContext.getAttribute("http.route");
                    if (httpRoute != null) {
                        if (isProxy()) {
                            HttpHost proxyHost = httpRoute.getProxyHost();
                            targetHost = proxyHost == null ? httpRoute.getTargetHost() : proxyHost;
                        } else {
                            targetHost = httpRoute.getTargetHost();
                        }
                        String hostName = (this.stripPort || targetHost.getPort() <= 0) ? targetHost.getHostName() : targetHost.toHostString();
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("init " + hostName);
                        }
                        this.token = generateToken(this.token, hostName);
                        this.state = State.TOKEN_GENERATED;
                        break;
                    } else {
                        throw new AuthenticationException("Connection route is not available");
                    }
                } catch (GSSException e) {
                    this.state = State.FAILED;
                    if (e.getMajor() == 9 || e.getMajor() == 8) {
                        throw new InvalidCredentialsException(e.getMessage(), e);
                    } else if (e.getMajor() == 13) {
                        throw new InvalidCredentialsException(e.getMessage(), e);
                    } else if (e.getMajor() == 10 || e.getMajor() == 19 || e.getMajor() == 20) {
                        throw new AuthenticationException(e.getMessage(), e);
                    } else {
                        throw new AuthenticationException(e.getMessage());
                    }
                }
                break;
            case TOKEN_GENERATED:
                break;
            default:
                throw new IllegalStateException("Illegal state: " + this.state);
        }
        String str = new String(this.base64codec.encode(this.token));
        if (this.log.isDebugEnabled()) {
            this.log.debug("Sending response '" + str + "' back to the auth server");
        }
        CharArrayBuffer charArrayBuffer = new CharArrayBuffer(32);
        if (isProxy()) {
            charArrayBuffer.append("Proxy-Authorization");
        } else {
            charArrayBuffer.append("Authorization");
        }
        charArrayBuffer.append(": Negotiate ");
        charArrayBuffer.append(str);
        return new BufferedHeader(charArrayBuffer);
    }

    /* access modifiers changed from: protected */
    public byte[] generateGSSToken(byte[] bArr, Oid oid, String str) throws GSSException {
        if (bArr == null) {
            bArr = new byte[0];
        }
        GSSManager manager = getManager();
        GSSContext createContext = manager.createContext(manager.createName("HTTP@" + str, GSSName.NT_HOSTBASED_SERVICE).canonicalize(oid), oid, (GSSCredential) null, 0);
        createContext.requestMutualAuth(true);
        createContext.requestCredDeleg(true);
        return createContext.initSecContext(bArr, 0, bArr.length);
    }

    /* access modifiers changed from: protected */
    public abstract byte[] generateToken(byte[] bArr, String str) throws GSSException;

    /* access modifiers changed from: protected */
    public GSSManager getManager() {
        return GSSManager.getInstance();
    }

    public boolean isComplete() {
        return this.state == State.TOKEN_GENERATED || this.state == State.FAILED;
    }

    /* access modifiers changed from: protected */
    public void parseChallenge(CharArrayBuffer charArrayBuffer, int i, int i2) throws MalformedChallengeException {
        String substringTrimmed = charArrayBuffer.substringTrimmed(i, i2);
        if (this.log.isDebugEnabled()) {
            this.log.debug("Received challenge '" + substringTrimmed + "' from the auth server");
        }
        if (this.state == State.UNINITIATED) {
            this.token = Base64.decodeBase64(substringTrimmed.getBytes());
            this.state = State.CHALLENGE_RECEIVED;
            return;
        }
        this.log.debug("Authentication already attempted");
        this.state = State.FAILED;
    }
}
