package org.linphone.core;

import android.hardware.Camera;
import org.linphone.core.AndroidCameraRecord;

public class AndroidCameraRecordImpl extends AndroidCameraRecord implements Camera.PreviewCallback {
    private final double expectedTimeBetweenFrames;
    private long filterCtxPtr;
    private long lastFrameTime = 0;
    protected final int rotation;
    private double timeElapsedBetweenFrames = 0.0d;

    public AndroidCameraRecordImpl(AndroidCameraRecord.RecorderParams recorderParams) {
        super(recorderParams);
        this.expectedTimeBetweenFrames = 1.0d / ((double) Math.round(recorderParams.fps));
        this.filterCtxPtr = recorderParams.filterDataNativePtr;
        this.rotation = recorderParams.rotation;
        storePreviewCallBack(this);
    }

    private native void putImage(long j, byte[] bArr, int i);

    /* access modifiers changed from: protected */
    public void lowLevelSetPreviewCallback(Camera camera, Camera.PreviewCallback previewCallback) {
        camera.setPreviewCallback(previewCallback);
    }

    public void onPreviewFrame(byte[] bArr, Camera camera) {
        if (bArr == null) {
            Log.e("onPreviewFrame Called with null buffer");
        } else if (this.filterCtxPtr == 0) {
            Log.e("onPreviewFrame Called with no filterCtxPtr set");
        } else {
            int expectedBufferLength = getExpectedBufferLength();
            if (expectedBufferLength != bArr.length) {
                Log.e("onPreviewFrame called with bad buffer length " + bArr.length + " whereas expected is " + expectedBufferLength + " don't calling putImage");
                return;
            }
            long currentTimeMillis = System.currentTimeMillis();
            if (this.lastFrameTime == 0) {
                this.lastFrameTime = currentTimeMillis;
                putImage(this.filterCtxPtr, bArr, this.rotation);
                return;
            }
            double d = ((0.8d * ((double) (currentTimeMillis - this.lastFrameTime))) / 1000.0d) + (0.2d * this.timeElapsedBetweenFrames);
            if (d >= this.expectedTimeBetweenFrames) {
                this.lastFrameTime = currentTimeMillis;
                this.timeElapsedBetweenFrames = d;
                putImage(this.filterCtxPtr, bArr, this.rotation);
            }
        }
    }
}
