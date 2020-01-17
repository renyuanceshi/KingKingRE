package org.linphone;

import android.content.Context;
import android.media.MediaPlayer;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import org.linphone.core.LinphoneAddress;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneChatMessage;
import org.linphone.core.LinphoneCore;

public interface LinphoneSimpleListener {

    public interface ConnectivityChangedListener extends LinphoneSimpleListener {
        void onConnectivityChanged(Context context, NetworkInfo networkInfo, ConnectivityManager connectivityManager);
    }

    public interface LinphoneOnAudioChangedListener extends LinphoneSimpleListener {

        public enum AudioState {
            EARPIECE,
            SPEAKER,
            BLUETOOTH
        }

        void onAudioStateChanged(AudioState audioState);
    }

    public interface LinphoneOnCallEncryptionChangedListener extends LinphoneSimpleListener {
        void onCallEncryptionChanged(LinphoneCall linphoneCall, boolean z, String str);
    }

    public interface LinphoneOnCallStateChangedListener extends LinphoneSimpleListener {
        void onCallStateChanged(LinphoneCall linphoneCall, LinphoneCall.State state, String str);
    }

    public interface LinphoneOnDTMFReceivedListener extends LinphoneSimpleListener {
        void onDTMFReceived(LinphoneCall linphoneCall, int i);
    }

    public interface LinphoneOnGlobalStateChangedListener extends LinphoneSimpleListener {
        void onGlobalStateChanged(LinphoneCore.GlobalState globalState, String str);
    }

    public interface LinphoneOnMessageReceivedListener extends LinphoneSimpleListener {
        void onMessageReceived(LinphoneAddress linphoneAddress, LinphoneChatMessage linphoneChatMessage, int i);
    }

    public interface LinphoneOnRegistrationStateChangedListener extends LinphoneSimpleListener {
        void onRegistrationStateChanged(LinphoneCore.RegistrationState registrationState);
    }

    public interface LinphoneServiceListener extends LinphoneOnGlobalStateChangedListener, LinphoneOnCallStateChangedListener, LinphoneOnCallEncryptionChangedListener {
        void onDisplayStatus(String str);

        void onRegistrationStateChanged(LinphoneCore.RegistrationState registrationState, String str);

        void onRingerPlayerCreated(MediaPlayer mediaPlayer);

        void tryingNewOutgoingCallButAlreadyInCall();

        void tryingNewOutgoingCallButCannotGetCallParameters();

        void tryingNewOutgoingCallButWrongDestinationAddress();
    }
}
