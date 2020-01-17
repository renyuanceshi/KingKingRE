package org.linphone;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.NetworkInfo;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.util.SSIDUtil;
import com.pccw.pref.SSIDList;
import java.util.ArrayList;
import org.linphone.core.LinphoneCall;

public class NetworkManager extends BroadcastReceiver {
    public static String previousSSID = "";

    /* access modifiers changed from: private */
    public boolean canAutoLogin(Context context) {
        return isCorrespondingTNCRead(context);
    }

    public static boolean isCSLPostpaidTAndCRead(Context context) {
        if (context != null) {
            return ClientStateManager.isCSLPostpaidTCAccepted(context);
        }
        return false;
    }

    public static boolean isCSLPrepaidTAndCRead(Context context) {
        if (context != null) {
            return ClientStateManager.isCSLPrepaidTCAccepted(context);
        }
        return false;
    }

    public static boolean isCorrespondingTNCRead(Context context) {
        return (ClientStateManager.isNormalPrepaid(context) || ClientStateManager.isHelloPrepaid(context)) ? isHKTPrepaidTAndCRead(context) : ClientStateManager.isCSLPrepaid(context) ? isCSLPrepaidTAndCRead(context) : ClientStateManager.isCSLPostpaid(context) ? isCSLPostpaidTAndCRead(context) : isHKTPostpaidTAndCRead(context);
    }

    public static boolean isHKTPostpaidTAndCRead(Context context) {
        if (context != null) {
            return ClientStateManager.isHKTPostpaidTCAccepted(context);
        }
        return false;
    }

    public static boolean isHKTPrepaidTAndCRead(Context context) {
        if (context != null) {
            return ClientStateManager.isHKTPrepaidTCAccepted(context);
        }
        return false;
    }

    public void onReceive(final Context context, final Intent intent) {
        new Thread() {
            public void run() {
                LinphoneCall currentCall;
                boolean z;
                NetworkInfo networkInfo = (NetworkInfo) intent.getParcelableExtra("networkInfo");
                if (networkInfo.getType() == 1) {
                    if (networkInfo.getState().equals(NetworkInfo.State.CONNECTED)) {
                        ArrayList<String> list = SSIDList.getList(context);
                        String currentSSID = SSIDUtil.getCurrentSSID(context);
                        if (NetworkManager.previousSSID.equals("") || !NetworkManager.previousSSID.equals(currentSSID)) {
                            NetworkManager.previousSSID = currentSSID;
                            z = true;
                        } else {
                            NetworkManager.previousSSID = currentSSID;
                            z = false;
                        }
                        if (z && list.contains(currentSSID) && NetworkManager.this.canAutoLogin(context) && !MobileSipService.getInstance().isReLoginRunning() && !MobileSipService.getInstance().isLoginRunning() && MobileSipService.getInstance().loginStatus == -100) {
                            DailPadActivity.on(context, true);
                            MobileSipService.getInstance().shouldAutologin = true;
                            MobileSipService.getInstance().startAutoLogin(context);
                        }
                    } else if (networkInfo.getState().equals(NetworkInfo.State.DISCONNECTED)) {
                        NetworkManager.previousSSID = "";
                    }
                }
                if (MobileSipService.getInstance().isAutoStart(context) && networkInfo.getType() == 1) {
                    if (Boolean.valueOf(intent.getBooleanExtra("noConnectivity", false)).booleanValue() || networkInfo.getState() == NetworkInfo.State.DISCONNECTED) {
                        if (LinphoneService.isready()) {
                            LinphoneService.instance().getLinphoneCore().setNetworkReachable(false);
                            if (LinphoneService.getLc().isIncall() && (currentCall = LinphoneService.getLc().getCurrentCall()) != null) {
                                LinphoneService.getLc().terminateCall(currentCall);
                            }
                        }
                        if (MobileSipService.getInstance().shouldRelogin) {
                            MobileSipService.getInstance().startReLogin(context);
                        } else if (MobileSipService.getInstance().shouldAutologin) {
                            MobileSipService.getInstance().startAutoLogin(context);
                        } else {
                            MobileSipService.getInstance().close(context);
                        }
                    } else {
                        if (networkInfo.getState() != NetworkInfo.State.CONNECTED || !MobileSipService.getInstance().isRoaming(context)) {
                        }
                    }
                }
            }
        }.start();
    }
}
