package de.timroes.axmlrpc;

import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class CookieManager {
    private static final String COOKIE = "Cookie";
    private static final String SET_COOKIE = "Set-Cookie";
    private Map<String, String> cookies = new HashMap();
    private int flags;

    public CookieManager(int i) {
        this.flags = i;
    }

    public void clearCookies() {
        this.cookies.clear();
    }

    public void readCookies(HttpURLConnection httpURLConnection) {
        if ((this.flags & 4) != 0) {
            for (int i = 0; i < httpURLConnection.getHeaderFields().size(); i++) {
                String headerFieldKey = httpURLConnection.getHeaderFieldKey(i);
                if (headerFieldKey != null && "Set-Cookie".toLowerCase().equals(headerFieldKey.toLowerCase())) {
                    String[] split = httpURLConnection.getHeaderField(i).split(";")[0].split("=");
                    if (split.length >= 2) {
                        this.cookies.put(split[0], split[1]);
                    }
                }
            }
        }
    }

    public void setCookies(HttpURLConnection httpURLConnection) {
        if ((this.flags & 4) != 0) {
            String str = "";
            Iterator<Map.Entry<String, String>> it = this.cookies.entrySet().iterator();
            while (true) {
                String str2 = str;
                if (it.hasNext()) {
                    Map.Entry next = it.next();
                    str = str2 + ((String) next.getKey()) + "=" + ((String) next.getValue()) + "; ";
                } else {
                    httpURLConnection.setRequestProperty("Cookie", str2);
                    return;
                }
            }
        }
    }
}
