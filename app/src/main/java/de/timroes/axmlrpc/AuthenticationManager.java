package de.timroes.axmlrpc;

import de.timroes.base64.Base64;
import java.net.HttpURLConnection;

public class AuthenticationManager {
    private String pass;
    private String user;

    public void setAuthData(String str, String str2) {
        this.user = str;
        this.pass = str2;
    }

    public void setAuthentication(HttpURLConnection httpURLConnection) {
        if (this.user != null && this.pass != null && this.user.length() > 0 && this.pass.length() > 0) {
            httpURLConnection.addRequestProperty("Authorization", "Basic " + Base64.encode(this.user + ":" + this.pass));
        }
    }
}
