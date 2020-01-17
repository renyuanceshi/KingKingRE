package com.pccwmobile.common.utilities;

import android.util.Log;
import com.pccw.mobile.sip.Constants;
import java.net.URI;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

public class HttpUtilities {
    private static String TAG_TAG = Constants.LOG_TAG_DEV;
    public static int timeoutConnection = Constants.HEARTBEAT_RETRY_INTERVAL;
    public static int timeoutSocket = Constants.HEARTBEAT_RETRY_INTERVAL;

    public static HttpResponse executeHttpDelete(String str) {
        DefaultHttpClient defaultHttpClient;
        HttpDelete httpDelete;
        try {
            BasicHttpParams basicHttpParams = new BasicHttpParams();
            try {
                HttpConnectionParams.setConnectionTimeout(basicHttpParams, timeoutConnection);
                HttpConnectionParams.setSoTimeout(basicHttpParams, timeoutSocket);
                defaultHttpClient = new DefaultHttpClient((HttpParams) basicHttpParams);
            } catch (Exception e) {
                e = e;
                try {
                    e.printStackTrace();
                    Log.e(TAG_TAG, "executeHttpDelete: error=" + e.toString(), e);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
            try {
                httpDelete = new HttpDelete();
            } catch (Exception e2) {
                e = e2;
                e.printStackTrace();
                Log.e(TAG_TAG, "executeHttpDelete: error=" + e.toString(), e);
                return null;
            } catch (Throwable th3) {
                th = th3;
                throw th;
            }
            try {
                httpDelete.setURI(new URI(str));
                return defaultHttpClient.execute(httpDelete);
            } catch (Exception e3) {
                e = e3;
            } catch (Throwable th4) {
                th = th4;
                throw th;
            }
        } catch (Exception e4) {
            e = e4;
            e.printStackTrace();
            Log.e(TAG_TAG, "executeHttpDelete: error=" + e.toString(), e);
            return null;
        }
    }

    public static HttpResponse executeHttpGet(String str) {
        DefaultHttpClient defaultHttpClient;
        HttpGet httpGet;
        try {
            BasicHttpParams basicHttpParams = new BasicHttpParams();
            try {
                HttpConnectionParams.setConnectionTimeout(basicHttpParams, timeoutConnection);
                HttpConnectionParams.setSoTimeout(basicHttpParams, timeoutSocket);
                defaultHttpClient = new DefaultHttpClient((HttpParams) basicHttpParams);
            } catch (Exception e) {
                e = e;
                try {
                    e.printStackTrace();
                    Log.e(TAG_TAG, "executeHttpGet: error=" + e.toString(), e);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
            try {
                httpGet = new HttpGet();
            } catch (Exception e2) {
                e = e2;
                e.printStackTrace();
                Log.e(TAG_TAG, "executeHttpGet: error=" + e.toString(), e);
                return null;
            } catch (Throwable th3) {
                th = th3;
                throw th;
            }
            try {
                httpGet.setURI(new URI(str));
                return defaultHttpClient.execute(httpGet);
            } catch (Exception e3) {
                e = e3;
            } catch (Throwable th4) {
                th = th4;
                throw th;
            }
        } catch (Exception e4) {
            e = e4;
            e.printStackTrace();
            Log.e(TAG_TAG, "executeHttpGet: error=" + e.toString(), e);
            return null;
        }
    }

    public static HttpResponse executeHttpPost(String str, List<BasicNameValuePair> list) {
        DefaultHttpClient defaultHttpClient;
        UrlEncodedFormEntity urlEncodedFormEntity;
        try {
            BasicHttpParams basicHttpParams = new BasicHttpParams();
            try {
                HttpConnectionParams.setConnectionTimeout(basicHttpParams, timeoutConnection);
                HttpConnectionParams.setSoTimeout(basicHttpParams, timeoutSocket);
                defaultHttpClient = new DefaultHttpClient((HttpParams) basicHttpParams);
            } catch (Exception e) {
                e = e;
                try {
                    e.printStackTrace();
                    Log.e(TAG_TAG, "executeHttpPost: error=" + e.toString(), e);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
            try {
                HttpPost httpPost = new HttpPost();
                if (list != null) {
                    try {
                        urlEncodedFormEntity = new UrlEncodedFormEntity((List<? extends NameValuePair>) list);
                    } catch (Exception e2) {
                        e = e2;
                    } catch (Throwable th3) {
                        th = th3;
                        throw th;
                    }
                    try {
                        urlEncodedFormEntity.setContentEncoding("UTF-8");
                        httpPost.setEntity(urlEncodedFormEntity);
                    } catch (Exception e3) {
                        e = e3;
                        e.printStackTrace();
                        Log.e(TAG_TAG, "executeHttpPost: error=" + e.toString(), e);
                        return null;
                    } catch (Throwable th4) {
                        th = th4;
                        throw th;
                    }
                }
                httpPost.setURI(new URI(str));
                return defaultHttpClient.execute(httpPost);
            } catch (Exception e4) {
                e = e4;
                e.printStackTrace();
                Log.e(TAG_TAG, "executeHttpPost: error=" + e.toString(), e);
                return null;
            } catch (Throwable th5) {
                th = th5;
                throw th;
            }
        } catch (Exception e5) {
            e = e5;
            e.printStackTrace();
            Log.e(TAG_TAG, "executeHttpPost: error=" + e.toString(), e);
            return null;
        }
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:27:0x00d0=Splitter:B:27:0x00d0, B:32:0x00f7=Splitter:B:32:0x00f7, B:22:0x00a9=Splitter:B:22:0x00a9, B:14:0x005c=Splitter:B:14:0x005c} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static org.apache.http.HttpResponse executeHttpPostMultipart(java.lang.String r9, java.lang.String r10, java.util.List<android.util.Pair<java.lang.String, java.lang.String>> r11, android.util.Pair<java.lang.String, java.io.File> r12, int r13, int r14) {
        /*
            r3 = 0
            org.apache.http.impl.client.DefaultHttpClient r4 = new org.apache.http.impl.client.DefaultHttpClient
            r4.<init>()
            org.apache.http.impl.client.DefaultHttpClient r1 = new org.apache.http.impl.client.DefaultHttpClient     // Catch:{ ParseException -> 0x0173, ClientProtocolException -> 0x00a7, IOException -> 0x00ce, URISyntaxException -> 0x00f5, Exception -> 0x011d, all -> 0x0187 }
            r1.<init>()     // Catch:{ ParseException -> 0x0173, ClientProtocolException -> 0x00a7, IOException -> 0x00ce, URISyntaxException -> 0x00f5, Exception -> 0x011d, all -> 0x0187 }
            org.apache.http.params.HttpParams r2 = r1.getParams()     // Catch:{ ParseException -> 0x0177, ClientProtocolException -> 0x0167, IOException -> 0x015b, URISyntaxException -> 0x0152, Exception -> 0x0181, all -> 0x0185 }
            java.lang.String r4 = "http.protocol.version"
            org.apache.http.HttpVersion r5 = org.apache.http.HttpVersion.HTTP_1_1     // Catch:{ ParseException -> 0x0177, ClientProtocolException -> 0x0167, IOException -> 0x015b, URISyntaxException -> 0x0152, Exception -> 0x0181, all -> 0x0185 }
            r2.setParameter(r4, r5)     // Catch:{ ParseException -> 0x0177, ClientProtocolException -> 0x0167, IOException -> 0x015b, URISyntaxException -> 0x0152, Exception -> 0x0181, all -> 0x0185 }
            org.apache.http.params.BasicHttpParams r2 = new org.apache.http.params.BasicHttpParams     // Catch:{ ParseException -> 0x0177, ClientProtocolException -> 0x0167, IOException -> 0x015b, URISyntaxException -> 0x0152, Exception -> 0x0181, all -> 0x0185 }
            r2.<init>()     // Catch:{ ParseException -> 0x0177, ClientProtocolException -> 0x0167, IOException -> 0x015b, URISyntaxException -> 0x0152, Exception -> 0x0181, all -> 0x0185 }
            org.apache.http.params.HttpConnectionParams.setConnectionTimeout(r2, r13)     // Catch:{ ParseException -> 0x017b, ClientProtocolException -> 0x016b, IOException -> 0x015f, URISyntaxException -> 0x0155, Exception -> 0x017f, all -> 0x0183 }
            org.apache.http.params.HttpConnectionParams.setSoTimeout(r2, r14)     // Catch:{ ParseException -> 0x017b, ClientProtocolException -> 0x016b, IOException -> 0x015f, URISyntaxException -> 0x0155, Exception -> 0x017f, all -> 0x0183 }
            org.apache.http.impl.client.DefaultHttpClient r4 = new org.apache.http.impl.client.DefaultHttpClient     // Catch:{ ParseException -> 0x017b, ClientProtocolException -> 0x016b, IOException -> 0x015f, URISyntaxException -> 0x0155, Exception -> 0x017f, all -> 0x0183 }
            r4.<init>((org.apache.http.params.HttpParams) r2)     // Catch:{ ParseException -> 0x017b, ClientProtocolException -> 0x016b, IOException -> 0x015f, URISyntaxException -> 0x0155, Exception -> 0x017f, all -> 0x0183 }
            org.apache.http.client.methods.HttpPost r5 = new org.apache.http.client.methods.HttpPost     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            r5.<init>()     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            java.net.URI r1 = new java.net.URI     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            r1.<init>(r9)     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            r5.setURI(r1)     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            org.apache.http.entity.mime.MultipartEntityBuilder r6 = org.apache.http.entity.mime.MultipartEntityBuilder.create()     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            org.apache.http.entity.mime.HttpMultipartMode r1 = org.apache.http.entity.mime.HttpMultipartMode.BROWSER_COMPATIBLE     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            r6.setMode(r1)     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            java.util.Iterator r7 = r11.iterator()     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
        L_0x0040:
            boolean r1 = r7.hasNext()     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            if (r1 == 0) goto L_0x0081
            java.lang.Object r1 = r7.next()     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            r0 = r1
            android.util.Pair r0 = (android.util.Pair) r0     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            r2 = r0
            java.lang.Object r1 = r2.first     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            java.lang.String r1 = (java.lang.String) r1     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            java.lang.Object r2 = r2.second     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            java.lang.String r2 = (java.lang.String) r2     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            r6.addTextBody(r1, r2)     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            goto L_0x0040
        L_0x005a:
            r1 = move-exception
            r2 = r1
        L_0x005c:
            java.lang.String r1 = TAG_TAG     // Catch:{ all -> 0x018c }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ all -> 0x018c }
            r5.<init>()     // Catch:{ all -> 0x018c }
            java.lang.String r6 = "executeHttpPostMultipart: error="
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ all -> 0x018c }
            java.lang.String r6 = r2.toString()     // Catch:{ all -> 0x018c }
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ all -> 0x018c }
            java.lang.String r5 = r5.toString()     // Catch:{ all -> 0x018c }
            android.util.Log.e(r1, r5, r2)     // Catch:{ all -> 0x018c }
            org.apache.http.conn.ClientConnectionManager r1 = r4.getConnectionManager()
            r1.shutdown()
            r1 = r3
        L_0x0080:
            return r1
        L_0x0081:
            java.lang.Object r1 = r12.first     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            java.lang.String r1 = (java.lang.String) r1     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            java.lang.Object r2 = r12.second     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            java.io.File r2 = (java.io.File) r2     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            org.apache.http.entity.ContentType r7 = org.apache.http.entity.ContentType.create((java.lang.String) r10)     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            java.lang.String r8 = r2.getName()     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            r6.addBinaryBody((java.lang.String) r1, (java.io.File) r2, (org.apache.http.entity.ContentType) r7, (java.lang.String) r8)     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            org.apache.http.HttpEntity r1 = r6.build()     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            r5.setEntity(r1)     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            org.apache.http.HttpResponse r1 = r4.execute(r5)     // Catch:{ ParseException -> 0x005a, ClientProtocolException -> 0x016f, IOException -> 0x0163, URISyntaxException -> 0x0158, Exception -> 0x014f, all -> 0x0145 }
            org.apache.http.conn.ClientConnectionManager r2 = r4.getConnectionManager()
            r2.shutdown()
            goto L_0x0080
        L_0x00a7:
            r1 = move-exception
            r2 = r1
        L_0x00a9:
            java.lang.String r1 = TAG_TAG     // Catch:{ all -> 0x018c }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ all -> 0x018c }
            r5.<init>()     // Catch:{ all -> 0x018c }
            java.lang.String r6 = "executeHttpPostMultipart: error="
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ all -> 0x018c }
            java.lang.String r6 = r2.toString()     // Catch:{ all -> 0x018c }
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ all -> 0x018c }
            java.lang.String r5 = r5.toString()     // Catch:{ all -> 0x018c }
            android.util.Log.e(r1, r5, r2)     // Catch:{ all -> 0x018c }
            org.apache.http.conn.ClientConnectionManager r1 = r4.getConnectionManager()
            r1.shutdown()
            r1 = r3
            goto L_0x0080
        L_0x00ce:
            r1 = move-exception
            r2 = r1
        L_0x00d0:
            java.lang.String r1 = TAG_TAG     // Catch:{ all -> 0x018c }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ all -> 0x018c }
            r5.<init>()     // Catch:{ all -> 0x018c }
            java.lang.String r6 = "executeHttpPostMultipart: error="
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ all -> 0x018c }
            java.lang.String r6 = r2.toString()     // Catch:{ all -> 0x018c }
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ all -> 0x018c }
            java.lang.String r5 = r5.toString()     // Catch:{ all -> 0x018c }
            android.util.Log.e(r1, r5, r2)     // Catch:{ all -> 0x018c }
            org.apache.http.conn.ClientConnectionManager r1 = r4.getConnectionManager()
            r1.shutdown()
            r1 = r3
            goto L_0x0080
        L_0x00f5:
            r1 = move-exception
            r2 = r1
        L_0x00f7:
            java.lang.String r1 = TAG_TAG     // Catch:{ all -> 0x018c }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ all -> 0x018c }
            r5.<init>()     // Catch:{ all -> 0x018c }
            java.lang.String r6 = "executeHttpPostMultipart: error="
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ all -> 0x018c }
            java.lang.String r6 = r2.toString()     // Catch:{ all -> 0x018c }
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ all -> 0x018c }
            java.lang.String r5 = r5.toString()     // Catch:{ all -> 0x018c }
            android.util.Log.e(r1, r5, r2)     // Catch:{ all -> 0x018c }
            org.apache.http.conn.ClientConnectionManager r1 = r4.getConnectionManager()
            r1.shutdown()
            r1 = r3
            goto L_0x0080
        L_0x011d:
            r2 = move-exception
            r1 = r4
        L_0x011f:
            java.lang.String r4 = TAG_TAG     // Catch:{ all -> 0x018a }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ all -> 0x018a }
            r5.<init>()     // Catch:{ all -> 0x018a }
            java.lang.String r6 = "executeHttpPostMultipart: error="
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ all -> 0x018a }
            java.lang.String r6 = r2.toString()     // Catch:{ all -> 0x018a }
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ all -> 0x018a }
            java.lang.String r5 = r5.toString()     // Catch:{ all -> 0x018a }
            android.util.Log.e(r4, r5, r2)     // Catch:{ all -> 0x018a }
            org.apache.http.conn.ClientConnectionManager r1 = r1.getConnectionManager()
            r1.shutdown()
            r1 = r3
            goto L_0x0080
        L_0x0145:
            r2 = move-exception
            r1 = r4
        L_0x0147:
            org.apache.http.conn.ClientConnectionManager r1 = r1.getConnectionManager()
            r1.shutdown()
            throw r2
        L_0x014f:
            r2 = move-exception
            r1 = r4
            goto L_0x011f
        L_0x0152:
            r2 = move-exception
            r4 = r1
            goto L_0x00f7
        L_0x0155:
            r2 = move-exception
            r4 = r1
            goto L_0x00f7
        L_0x0158:
            r1 = move-exception
            r2 = r1
            goto L_0x00f7
        L_0x015b:
            r2 = move-exception
            r4 = r1
            goto L_0x00d0
        L_0x015f:
            r2 = move-exception
            r4 = r1
            goto L_0x00d0
        L_0x0163:
            r1 = move-exception
            r2 = r1
            goto L_0x00d0
        L_0x0167:
            r2 = move-exception
            r4 = r1
            goto L_0x00a9
        L_0x016b:
            r2 = move-exception
            r4 = r1
            goto L_0x00a9
        L_0x016f:
            r1 = move-exception
            r2 = r1
            goto L_0x00a9
        L_0x0173:
            r1 = move-exception
            r2 = r1
            goto L_0x005c
        L_0x0177:
            r2 = move-exception
            r4 = r1
            goto L_0x005c
        L_0x017b:
            r2 = move-exception
            r4 = r1
            goto L_0x005c
        L_0x017f:
            r2 = move-exception
            goto L_0x011f
        L_0x0181:
            r2 = move-exception
            goto L_0x011f
        L_0x0183:
            r2 = move-exception
            goto L_0x0147
        L_0x0185:
            r2 = move-exception
            goto L_0x0147
        L_0x0187:
            r2 = move-exception
            r1 = r4
            goto L_0x0147
        L_0x018a:
            r2 = move-exception
            goto L_0x0147
        L_0x018c:
            r2 = move-exception
            r1 = r4
            goto L_0x0147
        */
        throw new UnsupportedOperationException("Method not decompiled: com.pccwmobile.common.utilities.HttpUtilities.executeHttpPostMultipart(java.lang.String, java.lang.String, java.util.List, android.util.Pair, int, int):org.apache.http.HttpResponse");
    }

    public static HttpResponse executeHttpPut(String str, List<BasicNameValuePair> list) {
        DefaultHttpClient defaultHttpClient;
        UrlEncodedFormEntity urlEncodedFormEntity;
        try {
            BasicHttpParams basicHttpParams = new BasicHttpParams();
            try {
                HttpConnectionParams.setConnectionTimeout(basicHttpParams, timeoutConnection);
                HttpConnectionParams.setSoTimeout(basicHttpParams, timeoutSocket);
                defaultHttpClient = new DefaultHttpClient((HttpParams) basicHttpParams);
            } catch (Exception e) {
                e = e;
                try {
                    e.printStackTrace();
                    Log.e(TAG_TAG, "executeHttpPut: error=" + e.toString(), e);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
            try {
                HttpPut httpPut = new HttpPut();
                if (list != null) {
                    try {
                        urlEncodedFormEntity = new UrlEncodedFormEntity((List<? extends NameValuePair>) list);
                    } catch (Exception e2) {
                        e = e2;
                    } catch (Throwable th3) {
                        th = th3;
                        throw th;
                    }
                    try {
                        urlEncodedFormEntity.setContentEncoding("UTF-8");
                        httpPut.setEntity(urlEncodedFormEntity);
                    } catch (Exception e3) {
                        e = e3;
                        e.printStackTrace();
                        Log.e(TAG_TAG, "executeHttpPut: error=" + e.toString(), e);
                        return null;
                    } catch (Throwable th4) {
                        th = th4;
                        throw th;
                    }
                }
                httpPut.setURI(new URI(str));
                return defaultHttpClient.execute(httpPut);
            } catch (Exception e4) {
                e = e4;
                e.printStackTrace();
                Log.e(TAG_TAG, "executeHttpPut: error=" + e.toString(), e);
                return null;
            } catch (Throwable th5) {
                th = th5;
                throw th;
            }
        } catch (Exception e5) {
            e = e5;
            e.printStackTrace();
            Log.e(TAG_TAG, "executeHttpPut: error=" + e.toString(), e);
            return null;
        }
    }
}
