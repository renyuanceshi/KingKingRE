package org.linphone.core;

public class AndroidCameraConf {
    public void findFrontAndRearCameraIds(int[] iArr, int[] iArr2, int[] iArr3) {
        Log.i("Detecting cameras");
        if (Hacks.isGalaxyS()) {
            Log.d("Hack Galaxy S : has 2 cameras front=2; rear=1");
            iArr[0] = 2;
            iArr2[0] = 1;
            iArr3[0] = iArr2[0];
        }
    }

    public int getCameraOrientation(int i) {
        if (i != 2 || !Hacks.isGalaxyS()) {
            return 0;
        }
        Log.d("Hack Galaxy S : rear camera id=2 ; mounted landscape");
        return 90;
    }

    public int getNumberOfCameras() {
        if (!Hacks.isGalaxyS()) {
            return 1;
        }
        Log.d("Hack Galaxy S : has 2 cameras");
        return 2;
    }

    public boolean isFrontCamera(int i) {
        if (i != 2 || !Hacks.isGalaxyS()) {
            return false;
        }
        Log.d("Hack Galaxy S : front camera has id=2");
        return true;
    }
}
