package com.pccw.mobile.util;

import android.content.Context;
import com.pccw.pref.EchoServerPref;
import java.util.ArrayList;
import java.util.Collections;

public class SetEchoServerHost {
    public static void setEchoServerHost(Context context) {
        String str;
        String str2;
        EchoServerPref echoServerPref = new EchoServerPref(context);
        String echoServer = echoServerPref.getEchoServer();
        if (echoServer.equalsIgnoreCase("NA") || echoServer.equals("")) {
            echoServer = echoServerPref.getEchoServerTest();
            if (echoServer.equalsIgnoreCase("NA") || echoServer.equals("")) {
                echoServerPref.setEchoServerHost1("NA");
                echoServerPref.setEchoServerHost2("NA");
                return;
            }
        }
        if (echoServer.contains(";")) {
            String[] split = echoServer.split(";");
            ArrayList arrayList = new ArrayList();
            arrayList.add(split[0].trim());
            arrayList.add(split[1].trim());
            Collections.shuffle(arrayList);
            str2 = (String) arrayList.get(1);
            str = (String) arrayList.get(0);
        } else {
            str = echoServer;
            str2 = echoServer;
        }
        echoServerPref.setEchoServerHost1(str);
        echoServerPref.setEchoServerHost2(str2);
    }
}
