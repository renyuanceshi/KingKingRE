package org.apache.http.auth;

import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;

@Immutable
public final class AuthOption {
    private final AuthScheme authScheme;
    private final Credentials creds;

    public AuthOption(AuthScheme authScheme2, Credentials credentials) {
        Args.notNull(authScheme2, "Auth scheme");
        Args.notNull(credentials, "User credentials");
        this.authScheme = authScheme2;
        this.creds = credentials;
    }

    public AuthScheme getAuthScheme() {
        return this.authScheme;
    }

    public Credentials getCredentials() {
        return this.creds;
    }

    public String toString() {
        return this.authScheme.toString();
    }
}
