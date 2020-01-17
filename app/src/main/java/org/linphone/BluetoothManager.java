package org.linphone;

import android.annotation.TargetApi;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCore;

@TargetApi(11)
public class BluetoothManager extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        LinphoneCore lc;
        String action = intent.getAction();
        LinphoneService instanceOrNull = LinphoneService.instanceOrNull();
        if ("android.bluetooth.device.action.ACL_DISCONNECTED".equals(action)) {
            if (instanceOrNull != null) {
                instanceOrNull.scoDisconnected();
                instanceOrNull.routeAudioToReceiver();
            }
        } else if ("android.bluetooth.device.action.ACL_CONNECTED".equals(action)) {
            if (instanceOrNull != null) {
                instanceOrNull.scoConnected();
            }
        } else if ("android.media.SCO_AUDIO_STATE_CHANGED".equals(action)) {
            int intExtra = intent.getIntExtra("android.media.extra.SCO_AUDIO_STATE", 0);
            if (intExtra == 1) {
                if (instanceOrNull != null) {
                }
                return;
            }
            if (!(intExtra == 0 && instanceOrNull == null)) {
            }
        } else if ("android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED".equals(action)) {
            int intExtra2 = intent.getIntExtra("android.bluetooth.adapter.extra.CONNECTION_STATE", 0);
            if (instanceOrNull != null && intExtra2 == 2) {
                instanceOrNull.startBluetooth();
                if (InCallScreen.getDialer() != null) {
                    InCallScreen.getDialer().refreshAudioRouteActions(false);
                }
                if (VideoCallActivity.getVideoCallScreen() != null) {
                    VideoCallActivity.getVideoCallScreen().refreshAudioRouteActions(false);
                }
            }
        } else if ("android.bluetooth.headset.profile.action.AUDIO_STATE_CHANGED".equals(action)) {
            int intExtra3 = intent.getIntExtra("android.bluetooth.profile.extra.STATE", 0);
            if (intent.getIntExtra("android.bluetooth.profile.extra.PREVIOUS_STATE", 0) == 12 && intExtra3 == 10 && (lc = LinphoneService.getLc()) != null && lc.getCurrentCall() != null && lc.getCurrentCall().getState() == LinphoneCall.State.StreamsRunning) {
                instanceOrNull.fixBluetoothMediaButton();
            }
        }
    }
}
