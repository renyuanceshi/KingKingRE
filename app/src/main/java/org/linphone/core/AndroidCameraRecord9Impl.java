package org.linphone.core;

import android.hardware.Camera;
import org.linphone.core.AndroidCameraRecord;

public class AndroidCameraRecord9Impl extends AndroidCameraRecord8Impl {
    public AndroidCameraRecord9Impl(AndroidCameraRecord.RecorderParams recorderParams) {
        super(recorderParams);
    }

    /* access modifiers changed from: protected */
    public Camera openCamera(int i) {
        return Camera.open(i);
    }
}
