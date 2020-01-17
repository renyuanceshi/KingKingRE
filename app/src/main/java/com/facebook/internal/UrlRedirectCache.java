package com.facebook.internal;

import android.net.Uri;
import com.facebook.LoggingBehavior;
import com.facebook.internal.FileLruCache;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

class UrlRedirectCache {
    private static final String REDIRECT_CONTENT_TAG = (TAG + "_Redirect");
    static final String TAG = UrlRedirectCache.class.getSimpleName();
    private static FileLruCache urlRedirectCache;

    UrlRedirectCache() {
    }

    static void cacheUriRedirect(Uri uri, Uri uri2) {
        OutputStream outputStream = null;
        if (uri != null && uri2 != null) {
            try {
                outputStream = getCache().openPutStream(uri.toString(), REDIRECT_CONTENT_TAG);
                outputStream.write(uri2.toString().getBytes());
            } catch (IOException e) {
            } finally {
                Utility.closeQuietly(outputStream);
            }
        }
    }

    static void clearCache() {
        try {
            getCache().clearCache();
        } catch (IOException e) {
            Logger.log(LoggingBehavior.CACHE, 5, TAG, "clearCache failed " + e.getMessage());
        }
    }

    static FileLruCache getCache() throws IOException {
        FileLruCache fileLruCache;
        synchronized (UrlRedirectCache.class) {
            try {
                if (urlRedirectCache == null) {
                    urlRedirectCache = new FileLruCache(TAG, new FileLruCache.Limits());
                }
                fileLruCache = urlRedirectCache;
            } catch (Throwable th) {
                Class<UrlRedirectCache> cls = UrlRedirectCache.class;
                throw th;
            }
        }
        return fileLruCache;
    }

    static Uri getRedirectedUri(Uri uri) {
        InputStreamReader inputStreamReader;
        InputStreamReader inputStreamReader2;
        Throwable th;
        Uri uri2 = null;
        if (uri != null) {
            String uri3 = uri.toString();
            try {
                FileLruCache cache = getCache();
                boolean z = false;
                inputStreamReader = null;
                while (true) {
                    try {
                        InputStream inputStream = cache.get(uri3, REDIRECT_CONTENT_TAG);
                        if (inputStream == null) {
                            break;
                        }
                        z = true;
                        inputStreamReader2 = new InputStreamReader(inputStream);
                        try {
                            char[] cArr = new char[128];
                            StringBuilder sb = new StringBuilder();
                            while (true) {
                                int read = inputStreamReader2.read(cArr, 0, cArr.length);
                                if (read <= 0) {
                                    break;
                                }
                                sb.append(cArr, 0, read);
                            }
                            Utility.closeQuietly(inputStreamReader2);
                            uri3 = sb.toString();
                            inputStreamReader = inputStreamReader2;
                        } catch (IOException e) {
                            inputStreamReader = inputStreamReader2;
                            Utility.closeQuietly(inputStreamReader);
                            return uri2;
                        } catch (Throwable th2) {
                            th = th2;
                            th = th;
                            Utility.closeQuietly(inputStreamReader2);
                            throw th;
                        }
                    } catch (IOException e2) {
                        Utility.closeQuietly(inputStreamReader);
                        return uri2;
                    } catch (Throwable th3) {
                        th = th3;
                        inputStreamReader2 = inputStreamReader;
                        Utility.closeQuietly(inputStreamReader2);
                        throw th;
                    }
                }
                if (z) {
                    uri2 = Uri.parse(uri3);
                    Utility.closeQuietly(inputStreamReader);
                } else {
                    Utility.closeQuietly(inputStreamReader);
                }
            } catch (IOException e3) {
                inputStreamReader = null;
                Utility.closeQuietly(inputStreamReader);
                return uri2;
            } catch (Throwable th4) {
                th = th4;
                inputStreamReader2 = null;
                th = th;
                Utility.closeQuietly(inputStreamReader2);
                throw th;
            }
        }
        return uri2;
    }
}
