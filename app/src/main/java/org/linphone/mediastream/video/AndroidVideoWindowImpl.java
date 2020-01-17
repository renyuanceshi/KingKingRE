package org.linphone.mediastream.video;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.opengl.GLSurfaceView;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;
import org.linphone.mediastream.Log;
import org.linphone.mediastream.video.display.OpenGLESDisplay;

public class AndroidVideoWindowImpl {
    /* access modifiers changed from: private */
    public Bitmap mBitmap = null;
    /* access modifiers changed from: private */
    public VideoWindowListener mListener = null;
    /* access modifiers changed from: private */
    public Surface mSurface = null;
    /* access modifiers changed from: private */
    public SurfaceView mVideoPreviewView;
    /* access modifiers changed from: private */
    public SurfaceView mVideoRenderingView;
    private Renderer renderer;
    /* access modifiers changed from: private */
    public boolean useGLrendering;

    private static class Renderer implements GLSurfaceView.Renderer {
        int height;
        boolean initPending = false;
        long ptr = 0;
        int width;

        public void onDrawFrame(GL10 gl10) {
            synchronized (this) {
                if (this.ptr != 0) {
                    if (this.initPending) {
                        OpenGLESDisplay.init(this.ptr, this.width, this.height);
                        this.initPending = false;
                    }
                    OpenGLESDisplay.render(this.ptr);
                }
            }
        }

        public void onSurfaceChanged(GL10 gl10, int i, int i2) {
            this.width = i;
            this.height = i2;
            this.initPending = true;
        }

        public void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
        }

        public void setOpenGLESDisplay(long j) {
            synchronized (this) {
                if (!(this.ptr == 0 || j == this.ptr)) {
                    this.initPending = true;
                }
                this.ptr = j;
            }
        }
    }

    public interface VideoWindowListener {
        void onVideoPreviewSurfaceDestroyed(AndroidVideoWindowImpl androidVideoWindowImpl);

        void onVideoPreviewSurfaceReady(AndroidVideoWindowImpl androidVideoWindowImpl, SurfaceView surfaceView);

        void onVideoRenderingSurfaceDestroyed(AndroidVideoWindowImpl androidVideoWindowImpl);

        void onVideoRenderingSurfaceReady(AndroidVideoWindowImpl androidVideoWindowImpl, SurfaceView surfaceView);
    }

    public AndroidVideoWindowImpl(SurfaceView surfaceView, SurfaceView surfaceView2) {
        this.mVideoRenderingView = surfaceView;
        this.mVideoPreviewView = surfaceView2;
        this.useGLrendering = (surfaceView instanceof GLSurfaceView) || (this.mVideoPreviewView instanceof GLSurfaceView);
    }

    public AndroidVideoWindowImpl(SurfaceView surfaceView, SurfaceView surfaceView2, VideoWindowListener videoWindowListener) {
        this.mVideoRenderingView = surfaceView;
        this.mVideoPreviewView = surfaceView2;
        this.useGLrendering = (surfaceView instanceof GLSurfaceView) || (this.mVideoPreviewView instanceof GLSurfaceView);
        this.mListener = videoWindowListener;
        init();
    }

    public static int rotationToAngle(int i) {
        switch (i) {
            case 1:
                return 90;
            case 2:
                return 180;
            case 3:
                return 270;
            default:
                return 0;
        }
    }

    public Bitmap getBitmap() {
        if (this.useGLrendering) {
            Log.e("View class does not match Video display filter used (you must use a non-GL View)");
        }
        return this.mBitmap;
    }

    public SurfaceView getPreviewSurfaceView() {
        if (this.useGLrendering) {
            Log.e("View class does not match Video display filter used (you must use a non-GL View)");
        }
        return this.mVideoPreviewView;
    }

    public Surface getSurface() {
        if (this.useGLrendering) {
            Log.e("View class does not match Video display filter used (you must use a non-GL View)");
        }
        if (this.mVideoRenderingView != null) {
            return this.mVideoRenderingView.getHolder().getSurface();
        }
        return null;
    }

    public void init() {
        if (this.mVideoRenderingView != null) {
            this.mVideoRenderingView.getHolder().addCallback(new SurfaceHolder.Callback() {
                public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
                    Log.i("Video display surface is being changed.");
                    if (!AndroidVideoWindowImpl.this.useGLrendering) {
                        synchronized (AndroidVideoWindowImpl.this) {
                            Bitmap unused = AndroidVideoWindowImpl.this.mBitmap = Bitmap.createBitmap(i2, i3, Bitmap.Config.RGB_565);
                            Surface unused2 = AndroidVideoWindowImpl.this.mSurface = surfaceHolder.getSurface();
                        }
                    }
                    if (AndroidVideoWindowImpl.this.mListener != null) {
                        AndroidVideoWindowImpl.this.mListener.onVideoRenderingSurfaceReady(AndroidVideoWindowImpl.this, AndroidVideoWindowImpl.this.mVideoRenderingView);
                    }
                    Log.w("Video display surface changed");
                }

                public void surfaceCreated(SurfaceHolder surfaceHolder) {
                    Log.w("Video display surface created");
                }

                public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
                    if (!AndroidVideoWindowImpl.this.useGLrendering) {
                        synchronized (AndroidVideoWindowImpl.this) {
                            Surface unused = AndroidVideoWindowImpl.this.mSurface = null;
                            Bitmap unused2 = AndroidVideoWindowImpl.this.mBitmap = null;
                        }
                    }
                    if (AndroidVideoWindowImpl.this.mListener != null) {
                        AndroidVideoWindowImpl.this.mListener.onVideoRenderingSurfaceDestroyed(AndroidVideoWindowImpl.this);
                    }
                    Log.d("Video display surface destroyed");
                }
            });
        }
        if (this.mVideoPreviewView != null) {
            this.mVideoPreviewView.getHolder().addCallback(new SurfaceHolder.Callback() {
                public void surfaceChanged(SurfaceHolder surfaceHolder, int i, int i2, int i3) {
                    Log.i("Video preview surface is being changed.");
                    if (AndroidVideoWindowImpl.this.mListener != null) {
                        AndroidVideoWindowImpl.this.mListener.onVideoPreviewSurfaceReady(AndroidVideoWindowImpl.this, AndroidVideoWindowImpl.this.mVideoPreviewView);
                    }
                    Log.w("Video preview surface changed");
                }

                public void surfaceCreated(SurfaceHolder surfaceHolder) {
                    Log.w("Video preview surface created");
                }

                public void surfaceDestroyed(SurfaceHolder surfaceHolder) {
                    if (AndroidVideoWindowImpl.this.mListener != null) {
                        AndroidVideoWindowImpl.this.mListener.onVideoPreviewSurfaceDestroyed(AndroidVideoWindowImpl.this);
                    }
                    Log.d("Video preview surface destroyed");
                }
            });
        }
        if (this.useGLrendering && this.mVideoRenderingView != null) {
            this.renderer = new Renderer();
            GLSurfaceView gLSurfaceView = this.mVideoRenderingView != null ? (GLSurfaceView) this.mVideoRenderingView : (GLSurfaceView) this.mVideoPreviewView;
            gLSurfaceView.setRenderer(this.renderer);
            gLSurfaceView.setRenderMode(0);
        }
    }

    public void release() {
    }

    public void requestRender() {
        if (this.mVideoRenderingView != null) {
            ((GLSurfaceView) this.mVideoRenderingView).requestRender();
        }
    }

    public void setListener(VideoWindowListener videoWindowListener) {
        this.mListener = videoWindowListener;
    }

    public void setOpenGLESDisplay(long j) {
        if (!this.useGLrendering) {
            Log.e("View class does not match Video display filter used (you must use a GL View)");
        }
        if (this.renderer != null) {
            this.renderer.setOpenGLESDisplay(j);
        }
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
