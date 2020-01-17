package org.linphone.core;

import android.hardware.Camera;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import java.util.List;
import org.linphone.core.AndroidCameraRecord;
import org.linphone.mediastream.Version;

public class AndroidCameraRecordManager {
    private static AndroidCameraRecordManager instance = null;
    private static final String tag = "Linphone";
    private int cameraId;
    private final AndroidCameraConf cc;
    private int frontCameraId;
    private boolean muted;
    private AndroidCameraRecord.RecorderParams parameters;
    private int phoneOrientation;
    private int rearCameraId;
    private AndroidCameraRecord recorder;
    private List<Camera.Size> supportedVideoSizes;
    /* access modifiers changed from: private */
    public SurfaceView surfaceView;

    private AndroidCameraRecordManager() {
        this.cc = Version.sdkAboveOrEqual(9) ? new AndroidCameraConf9() : new AndroidCameraConf();
        int[] iArr = {-1};
        int[] iArr2 = {-1};
        int[] iArr3 = {-1};
        this.cc.findFrontAndRearCameraIds(iArr, iArr2, iArr3);
        this.frontCameraId = iArr[0];
        this.rearCameraId = iArr2[0];
        this.cameraId = iArr3[0];
    }

    private int bufferRotationForCorrectImageOrientation() {
        int cameraOrientation = this.cc.getCameraOrientation(this.cameraId);
        int i = Version.sdkAboveOrEqual(8) ? (((360 - cameraOrientation) + 90) - this.phoneOrientation) % 360 : 0;
        Log.d("Capture video buffer will need a rotation of " + i + " degrees : camera " + cameraOrientation + ", phone " + this.phoneOrientation);
        return i;
    }

    public static final AndroidCameraRecordManager getInstance() {
        AndroidCameraRecordManager androidCameraRecordManager;
        synchronized (AndroidCameraRecordManager.class) {
            try {
                if (instance == null) {
                    instance = new AndroidCameraRecordManager();
                }
                androidCameraRecordManager = instance;
            } catch (Throwable th) {
                Class<AndroidCameraRecordManager> cls = AndroidCameraRecordManager.class;
                throw th;
            }
        }
        return androidCameraRecordManager;
    }

    /* access modifiers changed from: private */
    public void tryToStartVideoRecording() {
        if (!this.muted && this.surfaceView != null && this.parameters != null) {
            this.parameters.rotation = bufferRotationForCorrectImageOrientation();
            this.parameters.surfaceView = this.surfaceView;
            if (Version.sdkAboveOrEqual(9)) {
                this.recorder = new AndroidCameraRecord9Impl(this.parameters);
            } else if (Version.sdkAboveOrEqual(8)) {
                this.recorder = new AndroidCameraRecord8Impl(this.parameters);
            } else if (Version.sdkAboveOrEqual(5)) {
                this.recorder = new AndroidCameraRecord5Impl(this.parameters);
            } else {
                this.recorder = new AndroidCameraRecordImpl(this.parameters);
            }
            this.recorder.startPreview();
        }
    }

    public int getPhoneOrientation() {
        return this.phoneOrientation;
    }

    public boolean hasSeveralCameras() {
        return this.frontCameraId != this.rearCameraId;
    }

    public void invalidateParameters() {
        stopVideoRecording();
        this.parameters = null;
    }

    public boolean isCameraOrientationPortrait() {
        return this.cc.getCameraOrientation(this.cameraId) % 180 == 90;
    }

    public boolean isMuted() {
        return this.muted;
    }

    public boolean isRecording() {
        if (this.recorder != null) {
            return this.recorder.isStarted();
        }
        return false;
    }

    public boolean isUseFrontCamera() {
        return this.cc.isFrontCamera(this.cameraId);
    }

    public boolean outputIsPortrait() {
        boolean z = bufferRotationForCorrectImageOrientation() % 180 == 90;
        Log.d("Camera sensor in portrait orientation ?" + z);
        return z;
    }

    public void setMuted(boolean z) {
        if (z != this.muted) {
            this.muted = z;
            if (this.muted) {
                stopVideoRecording();
            } else {
                tryToStartVideoRecording();
            }
        }
    }

    public void setParametersFromFilter(long j, int i, int i2, float f) {
        stopVideoRecording();
        AndroidCameraRecord.RecorderParams recorderParams = new AndroidCameraRecord.RecorderParams(j);
        recorderParams.fps = f;
        recorderParams.width = i2;
        recorderParams.height = i;
        recorderParams.cameraId = this.cameraId;
        this.parameters = recorderParams;
        tryToStartVideoRecording();
    }

    public void setPhoneOrientation(int i) {
        this.phoneOrientation = i;
    }

    public final void setSurfaceView(final SurfaceView surfaceView2, int i) {
        this.phoneOrientation = i;
        SurfaceHolder holder = surfaceView2.getHolder();
        holder.setType(3);
        holder.addCallback(new SurfaceHolder.Callback() {
            public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
                Log.d("Video capture surface changed");
            }

            public void surfaceCreated(SurfaceHolder surfaceHolder) {
                SurfaceView unused = AndroidCameraRecordManager.this.surfaceView = surfaceView2;
                Log.d("Video capture surface created");
                AndroidCameraRecordManager.this.tryToStartVideoRecording();
            }

            public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
                SurfaceView unused = AndroidCameraRecordManager.this.surfaceView = null;
                Log.d("Video capture surface destroyed");
                AndroidCameraRecordManager.this.stopVideoRecording();
            }
        });
    }

    public void setUseFrontCamera(boolean z) {
        if (this.cc.isFrontCamera(this.cameraId) != z) {
            toggleUseFrontCamera();
        }
    }

    public void stopVideoRecording() {
        if (this.recorder != null) {
            this.recorder.stopPreview();
            this.recorder = null;
        }
    }

    public List<Camera.Size> supportedVideoSizes() {
        if (this.supportedVideoSizes != null) {
            return this.supportedVideoSizes;
        }
        if (this.recorder != null) {
            this.supportedVideoSizes = this.recorder.getSupportedVideoSizes();
            if (this.supportedVideoSizes != null) {
                return this.supportedVideoSizes;
            }
        }
        if (Version.sdkAboveOrEqual(5)) {
            this.supportedVideoSizes = AndroidCameraRecord5Impl.oneShotSupportedVideoSizes();
        }
        return this.supportedVideoSizes;
    }

    public boolean toggleMute() {
        setMuted(!this.muted);
        return this.muted;
    }

    public boolean toggleUseFrontCamera() {
        boolean isFrontCamera = this.cc.isFrontCamera(this.cameraId);
        this.cameraId = isFrontCamera ? this.rearCameraId : this.frontCameraId;
        if (this.parameters != null) {
            this.parameters.cameraId = this.cameraId;
            if (isRecording()) {
                stopVideoRecording();
                tryToStartVideoRecording();
            }
        }
        return !isFrontCamera;
    }

    public void tryResumingVideoRecording() {
        if (!isRecording()) {
            tryToStartVideoRecording();
        }
    }
}
