package org.linphone;

import android.content.ContentUris;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.provider.Contacts;
import android.widget.ImageView;
import com.pccw.mobile.sip02.R;
import java.io.InputStream;

public class ContactsAsyncHelper extends Handler {
    private static final boolean DBG = false;
    private static final int DEFAULT_TOKEN = -1;
    private static final int EVENT_LOAD_IMAGE = 1;
    private static final String LOG_TAG = "PCCW_MOBILE_SIP";
    private static ContactsAsyncHelper sInstance = new ContactsAsyncHelper();
    private static Handler sThreadHandler;

    public static class ImageTracker {
        public static final int DISPLAY_DEFAULT = -2;
        public static final int DISPLAY_IMAGE = -1;
        public static final int DISPLAY_UNDEFINED = 0;
        private int displayMode = 0;
        private CallerInfo mCurrentCallerInfo = null;

        public int getPhotoState() {
            return this.displayMode;
        }

        public Uri getPhotoUri() {
            if (this.mCurrentCallerInfo != null) {
                return ContentUris.withAppendedId(Contacts.People.CONTENT_URI, this.mCurrentCallerInfo.person_id);
            }
            return null;
        }

        public boolean isDifferentImageRequest(CallerInfo callerInfo) {
            return this.mCurrentCallerInfo != callerInfo;
        }

        public void setPhotoRequest(CallerInfo callerInfo) {
            this.mCurrentCallerInfo = callerInfo;
        }

        public void setPhotoState(int i) {
            this.displayMode = i;
        }
    }

    public interface OnImageLoadCompleteListener {
        void onImageLoadComplete(int i, Object obj, ImageView imageView, boolean z);
    }

    private static final class WorkerArgs {
        public Context context;
        public Object cookie;
        public int defaultResource;
        public CallerInfo info;
        public OnImageLoadCompleteListener listener;
        public Object result;
        public Uri uri;
        public ImageView view;

        private WorkerArgs() {
        }
    }

    private class WorkerHandler extends Handler {
        public WorkerHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            WorkerArgs workerArgs = (WorkerArgs) message.obj;
            switch (message.arg1) {
                case 1:
                    InputStream openContactPhotoInputStream = Contacts.People.openContactPhotoInputStream(workerArgs.context.getContentResolver(), workerArgs.uri);
                    if (openContactPhotoInputStream == null) {
                        workerArgs.result = null;
                        break;
                    } else {
                        workerArgs.result = Drawable.createFromStream(openContactPhotoInputStream, workerArgs.uri.toString());
                        break;
                    }
            }
            Message obtainMessage = ContactsAsyncHelper.this.obtainMessage(message.what);
            obtainMessage.arg1 = message.arg1;
            obtainMessage.obj = message.obj;
            obtainMessage.sendToTarget();
        }
    }

    private ContactsAsyncHelper() {
        HandlerThread handlerThread = new HandlerThread("ContactsAsyncWorker");
        handlerThread.start();
        sThreadHandler = new WorkerHandler(handlerThread.getLooper());
    }

    public static final void updateImageViewWithContactPhotoAsync(Context context, ImageView imageView, Uri uri, int i) {
        updateImageViewWithContactPhotoAsync((CallerInfo) null, -1, (OnImageLoadCompleteListener) null, (Object) null, context, imageView, uri, i);
    }

    public static final void updateImageViewWithContactPhotoAsync(CallerInfo callerInfo, int i, OnImageLoadCompleteListener onImageLoadCompleteListener, Object obj, Context context, ImageView imageView, Uri uri, int i2) {
        if (uri == null) {
            imageView.setVisibility(0);
            imageView.setImageResource(i2);
            return;
        }
        WorkerArgs workerArgs = new WorkerArgs();
        workerArgs.cookie = obj;
        workerArgs.context = context;
        workerArgs.view = imageView;
        workerArgs.uri = uri;
        workerArgs.defaultResource = i2;
        workerArgs.listener = onImageLoadCompleteListener;
        workerArgs.info = callerInfo;
        Message obtainMessage = sThreadHandler.obtainMessage(i);
        obtainMessage.arg1 = 1;
        obtainMessage.obj = workerArgs;
        if (i2 != -1) {
            imageView.setVisibility(0);
            imageView.setImageResource(i2);
        } else {
            imageView.setVisibility(4);
        }
        sThreadHandler.sendMessage(obtainMessage);
    }

    public static final void updateImageViewWithContactPhotoAsync(CallerInfo callerInfo, Context context, ImageView imageView, Uri uri, int i) {
        updateImageViewWithContactPhotoAsync(callerInfo, -1, (OnImageLoadCompleteListener) null, (Object) null, context, imageView, uri, i);
    }

    public void handleMessage(Message message) {
        boolean z = false;
        WorkerArgs workerArgs = (WorkerArgs) message.obj;
        switch (message.arg1) {
            case 1:
                if (workerArgs.result != null) {
                    workerArgs.view.setScaleType(ImageView.ScaleType.CENTER);
                    workerArgs.view.setBackgroundResource(R.drawable.incall_photo_border);
                    workerArgs.view.setVisibility(0);
                    workerArgs.view.setImageDrawable((Drawable) workerArgs.result);
                    if (workerArgs.info != null) {
                        workerArgs.info.cachedPhoto = (Drawable) workerArgs.result;
                    }
                    z = true;
                } else if (workerArgs.defaultResource != -1) {
                    workerArgs.view.setVisibility(0);
                    workerArgs.view.setImageResource(workerArgs.defaultResource);
                }
                if (workerArgs.info != null) {
                    workerArgs.info.isCachedPhotoCurrent = true;
                }
                if (workerArgs.listener != null) {
                    workerArgs.listener.onImageLoadComplete(message.what, workerArgs.cookie, workerArgs.view, z);
                    return;
                }
                return;
            default:
                return;
        }
    }
}
