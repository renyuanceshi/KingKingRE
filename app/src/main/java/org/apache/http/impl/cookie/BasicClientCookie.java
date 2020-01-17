package org.apache.http.impl.cookie;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.cookie.SetCookie;
import org.apache.http.util.Args;

@NotThreadSafe
public class BasicClientCookie implements SetCookie, ClientCookie, Cloneable, Serializable {
    private static final long serialVersionUID = -3869795591041535538L;
    private Map<String, String> attribs = new HashMap();
    private String cookieComment;
    private String cookieDomain;
    private Date cookieExpiryDate;
    private String cookiePath;
    private int cookieVersion;
    private boolean isSecure;
    private final String name;
    private String value;

    public BasicClientCookie(String str, String str2) {
        Args.notNull(str, "Name");
        this.name = str;
        this.value = str2;
    }

    public Object clone() throws CloneNotSupportedException {
        BasicClientCookie basicClientCookie = (BasicClientCookie) super.clone();
        basicClientCookie.attribs = new HashMap(this.attribs);
        return basicClientCookie;
    }

    public boolean containsAttribute(String str) {
        return this.attribs.get(str) != null;
    }

    public String getAttribute(String str) {
        return this.attribs.get(str);
    }

    public String getComment() {
        return this.cookieComment;
    }

    public String getCommentURL() {
        return null;
    }

    public String getDomain() {
        return this.cookieDomain;
    }

    public Date getExpiryDate() {
        return this.cookieExpiryDate;
    }

    public String getName() {
        return this.name;
    }

    public String getPath() {
        return this.cookiePath;
    }

    public int[] getPorts() {
        return null;
    }

    public String getValue() {
        return this.value;
    }

    public int getVersion() {
        return this.cookieVersion;
    }

    public boolean isExpired(Date date) {
        Args.notNull(date, "Date");
        return this.cookieExpiryDate != null && this.cookieExpiryDate.getTime() <= date.getTime();
    }

    public boolean isPersistent() {
        return this.cookieExpiryDate != null;
    }

    public boolean isSecure() {
        return this.isSecure;
    }

    public void setAttribute(String str, String str2) {
        this.attribs.put(str, str2);
    }

    public void setComment(String str) {
        this.cookieComment = str;
    }

    public void setDomain(String str) {
        if (str != null) {
            this.cookieDomain = str.toLowerCase(Locale.ENGLISH);
        } else {
            this.cookieDomain = null;
        }
    }

    public void setExpiryDate(Date date) {
        this.cookieExpiryDate = date;
    }

    public void setPath(String str) {
        this.cookiePath = str;
    }

    public void setSecure(boolean z) {
        this.isSecure = z;
    }

    public void setValue(String str) {
        this.value = str;
    }

    public void setVersion(int i) {
        this.cookieVersion = i;
    }

    public String toString() {
        return "[version: " + Integer.toString(this.cookieVersion) + "]" + "[name: " + this.name + "]" + "[value: " + this.value + "]" + "[domain: " + this.cookieDomain + "]" + "[path: " + this.cookiePath + "]" + "[expiry: " + this.cookieExpiryDate + "]";
    }
}
