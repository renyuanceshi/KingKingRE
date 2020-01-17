package org.apache.http.impl.auth;

import com.facebook.share.internal.ShareConstants;
import com.pccw.mobile.sip.ServerMessageController;
import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.HashSet;
import java.util.Locale;
import java.util.StringTokenizer;
import org.apache.http.Consts;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpRequest;
import org.apache.http.NameValuePair;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.ChallengeState;
import org.apache.http.auth.Credentials;
import org.apache.http.auth.MalformedChallengeException;
import org.apache.http.message.BasicHeaderValueFormatter;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.message.BufferedHeader;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;
import org.apache.http.util.EncodingUtils;

@NotThreadSafe
public class DigestScheme extends RFC2617Scheme {
    private static final char[] HEXADECIMAL = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    private static final int QOP_AUTH = 2;
    private static final int QOP_AUTH_INT = 1;
    private static final int QOP_MISSING = 0;
    private static final int QOP_UNKNOWN = -1;
    private String a1;
    private String a2;
    private String cnonce;
    private boolean complete;
    private String lastNonce;
    private long nounceCount;

    public DigestScheme() {
        this(Consts.ASCII);
    }

    public DigestScheme(Charset charset) {
        super(charset);
        this.complete = false;
    }

    @Deprecated
    public DigestScheme(ChallengeState challengeState) {
        super(challengeState);
    }

    public static String createCnonce() {
        byte[] bArr = new byte[8];
        new SecureRandom().nextBytes(bArr);
        return encode(bArr);
    }

    private Header createDigestHeader(Credentials credentials, HttpRequest httpRequest) throws AuthenticationException {
        String sb;
        String parameter = getParameter(ShareConstants.MEDIA_URI);
        String parameter2 = getParameter("realm");
        String parameter3 = getParameter("nonce");
        String parameter4 = getParameter("opaque");
        String parameter5 = getParameter("methodname");
        String parameter6 = getParameter("algorithm");
        if (parameter6 == null) {
            parameter6 = "MD5";
        }
        HashSet hashSet = new HashSet(8);
        char c = 65535;
        String parameter7 = getParameter("qop");
        if (parameter7 != null) {
            StringTokenizer stringTokenizer = new StringTokenizer(parameter7, ",");
            while (stringTokenizer.hasMoreTokens()) {
                hashSet.add(stringTokenizer.nextToken().trim().toLowerCase(Locale.US));
            }
            if ((httpRequest instanceof HttpEntityEnclosingRequest) && hashSet.contains("auth-int")) {
                c = 1;
            } else if (hashSet.contains("auth")) {
                c = 2;
            }
        } else {
            c = 0;
        }
        if (c == 65535) {
            throw new AuthenticationException("None of the qop methods is supported: " + parameter7);
        }
        String parameter8 = getParameter("charset");
        if (parameter8 == null) {
            parameter8 = "ISO-8859-1";
        }
        String str = parameter6.equalsIgnoreCase("MD5-sess") ? "MD5" : parameter6;
        try {
            MessageDigest createMessageDigest = createMessageDigest(str);
            String name = credentials.getUserPrincipal().getName();
            String password = credentials.getPassword();
            if (parameter3.equals(this.lastNonce)) {
                this.nounceCount++;
            } else {
                this.nounceCount = 1;
                this.cnonce = null;
                this.lastNonce = parameter3;
            }
            StringBuilder sb2 = new StringBuilder(256);
            Formatter formatter = new Formatter(sb2, Locale.US);
            formatter.format("%08x", new Object[]{Long.valueOf(this.nounceCount)});
            formatter.close();
            String sb3 = sb2.toString();
            if (this.cnonce == null) {
                this.cnonce = createCnonce();
            }
            this.a1 = null;
            this.a2 = null;
            if (parameter6.equalsIgnoreCase("MD5-sess")) {
                sb2.setLength(0);
                sb2.append(name).append(':').append(parameter2).append(':').append(password);
                String encode = encode(createMessageDigest.digest(EncodingUtils.getBytes(sb2.toString(), parameter8)));
                sb2.setLength(0);
                sb2.append(encode).append(':').append(parameter3).append(':').append(this.cnonce);
                this.a1 = sb2.toString();
            } else {
                sb2.setLength(0);
                sb2.append(name).append(':').append(parameter2).append(':').append(password);
                this.a1 = sb2.toString();
            }
            String encode2 = encode(createMessageDigest.digest(EncodingUtils.getBytes(this.a1, parameter8)));
            if (c == 2) {
                this.a2 = parameter5 + ':' + parameter;
            } else if (c == 1) {
                HttpEntity httpEntity = null;
                if (httpRequest instanceof HttpEntityEnclosingRequest) {
                    httpEntity = ((HttpEntityEnclosingRequest) httpRequest).getEntity();
                }
                if (httpEntity == null || httpEntity.isRepeatable()) {
                    HttpEntityDigester httpEntityDigester = new HttpEntityDigester(createMessageDigest);
                    if (httpEntity != null) {
                        try {
                            httpEntity.writeTo(httpEntityDigester);
                        } catch (IOException e) {
                            throw new AuthenticationException("I/O error reading entity content", e);
                        }
                    }
                    httpEntityDigester.close();
                    this.a2 = parameter5 + ':' + parameter + ':' + encode(httpEntityDigester.getDigest());
                } else if (hashSet.contains("auth")) {
                    c = 2;
                    this.a2 = parameter5 + ':' + parameter;
                } else {
                    throw new AuthenticationException("Qop auth-int cannot be used with a non-repeatable entity");
                }
            } else {
                this.a2 = parameter5 + ':' + parameter;
            }
            String encode3 = encode(createMessageDigest.digest(EncodingUtils.getBytes(this.a2, parameter8)));
            if (c == 0) {
                sb2.setLength(0);
                sb2.append(encode2).append(':').append(parameter3).append(':').append(encode3);
                sb = sb2.toString();
            } else {
                sb2.setLength(0);
                sb2.append(encode2).append(':').append(parameter3).append(':').append(sb3).append(':').append(this.cnonce).append(':').append(c == 1 ? "auth-int" : "auth").append(':').append(encode3);
                sb = sb2.toString();
            }
            String encode4 = encode(createMessageDigest.digest(EncodingUtils.getAsciiBytes(sb)));
            CharArrayBuffer charArrayBuffer = new CharArrayBuffer(128);
            if (isProxy()) {
                charArrayBuffer.append("Proxy-Authorization");
            } else {
                charArrayBuffer.append("Authorization");
            }
            charArrayBuffer.append(": Digest ");
            ArrayList arrayList = new ArrayList(20);
            arrayList.add(new BasicNameValuePair("username", name));
            arrayList.add(new BasicNameValuePair("realm", parameter2));
            arrayList.add(new BasicNameValuePair("nonce", parameter3));
            arrayList.add(new BasicNameValuePair(ShareConstants.MEDIA_URI, parameter));
            arrayList.add(new BasicNameValuePair(ServerMessageController.TAG_RESPONSE, encode4));
            if (c != 0) {
                arrayList.add(new BasicNameValuePair("qop", c == 1 ? "auth-int" : "auth"));
                arrayList.add(new BasicNameValuePair("nc", sb3));
                arrayList.add(new BasicNameValuePair("cnonce", this.cnonce));
            }
            arrayList.add(new BasicNameValuePair("algorithm", parameter6));
            if (parameter4 != null) {
                arrayList.add(new BasicNameValuePair("opaque", parameter4));
            }
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= arrayList.size()) {
                    return new BufferedHeader(charArrayBuffer);
                }
                BasicNameValuePair basicNameValuePair = (BasicNameValuePair) arrayList.get(i2);
                if (i2 > 0) {
                    charArrayBuffer.append(", ");
                }
                String name2 = basicNameValuePair.getName();
                BasicHeaderValueFormatter.INSTANCE.formatNameValuePair(charArrayBuffer, (NameValuePair) basicNameValuePair, !("nc".equals(name2) || "qop".equals(name2) || "algorithm".equals(name2)));
                i = i2 + 1;
            }
        } catch (UnsupportedDigestAlgorithmException e2) {
            throw new AuthenticationException("Unsuppported digest algorithm: " + str);
        }
    }

    private static MessageDigest createMessageDigest(String str) throws UnsupportedDigestAlgorithmException {
        try {
            return MessageDigest.getInstance(str);
        } catch (Exception e) {
            throw new UnsupportedDigestAlgorithmException("Unsupported algorithm in HTTP Digest authentication: " + str);
        }
    }

    static String encode(byte[] bArr) {
        int length = bArr.length;
        char[] cArr = new char[(length * 2)];
        for (int i = 0; i < length; i++) {
            byte b = bArr[i];
            cArr[i * 2] = (char) HEXADECIMAL[(bArr[i] & 240) >> 4];
            cArr[(i * 2) + 1] = (char) HEXADECIMAL[b & 15];
        }
        return new String(cArr);
    }

    @Deprecated
    public Header authenticate(Credentials credentials, HttpRequest httpRequest) throws AuthenticationException {
        return authenticate(credentials, httpRequest, new BasicHttpContext());
    }

    public Header authenticate(Credentials credentials, HttpRequest httpRequest, HttpContext httpContext) throws AuthenticationException {
        Args.notNull(credentials, "Credentials");
        Args.notNull(httpRequest, "HTTP request");
        if (getParameter("realm") == null) {
            throw new AuthenticationException("missing realm in challenge");
        } else if (getParameter("nonce") == null) {
            throw new AuthenticationException("missing nonce in challenge");
        } else {
            getParameters().put("methodname", httpRequest.getRequestLine().getMethod());
            getParameters().put(ShareConstants.MEDIA_URI, httpRequest.getRequestLine().getUri());
            if (getParameter("charset") == null) {
                getParameters().put("charset", getCredentialsCharset(httpRequest));
            }
            return createDigestHeader(credentials, httpRequest);
        }
    }

    /* access modifiers changed from: package-private */
    public String getA1() {
        return this.a1;
    }

    /* access modifiers changed from: package-private */
    public String getA2() {
        return this.a2;
    }

    /* access modifiers changed from: package-private */
    public String getCnonce() {
        return this.cnonce;
    }

    public String getSchemeName() {
        return "digest";
    }

    public boolean isComplete() {
        if ("true".equalsIgnoreCase(getParameter("stale"))) {
            return false;
        }
        return this.complete;
    }

    public boolean isConnectionBased() {
        return false;
    }

    public void overrideParamter(String str, String str2) {
        getParameters().put(str, str2);
    }

    public void processChallenge(Header header) throws MalformedChallengeException {
        super.processChallenge(header);
        this.complete = true;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DIGEST [complete=").append(this.complete).append(", nonce=").append(this.lastNonce).append(", nc=").append(this.nounceCount).append("]");
        return sb.toString();
    }
}
