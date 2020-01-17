package org.linphone;

import org.linphone.core.AndroidCameraRecordManager;
import org.linphone.core.LinphoneAddress;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCallParams;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreException;
import org.linphone.core.Log;

public class CallManager {
    private static CallManager instance;
    private static boolean shouldaddvideo = false;

    private CallManager() {
    }

    private BandwidthManager bm() {
        return BandwidthManager.getInstance();
    }

    public static final CallManager getInstance() {
        CallManager callManager;
        synchronized (CallManager.class) {
            try {
                if (instance == null) {
                    instance = new CallManager();
                }
                callManager = instance;
            } catch (Throwable th) {
                Class<CallManager> cls = CallManager.class;
                throw th;
            }
        }
        return callManager;
    }

    private LinphoneCore lc() {
        return LinphoneService.instance().getLinphoneCore();
    }

    private AndroidCameraRecordManager videoManager() {
        return AndroidCameraRecordManager.getInstance();
    }

    public boolean addVideo() {
        LinphoneCall currentCall = lc().getCurrentCall();
        enableCamera(currentCall, true);
        currentCall.getCurrentParamsCopy().setVideoEnabled(true);
        LinphoneService.getLc().enableVideo(true, true);
        return reinviteWithVideo();
    }

    public void enableCamera(LinphoneCall linphoneCall, boolean z) {
        if (linphoneCall != null) {
            linphoneCall.enableCamera(z);
        }
    }

    public void inviteAddress(LinphoneAddress linphoneAddress, boolean z) throws LinphoneCoreException {
        LinphoneCore lc = lc();
        LinphoneCallParams createCallParams = lc.createCallParams((LinphoneCall) null);
        bm().updateWithProfileSettings(lc, createCallParams);
        if (!z || !createCallParams.getVideoEnabled()) {
            createCallParams.setVideoEnabled(false);
        } else {
            videoManager().setMuted(false);
            createCallParams.setVideoEnabled(true);
        }
        lc.inviteAddressWithParams(linphoneAddress, createCallParams);
        if (z) {
            shouldaddvideo = true;
        } else {
            shouldaddvideo = false;
        }
    }

    /* access modifiers changed from: package-private */
    public void reinvite() {
        LinphoneCore lc = lc();
        LinphoneCall currentCall = lc.getCurrentCall();
        if (currentCall == null) {
            Log.e("Trying to reinvite while not in call: doing nothing");
            return;
        }
        LinphoneCallParams currentParamsCopy = currentCall.getCurrentParamsCopy();
        bm().updateWithProfileSettings(lc, currentParamsCopy);
        lc.updateCall(currentCall, currentParamsCopy);
    }

    /* access modifiers changed from: package-private */
    public boolean reinviteWithVideo() {
        LinphoneCore lc = lc();
        LinphoneCall currentCall = lc.getCurrentCall();
        if (currentCall == null) {
            Log.e("Trying to reinviteWithVideo while not in call: doing nothing");
            return false;
        }
        LinphoneCallParams currentParamsCopy = currentCall.getCurrentParamsCopy();
        if (currentParamsCopy.getVideoEnabled()) {
            return false;
        }
        bm().updateWithProfileSettings(lc, currentParamsCopy);
        if (!currentParamsCopy.getVideoEnabled()) {
            return false;
        }
        lc.updateCall(currentCall, currentParamsCopy);
        return true;
    }

    /* access modifiers changed from: package-private */
    public void updateCall() {
        LinphoneCore lc = lc();
        LinphoneCall currentCall = lc.getCurrentCall();
        if (currentCall == null) {
            Log.e("Trying to updateCall while not in call: doing nothing");
            return;
        }
        bm().updateWithProfileSettings(lc, currentCall.getCurrentParamsCopy());
        lc.updateCall(currentCall, (LinphoneCallParams) null);
    }
}
