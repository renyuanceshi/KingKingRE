package org.linphone;

import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.KeyguardManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.graphics.drawable.BitmapDrawable;
import android.media.AudioManager;
import android.opengl.GLSurfaceView;
import android.os.Build;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.PowerManager;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.util.Log;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.OrientationEventListener;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.RotateAnimation;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.facebook.internal.ServerProtocol;
import com.pccw.camera.ui.RotateDialogController;
import com.pccw.mobile.sip.BaseActivity;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip02.R;

import org.linphone.core.AndroidCameraRecordManager;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCallParams;
import org.linphone.core.LinphoneCallStats;
import org.linphone.core.LinphoneCore;
import org.linphone.core.PayloadType;
import org.linphone.core.VideoSize;
import org.linphone.mediastream.Version;
import org.linphone.mediastream.video.AndroidVideoWindowImpl;
import org.linphone.mediastream.video.capture.hwconf.AndroidCameraConfiguration;

import java.util.Timer;
import java.util.TimerTask;

public class VideoCallActivity extends BaseActivity implements View.OnClickListener {
    private static final int capturePreviewLargestDimension = 150;
    public static boolean launched = false;
    private static final int promptBackToDialerId = 0;
    private static final String tag = "PCCW_MOBILE_SIP";
    private static VideoCallActivity theVideoCall;
    private final int DEVICE_LANDSCAPE = 1;
    private final int DEVICE_PORTRAIT = 2;
    private final int EYE_MODE_ORIENTATION = 0;
    private RelativeLayout MenuCallEnd;
    private RelativeLayout MenuMute;
    /* access modifiers changed from: private */
    public RelativeLayout MenuRouteAudio;
    /* access modifiers changed from: private */
    public RelativeLayout MenuSpeaker;
    private ImageButton MenuSwtichCamera;
    private RelativeLayout MenuVideoOff;
    private final int ROAMSAVE_MODE_ORIENTATION = 1;
    AndroidVideoWindowImpl androidVideoWindowImpl;
    private ImageButton callEndButton;
    private Handler controlsHandler = new Handler();
    /* access modifiers changed from: private */
    public int deviceOrientation = 0;
    boolean enabledKeyguard;
    HeadSetReceiver intentReceiver = null;
    /* access modifiers changed from: private */
    public AudioManager mAudioManager;
    /* access modifiers changed from: private */
    public Runnable mCallQualityUpdater;
    private Runnable mControls;
    Handler mHandler = new Handler();
    KeyguardManager.KeyguardLock mKeyguardLock;
    KeyguardManager mKeyguardManager;
    OrientationEventListener mOrientationEventListener;
    /* access modifiers changed from: private */
    public RotateDialogController mRotateDialog;
    /* access modifiers changed from: private */
    public TimerTask mTask;
    /* access modifiers changed from: private */
    public Timer mTimer;
    private SurfaceView mVideoCaptureView;
    /* access modifiers changed from: private */
    public SurfaceView mVideoCaptureViewReady;
    private SurfaceView mVideoView;
    /* access modifiers changed from: private */
    public SurfaceView mVideoViewReady;
    private PowerManager.WakeLock mWakeLock;
    private ImageButton muteButton;
    private boolean needExtraRotation = true;
    private int orientationMode = 0;
    private int phoneOrientation;
    private int previousPhoneOrientation;
    private AndroidCameraRecordManager recordManager;
    /* access modifiers changed from: private */
    public Handler refreshHandler = new Handler();
    private ImageButton routeBluetooth;
    private ImageButton routeButton;
    private ImageButton routeReceiver;
    private ImageButton routeSpeaker;
    private Runnable runDialAccept = new Runnable() {
        public void run() {
            LinphoneCore lc = LinphoneService.getLc();
            LinphoneCallParams currentParamsCopy = VideoCallActivity.this.videoCall.getCurrentParamsCopy();
            currentParamsCopy.setVideoEnabled(false);
            lc.updateCall(VideoCallActivity.this.videoCall, currentParamsCopy);
        }
    };
    private boolean showViewStat = false;
    private ImageButton speakerButton;
    /* access modifiers changed from: private */
    public CountDownTimer timer;
    private ImageButton videoButton;
    /* access modifiers changed from: private */
    public LinphoneCall videoCall;
    private LinearLayout viewStat;

    private class HeadSetReceiver extends BroadcastReceiver {
        private HeadSetReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals("android.intent.action.HEADSET_PLUG")) {
                if (intent.getIntExtra(ServerProtocol.DIALOG_PARAM_STATE, -1) == 0) {
                    VideoCallActivity.this.routeAudioToSpeaker();
                } else if (intent.getIntExtra(ServerProtocol.DIALOG_PARAM_STATE, -1) == 1) {
                    VideoCallActivity.this.routeAudioToReceiver();
                }
                VideoCallActivity.this.changeIconBackground();
            }
        }
    }

    private void callRotation(int i, int i2) {
        startAnimation(this.muteButton, new RotateAnimation((float) i2, (float) i, 1, 0.5f, 1, 0.5f));
        startAnimation(this.speakerButton, new RotateAnimation((float) i2, (float) i, 1, 0.5f, 1, 0.5f));
        startAnimation(this.videoButton, new RotateAnimation((float) i2, (float) i, 1, 0.5f, 1, 0.5f));
        startAnimation(this.callEndButton, new RotateAnimation((float) i2, (float) i, 1, 0.5f, 1, 0.5f));
        startAnimation(this.MenuSwtichCamera, new RotateAnimation((float) i2, (float) i, 1, 0.5f, 1, 0.5f));
        if (this.MenuRouteAudio.getVisibility() == 0) {
            Log.i("V", "need Rotation, rotate button");
            startAnimation(this.routeButton, new RotateAnimation((float) i2, (float) i, 1, 0.5f, 1, 0.5f));
            if (this.routeBluetooth != null && this.routeSpeaker != null && this.routeReceiver != null) {
                Log.i("V", "need Rotation, rotate images");
                startAnimation(this.routeBluetooth, new RotateAnimation((float) i2, (float) i, 1, 0.5f, 1, 0.5f));
                startAnimation(this.routeReceiver, new RotateAnimation((float) i2, (float) i, 1, 0.5f, 1, 0.5f));
                startAnimation(this.routeSpeaker, new RotateAnimation((float) i2, (float) i, 1, 0.5f, 1, 0.5f));
            }
        }
    }

    private void disableCallStatsView() {
        if (this.mTimer != null) {
            this.mTimer.cancel();
        }
        if (this.mTask != null) {
            this.mTask.cancel();
        }
    }

    private int dpToPixels(int i) {
        return (int) TypedValue.applyDimension(1, (float) i, getResources().getDisplayMetrics());
    }

    /* access modifiers changed from: private */
    public int getOrientationMode() {
        return this.orientationMode;
    }

    public static VideoCallActivity getVideoCallScreen() {
        if (theVideoCall == null) {
            return null;
        }
        return theVideoCall;
    }

    private void initCallStatsRefresher() {
        this.mTimer = new Timer();
        this.mTask = new TimerTask() {
            public void run() {
                final LinphoneCall currentCall = LinphoneService.getLc().getCurrentCall();
                if (currentCall == null) {
                    VideoCallActivity.this.mTimer.cancel();
                    VideoCallActivity.this.mTask.cancel();
                    return;
                }
                final TextView textView = (TextView) VideoCallActivity.this.findViewById(R.id.viewStatText);
                if (textView == null) {
                    VideoCallActivity.this.mTimer.cancel();
                    VideoCallActivity.this.mTask.cancel();
                    return;
                }
                VideoCallActivity.this.mHandler.post(new Runnable() {
                    public void run() {
                        synchronized (LinphoneService.getLc()) {
                            try {
                                StringBuffer stringBuffer = new StringBuffer();
                                LinphoneCallParams currentParamsCopy = currentCall.getCurrentParamsCopy();
                                if (currentParamsCopy == null || !currentParamsCopy.getVideoEnabled()) {
                                    LinphoneCallStats audioStats = currentCall.getAudioStats();
                                    if (audioStats != null) {
                                        stringBuffer.append("Audio");
                                        PayloadType usedAudioCodec = currentParamsCopy.getUsedAudioCodec();
                                        if (usedAudioCodec != null) {
                                            stringBuffer.append("\nCodec:" + usedAudioCodec.getMime() + (usedAudioCodec.getRate() / 1000));
                                        }
                                        stringBuffer.append("\nDownload:" + String.valueOf((int) audioStats.getDownloadBandwidth()) + " kbits/s");
                                        stringBuffer.append("\nUpload:" + String.valueOf((int) audioStats.getUploadBandwidth()) + " kbits/s");
                                        stringBuffer.append("\nSize:" + audioStats.getIceState().toString());
                                    }
                                } else {
                                    LinphoneCallStats videoStats = currentCall.getVideoStats();
                                    LinphoneCallStats audioStats2 = currentCall.getAudioStats();
                                    if (!(videoStats == null || audioStats2 == null)) {
                                        stringBuffer.append("Video");
                                        PayloadType usedAudioCodec2 = currentParamsCopy.getUsedAudioCodec();
                                        PayloadType usedVideoCodec = currentParamsCopy.getUsedVideoCodec();
                                        if (!(usedVideoCodec == null || usedAudioCodec2 == null)) {
                                            stringBuffer.append("\nCodec:" + usedVideoCodec.getMime() + " / " + usedAudioCodec2.getMime() + (usedAudioCodec2.getRate() / 1000));
                                        }
                                        stringBuffer.append("\nDownload:" + String.valueOf((int) videoStats.getDownloadBandwidth()) + " / " + ((int) audioStats2.getDownloadBandwidth()) + " kbits/s");
                                        stringBuffer.append("\nUpload:" + String.valueOf((int) videoStats.getUploadBandwidth()) + " / " + ((int) audioStats2.getUploadBandwidth()) + " kbits/s");
                                        stringBuffer.append("\nSize:" + currentParamsCopy.getSentVideoSize().toDisplayableString() + " / " + currentParamsCopy.getReceivedVideoSize().toDisplayableString());
                                    }
                                }
                                textView.setText(stringBuffer.toString());
                            } catch (Exception e) {
                            }
                        }
                    }
                });
            }
        };
        this.mTimer.scheduleAtFixedRate(this.mTask, 0, 1000);
    }

    private void resizeCapturePreview(SurfaceView surfaceView, VideoSize videoSize) {
        ratioWidthHeight(videoSize);
    }

    private void sendStaticImage(boolean z) {
        LinphoneCore lc = LinphoneService.getLc();
        if (lc.isIncall()) {
            lc.getCurrentCall().enableCamera(!z);
        }
    }

    private void setListener() {
        this.MenuMute.setOnClickListener(this);
        this.MenuSpeaker.setOnClickListener(this);
        this.MenuCallEnd.setOnClickListener(this);
        this.MenuVideoOff.setOnClickListener(this);
        this.MenuSwtichCamera.setOnClickListener(this);
        this.MenuRouteAudio.setOnClickListener(this);
    }

    private void setOrientationMode(int i) {
        this.orientationMode = i;
    }

    private void startAnimation(ImageView imageView, RotateAnimation rotateAnimation) {
        rotateAnimation.setDuration(500);
        rotateAnimation.setFillEnabled(true);
        rotateAnimation.setFillAfter(true);
        imageView.startAnimation(rotateAnimation);
    }

    public void backToVoiceCallAudioRouteActions(final boolean z) {
        if (this.mHandler == null) {
            this.mHandler = new Handler();
        }
        this.mHandler.post(new Runnable() {
            public void run() {
                if (LinphoneService.instance().isBluetoothScoConnected) {
                    VideoCallActivity.this.MenuRouteAudio.setVisibility(View.VISIBLE);
                    VideoCallActivity.this.MenuSpeaker.setVisibility(View.GONE);
                    if (!z) {
                        try {
                            Thread.sleep(3000);
                        } catch (InterruptedException e) {
                        }
                    }
                    VideoCallActivity.this.routeAudioToBluetooth();
                } else {
                    VideoCallActivity.this.MenuRouteAudio.setVisibility(View.GONE);
                    VideoCallActivity.this.MenuSpeaker.setVisibility(View.VISIBLE);
                    VideoCallActivity.this.routeAudioToReceiver();
                }
                VideoCallActivity.this.changeIconBackground();
            }
        });
    }

    public void callState(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneCall.State state, String str) {
        if (linphoneCall == this.videoCall && state == LinphoneCall.State.CallEnd) {
            BandwidthManager.getInstance().setUserRestriction(false);
            LinphoneService.instance().resetCameraFromPreferences();
            setVolumeControlStream(Integer.MIN_VALUE);
            finish();
        } else if (linphoneCall == this.videoCall && !linphoneCall.getCurrentParamsCopy().getVideoEnabled()) {
            setVolumeControlStream(Integer.MIN_VALUE);
            backToVoiceCallAudioRouteActions(true);
            finish();
        }
    }

    public void changeIconBackground() {
        boolean z = true;
        LinphoneCore lc = LinphoneService.getLc();
        this.MenuSpeaker.setSelected(this.mAudioManager.isSpeakerphoneOn());
        ImageButton imageButton = this.speakerButton;
        if (this.mAudioManager.isSpeakerphoneOn()) {
        }
        imageButton.setImageResource(R.drawable.ic_speaker_off);
        RelativeLayout relativeLayout = this.MenuMute;
        if (!lc.isMicMuted()) {
            z = false;
        }
        relativeLayout.setSelected(z);
        ImageButton imageButton2 = this.muteButton;
        if (lc.isMicMuted()) {
        }
        imageButton2.setImageResource(R.drawable.ic_mute_on);
    }

    public void changeIconOrientation() {
        if (getOrientationMode() != 1) {
            switch (this.deviceOrientation) {
                case 1:
                    callRotation(0, -90);
                    break;
                case 2:
                    callRotation(-90, 0);
                    break;
            }
            updateRoutingIcon();
        }
    }

    /* access modifiers changed from: package-private */
    public void disableKeyguard() {
        if (this.mKeyguardManager == null) {
            this.mKeyguardManager = (KeyguardManager) getSystemService("keyguard");
            this.mKeyguardLock = this.mKeyguardManager.newKeyguardLock("RoamSave");
            this.enabledKeyguard = true;
        }
        if (this.enabledKeyguard) {
            this.mKeyguardLock.disableKeyguard();
            this.enabledKeyguard = false;
        }
    }

    /* access modifiers changed from: package-private */
    public void fixZOrder(SurfaceView surfaceView, SurfaceView surfaceView2) {
        surfaceView.setZOrderOnTop(false);
        surfaceView2.setZOrderOnTop(true);
    }

    /* access modifiers changed from: package-private */
    @TargetApi(8)
    public void initDeviceOrientation() {
        LinphoneService.getLc();
        this.deviceOrientation = 2;
        if (getOrientationMode() == 1) {
            if (Version.sdkAboveOrEqual(11)) {
                this.mRotateDialog.setOrientation(0);
            }
        } else if (Version.sdkAboveOrEqual(11)) {
            this.mRotateDialog.setOrientation(90);
        }
        changeIconOrientation();
    }

    public void onButtonClick(View view) {
    }

    public void onClick(View view) {
        LinphoneCore lc = LinphoneService.getLc();
        switch (view.getId()) {
            case R.id.rotatecambtn:
                int videoDevice = LinphoneService.getLc().getVideoDevice();
                LinphoneService.getLc().setVideoDevice((videoDevice + 1) % AndroidCameraConfiguration.retrieveCameras().length);
                CallManager.getInstance().updateCall();
                if (this.mVideoCaptureViewReady != null) {
                    LinphoneService.getLc().setPreviewWindow(this.mVideoCaptureViewReady);
                }
                initDeviceOrientation();
                break;
            case R.id.videocall_menu_terminate_call:
                if (lc.isIncall()) {
                    lc.terminateCall(lc.getCurrentCall());
                }
                finish();
                break;
            case R.id.videocall_menu_speaker:
                if (!this.mAudioManager.isSpeakerphoneOn()) {
                    routeAudioToSpeaker();
                    this.speakerButton.setImageResource(R.drawable.ic_speaker_off);
                    break;
                } else {
                    routeAudioToReceiver();
                    this.speakerButton.setImageResource(R.drawable.ic_speaker_off);
                    break;
                }
            case R.id.routeAudioButton:
                popupAudioRoutingWindow();
                break;
            case R.id.videocall_menu_mute:
                if (!lc.isMicMuted()) {
                    lc.muteMic(true);
                    this.muteButton.setImageResource(R.drawable.ic_mute_on);
                    break;
                } else {
                    lc.muteMic(false);
                    this.muteButton.setImageResource(R.drawable.ic_mute_on);
                    break;
                }
            case R.id.videocall_menu_back_to_dialer:
                if (!Version.sdkAboveOrEqual(11)) {
                    this.mHandler.post(new Runnable() {
                        public void run() {
                            VideoCallActivity.this.showDialog(0);
                            CountDownTimer unused = VideoCallActivity.this.timer = new CountDownTimer(10000, 1000) {
                                public void onFinish() {
                                    VideoCallActivity.this.removeDialog(0);
                                    VideoCallActivity.this.timer.cancel();
                                }

                                public void onTick(long j) {
                                }
                            }.start();
                        }
                    });
                    break;
                } else {
                    this.mRotateDialog.showAlertDialog(getString(R.string.app_name), getString(R.string.dynamic_back_to_dial_asking), getString(R.string.dynamic_back_to_dial_deny), (Runnable) null, getString(R.string.dynamic_back_to_dial_accept), this.runDialAccept);
                    break;
                }
        }
        changeIconBackground();
    }

    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        theVideoCall = this;
        final LinphoneCore lc = LinphoneService.getLc();
        int shouldUseOrientationMode = MobileSipService.shouldUseOrientationMode(MobileSipService.getInstance().getPhoneNumber(lc.getCurrentCall()));
        setOrientationMode(shouldUseOrientationMode);
        if (shouldUseOrientationMode == 1) {
            this.needExtraRotation = false;
        }
        this.mAudioManager = (AudioManager) getSystemService(AUDIO_SERVICE);
        resetCameraFromPreferences();
        if (getOrientationMode() == 1) {
            setRequestedOrientation(1);
        } else {
            setRequestedOrientation(0);
        }
        setContentView(R.layout.videocall);
        this.MenuMute = (RelativeLayout) findViewById(R.id.videocall_menu_mute);
        this.MenuSpeaker = (RelativeLayout) findViewById(R.id.videocall_menu_speaker);
        this.MenuCallEnd = (RelativeLayout) findViewById(R.id.videocall_menu_terminate_call);
        this.MenuVideoOff = (RelativeLayout) findViewById(R.id.videocall_menu_back_to_dialer);
        this.MenuRouteAudio = (RelativeLayout) findViewById(R.id.routeAudioButton);
        this.MenuSwtichCamera = (ImageButton) findViewById(R.id.rotatecambtn);
        this.muteButton = (ImageButton) findViewById(R.id.ic_mute);
        this.speakerButton = (ImageButton) findViewById(R.id.ic_speaker);
        this.videoButton = (ImageButton) findViewById(R.id.ic_video);
        this.routeButton = (ImageButton) findViewById(R.id.ic_route);
        this.callEndButton = (ImageButton) findViewById(R.id.ic_decline);
        if (this.needExtraRotation) {
            startAnimation(this.routeButton, new RotateAnimation(0.0f, -90.0f, 1, 0.5f, 1, 0.5f));
        }
        setListener();
        refreshAudioRouteActions(true);
        if (!MobileSipService.shouldEnableVideoButton(MobileSipService.getInstance().getPhoneNumber(lc.getCurrentCall()))) {
            this.MenuVideoOff.setEnabled(false);
        }
        this.videoButton.setImageResource(this.MenuVideoOff.isEnabled() ? R.drawable.ic_video_on : R.drawable.ic_video_disabled);
        if (Version.sdkAboveOrEqual(11)) {
            this.mRotateDialog = new RotateDialogController(this, R.layout.rotate_dialog);
        }
        setVolumeControlStream(0);
        initDeviceOrientation();
        SurfaceView surfaceView = (SurfaceView) findViewById(R.id.video_surface);
        SurfaceView surfaceView2 = (SurfaceView) findViewById(R.id.video_capture_surface);
        surfaceView2.getHolder().setType(3);
        this.recordManager = AndroidCameraRecordManager.getInstance();
        fixZOrder(surfaceView, surfaceView2);
        this.androidVideoWindowImpl = new AndroidVideoWindowImpl(surfaceView, surfaceView2);
        this.androidVideoWindowImpl.setListener(new AndroidVideoWindowImpl.VideoWindowListener() {
            public void onVideoPreviewSurfaceDestroyed(AndroidVideoWindowImpl androidVideoWindowImpl) {
                lc.setPreviewWindow((Object) null);
            }

            public void onVideoPreviewSurfaceReady(AndroidVideoWindowImpl androidVideoWindowImpl, SurfaceView surfaceView) {
                SurfaceView unused = VideoCallActivity.this.mVideoCaptureViewReady = surfaceView;
                lc.setPreviewWindow(VideoCallActivity.this.mVideoCaptureViewReady);
            }

            public void onVideoRenderingSurfaceDestroyed(AndroidVideoWindowImpl androidVideoWindowImpl) {
                lc.setVideoWindow((Object) null);
            }

            public void onVideoRenderingSurfaceReady(AndroidVideoWindowImpl androidVideoWindowImpl, SurfaceView surfaceView) {
                lc.setVideoWindow(androidVideoWindowImpl);
                SurfaceView unused = VideoCallActivity.this.mVideoViewReady = surfaceView;
            }
        });
        this.androidVideoWindowImpl.init();
        this.videoCall = LinphoneService.getLc().getCurrentCall();
        if (this.videoCall != null) {
            if (this.videoCall.cameraEnabled()) {
                sendStaticImage(true);
            }
            updatePreview(this.videoCall.cameraEnabled());
        }
        this.mWakeLock = ((PowerManager) getSystemService("power")).newWakeLock(536870922, "VideoCall");
        this.mWakeLock.acquire();
        getWindow().addFlags(AccessibilityEventCompat.TYPE_WINDOWS_CHANGED);
        getWindow().addFlags(524288);
        getWindow().setFlags(128, 128);
        this.mOrientationEventListener = new OrientationEventListener(this, 2) {
            public void onOrientationChanged(int i) {
                if (VideoCallActivity.this.getOrientationMode() != 1) {
                    if (VideoCallActivity.this.deviceOrientation == 2 && ((i >= 260 && i <= 280) || (i >= 80 && i <= 90))) {
                        int unused = VideoCallActivity.this.deviceOrientation = 1;
                        VideoCallActivity.this.changeIconOrientation();
                        if (Version.sdkAboveOrEqual(11)) {
                            VideoCallActivity.this.mRotateDialog.setOrientation(0);
                        }
                    } else if (VideoCallActivity.this.deviceOrientation != 1) {
                    } else {
                        if (i >= 350 || i <= 10) {
                            int unused2 = VideoCallActivity.this.deviceOrientation = 2;
                            VideoCallActivity.this.changeIconOrientation();
                            if (Version.sdkAboveOrEqual(11)) {
                                VideoCallActivity.this.mRotateDialog.setOrientation(90);
                            }
                        }
                    }
                }
            }
        };
        this.mOrientationEventListener.enable();
        this.intentReceiver = new HeadSetReceiver();
        registerReceiver(this.intentReceiver, new IntentFilter("android.intent.action.HEADSET_PLUG"));
        lc.setVideoPolicy(false, true);
        this.viewStat = (LinearLayout) findViewById(R.id.viewStat);
        this.viewStat.setVisibility(View.GONE);
        this.showViewStat = false;
    }

    /* access modifiers changed from: protected */
    public Dialog onCreateDialog(final int i) {
        new AlertDialog.Builder(this);
        switch (i) {
            case 0:
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setTitle(R.string.dynamic_back_to_dial_asking);
                builder.setNegativeButton(R.string.dynamic_back_to_dial_deny, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        VideoCallActivity.this.removeDialog(i);
                        VideoCallActivity.this.timer.cancel();
                    }
                });
                builder.setPositiveButton(R.string.dynamic_back_to_dial_accept, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        VideoCallActivity.this.removeDialog(i);
                        VideoCallActivity.this.timer.cancel();
                        LinphoneCore lc = LinphoneService.getLc();
                        LinphoneCallParams currentParamsCopy = VideoCallActivity.this.videoCall.getCurrentParamsCopy();
                        currentParamsCopy.setVideoEnabled(false);
                        lc.updateCall(VideoCallActivity.this.videoCall, currentParamsCopy);
                    }
                });
                return builder.create();
            default:
                throw new IllegalArgumentException("unkown dialog id " + i);
        }
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        return super.onCreateOptionsMenu(menu);
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        launched = false;
        if (this.androidVideoWindowImpl != null) {
            this.androidVideoWindowImpl.release();
        }
        this.mOrientationEventListener.disable();
        if (this.intentReceiver != null) {
            unregisterReceiver(this.intentReceiver);
        }
        theVideoCall = null;
        LinphoneService.instance().getLinphoneCore().setVideoPolicy(false, false);
        super.onDestroy();
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 4) {
            if (!MobileSipService.shouldEnableVideoButton(MobileSipService.getInstance().getPhoneNumber(LinphoneService.getLc().getCurrentCall()))) {
                return true;
            }
            LinphoneCallParams currentParamsCopy = this.videoCall.getCurrentParamsCopy();
            currentParamsCopy.setVideoEnabled(false);
            LinphoneService.getLc().updateCall(this.videoCall, currentParamsCopy);
            return true;
        } else if (i != 24 && i != 25) {
            return super.onKeyDown(i, keyEvent);
        } else {
            if (this.mAudioManager.isBluetoothScoOn()) {
                this.mAudioManager.adjustStreamVolume(6, i == 24 ? 1 : -1, 1);
            }
            if (!this.mAudioManager.isBluetoothScoOn()) {
                return super.onKeyDown(i, keyEvent);
            }
            return true;
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        boolean onOptionsItemSelected = super.onOptionsItemSelected(menuItem);
        switch (menuItem.getItemId()) {
            case 1001:
                if (!this.showViewStat) {
                    this.viewStat.setVisibility(View.VISIBLE);
                    initCallStatsRefresher();
                    this.showViewStat = true;
                    break;
                } else {
                    this.viewStat.setVisibility(View.GONE);
                    disableCallStatsView();
                    this.showViewStat = false;
                    break;
                }
        }
        return onOptionsItemSelected;
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        if (this.mWakeLock.isHeld()) {
            this.mWakeLock.release();
        }
        if (this.videoCall != null) {
            this.videoCall.enableCamera(false);
        }
        if (isFinishing()) {
            this.videoCall = null;
        }
        launched = false;
        synchronized (this.androidVideoWindowImpl) {
            LinphoneService.getLc().setVideoWindow((Object) null);
        }
        if (this.mCallQualityUpdater != null) {
            this.refreshHandler.removeCallbacks(this.mCallQualityUpdater);
            this.mCallQualityUpdater = null;
        }
        if (this.mControls != null) {
            this.controlsHandler.removeCallbacks(this.mControls);
            this.mControls = null;
        }
        if (this.mWakeLock.isHeld()) {
            this.mWakeLock.release();
        }
        super.onPause();
        if (this.mVideoViewReady != null) {
            ((GLSurfaceView) this.mVideoViewReady).onPause();
        }
        if (Version.sdkStrictlyBelow(13)) {
            reenableKeyguard();
        }
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        if (!LinphoneService.getLc().isIncall()) {
            finish();
        }
        changeIconBackground();
        changeIconOrientation();
        super.onResume();
        if (this.mVideoViewReady != null) {
            ((GLSurfaceView) this.mVideoViewReady).onResume();
        }
        synchronized (this.androidVideoWindowImpl) {
            LinphoneService.getLc().setVideoWindow(this.androidVideoWindowImpl);
        }
        launched = true;
        Handler handler = this.refreshHandler;
        AnonymousClass5 r1 = new Runnable() {
            LinphoneCall mCurrentCall = LinphoneService.getLc().getCurrentCall();

            public void run() {
                if (this.mCurrentCall == null) {
                    Runnable unused = VideoCallActivity.this.mCallQualityUpdater = null;
                    return;
                }
                if (((int) this.mCurrentCall.getCurrentQuality()) != 0) {
                }
                if (VideoCallActivity.launched) {
                    VideoCallActivity.this.refreshHandler.postDelayed(this, 1000);
                } else {
                    Runnable unused2 = VideoCallActivity.this.mCallQualityUpdater = null;
                }
            }
        };
        this.mCallQualityUpdater = r1;
        handler.postDelayed(r1, 1000);
        if (this.videoCall != null) {
            this.videoCall.enableCamera(true);
            updatePreview(this.videoCall.cameraEnabled());
        }
    }

    /* access modifiers changed from: protected */
    public void onStart() {
        super.onStart();
        if (Version.sdkStrictlyBelow(13)) {
            disableKeyguard();
        }
    }

    /* access modifiers changed from: protected */
    public void onStop() {
        super.onStop();
        if (Version.sdkStrictlyBelow(13)) {
            reenableKeyguard();
        }
    }

    /* access modifiers changed from: protected */
    public void popupAudioRoutingWindow() {
        View inflate = getLayoutInflater().inflate(R.layout.audio_routing_menu, (ViewGroup) null, false);
        final PopupWindow popupWindow = new PopupWindow(inflate, -2, -2, true);
        this.routeBluetooth = (ImageButton) inflate.findViewById(R.id.routeBluetooth);
        this.routeSpeaker = (ImageButton) inflate.findViewById(R.id.routeSpeaker);
        this.routeReceiver = (ImageButton) inflate.findViewById(R.id.routeReceiver);
        this.routeBluetooth.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                VideoCallActivity.this.routeAudioToBluetooth();
                popupWindow.dismiss();
            }
        });
        this.routeSpeaker.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                VideoCallActivity.this.routeAudioToSpeaker();
                popupWindow.dismiss();
            }
        });
        this.routeReceiver.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                VideoCallActivity.this.routeAudioToReceiver();
                popupWindow.dismiss();
            }
        });
        if (this.needExtraRotation && this.deviceOrientation == 2) {
            startAnimation(this.routeBluetooth, new RotateAnimation(0.0f, -90.0f, 1, 0.5f, 1, 0.5f));
            startAnimation(this.routeReceiver, new RotateAnimation(0.0f, -90.0f, 1, 0.5f, 1, 0.5f));
            startAnimation(this.routeSpeaker, new RotateAnimation(0.0f, -90.0f, 1, 0.5f, 1, 0.5f));
        }
        popupWindow.getContentView().measure(0, 0);
        popupWindow.setBackgroundDrawable(new BitmapDrawable());
        if (getOrientationMode() == 1) {
            popupWindow.showAsDropDown(findViewById(R.id.routeAudioButton), findViewById(R.id.routeAudioButton).getWidth() / 2, -(findViewById(R.id.routeAudioButton).getHeight() + popupWindow.getContentView().getMeasuredHeight()));
        } else {
            popupWindow.showAsDropDown(findViewById(R.id.routeAudioButton), -popupWindow.getContentView().getMeasuredWidth(), -popupWindow.getContentView().getMeasuredHeight());
        }
        popupWindow.setFocusable(true);
        popupWindow.setTouchable(true);
        popupWindow.setOutsideTouchable(true);
    }

    public float ratioWidthHeight(VideoSize videoSize) {
        return ((float) videoSize.width) / ((float) videoSize.height);
    }

    /* access modifiers changed from: package-private */
    public void reenableKeyguard() {
        if (!this.enabledKeyguard) {
            try {
                if (Integer.parseInt(Build.VERSION.SDK) < 5) {
                    Thread.sleep(1000);
                }
            } catch (InterruptedException e) {
            }
            this.mKeyguardLock.reenableKeyguard();
            this.enabledKeyguard = true;
        }
    }

    public void refreshAudioRouteActions(final boolean z) {
        if (this.mHandler == null) {
            this.mHandler = new Handler();
        }
        this.mHandler.post(new Runnable() {
            public void run() {
                if (LinphoneService.instance().isBluetoothScoConnected) {
                    VideoCallActivity.this.MenuRouteAudio.setVisibility(View.VISIBLE);
                    VideoCallActivity.this.MenuSpeaker.setVisibility(View.GONE);
                    if (!z) {
                        try {
                            Thread.sleep(3000);
                        } catch (InterruptedException e) {
                        }
                    }
                    VideoCallActivity.this.routeAudioToBluetooth();
                } else {
                    VideoCallActivity.this.MenuRouteAudio.setVisibility(View.GONE);
                    VideoCallActivity.this.MenuSpeaker.setVisibility(View.VISIBLE);
                    if (VideoCallActivity.this.mAudioManager.isWiredHeadsetOn()) {
                        VideoCallActivity.this.routeAudioToReceiver();
                    } else {
                        VideoCallActivity.this.routeAudioToSpeaker();
                    }
                }
                VideoCallActivity.this.changeIconBackground();
            }
        });
    }

    public void resetCameraFromPreferences() {
        int i = 0;
        for (AndroidCameraConfiguration.AndroidCamera androidCamera : AndroidCameraConfiguration.retrieveCameras()) {
            if (androidCamera.frontFacing) {
                i = androidCamera.id;
            }
        }
        LinphoneService.getLc().setVideoDevice(i);
    }

    public void routeAudioToBluetooth() {
        LinphoneService.instance().routeAudioToBluetooth();
        this.routeButton.setImageResource(R.drawable.ic_bluetooth);
    }

    public void routeAudioToReceiver() {
        LinphoneService.instance().routeAudioToReceiver();
        this.routeButton.setImageResource(R.drawable.ic_receiver);
    }

    public void routeAudioToSpeaker() {
        LinphoneService.instance().routeAudioToSpeaker();
        this.routeButton.setImageResource(R.drawable.ic_speaker);
    }

    /* access modifiers changed from: package-private */
    public void updatePreview(boolean z) {
        this.mVideoCaptureViewReady = null;
        if (z) {
            findViewById(R.id.video_capture_surface).setVisibility(View.VISIBLE);
        } else {
            findViewById(R.id.video_capture_surface).setVisibility(4);
        }
        findViewById(R.id.video_frame).requestLayout();
    }

    public void updateRoutingIcon() {
        try {
            if (this.mAudioManager.isSpeakerphoneOn()) {
                if (getOrientationMode() == 1 || this.deviceOrientation == 1) {
                    this.speakerButton.setImageResource(R.drawable.ic_speaker_off);
                }
            } else if (LinphoneService.instance().isUsingBluetoothAudioRoute) {
                if (getOrientationMode() == 1 || this.deviceOrientation == 1) {
                    this.speakerButton.setImageResource(R.drawable.ic_bluetooth);
                }
            } else if (getOrientationMode() == 1 || this.deviceOrientation == 1) {
                this.speakerButton.setImageResource(R.drawable.ic_speaker_off);
            }
        } catch (NullPointerException e) {
        }
    }
}
