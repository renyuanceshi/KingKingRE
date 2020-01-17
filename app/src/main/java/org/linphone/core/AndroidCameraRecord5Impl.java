package org.linphone.core;

import android.hardware.Camera;
import java.util.List;
import org.linphone.core.AndroidCameraRecord;

public class AndroidCameraRecord5Impl extends AndroidCameraRecordImpl {
    public AndroidCameraRecord5Impl(AndroidCameraRecord.RecorderParams recorderParams) {
        super(recorderParams);
    }

    public static List<Camera.Size> oneShotSupportedVideoSizes() {
        Camera open = Camera.open();
        List<Camera.Size> supportedPreviewSizes = open.getParameters().getSupportedPreviewSizes();
        open.release();
        return supportedPreviewSizes;
    }

    /* access modifiers changed from: protected */
    public List<Camera.Size> getSupportedPreviewSizes(Camera.Parameters parameters) {
        return parameters.getSupportedPreviewSizes();
    }

    /* access modifiers changed from: protected */
    public void onSettingCameraParameters(Camera.Parameters parameters) {
        super.onSettingCameraParameters(parameters);
        if (parameters.getSupportedFocusModes().contains("auto")) {
            Log.w("Auto Focus supported by camera device");
            parameters.setFocusMode("auto");
            return;
        }
        Log.w("Auto Focus not supported by camera device");
        if (parameters.getSupportedFocusModes().contains("infinity")) {
            Log.w("Infinity Focus supported by camera device");
            parameters.setFocusMode("infinity");
            return;
        }
        Log.w("Infinity Focus not supported by camera device");
    }
}
