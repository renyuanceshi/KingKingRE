package org.apache.http.conn.ssl;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.cert.CertificateParsingException;
import java.security.cert.X509Certificate;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.annotation.Immutable;
import org.apache.http.conn.util.InetAddressUtils;

@Immutable
public abstract class AbstractVerifier implements X509HostnameVerifier {
    private static final String[] BAD_COUNTRY_2LDS = {"ac", "co", "com", "ed", "edu", "go", "gouv", "gov", "info", "lg", "ne", "net", "or", "org"};
    private final Log log = LogFactory.getLog(getClass());

    static {
        Arrays.sort(BAD_COUNTRY_2LDS);
    }

    @Deprecated
    public static boolean acceptableCountryWildcard(String str) {
        String[] split = str.split("\\.");
        return (split.length == 3 && split[2].length() == 2 && Arrays.binarySearch(BAD_COUNTRY_2LDS, split[1]) >= 0) ? false : true;
    }

    public static int countDots(String str) {
        int i = 0;
        int i2 = 0;
        while (true) {
            int i3 = i;
            if (i2 >= str.length()) {
                return i3;
            }
            i = str.charAt(i2) == '.' ? i3 + 1 : i3;
            i2++;
        }
    }

    public static String[] getCNs(X509Certificate x509Certificate) {
        LinkedList linkedList = new LinkedList();
        StringTokenizer stringTokenizer = new StringTokenizer(x509Certificate.getSubjectX500Principal().toString(), ",+");
        while (stringTokenizer.hasMoreTokens()) {
            String trim = stringTokenizer.nextToken().trim();
            if (trim.length() > 3 && trim.substring(0, 3).equalsIgnoreCase("CN=")) {
                linkedList.add(trim.substring(3));
            }
        }
        if (linkedList.isEmpty()) {
            return null;
        }
        String[] strArr = new String[linkedList.size()];
        linkedList.toArray(strArr);
        return strArr;
    }

    public static String[] getDNSSubjectAlts(X509Certificate x509Certificate) {
        return getSubjectAlts(x509Certificate, (String) null);
    }

    private static String[] getSubjectAlts(X509Certificate x509Certificate, String str) {
        Collection<List<?>> collection;
        int i = isIPAddress(str) ? 7 : 2;
        LinkedList linkedList = new LinkedList();
        try {
            collection = x509Certificate.getSubjectAlternativeNames();
        } catch (CertificateParsingException e) {
            collection = null;
        }
        if (collection != null) {
            for (List next : collection) {
                if (((Integer) next.get(0)).intValue() == i) {
                    linkedList.add((String) next.get(1));
                }
            }
        }
        if (linkedList.isEmpty()) {
            return null;
        }
        String[] strArr = new String[linkedList.size()];
        linkedList.toArray(strArr);
        return strArr;
    }

    private static boolean isIPAddress(String str) {
        return str != null && (InetAddressUtils.isIPv4Address(str) || InetAddressUtils.isIPv6Address(str));
    }

    private String normaliseIPv6Address(String str) {
        if (str == null || !InetAddressUtils.isIPv6Address(str)) {
            return str;
        }
        try {
            return InetAddress.getByName(str).getHostAddress();
        } catch (UnknownHostException e) {
            this.log.error("Unexpected error converting " + str, e);
            return str;
        }
    }

    /* access modifiers changed from: package-private */
    public boolean validCountryWildcard(String str) {
        String[] split = str.split("\\.");
        return (split.length == 3 && split[2].length() == 2 && Arrays.binarySearch(BAD_COUNTRY_2LDS, split[1]) >= 0) ? false : true;
    }

    public final void verify(String str, X509Certificate x509Certificate) throws SSLException {
        verify(str, getCNs(x509Certificate), getSubjectAlts(x509Certificate, str));
    }

    public final void verify(String str, SSLSocket sSLSocket) throws IOException {
        if (str == null) {
            throw new NullPointerException("host to verify is null");
        }
        SSLSession session = sSLSocket.getSession();
        if (session == null) {
            sSLSocket.getInputStream().available();
            session = sSLSocket.getSession();
            if (session == null) {
                sSLSocket.startHandshake();
                session = sSLSocket.getSession();
            }
        }
        verify(str, (X509Certificate) session.getPeerCertificates()[0]);
    }

    public final void verify(String str, String[] strArr, String[] strArr2, boolean z) throws SSLException {
        LinkedList linkedList = new LinkedList();
        if (!(strArr == null || strArr.length <= 0 || strArr[0] == null)) {
            linkedList.add(strArr[0]);
        }
        if (strArr2 != null) {
            for (String str2 : strArr2) {
                if (str2 != null) {
                    linkedList.add(str2);
                }
            }
        }
        if (linkedList.isEmpty()) {
            throw new SSLException("Certificate for <" + str + "> doesn't contain CN or DNS subjectAlt");
        }
        StringBuilder sb = new StringBuilder();
        String normaliseIPv6Address = normaliseIPv6Address(str.trim().toLowerCase(Locale.US));
        Iterator it = linkedList.iterator();
        boolean z2 = false;
        while (it.hasNext()) {
            String lowerCase = ((String) it.next()).toLowerCase(Locale.US);
            sb.append(" <");
            sb.append(lowerCase);
            sb.append('>');
            if (it.hasNext()) {
                sb.append(" OR");
            }
            String[] split = lowerCase.split("\\.");
            if (split.length >= 3 && split[0].endsWith("*") && validCountryWildcard(lowerCase) && !isIPAddress(str)) {
                String str3 = split[0];
                if (str3.length() > 1) {
                    String substring = str3.substring(0, str3.length() - 1);
                    z2 = normaliseIPv6Address.startsWith(substring) && normaliseIPv6Address.substring(substring.length()).endsWith(lowerCase.substring(str3.length()));
                } else {
                    z2 = normaliseIPv6Address.endsWith(lowerCase.substring(1));
                }
                if (z2 && z) {
                    if (countDots(normaliseIPv6Address) == countDots(lowerCase)) {
                        z2 = true;
                        continue;
                    } else {
                        z2 = false;
                        continue;
                    }
                }
            } else {
                z2 = normaliseIPv6Address.equals(normaliseIPv6Address(lowerCase));
                continue;
            }
            if (z2) {
                break;
            }
        }
        if (!z2) {
            throw new SSLException("hostname in certificate didn't match: <" + str + "> !=" + sb);
        }
    }

    public final boolean verify(String str, SSLSession sSLSession) {
        try {
            verify(str, (X509Certificate) sSLSession.getPeerCertificates()[0]);
            return true;
        } catch (SSLException e) {
            return false;
        }
    }
}
