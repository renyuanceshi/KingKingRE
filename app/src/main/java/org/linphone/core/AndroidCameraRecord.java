package org.linphone.core;

import android.hardware.Camera;
import android.view.SurfaceView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public abstract class AndroidCameraRecord {
    protected static final String tag = "Linphone";
    protected Camera camera;
    private Camera.Size currentPreviewSize;
    private RecorderParams params;
    private boolean previewStarted;
    private Camera.PreviewCallback storedPreviewCallback;
    private List<Camera.Size> supportedVideoSizes;

    public static class RecorderParams {
        public int cameraId;
        final long filterDataNativePtr;
        public float fps;
        public int height;
        public int rotation;
        public SurfaceView surfaceView;
        public int width;

        public RecorderParams(long j) {
            this.filterDataNativePtr = j;
        }
    }

    public AndroidCameraRecord(RecorderParams recorderParams) {
        this.params = recorderParams;
    }

    /* access modifiers changed from: protected */
    public int getExpectedBufferLength() {
        if (this.currentPreviewSize == null) {
            return -1;
        }
        return ((this.currentPreviewSize.width * this.currentPreviewSize.height) * 3) / 2;
    }

    /* access modifiers changed from: protected */
    public List<Camera.Size> getSupportedPreviewSizes(Camera.Parameters parameters) {
        return Collections.emptyList();
    }

    public List<Camera.Size> getSupportedVideoSizes() {
        return new ArrayList(this.supportedVideoSizes);
    }

    public boolean isStarted() {
        return this.previewStarted;
    }

    /* access modifiers changed from: protected */
    public abstract void lowLevelSetPreviewCallback(Camera camera2, Camera.PreviewCallback previewCallback);

    public void onPreviewStarted(Camera camera2) {
    }

    /* access modifiers changed from: protected */
    public void onSettingCameraParameters(Camera.Parameters parameters) {
    }

    /* access modifiers changed from: protected */
    public Camera openCamera(int i) {
        return Camera.open();
    }

    public void startPreview() {
        if (this.previewStarted) {
            Log.w("Already started");
            throw new RuntimeException("Video recorder already started");
        } else if (this.params.surfaceView.getVisibility() != 0) {
            Log.e("Illegal state: video capture surface view is not visible");
        } else {
            this.camera = openCamera(this.params.cameraId);
            this.camera.setErrorCallback(new Camera.ErrorCallback() {
                public void onError(int i, Camera camera) {
                    Log.e("Camera error : " + i);
                }
            });
            Camera.Parameters parameters = this.camera.getParameters();
            parameters.set("camera-id", this.params.cameraId);
            this.camera.setParameters(parameters);
            Camera.Parameters parameters2 = this.camera.getParameters();
            if (this.supportedVideoSizes == null) {
                this.supportedVideoSizes = new ArrayList(getSupportedPreviewSizes(parameters2));
            }
            if (this.params.width >= this.params.height) {
                parameters2.setPreviewSize(this.params.width, this.params.height);
            } else {
                parameters2.setPreviewSize(this.params.height, this.params.width);
            }
            parameters2.setPreviewFrameRate(Math.round(this.params.fps));
            onSettingCameraParameters(parameters2);
            this.camera.setParameters(parameters2);
            this.currentPreviewSize = this.camera.getParameters().getPreviewSize();
            try {
                this.camera.setPreviewDisplay(this.params.surfaceView.getHolder());
            } catch (Throwable th) {
                Log.e("Exception in Video capture setPreviewDisplay()", th);
            }
            try {
                this.camera.startPreview();
                this.previewStarted = true;
            } catch (Throwable th2) {
                Log.e("Can't start camera preview");
            }
            this.previewStarted = true;
            lowLevelSetPreviewCallback(this.camera, this.storedPreviewCallback);
            onPreviewStarted(this.camera);
        }
    }

    public void stopCaptureCallback() {
        if (this.camera != null) {
            lowLevelSetPreviewCallback(this.camera, (Camera.PreviewCallback) null);
        }
    }

    public void stopPreview() {
        if (this.previewStarted) {
            lowLevelSetPreviewCallback(this.camera, (Camera.PreviewCallback) null);
            this.camera.stopPreview();
            this.camera.release();
            this.camera = null;
            if (this.currentPreviewSize != null) {
                this.currentPreviewSize = null;
            }
            this.previewStarted = false;
        }
    }

    public void storePreviewCallBack(Camera.PreviewCallback previewCallback) {
        this.storedPreviewCallback = previewCallback;
        if (this.camera == null) {
            Log.w("Capture camera not ready, storing callback");
            return;
        }
        lowLevelSetPreviewCallback(this.camera, previewCallback);
    }
}
