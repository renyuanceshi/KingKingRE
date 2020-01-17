package org.linphone.core;

import android.hardware.Camera;

public class AndroidCameraConf9 extends AndroidCameraConf {
    public void findFrontAndRearCameraIds9(Integer num, Integer num2, Integer num3) {
        for (int i = 0; i < getNumberOfCameras(); i++) {
            if (isFrontCamera(i)) {
            }
        }
    }

    public int getCameraOrientation(int i) {
        Camera.CameraInfo cameraInfo = new Camera.CameraInfo();
        if (i < 0) {
            i = 0;
        }
        Camera.getCameraInfo(i, cameraInfo);
        return cameraInfo.orientation;
    }

    public int getNumberOfCameras() {
        return Camera.getNumberOfCameras();
    }

    public boolean isFrontCamera(int i) {
        Camera.CameraInfo cameraInfo = new Camera.CameraInfo();
        if (i < 0) {
            i = 0;
        }
        Camera.getCameraInfo(i, cameraInfo);
        return cameraInfo.facing == 1;
    }
}
