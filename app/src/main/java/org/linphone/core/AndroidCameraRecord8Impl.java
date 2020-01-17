package org.linphone.core;

import android.hardware.Camera;
import org.linphone.core.AndroidCameraRecord;

public class AndroidCameraRecord8Impl extends AndroidCameraRecord5Impl {
    public AndroidCameraRecord8Impl(AndroidCameraRecord.RecorderParams recorderParams) {
        super(recorderParams);
    }

    /* access modifiers changed from: protected */
    public void lowLevelSetPreviewCallback(Camera camera, Camera.PreviewCallback previewCallback) {
        if (previewCallback != null) {
            Log.d("Setting optimized callback with buffer (Android >= 8). Remember to manage the pool of buffers!!!");
        }
        camera.setPreviewCallbackWithBuffer(previewCallback);
    }

    public void onPreviewFrame(byte[] bArr, Camera camera) {
        super.onPreviewFrame(bArr, camera);
        camera.addCallbackBuffer(bArr);
    }

    public void onPreviewStarted(Camera camera) {
        super.onPreviewStarted(camera);
        Camera.Size previewSize = camera.getParameters().getPreviewSize();
        int i = ((previewSize.width * previewSize.height) * 3) / 2;
        camera.addCallbackBuffer(new byte[i]);
        camera.addCallbackBuffer(new byte[i]);
    }

    /* access modifiers changed from: protected */
    public void onSettingCameraParameters(Camera.Parameters parameters) {
        super.onSettingCameraParameters(parameters);
        this.camera.setDisplayOrientation(this.rotation);
    }
}
