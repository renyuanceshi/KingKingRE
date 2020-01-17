package org.apache.http.auth;

import java.util.Queue;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class AuthState {
    private Queue<AuthOption> authOptions;
    private AuthScheme authScheme;
    private AuthScope authScope;
    private Credentials credentials;
    private AuthProtocolState state = AuthProtocolState.UNCHALLENGED;

    public Queue<AuthOption> getAuthOptions() {
        return this.authOptions;
    }

    public AuthScheme getAuthScheme() {
        return this.authScheme;
    }

    @Deprecated
    public AuthScope getAuthScope() {
        return this.authScope;
    }

    public Credentials getCredentials() {
        return this.credentials;
    }

    public AuthProtocolState getState() {
        return this.state;
    }

    public boolean hasAuthOptions() {
        return this.authOptions != null && !this.authOptions.isEmpty();
    }

    @Deprecated
    public void invalidate() {
        reset();
    }

    @Deprecated
    public boolean isValid() {
        return this.authScheme != null;
    }

    public void reset() {
        this.state = AuthProtocolState.UNCHALLENGED;
        this.authOptions = null;
        this.authScheme = null;
        this.authScope = null;
        this.credentials = null;
    }

    @Deprecated
    public void setAuthScheme(AuthScheme authScheme2) {
        if (authScheme2 == null) {
            reset();
        } else {
            this.authScheme = authScheme2;
        }
    }

    @Deprecated
    public void setAuthScope(AuthScope authScope2) {
        this.authScope = authScope2;
    }

    @Deprecated
    public void setCredentials(Credentials credentials2) {
        this.credentials = credentials2;
    }

    public void setState(AuthProtocolState authProtocolState) {
        if (authProtocolState == null) {
            authProtocolState = AuthProtocolState.UNCHALLENGED;
        }
        this.state = authProtocolState;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("state:").append(this.state).append(";");
        if (this.authScheme != null) {
            sb.append("auth scheme:").append(this.authScheme.getSchemeName()).append(";");
        }
        if (this.credentials != null) {
            sb.append("credentials present");
        }
        return sb.toString();
    }

    public void update(Queue<AuthOption> queue) {
        Args.notEmpty(queue, "Queue of auth options");
        this.authOptions = queue;
        this.authScheme = null;
        this.credentials = null;
    }

    public void update(AuthScheme authScheme2, Credentials credentials2) {
        Args.notNull(authScheme2, "Auth scheme");
        Args.notNull(credentials2, "Credentials");
        this.authScheme = authScheme2;
        this.credentials = credentials2;
        this.authOptions = null;
    }
}
