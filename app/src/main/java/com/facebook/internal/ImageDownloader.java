package com.facebook.internal;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import com.facebook.internal.WorkQueue;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

public class ImageDownloader {
    private static final int CACHE_READ_QUEUE_MAX_CONCURRENT = 2;
    private static final int DOWNLOAD_QUEUE_MAX_CONCURRENT = 8;
    private static WorkQueue cacheReadQueue = new WorkQueue(2);
    private static WorkQueue downloadQueue = new WorkQueue(8);
    private static Handler handler;
    private static final Map<RequestKey, DownloaderContext> pendingRequests = new HashMap();

    private static class CacheReadWorkItem implements Runnable {
        private boolean allowCachedRedirects;
        private Context context;
        private RequestKey key;

        CacheReadWorkItem(Context context2, RequestKey requestKey, boolean z) {
            this.context = context2;
            this.key = requestKey;
            this.allowCachedRedirects = z;
        }

        public void run() {
            ImageDownloader.readFromCache(this.key, this.context, this.allowCachedRedirects);
        }
    }

    private static class DownloadImageWorkItem implements Runnable {
        private Context context;
        private RequestKey key;

        DownloadImageWorkItem(Context context2, RequestKey requestKey) {
            this.context = context2;
            this.key = requestKey;
        }

        public void run() {
            ImageDownloader.download(this.key, this.context);
        }
    }

    private static class DownloaderContext {
        boolean isCancelled;
        ImageRequest request;
        WorkQueue.WorkItem workItem;

        private DownloaderContext() {
        }
    }

    private static class RequestKey {
        private static final int HASH_MULTIPLIER = 37;
        private static final int HASH_SEED = 29;
        Object tag;
        Uri uri;

        RequestKey(Uri uri2, Object obj) {
            this.uri = uri2;
            this.tag = obj;
        }

        public boolean equals(Object obj) {
            if (obj == null || !(obj instanceof RequestKey)) {
                return false;
            }
            RequestKey requestKey = (RequestKey) obj;
            return requestKey.uri == this.uri && requestKey.tag == this.tag;
        }

        public int hashCode() {
            return ((this.uri.hashCode() + 1073) * 37) + this.tag.hashCode();
        }
    }

    public static boolean cancelRequest(ImageRequest imageRequest) {
        boolean z;
        RequestKey requestKey = new RequestKey(imageRequest.getImageUri(), imageRequest.getCallerTag());
        synchronized (pendingRequests) {
            DownloaderContext downloaderContext = pendingRequests.get(requestKey);
            if (downloaderContext == null) {
                z = false;
            } else if (downloaderContext.workItem.cancel()) {
                pendingRequests.remove(requestKey);
                z = true;
            } else {
                downloaderContext.isCancelled = true;
                z = true;
            }
        }
        return z;
    }

    public static void clearCache(Context context) {
        ImageResponseCache.clearCache(context);
        UrlRedirectCache.clearCache();
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x0081, code lost:
        com.facebook.internal.Utility.closeQuietly(r5);
        com.facebook.internal.Utility.disconnectQuietly(r0);
        r4 = r3;
        r0 = r6;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x00ba, code lost:
        r1 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x00bb, code lost:
        r5 = null;
        r2 = r0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x00c4, code lost:
        r3 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:0x00c5, code lost:
        r5 = null;
        r6 = true;
        r7 = r0;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x004d  */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x00ba A[ExcHandler: all (th java.lang.Throwable), Splitter:B:4:0x0015] */
    /* JADX WARNING: Removed duplicated region for block: B:55:? A[RETURN, SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void download(com.facebook.internal.ImageDownloader.RequestKey r10, android.content.Context r11) {
        /*
            r1 = 1
            r2 = 0
            r4 = 0
            java.net.URL r0 = new java.net.URL     // Catch:{ IOException -> 0x00be, all -> 0x00b5 }
            android.net.Uri r3 = r10.uri     // Catch:{ IOException -> 0x00be, all -> 0x00b5 }
            java.lang.String r3 = r3.toString()     // Catch:{ IOException -> 0x00be, all -> 0x00b5 }
            r0.<init>(r3)     // Catch:{ IOException -> 0x00be, all -> 0x00b5 }
            java.net.URLConnection r0 = r0.openConnection()     // Catch:{ IOException -> 0x00be, all -> 0x00b5 }
            java.net.HttpURLConnection r0 = (java.net.HttpURLConnection) r0     // Catch:{ IOException -> 0x00be, all -> 0x00b5 }
            r3 = 0
            r0.setInstanceFollowRedirects(r3)     // Catch:{ IOException -> 0x00c4, all -> 0x00ba }
            int r3 = r0.getResponseCode()     // Catch:{ IOException -> 0x00c4, all -> 0x00ba }
            switch(r3) {
                case 200: goto L_0x008a;
                case 301: goto L_0x0051;
                case 302: goto L_0x0051;
                default: goto L_0x001f;
            }     // Catch:{ IOException -> 0x00c4, all -> 0x00ba }
        L_0x001f:
            java.io.InputStream r5 = r0.getErrorStream()     // Catch:{ IOException -> 0x00c4, all -> 0x00ba }
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            r3.<init>()     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            if (r5 == 0) goto L_0x00a2
            java.io.InputStreamReader r6 = new java.io.InputStreamReader     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            r6.<init>(r5)     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            r7 = 128(0x80, float:1.794E-43)
            char[] r7 = new char[r7]     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
        L_0x0033:
            r8 = 0
            int r9 = r7.length     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            int r8 = r6.read(r7, r8, r9)     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            if (r8 <= 0) goto L_0x0094
            r9 = 0
            r3.append(r7, r9, r8)     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            goto L_0x0033
        L_0x0040:
            r3 = move-exception
            r6 = r1
            r7 = r0
        L_0x0043:
            com.facebook.internal.Utility.closeQuietly(r5)
            com.facebook.internal.Utility.disconnectQuietly(r7)
            r1 = r6
            r0 = r3
        L_0x004b:
            if (r1 == 0) goto L_0x0050
            issueResponse(r10, r0, r4, r2)
        L_0x0050:
            return
        L_0x0051:
            java.lang.String r1 = "location"
            java.lang.String r1 = r0.getHeaderField(r1)     // Catch:{ IOException -> 0x00ca, all -> 0x00ba }
            boolean r3 = com.facebook.internal.Utility.isNullOrEmpty((java.lang.String) r1)     // Catch:{ IOException -> 0x00ca, all -> 0x00ba }
            if (r3 != 0) goto L_0x00d1
            android.net.Uri r1 = android.net.Uri.parse(r1)     // Catch:{ IOException -> 0x00ca, all -> 0x00ba }
            android.net.Uri r3 = r10.uri     // Catch:{ IOException -> 0x00ca, all -> 0x00ba }
            com.facebook.internal.UrlRedirectCache.cacheUriRedirect(r3, r1)     // Catch:{ IOException -> 0x00ca, all -> 0x00ba }
            com.facebook.internal.ImageDownloader$DownloaderContext r3 = removePendingRequest(r10)     // Catch:{ IOException -> 0x00ca, all -> 0x00ba }
            if (r3 == 0) goto L_0x00d1
            boolean r5 = r3.isCancelled     // Catch:{ IOException -> 0x00ca, all -> 0x00ba }
            if (r5 != 0) goto L_0x00d1
            com.facebook.internal.ImageRequest r3 = r3.request     // Catch:{ IOException -> 0x00ca, all -> 0x00ba }
            com.facebook.internal.ImageDownloader$RequestKey r5 = new com.facebook.internal.ImageDownloader$RequestKey     // Catch:{ IOException -> 0x00ca, all -> 0x00ba }
            java.lang.Object r6 = r10.tag     // Catch:{ IOException -> 0x00ca, all -> 0x00ba }
            r5.<init>(r1, r6)     // Catch:{ IOException -> 0x00ca, all -> 0x00ba }
            r1 = 0
            enqueueCacheRead(r3, r5, r1)     // Catch:{ IOException -> 0x00ca, all -> 0x00ba }
            r1 = r2
            r3 = r4
            r5 = r4
            r6 = r4
        L_0x0081:
            com.facebook.internal.Utility.closeQuietly(r5)
            com.facebook.internal.Utility.disconnectQuietly(r0)
            r4 = r3
            r0 = r6
            goto L_0x004b
        L_0x008a:
            java.io.InputStream r5 = com.facebook.internal.ImageResponseCache.interceptAndCacheImageStream(r11, r0)     // Catch:{ IOException -> 0x00c4, all -> 0x00ba }
            android.graphics.Bitmap r3 = android.graphics.BitmapFactory.decodeStream(r5)     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            r6 = r4
            goto L_0x0081
        L_0x0094:
            com.facebook.internal.Utility.closeQuietly(r6)     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
        L_0x0097:
            com.facebook.FacebookException r6 = new com.facebook.FacebookException     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            java.lang.String r3 = r3.toString()     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            r6.<init>((java.lang.String) r3)     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            r3 = r4
            goto L_0x0081
        L_0x00a2:
            int r6 = com.facebook.R.string.com_facebook_image_download_unknown_error     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            java.lang.String r6 = r11.getString(r6)     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            r3.append(r6)     // Catch:{ IOException -> 0x0040, all -> 0x00ac }
            goto L_0x0097
        L_0x00ac:
            r1 = move-exception
            r2 = r0
        L_0x00ae:
            com.facebook.internal.Utility.closeQuietly(r5)
            com.facebook.internal.Utility.disconnectQuietly(r2)
            throw r1
        L_0x00b5:
            r0 = move-exception
            r1 = r0
            r5 = r4
            r2 = r4
            goto L_0x00ae
        L_0x00ba:
            r1 = move-exception
            r5 = r4
            r2 = r0
            goto L_0x00ae
        L_0x00be:
            r0 = move-exception
            r3 = r0
            r5 = r4
            r6 = r1
            r7 = r4
            goto L_0x0043
        L_0x00c4:
            r3 = move-exception
            r5 = r4
            r6 = r1
            r7 = r0
            goto L_0x0043
        L_0x00ca:
            r1 = move-exception
            r3 = r1
            r5 = r4
            r6 = r2
            r7 = r0
            goto L_0x0043
        L_0x00d1:
            r1 = r2
            r3 = r4
            r5 = r4
            r6 = r4
            goto L_0x0081
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.internal.ImageDownloader.download(com.facebook.internal.ImageDownloader$RequestKey, android.content.Context):void");
    }

    public static void downloadAsync(ImageRequest imageRequest) {
        if (imageRequest != null) {
            RequestKey requestKey = new RequestKey(imageRequest.getImageUri(), imageRequest.getCallerTag());
            synchronized (pendingRequests) {
                DownloaderContext downloaderContext = pendingRequests.get(requestKey);
                if (downloaderContext != null) {
                    downloaderContext.request = imageRequest;
                    downloaderContext.isCancelled = false;
                    downloaderContext.workItem.moveToFront();
                } else {
                    enqueueCacheRead(imageRequest, requestKey, imageRequest.isCachedRedirectAllowed());
                }
            }
        }
    }

    private static void enqueueCacheRead(ImageRequest imageRequest, RequestKey requestKey, boolean z) {
        enqueueRequest(imageRequest, requestKey, cacheReadQueue, new CacheReadWorkItem(imageRequest.getContext(), requestKey, z));
    }

    private static void enqueueDownload(ImageRequest imageRequest, RequestKey requestKey) {
        enqueueRequest(imageRequest, requestKey, downloadQueue, new DownloadImageWorkItem(imageRequest.getContext(), requestKey));
    }

    private static void enqueueRequest(ImageRequest imageRequest, RequestKey requestKey, WorkQueue workQueue, Runnable runnable) {
        synchronized (pendingRequests) {
            DownloaderContext downloaderContext = new DownloaderContext();
            downloaderContext.request = imageRequest;
            pendingRequests.put(requestKey, downloaderContext);
            downloaderContext.workItem = workQueue.addActiveWorkItem(runnable);
        }
    }

    private static Handler getHandler() {
        Handler handler2;
        synchronized (ImageDownloader.class) {
            try {
                if (handler == null) {
                    handler = new Handler(Looper.getMainLooper());
                }
                handler2 = handler;
            } catch (Throwable th) {
                Class<ImageDownloader> cls = ImageDownloader.class;
                throw th;
            }
        }
        return handler2;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:4:0x000a, code lost:
        r1 = r0.request;
        r5 = r1.getCallback();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static void issueResponse(com.facebook.internal.ImageDownloader.RequestKey r7, java.lang.Exception r8, android.graphics.Bitmap r9, boolean r10) {
        /*
            com.facebook.internal.ImageDownloader$DownloaderContext r0 = removePendingRequest(r7)
            if (r0 == 0) goto L_0x0021
            boolean r1 = r0.isCancelled
            if (r1 != 0) goto L_0x0021
            com.facebook.internal.ImageRequest r1 = r0.request
            com.facebook.internal.ImageRequest$Callback r5 = r1.getCallback()
            if (r5 == 0) goto L_0x0021
            android.os.Handler r6 = getHandler()
            com.facebook.internal.ImageDownloader$1 r0 = new com.facebook.internal.ImageDownloader$1
            r2 = r8
            r3 = r10
            r4 = r9
            r0.<init>(r1, r2, r3, r4, r5)
            r6.post(r0)
        L_0x0021:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.internal.ImageDownloader.issueResponse(com.facebook.internal.ImageDownloader$RequestKey, java.lang.Exception, android.graphics.Bitmap, boolean):void");
    }

    public static void prioritizeRequest(ImageRequest imageRequest) {
        RequestKey requestKey = new RequestKey(imageRequest.getImageUri(), imageRequest.getCallerTag());
        synchronized (pendingRequests) {
            DownloaderContext downloaderContext = pendingRequests.get(requestKey);
            if (downloaderContext != null) {
                downloaderContext.workItem.moveToFront();
            }
        }
    }

    /* access modifiers changed from: private */
    public static void readFromCache(RequestKey requestKey, Context context, boolean z) {
        InputStream inputStream;
        Uri redirectedUri;
        boolean z2 = false;
        if (!z || (redirectedUri = UrlRedirectCache.getRedirectedUri(requestKey.uri)) == null) {
            inputStream = null;
        } else {
            inputStream = ImageResponseCache.getCachedImageStream(redirectedUri, context);
            if (inputStream != null) {
                z2 = true;
            }
        }
        if (!z2) {
            inputStream = ImageResponseCache.getCachedImageStream(requestKey.uri, context);
        }
        if (inputStream != null) {
            Bitmap decodeStream = BitmapFactory.decodeStream(inputStream);
            Utility.closeQuietly(inputStream);
            issueResponse(requestKey, (Exception) null, decodeStream, z2);
            return;
        }
        DownloaderContext removePendingRequest = removePendingRequest(requestKey);
        if (removePendingRequest != null && !removePendingRequest.isCancelled) {
            enqueueDownload(removePendingRequest.request, requestKey);
        }
    }

    private static DownloaderContext removePendingRequest(RequestKey requestKey) {
        DownloaderContext remove;
        synchronized (pendingRequests) {
            remove = pendingRequests.remove(requestKey);
        }
        return remove;
    }
}
