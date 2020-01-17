package org.linphone.mediastream.video.capture;

import android.annotation.TargetApi;
import android.graphics.ImageFormat;
import android.hardware.Camera;
import java.util.Iterator;
import java.util.List;
import org.linphone.mediastream.Log;

@TargetApi(9)
public class AndroidVideoApi9JniWrapper {
    public static int detectCameras(int[] iArr, int[] iArr2, int[] iArr3) {
        return AndroidVideoApi5JniWrapper.detectCameras(iArr, iArr2, iArr3);
    }

    private static int[] findClosestEnclosingFpsRange(int i, List<int[]> list) {
        int abs;
        Log.d("Searching for closest fps range from " + i);
        if (list == null || list.size() == 0) {
            return new int[]{0, 0};
        }
        int[] iArr = list.get(0);
        int abs2 = Math.abs(iArr[1] - i) + Math.abs(iArr[0] - i);
        int[] iArr2 = iArr;
        for (int[] next : list) {
            if (next[0] <= i && next[1] >= i && (abs = Math.abs(next[0] - i) + Math.abs(next[1] - i)) < abs2 && next[0] != next[1]) {
                Log.d("A better range has been found: w=" + next[0] + ",h=" + next[1]);
                abs2 = abs;
                iArr2 = next;
            }
        }
        Log.d("The closest fps range is w=" + iArr2[0] + ",h=" + iArr2[1]);
        return iArr2;
    }

    public static int[] selectNearestResolutionAvailable(int i, int i2, int i3) {
        Log.d("selectNearestResolutionAvailable: " + i + ", " + i2 + "x" + i3);
        return AndroidVideoApi5JniWrapper.selectNearestResolutionAvailableForCamera(i, i2, i3);
    }

    private static void setCameraDisplayOrientation(int i, int i2, Camera camera) {
        Camera.CameraInfo cameraInfo = new Camera.CameraInfo();
        Camera.getCameraInfo(i2, cameraInfo);
        int i3 = cameraInfo.facing == 1 ? (360 - ((cameraInfo.orientation + i) % 360)) % 360 : ((cameraInfo.orientation - i) + 360) % 360;
        Log.w("Camera preview orientation: " + i3);
        try {
            camera.setDisplayOrientation(i3);
        } catch (Exception e) {
            Log.e("Failed to execute: camera[" + camera + "].setDisplayOrientation(" + i3 + ")");
            e.printStackTrace();
        }
    }

    public static void setPreviewDisplaySurface(Object obj, Object obj2) {
        AndroidVideoApi5JniWrapper.setPreviewDisplaySurface(obj, obj2);
    }

    public static Object startRecording(int i, int i2, int i3, int i4, int i5, final long j) {
        Log.d("startRecording(" + i + ", " + i2 + ", " + i3 + ", " + i4 + ", " + i5 + ", " + j + ")");
        try {
            Camera open = Camera.open(i);
            Camera.Parameters parameters = open.getParameters();
            Iterator<String> it = parameters.getSupportedFocusModes().iterator();
            while (true) {
                if (it.hasNext()) {
                    if (it.next().equalsIgnoreCase("continuous-video")) {
                        Log.d("FOCUS_MODE_CONTINUOUS_VIDEO is supported, let's use it");
                        parameters.setFocusMode("continuous-video");
                        break;
                    }
                } else {
                    break;
                }
            }
            if (parameters.isVideoStabilizationSupported()) {
                Log.d("Video stabilization is supported, let's use it");
                parameters.setVideoStabilization(true);
            }
            parameters.setPreviewSize(i2, i3);
            int[] findClosestEnclosingFpsRange = findClosestEnclosingFpsRange(i4 * 1000, parameters.getSupportedPreviewFpsRange());
            if (findClosestEnclosingFpsRange[0] != findClosestEnclosingFpsRange[1]) {
                parameters.setPreviewFpsRange(findClosestEnclosingFpsRange[0], findClosestEnclosingFpsRange[1]);
            }
            open.setParameters(parameters);
            int bitsPerPixel = ((i2 * i3) * ImageFormat.getBitsPerPixel(parameters.getPreviewFormat())) / 8;
            open.addCallbackBuffer(new byte[bitsPerPixel]);
            open.addCallbackBuffer(new byte[bitsPerPixel]);
            open.setPreviewCallbackWithBuffer(new Camera.PreviewCallback() {
                public void onPreviewFrame(byte[] bArr, Camera camera) {
                    if (bArr == null) {
                        Camera.Parameters parameters = camera.getParameters();
                        Camera.Size previewSize = parameters.getPreviewSize();
                        int i = previewSize.width;
                        int bitsPerPixel = (ImageFormat.getBitsPerPixel(parameters.getPreviewFormat()) * (previewSize.height * i)) / 8;
                        camera.addCallbackBuffer(new byte[(bitsPerPixel + (bitsPerPixel / 20))]);
                    } else if (AndroidVideoApi5JniWrapper.isRecording) {
                        AndroidVideoApi5JniWrapper.putImage(j, bArr);
                        camera.addCallbackBuffer(bArr);
                    }
                }
            });
            setCameraDisplayOrientation(i5, i, open);
            open.startPreview();
            AndroidVideoApi5JniWrapper.isRecording = true;
            Log.d("Returning camera object: " + open);
            return open;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void stopRecording(Object obj) {
        AndroidVideoApi5JniWrapper.isRecording = false;
        AndroidVideoApi8JniWrapper.stopRecording(obj);
    }
}
