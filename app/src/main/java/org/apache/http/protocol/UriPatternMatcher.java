package org.apache.http.protocol;

import java.util.HashMap;
import java.util.Map;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.util.Args;

@ThreadSafe
public class UriPatternMatcher<T> {
    @GuardedBy("this")
    private final Map<String, T> map = new HashMap();

    @Deprecated
    public Map<String, T> getObjects() {
        Map<String, T> map2;
        synchronized (this) {
            map2 = this.map;
        }
        return map2;
    }

    public T lookup(String str) {
        T t;
        synchronized (this) {
            Args.notNull(str, "Request path");
            t = this.map.get(str);
            if (t == null) {
                String str2 = null;
                for (String next : this.map.keySet()) {
                    if (matchUriRequestPattern(next, str) && (str2 == null || str2.length() < next.length() || (str2.length() == next.length() && next.endsWith("*")))) {
                        t = this.map.get(next);
                        str2 = next;
                    }
                }
            }
        }
        return t;
    }

    /* access modifiers changed from: protected */
    public boolean matchUriRequestPattern(String str, String str2) {
        if (str.equals("*")) {
            return true;
        }
        if (!str.endsWith("*") || !str2.startsWith(str.substring(0, str.length() - 1))) {
            return str.startsWith("*") && str2.endsWith(str.substring(1, str.length()));
        }
        return true;
    }

    public void register(String str, T t) {
        synchronized (this) {
            Args.notNull(str, "URI request pattern");
            this.map.put(str, t);
        }
    }

    @Deprecated
    public void setHandlers(Map<String, T> map2) {
        synchronized (this) {
            Args.notNull(map2, "Map of handlers");
            this.map.clear();
            this.map.putAll(map2);
        }
    }

    @Deprecated
    public void setObjects(Map<String, T> map2) {
        synchronized (this) {
            Args.notNull(map2, "Map of handlers");
            this.map.clear();
            this.map.putAll(map2);
        }
    }

    public String toString() {
        return this.map.toString();
    }

    public void unregister(String str) {
        synchronized (this) {
            if (str != null) {
                this.map.remove(str);
            }
        }
    }
}
