package org.linphone;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.media.AudioManager;
import android.os.Build;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.Message;
import android.os.PowerManager;
import android.provider.Settings;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ToggleButton;
import com.pccw.android.common.widget.SlidingTab;
import com.pccw.mobile.sip.AddCallActivity;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.Contact;
import com.pccw.mobile.sip.util.ContactsUtils;
import com.pccw.mobile.sip02.R;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import org.apache.commons.lang.time.DateUtils;
import org.linphone.core.Hacks;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCallParams;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreException;
import org.linphone.core.LinphoneProxyConfig;
import org.linphone.core.Reason;

public class InCallScreen extends CallScreen implements View.OnClickListener, SensorEventListener {
    static final int ADD_CALL_ACTIVITY = 101;
    static final float PROXIMITY_THRESHOLD = 5.0f;
    static int VIDEO_VIEW_ACTIVITY = 100;
    static String incomingCallerLabel = null;
    static String incomingCallerName = null;
    static String incomingCallerNumber = null;
    static Drawable incomingCallerPhoto = null;
    private static final HashMap<Integer, Character> mDisplayMap = new HashMap<>();
    private static final HashMap<Character, Integer> mToneMap = new HashMap<>();
    private static boolean preventVolumeBarToDisplay = false;
    private static final int promptAcceptVideoId = 0;
    private static final int promptInviteVideoId = 1;
    public static boolean started;
    private static InCallScreen theDialer;
    static PowerManager.WakeLock wl;
    final int CONFERENCE_CALL_WAITING_TIME = 20000;
    final String DIALOG_INCOMING = "dialog_incoming";
    final int MSG_ANSWER = 1;
    final int MSG_ANSWER_SPEAKER = 2;
    final int MSG_BACK = 3;
    final int MSG_QUALITY_INDICATOR_UPDATE = 6;
    final int MSG_QUIT = 5;
    final int MSG_TICK = 4;
    final int MSG_UPDATE_CALL_CARD = 7;
    final int QUALITY_INDICATOR_INITIAL_DELAY = 1000;
    final int QUALITY_INDICATOR_REFRESH_TIME = 1000;
    final int SCREEN_OFF_TIMEOUT = 12000;
    /* access modifiers changed from: private */
    public ToggleButton audioRoute;
    private ImageButton clearCallButton;
    private String conferenceCallReferTo = Constants.CONFERENCE_ROOM_CALLER_ID;
    private ToggleButton dialButton;
    boolean first;
    CallCardHold holdCallCard;
    /* access modifiers changed from: private */
    public LinearLayout inCallButtons;
    View inCallDtmfView;
    private boolean isInConferenceCall = false;
    private boolean isPausing = false;
    /* access modifiers changed from: private */
    public boolean isWaitingConferenceCall = false;
    /* access modifiers changed from: private */
    public LinphoneCore lLinphoneCore;
    /* access modifiers changed from: private */
    public AudioManager mAudioManager;
    CallCard mCallCard;
    Context mContext = this;
    EditText mDigits;
    Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            switch (message.what) {
                case 3:
                    InCallScreen.this.moveBack();
                    return;
                case 5:
                    InCallScreen.this.finish();
                    return;
                case 6:
                    InCallScreen.this.updateQualityIndicator(Float.parseFloat((String) message.obj));
                    return;
                case 7:
                    InCallScreen.this.setupCallCard();
                    return;
                default:
                    return;
            }
        }
    };
    ViewGroup mInCallPanel;
    /* access modifiers changed from: private */
    public SlidingTab mIncomingCallWidget;
    ViewGroup mMainFrame;
    private ToggleButton mergeAddButton;
    private ToggleButton muteButton;
    int oldtimeout;
    private List<LinphoneCall> pausingCalls = null;
    PowerManager pm;
    private boolean promptRemoteCancelVideoToast = false;
    Sensor proximitySensor;
    Timer qualityIndiTimer;
    private ImageView routeBluetooth;
    private ImageView routeReceiver;
    private ImageView routeSpeaker;
    boolean running;
    SensorManager sensorManager;
    boolean shouldUpdateQualityIndicator = false;
    /* access modifiers changed from: private */
    public ToggleButton speakerButton;
    /* access modifiers changed from: private */
    public ToggleButton startVideoButton;
    private View swapCallButton;
    Thread t;
    /* access modifiers changed from: private */
    public CountDownTimer timer;
    Timer waitingConferenceCallTimer;

    public static class IncomingCallDialogFragment extends DialogFragment {
        Button answerButton;
        Button answerEndButton;
        TextView callerLabelTextView;
        TextView callerNameTextView;
        TextView callerNumberTextView;
        public ImageView callerPhoto;
        ImageButton rejectButton;

        public static IncomingCallDialogFragment newInstance() {
            IncomingCallDialogFragment incomingCallDialogFragment = new IncomingCallDialogFragment();
            incomingCallDialogFragment.setArguments(new Bundle());
            return incomingCallDialogFragment;
        }

        public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
            View inflate = layoutInflater.inflate(R.layout.incoming_call_dialog, viewGroup, false);
            this.callerNameTextView = (TextView) inflate.findViewById(R.id.incoming_caller_name);
            this.callerLabelTextView = (TextView) inflate.findViewById(R.id.incoming_label);
            this.callerNumberTextView = (TextView) inflate.findViewById(R.id.incoming_phone_number);
            this.callerPhoto = (ImageView) inflate.findViewById(R.id.incoming_caller_profile_pic);
            getDialog().requestWindowFeature(1);
            setCancelable(false);
            if (InCallScreen.incomingCallerName == null || InCallScreen.incomingCallerName.isEmpty()) {
                this.callerNameTextView.setText(R.string.unknown);
            } else {
                this.callerNameTextView.setText(InCallScreen.incomingCallerName);
            }
            if (CallerInfo.UNKNOWN_NUMBER.equals(InCallScreen.incomingCallerNumber)) {
                this.callerNumberTextView.setText(R.string.unknown);
            } else if (CallerInfo.PRIVATE_NUMBER.equals(InCallScreen.incomingCallerNumber)) {
                this.callerNumberTextView.setText(R.string.unknown);
            } else if (InCallScreen.incomingCallerNumber == null || InCallScreen.incomingCallerNumber.isEmpty()) {
                this.callerNumberTextView.setText(R.string.unknown);
            } else {
                String shouldRestoreMapPhoneNumber = MobileSipService.getInstance().shouldRestoreMapPhoneNumber(InCallScreen.incomingCallerNumber);
                TextView textView = this.callerNumberTextView;
                if (shouldRestoreMapPhoneNumber == null) {
                    shouldRestoreMapPhoneNumber = InCallScreen.incomingCallerNumber;
                }
                textView.setText(shouldRestoreMapPhoneNumber);
            }
            if (InCallScreen.incomingCallerLabel == null || InCallScreen.incomingCallerLabel.isEmpty()) {
                this.callerLabelTextView.setText("");
            } else {
                this.callerLabelTextView.setText(InCallScreen.incomingCallerLabel);
                this.callerLabelTextView.setVisibility(0);
            }
            if (InCallScreen.incomingCallerPhoto != null) {
                this.callerPhoto.setImageDrawable(InCallScreen.incomingCallerPhoto);
            } else {
                this.callerPhoto.setImageResource(R.drawable.default_profile_pic);
            }
            this.answerButton = (Button) inflate.findViewById(R.id.incoming_answer_button);
            this.answerButton.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    ((InCallScreen) IncomingCallDialogFragment.this.getActivity()).answer();
                    IncomingCallDialogFragment.this.getDialog().dismiss();
                }
            });
            this.answerEndButton = (Button) inflate.findViewById(R.id.incoming_answer_end_button);
            this.answerEndButton.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    ((InCallScreen) IncomingCallDialogFragment.this.getActivity()).answerAndEndCall();
                    IncomingCallDialogFragment.this.getDialog().dismiss();
                }
            });
            this.rejectButton = (ImageButton) inflate.findViewById(R.id.incoming_reject_button);
            this.rejectButton.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    ((InCallScreen) IncomingCallDialogFragment.this.getActivity()).reject();
                    IncomingCallDialogFragment.this.getDialog().dismiss();
                }
            });
            return inflate;
        }
    }

    /* access modifiers changed from: private */
    public void acceptCallUpdate(boolean z, int i) {
        removeDialog(i);
        if (this.timer != null) {
            this.timer.cancel();
        }
        LinphoneCall currentCall = LinphoneService.getLc().getCurrentCall();
        if (currentCall != null) {
            LinphoneCallParams currentParamsCopy = currentCall.getCurrentParamsCopy();
            if (z) {
                currentParamsCopy.setVideoEnabled(true);
                LinphoneService.getLc().enableVideo(true, true);
            }
            try {
                LinphoneService.getLc().acceptCallUpdate(currentCall, currentParamsCopy);
            } catch (LinphoneCoreException e) {
                e.printStackTrace();
            }
        }
    }

    private void closeIncomingDialog() {
        Fragment findFragmentByTag = getSupportFragmentManager().findFragmentByTag("dialog_incoming");
        if (findFragmentByTag != null && (findFragmentByTag instanceof IncomingCallDialogFragment)) {
            ((IncomingCallDialogFragment) findFragmentByTag).dismissAllowingStateLoss();
        }
    }

    private void configureMuteButtons() {
        this.muteButton.setChecked(LinphoneService.instance().getLinphoneCore().isMicMuted());
    }

    private void configureQualityIndicator(final LinphoneCall linphoneCall) {
        this.qualityIndiTimer.scheduleAtFixedRate(new TimerTask() {
            public void run() {
                if (!InCallScreen.this.shouldUpdateQualityIndicator) {
                    return;
                }
                if (linphoneCall == null || !(LinphoneCall.State.Connected == linphoneCall.getState() || LinphoneCall.State.StreamsRunning == linphoneCall.getState())) {
                    cancel();
                    return;
                }
                Message message = new Message();
                message.what = 6;
                message.obj = Float.toString(linphoneCall.getCurrentQuality());
                InCallScreen.this.mHandler.sendMessage(message);
            }
        }, 1000, 1000);
    }

    private void configureSpeakerButtons() {
        if ((Integer.parseInt(Build.VERSION.SDK) > 4 || this.mAudioManager.getRouting(0) != 2) && (Integer.parseInt(Build.VERSION.SDK) <= 4 || !this.mAudioManager.isSpeakerphoneOn())) {
            this.speakerButton.setChecked(false);
        } else {
            this.speakerButton.setChecked(true);
        }
    }

    private void enterIncalMode(LinphoneCore linphoneCore) {
        this.mAudioManager.setMode(Build.VERSION.SDK_INT >= 11 ? 3 : 2);
        LinphoneService.instance().startBluetoothSco();
        setVolumeControlStream(0);
        LinphoneActivity.instance().startProxymitySensor();
    }

    private void exitCallMode() {
        setVolumeControlStream(Integer.MIN_VALUE);
        this.speakerButton.setChecked(false);
        routeAudioToReceiver();
        LinphoneService.instance().stopBluetoothSco();
        this.mAudioManager.setMode(0);
        BandwidthManager.getInstance().setUserRestriction(false);
        LinphoneActivity.instance().stopProxymitySensor();
    }

    public static InCallScreen getDialer() {
        if (theDialer == null) {
            return null;
        }
        return theDialer;
    }

    private void handleIncomingCallWaiting(LinphoneCall linphoneCall) {
        if (this.isWaitingConferenceCall || this.isInConferenceCall) {
            this.lLinphoneCore.terminateCall(linphoneCall);
            return;
        }
        String phoneNumber = MobileSipService.getInstance().getPhoneNumber(linphoneCall);
        String displayNumber = MobileSipService.getInstance().getDisplayNumber(phoneNumber);
        String str = "";
        String str2 = "";
        Drawable drawable = null;
        Contact contact = KingKingLinphoneUtil.getInstance().getContact();
        if (contact == null) {
            contact = ContactsUtils.getInstance().queryByPhoneNumber(this, phoneNumber);
            KingKingLinphoneUtil.getInstance().setContact(contact);
        }
        if (contact != null) {
            str = contact.displayName;
            str2 = contact.label;
            drawable = contact.photo;
        }
        incomingCallerName = str;
        incomingCallerLabel = str2;
        incomingCallerNumber = displayNumber;
        incomingCallerPhoto = drawable;
        showIncomingDialog();
    }

    private void inviteConferenceCall() {
        this.isWaitingConferenceCall = true;
        try {
            this.lLinphoneCore.invite(Constants.CONFERENCE_ROOM_CALLER_ID);
        } catch (LinphoneCoreException e) {
            Log.e("PCCW_MOBILE_SIP", "invite conference call exception=" + e.toString());
            this.isWaitingConferenceCall = false;
        }
    }

    /* access modifiers changed from: private */
    public void inviteVideo() {
        LinphoneCall currentCall = this.lLinphoneCore.getCurrentCall();
        if (currentCall == null) {
            return;
        }
        if (!currentCall.cameraEnabled() && currentCall.getCurrentParamsCopy().getVideoEnabled()) {
            startVideoView(100);
        } else if (!CallManager.getInstance().addVideo()) {
            startVideoView(100);
        } else {
            this.promptRemoteCancelVideoToast = true;
        }
    }

    private void pauseOrResumeOrSwapCall() {
        if (!this.isPausing) {
            this.isPausing = true;
            if (this.lLinphoneCore.getCallsNb() != 0) {
                if (this.lLinphoneCore.getCallsNb() == 1) {
                    pauseOrResumeCall(this.lLinphoneCore.getCalls()[0]);
                } else {
                    swapPausedCall();
                }
                this.isPausing = false;
            }
        }
    }

    private void refreshMergeAddButton() {
        List<LinphoneCall> callsInState = LinphoneUtils.getCallsInState(this.lLinphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.OutgoingEarlyMedia, LinphoneCall.State.OutgoingInit, LinphoneCall.State.OutgoingProgress, LinphoneCall.State.OutgoingRinging}));
        this.mergeAddButton.setChecked(false);
        if (ClientStateManager.isPrepaid(this.mContext)) {
            this.mergeAddButton.setEnabled(false);
            this.mergeAddButton.setTextColor(getResources().getColor(R.color.bg_white_semi));
            this.mergeAddButton.setCompoundDrawablesWithIntrinsicBounds(0, R.drawable.ic_add_call_disabled, 0, 0);
            this.mergeAddButton.setText(R.string.menu_add_call);
            this.mergeAddButton.setTextOn(getString(R.string.menu_add_call));
            this.mergeAddButton.setTextOff(getString(R.string.menu_add_call));
        } else if (this.isInConferenceCall || this.isWaitingConferenceCall) {
            this.mergeAddButton.setEnabled(false);
            this.mergeAddButton.setTextColor(getResources().getColor(R.color.bg_white_semi));
            this.mergeAddButton.setCompoundDrawablesWithIntrinsicBounds(0, R.drawable.ic_merge_call_disabled, 0, 0);
            this.mergeAddButton.setText(R.string.menu_merge_call);
            this.mergeAddButton.setTextOn(getString(R.string.menu_merge_call));
            this.mergeAddButton.setTextOff(getString(R.string.menu_merge_call));
        } else if (callsInState.size() > 0) {
            this.mergeAddButton.setEnabled(false);
            this.mergeAddButton.setTextColor(getResources().getColor(R.color.bg_white_semi));
            this.mergeAddButton.setCompoundDrawablesWithIntrinsicBounds(0, R.drawable.ic_add_call_disabled, 0, 0);
            this.mergeAddButton.setText(R.string.menu_add_call);
            this.mergeAddButton.setTextOn(getString(R.string.menu_add_call));
            this.mergeAddButton.setTextOff(getString(R.string.menu_add_call));
        } else if (this.lLinphoneCore.getCallsNb() <= 1) {
            this.mergeAddButton.setEnabled(true);
            this.mergeAddButton.setTextColor(getResources().getColor(R.color.bg_white));
            this.mergeAddButton.setCompoundDrawablesWithIntrinsicBounds(0, R.drawable.ic_add_call, 0, 0);
            this.mergeAddButton.setText(R.string.menu_add_call);
            this.mergeAddButton.setTextOn(getString(R.string.menu_add_call));
            this.mergeAddButton.setTextOff(getString(R.string.menu_add_call));
        } else {
            this.mergeAddButton.setEnabled(true);
            this.mergeAddButton.setTextColor(getResources().getColor(R.color.bg_white));
            this.mergeAddButton.setCompoundDrawablesWithIntrinsicBounds(0, R.drawable.ic_merge_call, 0, 0);
            this.mergeAddButton.setText(R.string.menu_merge_call);
            this.mergeAddButton.setTextOn(getString(R.string.menu_merge_call));
            this.mergeAddButton.setTextOff(getString(R.string.menu_merge_call));
        }
    }

    /* access modifiers changed from: private */
    public void routeAudioToBluetooth() {
        LinphoneService.instance().routeAudioToBluetooth();
    }

    /* access modifiers changed from: private */
    public void routeAudioToReceiver() {
        LinphoneService.instance().routeAudioToReceiver();
    }

    /* access modifiers changed from: private */
    public void routeAudioToSpeaker() {
        LinphoneService.instance().routeAudioToSpeaker();
    }

    /* access modifiers changed from: private */
    public void setupCallCard() {
        LinphoneCall linphoneCall;
        LinphoneCall linphoneCall2;
        LinphoneCall linphoneCall3;
        Drawable drawable = null;
        if (this.lLinphoneCore.getCallsNb() != 0) {
            LinphoneCall currentCall = this.lLinphoneCore.getCurrentCall();
            refreshMergeAddButton();
            List<LinphoneCall> callsInState = LinphoneUtils.getCallsInState(this.lLinphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.OutgoingEarlyMedia, LinphoneCall.State.OutgoingInit, LinphoneCall.State.OutgoingProgress, LinphoneCall.State.OutgoingRinging}));
            if (this.isWaitingConferenceCall || this.isInConferenceCall) {
                LinphoneCall[] calls = this.lLinphoneCore.getCalls();
                int length = calls.length;
                int i = 0;
                while (true) {
                    if (i >= length) {
                        linphoneCall2 = null;
                        linphoneCall = currentCall;
                        break;
                    }
                    LinphoneCall linphoneCall4 = calls[i];
                    if (MobileSipService.getInstance().getPhoneNumber(linphoneCall4).equals(CallerInfo.CONFERENCE_NUMBER)) {
                        linphoneCall2 = null;
                        linphoneCall = linphoneCall4;
                        break;
                    }
                    i++;
                }
            } else if (callsInState.size() > 0) {
                linphoneCall2 = null;
                linphoneCall = callsInState.get(0);
            } else {
                if (currentCall == null) {
                    List<LinphoneCall> callsInState2 = LinphoneUtils.getCallsInState(this.lLinphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.Resuming}));
                    linphoneCall3 = callsInState2.size() > 0 ? callsInState2.get(0) : this.lLinphoneCore.getCalls()[0];
                } else {
                    linphoneCall3 = currentCall;
                }
                if (this.lLinphoneCore.getCallsNb() > 1) {
                    Iterator<LinphoneCall> it = LinphoneUtils.getCallsInState(this.lLinphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.Paused, LinphoneCall.State.PausedByRemote, LinphoneCall.State.Pausing})).iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        LinphoneCall next = it.next();
                        if (next != linphoneCall3) {
                            linphoneCall2 = next;
                            linphoneCall = linphoneCall3;
                            break;
                        }
                    }
                }
                linphoneCall2 = null;
                linphoneCall = linphoneCall3;
            }
            if (linphoneCall2 == null) {
                if (linphoneCall != null) {
                    String phoneNumber = MobileSipService.getInstance().getPhoneNumber(linphoneCall);
                    Contact contact = KingKingLinphoneUtil.getInstance().getContact();
                    this.mCallCard.mPhoneNumber.setText(phoneNumber);
                    if (contact == null) {
                        contact = ContactsUtils.getInstance().queryByPhoneNumber(this, phoneNumber);
                        KingKingLinphoneUtil.getInstance().setContact(contact);
                    }
                    this.mCallCard.updateCallCardInfo(phoneNumber, contact == null ? null : contact.displayName, contact == null ? null : contact.label, contact == null ? null : contact.photo);
                    this.mCallCard.displayMainCallStatus(linphoneCall.getState(), linphoneCall.getDuration(), true);
                }
                this.mCallCard.displayMainCallLayout();
                this.swapCallButton.setVisibility(8);
                this.holdCallCard.displayMainCallLayout();
                return;
            }
            if (linphoneCall != null) {
                String phoneNumber2 = MobileSipService.getInstance().getPhoneNumber(linphoneCall);
                Contact contact2 = KingKingLinphoneUtil.getInstance().getContact();
                this.mCallCard.mPhoneNumberCallWaitingMain.setText(phoneNumber2);
                if (contact2 == null) {
                    contact2 = ContactsUtils.getInstance().queryByPhoneNumber(this, phoneNumber2);
                    KingKingLinphoneUtil.getInstance().setContact(contact2);
                }
                this.mCallCard.updateCallWaitingMainCallCardInfo(phoneNumber2, contact2 == null ? null : contact2.displayName, contact2 == null ? null : contact2.label, contact2 == null ? null : contact2.photo);
                this.mCallCard.displayMainCallStatus(linphoneCall.getState(), linphoneCall.getDuration(), false);
            }
            if (linphoneCall2 != null) {
                String phoneNumber3 = MobileSipService.getInstance().getPhoneNumber(linphoneCall2);
                Contact contact3 = KingKingLinphoneUtil.getInstance().getContact();
                this.holdCallCard.mPhoneNumberCallWaitingOnHold.setText(phoneNumber3);
                if (contact3 == null) {
                    contact3 = ContactsUtils.getInstance().queryByPhoneNumber(this, phoneNumber3);
                    KingKingLinphoneUtil.getInstance().setContact(contact3);
                }
                CallCardHold callCardHold = this.holdCallCard;
                String str = contact3 == null ? null : contact3.displayName;
                String str2 = contact3 == null ? null : contact3.label;
                if (contact3 != null) {
                    drawable = contact3.photo;
                }
                callCardHold.updateCallWaitingOnHoldCallCardInfo(phoneNumber3, str, str2, drawable);
                this.holdCallCard.displayCallWaitingHoldCallStatus(linphoneCall2.getState(), linphoneCall2.getDuration());
            }
            this.mCallCard.displayCallWaitingLayout();
            this.swapCallButton.setVisibility(0);
            this.holdCallCard.displayCallWaitingLayout();
        }
    }

    private void showIncomingDialog() {
        FragmentTransaction beginTransaction = getSupportFragmentManager().beginTransaction();
        Fragment findFragmentByTag = getSupportFragmentManager().findFragmentByTag("dialog_incoming");
        if (findFragmentByTag != null && (findFragmentByTag instanceof IncomingCallDialogFragment)) {
            ((IncomingCallDialogFragment) findFragmentByTag).dismissAllowingStateLoss();
        }
        if (incomingCallerName != null && incomingCallerNumber != null) {
            IncomingCallDialogFragment.newInstance().show(beginTransaction, "dialog_incoming");
        }
    }

    private void startConferenceCall(LinphoneCall linphoneCall) {
        this.pausingCalls = new ArrayList();
        this.isInConferenceCall = true;
        this.conferenceCallReferTo = Constants.CONFERENCE_ROOM_CALLER_ID;
        if (linphoneCall.getRemoteContact() != null && linphoneCall.getRemoteContact().contains(Constants.CONFERENCE_ROOM_CALLER_PREFIX)) {
            this.conferenceCallReferTo = linphoneCall.getRemoteContact();
        }
        for (LinphoneCall linphoneCall2 : this.lLinphoneCore.getCalls()) {
            if (!(linphoneCall2 == null || linphoneCall2 == linphoneCall)) {
                if (LinphoneCall.State.Pausing == linphoneCall2.getState()) {
                    this.pausingCalls.add(linphoneCall2);
                } else {
                    this.lLinphoneCore.transferCall(linphoneCall2, this.conferenceCallReferTo);
                }
            }
        }
        this.startVideoButton.setEnabled(false);
        this.startVideoButton.setClickable(false);
        this.waitingConferenceCallTimer = new Timer();
        this.waitingConferenceCallTimer.schedule(new TimerTask() {
            public void run() {
                if (InCallScreen.this.isWaitingConferenceCall) {
                    try {
                        InCallScreen.this.lLinphoneCore.terminateAllCalls();
                    } catch (Exception e) {
                        InCallScreen.this.finish();
                    }
                }
            }
        }, 20000);
    }

    private void startVideoView(int i) {
        this.mHandler.postDelayed(new Runnable() {
            public void run() {
                if (!VideoCallActivity.launched) {
                    InCallScreen.this.startActivityForResult(new Intent().setClass(InCallScreen.this, VideoCallActivity.class), 100);
                    VideoCallActivity.launched = true;
                }
            }
        }, 0);
    }

    /* access modifiers changed from: private */
    public void updateQualityIndicator(float f) {
        this.mCallCard.updateQualityIndiImage(f);
    }

    public void answer() {
        LinphoneCall linphoneCall = null;
        List<LinphoneCall> callsInState = LinphoneUtils.getCallsInState(this.lLinphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.IncomingReceived}));
        if (callsInState.size() > 0) {
            linphoneCall = callsInState.get(0);
        }
        if (linphoneCall != null) {
            try {
                this.lLinphoneCore.acceptCall(linphoneCall);
                setupCallCard();
            } catch (LinphoneCoreException e) {
                this.lLinphoneCore.declineCall(linphoneCall, Reason.Busy);
            }
        }
    }

    public void answerAndEndCall() {
        LinphoneCall currentCall = this.lLinphoneCore.getCurrentCall();
        LinphoneCall linphoneCall = null;
        List<LinphoneCall> callsInState = LinphoneUtils.getCallsInState(this.lLinphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.IncomingReceived}));
        if (callsInState.size() > 0) {
            linphoneCall = callsInState.get(0);
        }
        if (linphoneCall != null) {
            try {
                this.lLinphoneCore.acceptCall(linphoneCall);
                setupCallCard();
            } catch (LinphoneCoreException e) {
                this.lLinphoneCore.declineCall(linphoneCall, Reason.Busy);
            }
        }
        if (currentCall != null && currentCall != linphoneCall) {
            this.lLinphoneCore.terminateCall(currentCall);
        }
    }

    public void answerWithVideo() {
        LinphoneCall linphoneCall = null;
        List<LinphoneCall> callsInState = LinphoneUtils.getCallsInState(this.lLinphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.IncomingReceived}));
        if (callsInState.size() > 0) {
            linphoneCall = callsInState.get(0);
        }
        if (linphoneCall != null) {
            try {
                LinphoneCallParams currentParamsCopy = linphoneCall.getCurrentParamsCopy();
                currentParamsCopy.setVideoEnabled(true);
                this.lLinphoneCore.acceptCallWithParams(linphoneCall, currentParamsCopy);
                setupCallCard();
            } catch (LinphoneCoreException e) {
                this.lLinphoneCore.declineCall(linphoneCall, Reason.Busy);
            }
        }
    }

    /* access modifiers changed from: package-private */
    public void appendDigit(char c) {
        this.mDigits.getText().append(c);
    }

    public void callState(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneCall.State state, String str) {
        LinphoneCall linphoneCall2 = null;
        if (linphoneCore.getCallsNb() > 0) {
            linphoneCall2 = this.lLinphoneCore.getCurrentCall();
            if (linphoneCall2 == null) {
                linphoneCall2 = this.lLinphoneCore.getCalls()[0];
            }
            if (linphoneCall2.getState() == LinphoneCall.State.IncomingReceived) {
                this.mIncomingCallWidget.setVisibility(0);
                this.inCallDtmfView.setVisibility(4);
                this.dialButton.setChecked(false);
                this.inCallButtons.setVisibility(4);
            } else if (linphoneCall2.getState() == LinphoneCall.State.OutgoingEarlyMedia || linphoneCall2.getState() == LinphoneCall.State.OutgoingInit || linphoneCall2.getState() == LinphoneCall.State.OutgoingProgress || linphoneCall2.getState() == LinphoneCall.State.OutgoingRinging) {
                this.mIncomingCallWidget.setVisibility(4);
                this.inCallDtmfView.setVisibility(4);
                this.dialButton.setChecked(false);
                this.inCallButtons.setVisibility(0);
                this.startVideoButton.setEnabled(false);
                this.startVideoButton.setClickable(false);
            } else {
                this.mIncomingCallWidget.setVisibility(4);
                this.inCallDtmfView.setVisibility(4);
                this.dialButton.setChecked(false);
                this.inCallButtons.setVisibility(0);
            }
            setupCallCard();
        }
        if (state == LinphoneCall.State.OutgoingInit) {
            enterIncalMode(linphoneCore);
        } else if (state == LinphoneCall.State.IncomingReceived) {
        } else {
            if (state == LinphoneCall.State.Connected) {
                this.mCallCard.mVideoIcon.setVisibility(8);
                this.shouldUpdateQualityIndicator = true;
                configureQualityIndicator(linphoneCall);
                enterIncalMode(linphoneCore);
                if (this.isWaitingConferenceCall && MobileSipService.getInstance().getPhoneNumber(linphoneCall).equals(CallerInfo.CONFERENCE_NUMBER)) {
                    startConferenceCall(linphoneCall);
                }
            } else if (state == LinphoneCall.State.Error) {
                if (this.lLinphoneCore.getCallsNb() == 0) {
                    this.shouldUpdateQualityIndicator = false;
                    this.qualityIndiTimer.cancel();
                    if (!str.contains("bearer capability not author")) {
                        Toast.makeText(this, String.format(getString(R.string.call_error), new Object[]{str}), 1).show();
                    }
                    exitCallMode();
                    finish();
                } else if (this.isWaitingConferenceCall) {
                    try {
                        this.lLinphoneCore.terminateAllCalls();
                    } catch (Exception e) {
                    }
                }
            } else if (state == LinphoneCall.State.CallEnd) {
                if (this.lLinphoneCore.getCallsNb() == 0) {
                    this.mCallCard.mVideoIcon.setVisibility(8);
                    this.shouldUpdateQualityIndicator = false;
                    this.qualityIndiTimer.cancel();
                    exitCallMode();
                    this.mHandler.sendEmptyMessageDelayed(5, 2000);
                    this.mIncomingCallWidget.setVisibility(4);
                    this.inCallDtmfView.setVisibility(4);
                    this.inCallButtons.setVisibility(0);
                    if (ClientStateManager.isRegisteredPrepaid(this.mContext)) {
                        MobileSipService.getInstance().setNeedPrepaidTopUpReminderCheck(true);
                    }
                } else if (!this.isWaitingConferenceCall || this.lLinphoneCore.getCallsNb() != 1) {
                    List<LinphoneCall> callsInState = LinphoneUtils.getCallsInState(this.lLinphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.IncomingReceived}));
                    if (callsInState == null || callsInState.size() == 0 || this.lLinphoneCore.getCallsNb() == 1) {
                        closeIncomingDialog();
                    }
                    if (!this.isWaitingConferenceCall && !this.isInConferenceCall) {
                        List<LinphoneCall> callsInState2 = LinphoneUtils.getCallsInState(this.lLinphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.Paused, LinphoneCall.State.PausedByRemote, LinphoneCall.State.Pausing}));
                        if (callsInState2 != null && callsInState2.size() > 0) {
                            this.lLinphoneCore.resumeCall(callsInState2.get(0));
                        }
                        if (this.isWaitingConferenceCall || this.isInConferenceCall || !BandwidthManager.isRoamSaveVideoEnable() || !MobileSipService.shouldEnableVideoButton(MobileSipService.getInstance().getPhoneNumber(linphoneCall)) || linphoneCore.getCallsNb() != 1) {
                            this.startVideoButton.setEnabled(false);
                            this.startVideoButton.setClickable(false);
                            return;
                        }
                        this.startVideoButton.setEnabled(true);
                        if (!this.promptRemoteCancelVideoToast) {
                            this.startVideoButton.setClickable(true);
                        } else {
                            this.startVideoButton.setClickable(false);
                        }
                    }
                } else {
                    this.isWaitingConferenceCall = false;
                }
            } else if (state == LinphoneCall.State.CallReleased) {
                if (this.lLinphoneCore.getCallsNb() == 0 && getDialer() == null) {
                    finish();
                }
            } else if (state == LinphoneCall.State.CallUpdatedByRemote && BandwidthManager.isRoamSaveVideoEnable()) {
                boolean videoEnabled = linphoneCall.getRemoteParams().getVideoEnabled();
                boolean videoEnabled2 = linphoneCall.getCurrentParamsCopy().getVideoEnabled();
                if (videoEnabled && !videoEnabled2 && !this.isInConferenceCall && LinphoneService.getLc().getCallsNb() == 1) {
                    this.mHandler.post(new Runnable() {
                        public void run() {
                            InCallScreen.this.showDialog(0);
                            CountDownTimer unused = InCallScreen.this.timer = new CountDownTimer(30000, 1000) {
                                public void onFinish() {
                                    InCallScreen.this.acceptCallUpdate(false, 0);
                                }

                                public void onTick(long j) {
                                }
                            }.start();
                        }
                    });
                } else if (videoEnabled && !videoEnabled2) {
                    acceptCallUpdate(false, 0);
                }
            } else if (state == LinphoneCall.State.StreamsRunning) {
                if (this.promptRemoteCancelVideoToast && !linphoneCall.getCurrentParamsCopy().getVideoEnabled()) {
                    Toast.makeText(getApplicationContext(), R.string.toast_video_remote_cancel, 1).show();
                }
                this.promptRemoteCancelVideoToast = false;
                if (this.isWaitingConferenceCall || this.isInConferenceCall || !BandwidthManager.isRoamSaveVideoEnable() || !MobileSipService.shouldEnableVideoButton(MobileSipService.getInstance().getPhoneNumber(linphoneCall)) || linphoneCore.getCallsNb() != 1) {
                    this.startVideoButton.setEnabled(false);
                    this.startVideoButton.setClickable(false);
                } else {
                    this.startVideoButton.setEnabled(true);
                    if (!this.promptRemoteCancelVideoToast) {
                        this.startVideoButton.setClickable(true);
                    } else {
                        this.startVideoButton.setClickable(false);
                    }
                }
                configureMuteButtons();
                if (linphoneCall2 != null && linphoneCall2.getCurrentParamsCopy().getVideoEnabled() && !VideoCallActivity.launched) {
                    startVideoView(VIDEO_VIEW_ACTIVITY);
                }
            } else if (state == LinphoneCall.State.OutgoingEarlyMedia) {
                if (Hacks.needIncallModeAudio()) {
                    this.mAudioManager.setMode(2);
                }
                if (Hacks.needRTPStreamHack()) {
                    this.mAudioManager.setMode(2);
                    this.mAudioManager.setMode(0);
                }
            } else if (state == LinphoneCall.State.Paused && this.isWaitingConferenceCall && this.isInConferenceCall && this.pausingCalls != null && this.pausingCalls.size() > 0 && this.pausingCalls.contains(linphoneCall)) {
                this.pausingCalls.remove(linphoneCall);
                this.lLinphoneCore.transferCall(linphoneCall, this.conferenceCallReferTo);
            }
        }
    }

    public void displayStatus(LinphoneCore linphoneCore, String str) {
    }

    public void globalState(LinphoneCore linphoneCore, LinphoneCore.GlobalState globalState, String str) {
    }

    /* access modifiers changed from: package-private */
    @SuppressLint({"NewApi"})
    public void hiddenScreen(boolean z) {
        int i = 4;
        WindowManager.LayoutParams attributes = getWindow().getAttributes();
        if (z) {
            attributes.flags |= 1024;
            attributes.screenBrightness = 0.1f;
            this.mMainFrame.setVisibility(4);
            if (Build.VERSION.SDK_INT >= 14) {
                getWindow().getDecorView().setSystemUiVisibility(2);
            }
            this.inCallDtmfView.setVisibility(4);
        } else {
            attributes.flags &= -1025;
            attributes.screenBrightness = -1.0f;
            this.mMainFrame.setVisibility(0);
            if (Build.VERSION.SDK_INT >= 14) {
                getWindow().getDecorView().setSystemUiVisibility(0);
            }
            this.inCallDtmfView.setVisibility(this.dialButton.isChecked() ? 0 : 8);
        }
        getWindow().setAttributes(attributes);
        this.mMainFrame.setVisibility(z ? 4 : 0);
        LinearLayout linearLayout = this.inCallButtons;
        if (!z) {
            i = 0;
        }
        linearLayout.setVisibility(i);
    }

    public void initInCallScreen() {
        this.mInCallPanel = (ViewGroup) findViewById(R.id.inCallPanel);
        this.mMainFrame = (ViewGroup) findViewById(R.id.mainFrame);
        ViewGroup viewGroup = this.mInCallPanel;
        this.mCallCard = (CallCard) viewGroup.findViewById(R.id.callCard);
        this.mCallCard.reset();
        this.holdCallCard = (CallCardHold) viewGroup.findViewById(R.id.callCardHold);
        this.holdCallCard.reset();
        this.mIncomingCallWidget = (SlidingTab) findViewById(R.id.incomingCallWidget);
        this.mIncomingCallWidget.setLeftTabResources(R.drawable.empty, R.drawable.jog_tab_target_green, R.drawable.empty, R.drawable.btn_accept_call, R.drawable.btn_accept_call_animation);
        this.mIncomingCallWidget.setRightTabResources(R.drawable.empty, R.drawable.jog_tab_target_red, R.drawable.empty, R.drawable.btn_reject_call, R.drawable.btn_reject_call_animation);
        this.mIncomingCallWidget.setVideoTabResources(R.drawable.empty, R.drawable.jog_tab_target_green, R.drawable.empty, R.drawable.btn_accept_video_call, R.drawable.btn_accept_video_animation);
        this.mIncomingCallWidget.setLeftHintText(R.string.slide_to_answer_hint);
        this.mIncomingCallWidget.setRightHintText(R.string.slide_to_decline_hint);
        this.mIncomingCallWidget.setVideoHintText(R.string.slide_to_answer_hint);
        this.mIncomingCallWidget.setOnTriggerListener(new SlidingTab.OnTriggerListener() {
            public void onGrabbedStateChange(View view, int i) {
            }

            public void onTrigger(View view, int i) {
                switch (i) {
                    case 1:
                        InCallScreen.this.inCallButtons.setVisibility(0);
                        InCallScreen.this.mIncomingCallWidget.setVisibility(8);
                        InCallScreen.this.answer();
                        return;
                    case 2:
                        InCallScreen.this.mIncomingCallWidget.setVisibility(8);
                        InCallScreen.this.reject();
                        return;
                    case 3:
                        InCallScreen.this.mIncomingCallWidget.setVisibility(8);
                        InCallScreen.this.answerWithVideo();
                        return;
                    default:
                        return;
                }
            }
        });
        this.inCallDtmfView = findViewById(R.id.incall_dtmf);
        getWindow().addFlags(32768);
        this.mDigits = (EditText) findViewById(R.id.digits);
        mDisplayMap.put(Integer.valueOf(R.id.one), '1');
        mDisplayMap.put(Integer.valueOf(R.id.two), '2');
        mDisplayMap.put(Integer.valueOf(R.id.three), '3');
        mDisplayMap.put(Integer.valueOf(R.id.four), '4');
        mDisplayMap.put(Integer.valueOf(R.id.five), '5');
        mDisplayMap.put(Integer.valueOf(R.id.six), '6');
        mDisplayMap.put(Integer.valueOf(R.id.seven), '7');
        mDisplayMap.put(Integer.valueOf(R.id.eight), '8');
        mDisplayMap.put(Integer.valueOf(R.id.nine), '9');
        mDisplayMap.put(Integer.valueOf(R.id.zero), '0');
        mDisplayMap.put(Integer.valueOf(R.id.pound), '#');
        mDisplayMap.put(Integer.valueOf(R.id.star), '*');
        for (Integer intValue : mDisplayMap.keySet()) {
            findViewById(intValue.intValue()).setOnClickListener(this);
        }
        this.inCallButtons = (LinearLayout) findViewById(R.id.inCallButtons);
        this.clearCallButton = (ImageButton) findViewById(R.id.clearCallButton);
        this.dialButton = (ToggleButton) findViewById(R.id.dialpadButton);
        this.speakerButton = (ToggleButton) findViewById(R.id.speakerButton);
        this.mergeAddButton = (ToggleButton) findViewById(R.id.mergeAddButton);
        this.startVideoButton = (ToggleButton) findViewById(R.id.startVideoButton);
        this.muteButton = (ToggleButton) findViewById(R.id.muteButton);
        this.audioRoute = (ToggleButton) findViewById(R.id.routeButton);
        this.swapCallButton = findViewById(R.id.btn_call_swap);
        this.clearCallButton.setOnClickListener(this);
        this.dialButton.setOnClickListener(this);
        this.speakerButton.setOnClickListener(this);
        this.mergeAddButton.setOnClickListener(this);
        this.startVideoButton.setOnClickListener(this);
        this.muteButton.setOnClickListener(this);
        this.audioRoute.setOnClickListener(this);
        this.swapCallButton.setOnClickListener(this);
    }

    /* access modifiers changed from: package-private */
    public void moveBack() {
        onStop();
    }

    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    public void onClick(View view) {
        int id = view.getId();
        if (mDisplayMap.containsKey(Integer.valueOf(id))) {
            if (this.lLinphoneCore.isIncall()) {
                appendDigit(mDisplayMap.get(Integer.valueOf(id)).charValue());
                this.lLinphoneCore.sendDtmf(mDisplayMap.get(Integer.valueOf(id)).charValue());
                this.lLinphoneCore.playDtmf('1', 10);
            }
            this.lLinphoneCore.stopDtmf();
        }
        switch (id) {
            case R.id.btn_call_swap:
                pauseOrResumeOrSwapCall();
                return;
            case R.id.mergeAddButton:
                if (!this.isWaitingConferenceCall && !this.isInConferenceCall) {
                    if (this.lLinphoneCore.getCallsNb() <= 1) {
                        Intent intent = new Intent();
                        intent.addFlags(268435456);
                        intent.setClass(this, AddCallActivity.class);
                        startActivityForResult(intent, 101);
                    } else {
                        inviteConferenceCall();
                    }
                }
                refreshMergeAddButton();
                return;
            case R.id.speakerButton:
                if (this.speakerButton.isChecked()) {
                    routeAudioToSpeaker();
                    return;
                } else {
                    routeAudioToReceiver();
                    return;
                }
            case R.id.routeButton:
                popupAudioRoutingWindow();
                return;
            case R.id.dialpadButton:
                this.inCallDtmfView.setVisibility(this.dialButton.isChecked() ? 0 : 8);
                return;
            case R.id.startVideoButton:
                if (this.lLinphoneCore.getCurrentCall() != null) {
                    this.mHandler.post(new Runnable() {
                        public void run() {
                            InCallScreen.this.showDialog(1);
                            CountDownTimer unused = InCallScreen.this.timer = new CountDownTimer(10000, 1000) {
                                public void onFinish() {
                                    InCallScreen.this.removeDialog(1);
                                    InCallScreen.this.timer.cancel();
                                    InCallScreen.this.startVideoButton.setChecked(false);
                                }

                                public void onTick(long j) {
                                }
                            }.start();
                        }
                    });
                    return;
                }
                return;
            case R.id.muteButton:
                if (this.muteButton.isChecked()) {
                    this.lLinphoneCore.muteMic(true);
                    return;
                } else {
                    this.lLinphoneCore.muteMic(false);
                    return;
                }
            case R.id.clearCallButton:
                LinphoneCall currentCall = this.lLinphoneCore.getCurrentCall();
                if (currentCall != null) {
                    this.lLinphoneCore.terminateCall(currentCall);
                } else {
                    this.lLinphoneCore.terminateAllCalls();
                }
                if (this.lLinphoneCore.getCallsNb() == 0) {
                    this.mHandler.sendEmptyMessageDelayed(5, 2000);
                    return;
                } else {
                    this.mHandler.sendEmptyMessageDelayed(7, 2000);
                    return;
                }
            default:
                return;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.incall_msip);
        this.mAudioManager = (AudioManager) getSystemService("audio");
        initInCallScreen();
        this.lLinphoneCore = LinphoneService.instance().getLinphoneCore();
        this.sensorManager = (SensorManager) getSystemService("sensor");
        this.proximitySensor = this.sensorManager.getDefaultSensor(8);
        this.pm = (PowerManager) this.mContext.getSystemService("power");
        theDialer = this;
        this.qualityIndiTimer = new Timer();
        refreshAudioRouteActions(true);
    }

    /* access modifiers changed from: protected */
    public Dialog onCreateDialog(final int i) {
        new AlertDialog.Builder(this);
        switch (i) {
            case 0:
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setTitle(R.string.dynamic_video_asking);
                builder.setNegativeButton(R.string.dynamic_video_deny, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        InCallScreen.this.acceptCallUpdate(false, i);
                    }
                });
                builder.setPositiveButton(R.string.dynamic_video_accept, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        InCallScreen.this.acceptCallUpdate(true, i);
                    }
                });
                builder.setCancelable(false);
                return builder.create();
            case 1:
                AlertDialog.Builder builder2 = new AlertDialog.Builder(this);
                builder2.setTitle(R.string.dynamic_video_invite);
                builder2.setNegativeButton(R.string.dynamic_video_invite_cannel, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        InCallScreen.this.removeDialog(i);
                        InCallScreen.this.timer.cancel();
                        InCallScreen.this.startVideoButton.setChecked(false);
                    }
                });
                builder2.setPositiveButton(R.string.dynamic_video_invite_ok, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        InCallScreen.this.removeDialog(i);
                        InCallScreen.this.timer.cancel();
                        InCallScreen.this.inviteVideo();
                        InCallScreen.this.startVideoButton.setClickable(false);
                    }
                });
                builder2.setCancelable(false);
                return builder2.create();
            default:
                throw new IllegalArgumentException("unkown dialog id " + i);
        }
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        if (this.qualityIndiTimer != null) {
            this.qualityIndiTimer.cancel();
        }
        if (this.waitingConferenceCallTimer != null) {
            this.waitingConferenceCallTimer.cancel();
        }
        if (wl != null && wl.isHeld()) {
            wl.release();
        }
        finishActivity(101);
        theDialer = null;
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        int i2 = -1;
        if (i == 4 && LinphoneService.isready() && LinphoneService.getLc().isIncall()) {
            return true;
        }
        if ((i == 24 || i == 25) && (Hacks.needSoftvolume() || MobileSipService.getInstance().useSoftvolume(this))) {
            if (i == 24) {
                LinphoneService.instance().adjustSoftwareVolume(1);
            } else if (i == 25) {
                LinphoneService.instance().adjustSoftwareVolume(-1);
            }
        } else if (i == 24 || i == 25) {
            if (this.mAudioManager.isBluetoothScoOn()) {
                AudioManager audioManager = this.mAudioManager;
                if (i == 24) {
                    i2 = 1;
                }
                audioManager.adjustStreamVolume(6, i2, 1);
            }
            if (!this.mAudioManager.isBluetoothScoOn()) {
                return super.onKeyDown(i, keyEvent);
            }
            return true;
        }
        return !preventVolumeBarToDisplay ? super.onKeyDown(i, keyEvent) : super.onKeyDown(i, keyEvent);
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        switch (i) {
            case 4:
                return i == 4 && LinphoneService.isready() && LinphoneService.getLc().isIncall();
            case 24:
            case 25:
                return true;
        }
    }

    public void onPause() {
        super.onPause();
        if (this.t != null) {
            this.running = false;
            this.t.interrupt();
        }
        LinphoneActivity.instance().stopProxymitySensor();
    }

    public void onResume() {
        super.onResume();
        try {
            Thread.sleep(200);
        } catch (InterruptedException e) {
        }
        if (this.lLinphoneCore.getCallsNb() == 0) {
            exitCallMode();
            return;
        }
        LinphoneCall currentCall = this.lLinphoneCore.getCurrentCall();
        if (currentCall == null) {
            currentCall = this.lLinphoneCore.getCalls()[0];
        }
        LinphoneCall.State state = currentCall.getState();
        if (state == LinphoneCall.State.OutgoingInit || state == LinphoneCall.State.OutgoingRinging || state == LinphoneCall.State.Connected || state == LinphoneCall.State.StreamsRunning || state == LinphoneCall.State.OutgoingProgress || state == LinphoneCall.State.OutgoingEarlyMedia) {
            this.mIncomingCallWidget.setVisibility(4);
            this.inCallDtmfView.setVisibility(4);
            this.inCallButtons.setVisibility(0);
            LinphoneActivity.instance().startProxymitySensor();
        } else if (state == LinphoneCall.State.IncomingReceived) {
            this.mIncomingCallWidget.setVisibility(0);
            this.inCallDtmfView.setVisibility(4);
            this.inCallButtons.setVisibility(4);
        } else if (state != LinphoneCall.State.Error && state == LinphoneCall.State.CallEnd) {
            this.mIncomingCallWidget.setVisibility(4);
        }
        configureMuteButtons();
        setupCallCard();
        if (this.lLinphoneCore.getCallsNb() > 1) {
            List<LinphoneCall> callsInState = LinphoneUtils.getCallsInState(this.lLinphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.IncomingReceived}));
            if (currentCall.getState() != LinphoneCall.State.IncomingReceived && callsInState.size() > 0) {
                handleIncomingCallWaiting(callsInState.get(0));
            }
        }
        this.mHandler.sendEmptyMessage(4);
    }

    public void onSensorChanged(SensorEvent sensorEvent) {
        boolean z = false;
        if (this.first) {
            this.first = false;
            return;
        }
        float f = sensorEvent.values[0];
        if (((double) f) >= 0.0d && f < PROXIMITY_THRESHOLD && f < sensorEvent.sensor.getMaximumRange()) {
            z = true;
        }
        setScreenBacklight((float) (z ? 0.1d : -1.0d));
    }

    public void onStart() {
        super.onStart();
        this.first = true;
        started = true;
    }

    public void onStop() {
        super.onStop();
        started = false;
    }

    public void onWindowFocusChanged(boolean z) {
        if (this.mIncomingCallWidget != null) {
            SlidingTab slidingTab = this.mIncomingCallWidget;
            SlidingTab.btnAcceptCallAnimation.start();
            SlidingTab slidingTab2 = this.mIncomingCallWidget;
            SlidingTab.btnRejectCallAnimation.start();
            SlidingTab slidingTab3 = this.mIncomingCallWidget;
            SlidingTab.btnAcceptVideoAnimation.start();
        }
        super.onWindowFocusChanged(z);
    }

    public void pauseOrResumeCall(LinphoneCall linphoneCall) {
        if (linphoneCall != null && LinphoneUtils.isCallRunning(linphoneCall)) {
            this.lLinphoneCore.pauseCall(linphoneCall);
        } else if (LinphoneUtils.isCallPaused(linphoneCall)) {
            this.lLinphoneCore.resumeCall(linphoneCall);
        }
    }

    /* access modifiers changed from: protected */
    public void popupAudioRoutingWindow() {
        View inflate = getLayoutInflater().inflate(R.layout.audio_routing_menu, (ViewGroup) null, false);
        final PopupWindow popupWindow = new PopupWindow(inflate, -2, -2, true);
        this.routeBluetooth = (ImageView) inflate.findViewById(R.id.routeBluetooth);
        this.routeSpeaker = (ImageView) inflate.findViewById(R.id.routeSpeaker);
        this.routeReceiver = (ImageView) inflate.findViewById(R.id.routeReceiver);
        this.routeBluetooth.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                InCallScreen.this.routeAudioToBluetooth();
                popupWindow.dismiss();
            }
        });
        this.routeSpeaker.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                InCallScreen.this.routeAudioToSpeaker();
                popupWindow.dismiss();
            }
        });
        this.routeReceiver.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                InCallScreen.this.routeAudioToReceiver();
                popupWindow.dismiss();
            }
        });
        popupWindow.getContentView().measure(0, 0);
        popupWindow.setBackgroundDrawable(new BitmapDrawable());
        popupWindow.showAsDropDown(findViewById(R.id.routeButton), 0, -(findViewById(R.id.routeButton).getHeight() + popupWindow.getContentView().getMeasuredHeight()));
        popupWindow.setFocusable(true);
        popupWindow.setTouchable(true);
        popupWindow.setOutsideTouchable(true);
    }

    public void refreshAudioRouteActions(final boolean z) {
        if (this.mHandler == null) {
            this.mHandler = new Handler();
        }
        this.mHandler.post(new Runnable() {
            public void run() {
                if (LinphoneService.instance().isBluetoothScoConnected) {
                    InCallScreen.this.audioRoute.setVisibility(0);
                    InCallScreen.this.speakerButton.setVisibility(8);
                    if (!z) {
                        try {
                            Thread.sleep(3000);
                        } catch (InterruptedException e) {
                        }
                    }
                    InCallScreen.this.routeAudioToBluetooth();
                    return;
                }
                InCallScreen.this.audioRoute.setVisibility(8);
                InCallScreen.this.speakerButton.setVisibility(0);
                if (InCallScreen.this.speakerButton.isChecked()) {
                    InCallScreen.this.routeAudioToSpeaker();
                    return;
                }
                if (Hacks.needAudioPathRecovery()) {
                    InCallScreen.this.mAudioManager.setSpeakerphoneOn(true);
                    InCallScreen.this.mAudioManager.setSpeakerphoneOn(false);
                }
                InCallScreen.this.routeAudioToReceiver();
            }
        });
    }

    public void registrationState(LinphoneCore linphoneCore, LinphoneProxyConfig linphoneProxyConfig, LinphoneCore.RegistrationState registrationState, String str) {
    }

    public void reject() {
        LinphoneCall linphoneCall = null;
        List<LinphoneCall> callsInState = LinphoneUtils.getCallsInState(this.lLinphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.IncomingReceived}));
        if (callsInState.size() > 0) {
            linphoneCall = callsInState.get(0);
        }
        if (linphoneCall != null) {
            this.lLinphoneCore.declineCall(linphoneCall, Reason.Busy);
        }
    }

    /* access modifiers changed from: package-private */
    public void screenOff(boolean z) {
        ContentResolver contentResolver = getContentResolver();
        if (this.proximitySensor == null) {
            if (!z) {
                if (this.oldtimeout == 0 && Settings.System.getInt(contentResolver, "screen_off_timeout", DateUtils.MILLIS_IN_MINUTE) == 12000) {
                    this.oldtimeout = DateUtils.MILLIS_IN_MINUTE;
                }
                if (this.oldtimeout != 0) {
                    Settings.System.putInt(contentResolver, "screen_off_timeout", this.oldtimeout);
                    this.oldtimeout = 0;
                }
            } else if (this.oldtimeout == 0) {
                this.oldtimeout = Settings.System.getInt(contentResolver, "screen_off_timeout", DateUtils.MILLIS_IN_MINUTE);
                Settings.System.putInt(contentResolver, "screen_off_timeout", 12000);
            }
        }
    }

    /* access modifiers changed from: package-private */
    public void setScreenBacklight(float f) {
        WindowManager.LayoutParams attributes = getWindow().getAttributes();
        attributes.screenBrightness = f;
        getWindow().setAttributes(attributes);
    }

    public void swapPausedCall() {
        LinphoneCall linphoneCall;
        List<LinphoneCall> callsInState = LinphoneUtils.getCallsInState(this.lLinphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.Paused}));
        LinphoneCall linphoneCall2 = callsInState.size() > 0 ? callsInState.get(0) : null;
        if (linphoneCall2 != null) {
            LinphoneCall[] calls = this.lLinphoneCore.getCalls();
            int length = calls.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                LinphoneCall linphoneCall3 = calls[i];
                if (LinphoneCall.State.Paused != linphoneCall3.getState()) {
                    linphoneCall = linphoneCall3;
                    break;
                }
                i++;
            }
        }
        linphoneCall = null;
        if (linphoneCall2 != null && linphoneCall != null) {
            this.lLinphoneCore.pauseCall(linphoneCall);
            this.lLinphoneCore.resumeCall(linphoneCall2);
            setupCallCard();
        }
    }

    public void updateRoutingIcon() {
        configureSpeakerButtons();
        try {
            if (this.speakerButton.isChecked()) {
                this.audioRoute.setCompoundDrawablesWithIntrinsicBounds(0, R.drawable.ic_speaker, 0, 0);
                this.audioRoute.setText(R.string.route_speaker);
                this.audioRoute.setTextOn(getString(R.string.route_speaker));
                this.audioRoute.setTextOff(getString(R.string.route_speaker));
            } else if (LinphoneService.instance().isUsingBluetoothAudioRoute) {
                this.audioRoute.setCompoundDrawablesWithIntrinsicBounds(0, R.drawable.ic_bluetooth, 0, 0);
                this.audioRoute.setText(R.string.route_bluetooth);
                this.audioRoute.setTextOn(getString(R.string.route_bluetooth));
                this.audioRoute.setTextOff(getString(R.string.route_bluetooth));
            } else {
                this.audioRoute.setCompoundDrawablesWithIntrinsicBounds(0, R.drawable.ic_receiver, 0, 0);
                this.audioRoute.setText(R.string.route_receiver);
                this.audioRoute.setTextOn(getString(R.string.route_receiver));
                this.audioRoute.setTextOff(getString(R.string.route_receiver));
            }
        } catch (NullPointerException e) {
        }
    }
}
