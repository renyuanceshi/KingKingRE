package org.apache.http.impl.client;

import java.net.Authenticator;
import java.net.InetAddress;
import java.net.PasswordAuthentication;
import java.net.URL;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.HttpHost;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.Credentials;
import org.apache.http.auth.NTCredentials;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.util.Args;

@ThreadSafe
public class SystemDefaultCredentialsProvider implements CredentialsProvider {
    private static final Map<String, String> SCHEME_MAP = new ConcurrentHashMap();
    private final BasicCredentialsProvider internal = new BasicCredentialsProvider();

    static {
        SCHEME_MAP.put("Basic".toUpperCase(Locale.ENGLISH), "Basic");
        SCHEME_MAP.put("Digest".toUpperCase(Locale.ENGLISH), "Digest");
        SCHEME_MAP.put("NTLM".toUpperCase(Locale.ENGLISH), "NTLM");
        SCHEME_MAP.put("negotiate".toUpperCase(Locale.ENGLISH), "SPNEGO");
        SCHEME_MAP.put("Kerberos".toUpperCase(Locale.ENGLISH), "Kerberos");
    }

    private static PasswordAuthentication getSystemCreds(AuthScope authScope, Authenticator.RequestorType requestorType) {
        String host = authScope.getHost();
        int port = authScope.getPort();
        return Authenticator.requestPasswordAuthentication(host, (InetAddress) null, port, port == 443 ? "https" : HttpHost.DEFAULT_SCHEME_NAME, (String) null, translateScheme(authScope.getScheme()), (URL) null, requestorType);
    }

    private static String translateScheme(String str) {
        if (str == null) {
            return null;
        }
        String str2 = SCHEME_MAP.get(str);
        return str2 != null ? str2 : str;
    }

    public void clear() {
        this.internal.clear();
    }

    public Credentials getCredentials(AuthScope authScope) {
        Args.notNull(authScope, "Auth scope");
        Credentials credentials = this.internal.getCredentials(authScope);
        if (credentials != null) {
            return credentials;
        }
        if (authScope.getHost() != null) {
            PasswordAuthentication systemCreds = getSystemCreds(authScope, Authenticator.RequestorType.SERVER);
            PasswordAuthentication systemCreds2 = systemCreds == null ? getSystemCreds(authScope, Authenticator.RequestorType.PROXY) : systemCreds;
            if (systemCreds2 != null) {
                String property = System.getProperty("http.auth.ntlm.domain");
                return property != null ? new NTCredentials(systemCreds2.getUserName(), new String(systemCreds2.getPassword()), (String) null, property) : "NTLM".equalsIgnoreCase(authScope.getScheme()) ? new NTCredentials(systemCreds2.getUserName(), new String(systemCreds2.getPassword()), (String) null, (String) null) : new UsernamePasswordCredentials(systemCreds2.getUserName(), new String(systemCreds2.getPassword()));
            }
        }
        return null;
    }

    public void setCredentials(AuthScope authScope, Credentials credentials) {
        this.internal.setCredentials(authScope, credentials);
    }
}
