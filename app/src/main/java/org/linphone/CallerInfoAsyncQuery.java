package org.linphone;

import android.content.AsyncQueryHandler;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.provider.Contacts;
import android.telephony.PhoneNumberUtils;
import android.text.TextUtils;

public class CallerInfoAsyncQuery {
    private static final boolean DBG = false;
    private static final int EVENT_ADD_LISTENER = 2;
    private static final int EVENT_EMERGENCY_NUMBER = 4;
    private static final int EVENT_END_OF_QUEUE = 3;
    private static final int EVENT_NEW_QUERY = 1;
    private static final int EVENT_VOICEMAIL_NUMBER = 5;
    private static final String LOG_TAG = "PCCW_MOBILE_SIP";
    private CallerInfoAsyncQueryHandler mHandler;

    private class CallerInfoAsyncQueryHandler extends AsyncQueryHandler {
        /* access modifiers changed from: private */
        public CallerInfo mCallerInfo;
        /* access modifiers changed from: private */
        public Context mQueryContext;
        /* access modifiers changed from: private */
        public Uri mQueryUri;

        protected class CallerInfoWorkerHandler extends AsyncQueryHandler.WorkerHandler {
            public CallerInfoWorkerHandler(Looper looper) {
                super(CallerInfoAsyncQueryHandler.this, looper);
            }

            public void handleMessage(Message message) {
                AsyncQueryHandler.WorkerArgs workerArgs = (AsyncQueryHandler.WorkerArgs) message.obj;
                CookieWrapper cookieWrapper = (CookieWrapper) workerArgs.cookie;
                if (cookieWrapper == null) {
                    CallerInfoAsyncQueryHandler.super.handleMessage(message);
                    return;
                }
                switch (cookieWrapper.event) {
                    case 1:
                        CallerInfoAsyncQueryHandler.super.handleMessage(message);
                        return;
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                        Message obtainMessage = workerArgs.handler.obtainMessage(message.what);
                        obtainMessage.obj = workerArgs;
                        obtainMessage.arg1 = message.arg1;
                        obtainMessage.sendToTarget();
                        return;
                    default:
                        return;
                }
            }
        }

        private CallerInfoAsyncQueryHandler(Context context) {
            super(context.getContentResolver());
        }

        /* JADX WARNING: type inference failed for: r0v0, types: [android.os.Handler, org.linphone.CallerInfoAsyncQuery$CallerInfoAsyncQueryHandler$CallerInfoWorkerHandler] */
        /* access modifiers changed from: protected */
        public Handler createHandler(Looper looper) {
            return new CallerInfoWorkerHandler(looper);
        }

        /* access modifiers changed from: protected */
        public void onQueryComplete(int i, Object obj, Cursor cursor) {
            CookieWrapper cookieWrapper = (CookieWrapper) obj;
            if (cookieWrapper != null) {
                if (cookieWrapper.event == 3) {
                    CallerInfoAsyncQuery.this.release();
                    return;
                }
                if (this.mCallerInfo == null) {
                    if (this.mQueryContext == null || this.mQueryUri == null) {
                        throw new QueryPoolException("Bad context or query uri, or CallerInfoAsyncQuery already released.");
                    }
                    this.mCallerInfo = CallerInfo.getCallerInfo(this.mQueryContext, this.mQueryUri, cursor);
                    if (!TextUtils.isEmpty(cookieWrapper.number)) {
                        if (this.mCallerInfo.name == null && !cookieWrapper.number.equals(cookieWrapper.number2)) {
                            this.mCallerInfo.name = cookieWrapper.number2;
                        }
                        this.mCallerInfo.phoneNumber = PhoneNumberUtils.formatNumber(cookieWrapper.number);
                    }
                    CookieWrapper cookieWrapper2 = new CookieWrapper();
                    cookieWrapper2.event = 3;
                    startQuery(i, cookieWrapper2, (Uri) null, (String[]) null, (String) null, (String[]) null, (String) null);
                }
                if (cookieWrapper.listener != null) {
                    cookieWrapper.listener.onQueryComplete(i, cookieWrapper.cookie, this.mCallerInfo);
                }
            }
        }
    }

    private static final class CookieWrapper {
        public Object cookie;
        public int event;
        public OnQueryCompleteListener listener;
        public String number;
        public String number2;

        private CookieWrapper() {
        }
    }

    public interface OnQueryCompleteListener {
        void onQueryComplete(int i, Object obj, CallerInfo callerInfo);
    }

    public static class QueryPoolException extends SQLException {
        public QueryPoolException(String str) {
            super(str);
        }
    }

    private CallerInfoAsyncQuery() {
    }

    private void allocate(Context context, Uri uri) {
        if (context == null || uri == null) {
            throw new QueryPoolException("Bad context or query uri.");
        }
        this.mHandler = new CallerInfoAsyncQueryHandler(context);
        Context unused = this.mHandler.mQueryContext = context;
        Uri unused2 = this.mHandler.mQueryUri = uri;
    }

    private static void log(String str) {
    }

    /* access modifiers changed from: private */
    public void release() {
        Context unused = this.mHandler.mQueryContext = null;
        Uri unused2 = this.mHandler.mQueryUri = null;
        CallerInfo unused3 = this.mHandler.mCallerInfo = null;
        this.mHandler = null;
    }

    public static CallerInfoAsyncQuery startQuery(int i, Context context, Uri uri, OnQueryCompleteListener onQueryCompleteListener, Object obj) {
        CallerInfoAsyncQuery callerInfoAsyncQuery = new CallerInfoAsyncQuery();
        callerInfoAsyncQuery.allocate(context, uri);
        CookieWrapper cookieWrapper = new CookieWrapper();
        cookieWrapper.listener = onQueryCompleteListener;
        cookieWrapper.cookie = obj;
        cookieWrapper.event = 1;
        callerInfoAsyncQuery.mHandler.startQuery(i, cookieWrapper, uri, (String[]) null, (String) null, (String[]) null, (String) null);
        return callerInfoAsyncQuery;
    }

    public static CallerInfoAsyncQuery startQuery(int i, Context context, String str, String str2, OnQueryCompleteListener onQueryCompleteListener, Object obj) {
        Uri withAppendedPath = Uri.withAppendedPath(Contacts.Phones.CONTENT_FILTER_URL, str.contains("&") ? str.substring(0, str.indexOf("&")) : str);
        CallerInfoAsyncQuery callerInfoAsyncQuery = new CallerInfoAsyncQuery();
        callerInfoAsyncQuery.allocate(context, withAppendedPath);
        CookieWrapper cookieWrapper = new CookieWrapper();
        cookieWrapper.listener = onQueryCompleteListener;
        cookieWrapper.cookie = obj;
        cookieWrapper.number = str;
        cookieWrapper.number2 = str2;
        cookieWrapper.event = 1;
        callerInfoAsyncQuery.mHandler.startQuery(i, cookieWrapper, withAppendedPath, (String[]) null, (String) null, (String[]) null, (String) null);
        return callerInfoAsyncQuery;
    }

    public void addQueryListener(int i, OnQueryCompleteListener onQueryCompleteListener, Object obj) {
        CookieWrapper cookieWrapper = new CookieWrapper();
        cookieWrapper.listener = onQueryCompleteListener;
        cookieWrapper.cookie = obj;
        cookieWrapper.event = 2;
        this.mHandler.startQuery(i, cookieWrapper, (Uri) null, (String[]) null, (String) null, (String[]) null, (String) null);
    }
}
