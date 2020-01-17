package com.pccw.pref;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import com.pccw.mobile.sip.Constants;

public class EchoServerPref {
    Context ctx;
    SharedPreferences sp;

    public EchoServerPref(Context context) {
        this.ctx = context;
        this.sp = PreferenceManager.getDefaultSharedPreferences(context);
    }

    public String getEchoServer() {
        return this.sp.getString(Constants.echoServerHost, "NA");
    }

    public String getEchoServerHost1() {
        return this.sp.getString(Constants.echoServerHost1, "NA");
    }

    public String getEchoServerHost2() {
        return this.sp.getString(Constants.echoServerHost2, "NA");
    }

    public String getEchoServerTest() {
        return this.sp.getString(Constants.echoServerHostTest, "NA");
    }

    public String getValidEchoServerHost() {
        return this.sp.getString(Constants.validEchoServerHost, "NA");
    }

    public void setEchoServer(String str) {
        SharedPreferences.Editor edit = this.sp.edit();
        edit.putString(Constants.echoServerHost, str);
        edit.commit();
    }

    public void setEchoServerHost1(String str) {
        SharedPreferences.Editor edit = this.sp.edit();
        edit.putString(Constants.echoServerHost1, str);
        edit.commit();
    }

    public void setEchoServerHost2(String str) {
        SharedPreferences.Editor edit = this.sp.edit();
        edit.putString(Constants.echoServerHost2, str);
        edit.commit();
    }

    public void setEchoServerTest(String str) {
        SharedPreferences.Editor edit = this.sp.edit();
        edit.putString(Constants.echoServerHostTest, str);
        edit.commit();
    }

    public void setValidEchoServerHost(String str) {
        SharedPreferences.Editor edit = this.sp.edit();
        edit.putString(Constants.validEchoServerHost, str);
        edit.commit();
    }
}
