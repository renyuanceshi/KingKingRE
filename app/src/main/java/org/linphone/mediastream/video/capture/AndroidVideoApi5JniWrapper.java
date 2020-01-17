package org.linphone.mediastream.video.capture;

import android.hardware.Camera;
import android.support.v7.widget.ActivityChooserView;
import android.view.SurfaceView;
import java.util.Iterator;
import java.util.List;
import org.linphone.mediastream.Log;
import org.linphone.mediastream.Version;
import org.linphone.mediastream.video.AndroidVideoWindowImpl;
import org.linphone.mediastream.video.capture.hwconf.AndroidCameraConfiguration;

public class AndroidVideoApi5JniWrapper {
    public static boolean isRecording = false;

    public static void activateAutoFocus(Object obj) {
        Log.d("mediastreamer", "Turning on autofocus on camera " + obj);
        Camera camera = (Camera) obj;
        if (camera == null) {
            return;
        }
        if (camera.getParameters().getFocusMode() == "auto" || camera.getParameters().getFocusMode() == "macro") {
            camera.autoFocus((Camera.AutoFocusCallback) null);
        }
    }

    protected static void applyCameraParameters(Camera camera, int i, int i2, int i3) {
        Camera.Parameters parameters = camera.getParameters();
        parameters.setPreviewSize(i, i2);
        List<Integer> supportedPreviewFrameRates = parameters.getSupportedPreviewFrameRates();
        if (supportedPreviewFrameRates != null) {
            int i4 = Integer.MAX_VALUE;
            for (Integer next : supportedPreviewFrameRates) {
                int abs = Math.abs(next.intValue() - i3);
                if (abs < i4) {
                    parameters.setPreviewFrameRate(next.intValue());
                    i4 = abs;
                }
            }
            Log.d("mediastreamer", "Preview framerate set:" + parameters.getPreviewFrameRate());
        }
        camera.setParameters(parameters);
    }

    public static int detectCameras(int[] iArr, int[] iArr2, int[] iArr3) {
        Log.d("detectCameras\n");
        AndroidCameraConfiguration.AndroidCamera[] retrieveCameras = AndroidCameraConfiguration.retrieveCameras();
        int length = retrieveCameras.length;
        int i = 0;
        int i2 = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            AndroidCameraConfiguration.AndroidCamera androidCamera = retrieveCameras[i];
            if (i2 == 2) {
                Log.w("Returning only the 2 first cameras (increase buffer size to retrieve all)");
                break;
            }
            iArr[i2] = androidCamera.id;
            iArr2[i2] = androidCamera.frontFacing ? 1 : 0;
            iArr3[i2] = androidCamera.orientation;
            i2++;
            i++;
        }
        return i2;
    }

    public static native void putImage(long j, byte[] bArr);

    public static int[] selectNearestResolutionAvailable(int i, int i2, int i3) {
        Log.d("mediastreamer", "selectNearestResolutionAvailable: " + i + ", " + i2 + "x" + i3);
        return selectNearestResolutionAvailableForCamera(i, i2, i3);
    }

    protected static int[] selectNearestResolutionAvailableForCamera(int i, int i2, int i3) {
        int i4;
        int i5;
        if (i3 > i2) {
            i4 = i2;
            i5 = i3;
        } else {
            i4 = i3;
            i5 = i2;
        }
        AndroidCameraConfiguration.AndroidCamera[] retrieveCameras = AndroidCameraConfiguration.retrieveCameras();
        List<AndroidCameraConfiguration.AndroidCamera.Size> list = null;
        int length = retrieveCameras.length;
        int i6 = 0;
        while (i6 < length) {
            AndroidCameraConfiguration.AndroidCamera androidCamera = retrieveCameras[i6];
            i6++;
            list = androidCamera.id == i ? androidCamera.resolutions : list;
        }
        if (list == null) {
            Log.e("mediastreamer", "Failed to retrieve supported resolutions.");
            return null;
        }
        Log.i("mediastreamer", list.size() + " supported resolutions :");
        for (AndroidCameraConfiguration.AndroidCamera.Size next : list) {
            Log.i("mediastreamer", "\t" + next.width + "x" + next.height);
        }
        int max = Math.max(i5, i4);
        int min = Math.min(i5, i4);
        try {
            int i7 = max * min;
            int i8 = ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
            int i9 = 0;
            Iterator<AndroidCameraConfiguration.AndroidCamera.Size> it = list.iterator();
            AndroidCameraConfiguration.AndroidCamera.Size size = list.get(0);
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                AndroidCameraConfiguration.AndroidCamera.Size next2 = it.next();
                int i10 = (i7 - (next2.width * next2.height)) * -1;
                if (((next2.width >= max && next2.height >= min) || (next2.width >= min && next2.height >= max)) && i10 < i8) {
                    i9 = 0;
                    size = next2;
                    i8 = i10;
                }
                int i11 = (i7 - ((next2.width * next2.height) / 4)) * -1;
                if (((next2.width / 2 >= max && next2.height / 2 >= min) || (next2.width / 2 >= min && next2.height / 2 >= max)) && i11 < i8) {
                    if (Version.hasFastCpuWithAsmOptim()) {
                        i9 = 1;
                        i8 = i11;
                        size = next2;
                    } else {
                        size = next2;
                        i9 = 0;
                    }
                }
                if (next2.width == max && next2.height == min) {
                    i9 = 0;
                    size = next2;
                    break;
                }
            }
            int[] iArr = new int[3];
            iArr[0] = size.width;
            iArr[1] = size.height;
            iArr[2] = i9;
            try {
                Log.i("mediastreamer", "resolution selection done (" + iArr[0] + ", " + iArr[1] + ", " + iArr[2] + ")");
                return iArr;
            } catch (Exception e) {
                e = e;
            }
        } catch (Exception e2) {
            e = e2;
            Log.e(e, "mediastreamer", " resolution selection failed");
            return null;
        }
    }

    public static void setPreviewDisplaySurface(Object obj, Object obj2) {
        Log.d("mediastreamer", "setPreviewDisplaySurface(" + obj + ", " + obj2 + ")");
        Camera camera = (Camera) obj;
        try {
            if (obj2 instanceof SurfaceView) {
                camera.setPreviewDisplay(((SurfaceView) obj2).getHolder());
            } else {
                camera.setPreviewDisplay(((AndroidVideoWindowImpl) obj2).getPreviewSurfaceView().getHolder());
            }
        } catch (Exception e) {
            Log.e(e);
            e.printStackTrace();
        }
    }

    public static Object startRecording(int i, int i2, int i3, int i4, int i5, final long j) {
        Log.d("mediastreamer", "startRecording(" + i + ", " + i2 + ", " + i3 + ", " + i4 + ", " + i5 + ", " + j + ")");
        Camera open = Camera.open();
        applyCameraParameters(open, i2, i3, i4);
        open.setPreviewCallback(new Camera.PreviewCallback() {
            public void onPreviewFrame(byte[] bArr, Camera camera) {
                if (AndroidVideoApi5JniWrapper.isRecording) {
                    AndroidVideoApi5JniWrapper.putImage(j, bArr);
                }
            }
        });
        open.startPreview();
        isRecording = true;
        Log.d("mediastreamer", "Returning camera object: " + open);
        return open;
    }

    public static void stopRecording(Object obj) {
        isRecording = false;
        Log.d("mediastreamer", "stopRecording(" + obj + ")");
        Camera camera = (Camera) obj;
        if (camera != null) {
            camera.setPreviewCallback((Camera.PreviewCallback) null);
            camera.stopPreview();
            camera.release();
            return;
        }
        Log.i("mediastreamer", "Cannot stop recording ('camera' is null)");
    }
}
