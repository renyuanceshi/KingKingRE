package org.linphone.core;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

public class AndroidVideoWindowImpl {
    static final int LANDSCAPE = 0;
    static final int PORTRAIT = 1;
    /* access modifiers changed from: private */
    public Bitmap mBitmap = null;
    /* access modifiers changed from: private */
    public VideoWindowListener mListener = null;
    /* access modifiers changed from: private */
    public Surface mSurface = null;
    private SurfaceView mView;

    public interface VideoWindowListener {
        void onSurfaceDestroyed(AndroidVideoWindowImpl androidVideoWindowImpl);

        void onSurfaceReady(AndroidVideoWindowImpl androidVideoWindowImpl);
    }

    public AndroidVideoWindowImpl(SurfaceView surfaceView) {
        this.mView = surfaceView;
        surfaceView.getHolder().addCallback(new SurfaceHolder.Callback() {
            public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
                Log.i("Surface is being changed.");
                synchronized (AndroidVideoWindowImpl.this) {
                    Bitmap unused = AndroidVideoWindowImpl.this.mBitmap = Bitmap.createBitmap(i2, i3, Bitmap.Config.RGB_565);
                    Surface unused2 = AndroidVideoWindowImpl.this.mSurface = surfaceHolder.getSurface();
                }
                if (AndroidVideoWindowImpl.this.mListener != null) {
                    AndroidVideoWindowImpl.this.mListener.onSurfaceReady(AndroidVideoWindowImpl.this);
                }
                Log.w("Video display surface changed");
            }

            public void surfaceCreated(SurfaceHolder surfaceHolder) {
                Log.w("Video display surface created");
            }

            public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
                synchronized (AndroidVideoWindowImpl.this) {
                    Surface unused = AndroidVideoWindowImpl.this.mSurface = null;
                    Bitmap unused2 = AndroidVideoWindowImpl.this.mBitmap = null;
                }
                if (AndroidVideoWindowImpl.this.mListener != null) {
                    AndroidVideoWindowImpl.this.mListener.onSurfaceDestroyed(AndroidVideoWindowImpl.this);
                }
                Log.d("Video display surface destroyed");
            }
        });
    }

    public Bitmap getBitmap() {
        return this.mBitmap;
    }

    public Surface getSurface() {
        return this.mView.getHolder().getSurface();
    }

    public void requestOrientation(int i) {
    }

    public void setListener(VideoWindowListener videoWindowListener) {
        this.mListener = videoWindowListener;
    }

    public void update() {
        synchronized (this) {
            if (this.mSurface != null) {
                try {
                    Canvas lockCanvas = this.mSurface.lockCanvas((Rect) null);
                    lockCanvas.drawBitmap(this.mBitmap, 0.0f, 0.0f, (Paint) null);
                    this.mSurface.unlockCanvasAndPost(lockCanvas);
                } catch (IllegalArgumentException e) {
                    e.printStackTrace();
                } catch (Surface.OutOfResourcesException e2) {
                    e2.printStackTrace();
                }
            }
        }
        return;
    }
}
