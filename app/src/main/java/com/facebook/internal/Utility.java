package com.facebook.internal;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Parcel;
import android.os.StatFs;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import android.webkit.CookieManager;
import android.webkit.CookieSyncManager;
import com.facebook.AccessToken;
import com.facebook.FacebookException;
import com.facebook.FacebookSdk;
import com.facebook.GraphRequest;
import com.facebook.GraphResponse;
import com.facebook.HttpMethod;
import com.facebook.places.model.PlaceFields;
import com.facebook.share.internal.ShareConstants;
import java.io.BufferedInputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.TimeZone;
import java.util.regex.Pattern;
import org.apache.http.HttpHost;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

public final class Utility {
    public static final int DEFAULT_STREAM_BUFFER_SIZE = 8192;
    private static final String EXTRA_APP_EVENTS_INFO_FORMAT_VERSION = "a2";
    private static final int GINGERBREAD_MR1 = 10;
    private static final String HASH_ALGORITHM_MD5 = "MD5";
    private static final String HASH_ALGORITHM_SHA1 = "SHA-1";
    static final String LOG_TAG = "FacebookSDK";
    private static final int REFRESH_TIME_FOR_EXTENDED_DEVICE_INFO_MILLIS = 1800000;
    private static final String URL_SCHEME = "https";
    private static final String UTF8 = "UTF-8";
    private static long availableExternalStorageGB = -1;
    private static String carrierName = noCarrierConstant;
    private static String deviceTimeZoneName = "";
    private static String deviceTimezoneAbbreviation = "";
    private static final String noCarrierConstant = "NoCarrier";
    private static int numCPUCores = 0;
    private static long timestampOfLastCheck = -1;
    private static long totalExternalStorageGB = -1;

    public interface GraphMeRequestWithCacheCallback {
        void onFailure(FacebookException facebookException);

        void onSuccess(JSONObject jSONObject);
    }

    public interface Mapper<T, K> {
        K apply(T t);
    }

    public static class PermissionsPair {
        List<String> declinedPermissions;
        List<String> grantedPermissions;

        public PermissionsPair(List<String> list, List<String> list2) {
            this.grantedPermissions = list;
            this.declinedPermissions = list2;
        }

        public List<String> getDeclinedPermissions() {
            return this.declinedPermissions;
        }

        public List<String> getGrantedPermissions() {
            return this.grantedPermissions;
        }
    }

    public interface Predicate<T> {
        boolean apply(T t);
    }

    public static <T> boolean areObjectsEqual(T t, T t2) {
        return t == null ? t2 == null : t.equals(t2);
    }

    public static <T> ArrayList<T> arrayList(T... tArr) {
        ArrayList<T> arrayList = new ArrayList<>(tArr.length);
        for (T add : tArr) {
            arrayList.add(add);
        }
        return arrayList;
    }

    public static <T> List<T> asListNoNulls(T... tArr) {
        ArrayList arrayList = new ArrayList();
        for (T t : tArr) {
            if (t != null) {
                arrayList.add(t);
            }
        }
        return arrayList;
    }

    public static JSONObject awaitGetGraphMeRequestWithCache(String str) {
        JSONObject profileInformation = ProfileInformationCache.getProfileInformation(str);
        if (profileInformation != null) {
            return profileInformation;
        }
        GraphResponse executeAndWait = getGraphMeRequestWithCache(str).executeAndWait();
        if (executeAndWait.getError() != null) {
            return null;
        }
        return executeAndWait.getJSONObject();
    }

    public static Uri buildUri(String str, String str2, Bundle bundle) {
        Uri.Builder builder = new Uri.Builder();
        builder.scheme(URL_SCHEME);
        builder.authority(str);
        builder.path(str2);
        if (bundle != null) {
            for (String str3 : bundle.keySet()) {
                Object obj = bundle.get(str3);
                if (obj instanceof String) {
                    builder.appendQueryParameter(str3, (String) obj);
                }
            }
        }
        return builder.build();
    }

    public static void clearCaches(Context context) {
        ImageDownloader.clearCache(context);
    }

    private static void clearCookiesForDomain(Context context, String str) {
        CookieSyncManager.createInstance(context).sync();
        CookieManager instance = CookieManager.getInstance();
        String cookie = instance.getCookie(str);
        if (cookie != null) {
            for (String split : cookie.split(";")) {
                String[] split2 = split.split("=");
                if (split2.length > 0) {
                    instance.setCookie(str, split2[0].trim() + "=;expires=Sat, 1 Jan 2000 00:00:01 UTC;");
                }
            }
            instance.removeExpiredCookie();
        }
    }

    public static void clearFacebookCookies(Context context) {
        clearCookiesForDomain(context, "facebook.com");
        clearCookiesForDomain(context, ".facebook.com");
        clearCookiesForDomain(context, "https://facebook.com");
        clearCookiesForDomain(context, "https://.facebook.com");
    }

    public static void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            }
        }
    }

    public static String coerceValueIfNullOrEmpty(String str, String str2) {
        return isNullOrEmpty(str) ? str2 : str;
    }

    private static long convertBytesToGB(double d) {
        return Math.round(d / 1.073741824E9d);
    }

    static Map<String, Object> convertJSONObjectToHashMap(JSONObject jSONObject) {
        HashMap hashMap = new HashMap();
        JSONArray names = jSONObject.names();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= names.length()) {
                return hashMap;
            }
            try {
                String string = names.getString(i2);
                Object obj = jSONObject.get(string);
                if (obj instanceof JSONObject) {
                    obj = convertJSONObjectToHashMap((JSONObject) obj);
                }
                hashMap.put(string, obj);
            } catch (JSONException e) {
            }
            i = i2 + 1;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:18:0x0027  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x002c  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int copyAndCloseInputStream(java.io.InputStream r5, java.io.OutputStream r6) throws java.io.IOException {
        /*
            r0 = 0
            r2 = 0
            java.io.BufferedInputStream r1 = new java.io.BufferedInputStream     // Catch:{ all -> 0x0023 }
            r1.<init>(r5)     // Catch:{ all -> 0x0023 }
            r2 = 8192(0x2000, float:1.14794E-41)
            byte[] r2 = new byte[r2]     // Catch:{ all -> 0x0030 }
        L_0x000b:
            int r3 = r1.read(r2)     // Catch:{ all -> 0x0030 }
            r4 = -1
            if (r3 == r4) goto L_0x0018
            r4 = 0
            r6.write(r2, r4, r3)     // Catch:{ all -> 0x0030 }
            int r0 = r0 + r3
            goto L_0x000b
        L_0x0018:
            if (r1 == 0) goto L_0x001d
            r1.close()
        L_0x001d:
            if (r5 == 0) goto L_0x0022
            r5.close()
        L_0x0022:
            return r0
        L_0x0023:
            r0 = move-exception
            r1 = r2
        L_0x0025:
            if (r1 == 0) goto L_0x002a
            r1.close()
        L_0x002a:
            if (r5 == 0) goto L_0x002f
            r5.close()
        L_0x002f:
            throw r0
        L_0x0030:
            r0 = move-exception
            goto L_0x0025
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.internal.Utility.copyAndCloseInputStream(java.io.InputStream, java.io.OutputStream):int");
    }

    public static void deleteDirectory(File file) {
        File[] listFiles;
        if (file.exists()) {
            if (file.isDirectory() && (listFiles = file.listFiles()) != null) {
                for (File deleteDirectory : listFiles) {
                    deleteDirectory(deleteDirectory);
                }
            }
            file.delete();
        }
    }

    public static void disconnectQuietly(URLConnection uRLConnection) {
        if (uRLConnection != null && (uRLConnection instanceof HttpURLConnection)) {
            ((HttpURLConnection) uRLConnection).disconnect();
        }
    }

    private static boolean externalStorageExists() {
        return "mounted".equals(Environment.getExternalStorageState());
    }

    public static <T> List<T> filter(List<T> list, Predicate<T> predicate) {
        if (list == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (T next : list) {
            if (predicate.apply(next)) {
                arrayList.add(next);
            }
        }
        if (arrayList.size() != 0) {
            return arrayList;
        }
        return null;
    }

    public static String generateRandomString(int i) {
        return new BigInteger(i * 5, new Random()).toString(32);
    }

    public static String getActivityName(Context context) {
        return context == null ? "null" : context == context.getApplicationContext() ? "unknown" : context.getClass().getSimpleName();
    }

    public static Date getBundleLongAsDate(Bundle bundle, String str, Date date) {
        long parseLong;
        if (bundle == null) {
            return null;
        }
        Object obj = bundle.get(str);
        if (obj instanceof Long) {
            parseLong = ((Long) obj).longValue();
        } else if (!(obj instanceof String)) {
            return null;
        } else {
            try {
                parseLong = Long.parseLong((String) obj);
            } catch (NumberFormatException e) {
                return null;
            }
        }
        if (parseLong == 0) {
            return new Date(Long.MAX_VALUE);
        }
        return new Date((parseLong * 1000) + date.getTime());
    }

    public static long getContentSize(Uri uri) {
        Cursor cursor;
        try {
            cursor = FacebookSdk.getApplicationContext().getContentResolver().query(uri, (String[]) null, (String) null, (String[]) null, (String) null);
            try {
                int columnIndex = cursor.getColumnIndex("_size");
                cursor.moveToFirst();
                long j = cursor.getLong(columnIndex);
                if (cursor != null) {
                    cursor.close();
                }
                return j;
            } catch (Throwable th) {
                th = th;
            }
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
    }

    private static GraphRequest getGraphMeRequestWithCache(String str) {
        Bundle bundle = new Bundle();
        bundle.putString(GraphRequest.FIELDS_PARAM, "id,name,first_name,middle_name,last_name,link");
        bundle.putString("access_token", str);
        return new GraphRequest((AccessToken) null, "me", bundle, HttpMethod.GET, (GraphRequest.Callback) null);
    }

    public static void getGraphMeRequestWithCacheAsync(final String str, final GraphMeRequestWithCacheCallback graphMeRequestWithCacheCallback) {
        JSONObject profileInformation = ProfileInformationCache.getProfileInformation(str);
        if (profileInformation != null) {
            graphMeRequestWithCacheCallback.onSuccess(profileInformation);
            return;
        }
        AnonymousClass1 r0 = new GraphRequest.Callback() {
            public void onCompleted(GraphResponse graphResponse) {
                if (graphResponse.getError() != null) {
                    graphMeRequestWithCacheCallback.onFailure(graphResponse.getError().getException());
                    return;
                }
                ProfileInformationCache.putProfileInformation(str, graphResponse.getJSONObject());
                graphMeRequestWithCacheCallback.onSuccess(graphResponse.getJSONObject());
            }
        };
        GraphRequest graphMeRequestWithCache = getGraphMeRequestWithCache(str);
        graphMeRequestWithCache.setCallback(r0);
        graphMeRequestWithCache.executeAsync();
    }

    public static String getMetadataApplicationId(Context context) {
        Validate.notNull(context, PlaceFields.CONTEXT);
        FacebookSdk.sdkInitialize(context);
        return FacebookSdk.getApplicationId();
    }

    public static Method getMethodQuietly(Class<?> cls, String str, Class<?>... clsArr) {
        try {
            return cls.getMethod(str, clsArr);
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    public static Method getMethodQuietly(String str, String str2, Class<?>... clsArr) {
        try {
            return getMethodQuietly(Class.forName(str), str2, clsArr);
        } catch (ClassNotFoundException e) {
            return null;
        }
    }

    public static Object getStringPropertyAsJSON(JSONObject jSONObject, String str, String str2) throws JSONException {
        Object opt = jSONObject.opt(str);
        Object nextValue = (opt == null || !(opt instanceof String)) ? opt : new JSONTokener((String) opt).nextValue();
        if (nextValue == null || (nextValue instanceof JSONObject) || (nextValue instanceof JSONArray)) {
            return nextValue;
        }
        if (str2 != null) {
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.putOpt(str2, nextValue);
            return jSONObject2;
        }
        throw new FacebookException("Got an unexpected non-JSON object.");
    }

    public static String getUriString(Uri uri) {
        if (uri == null) {
            return null;
        }
        return uri.toString();
    }

    public static PermissionsPair handlePermissionResponse(JSONObject jSONObject) throws JSONException {
        String optString;
        JSONArray jSONArray = jSONObject.getJSONObject(NativeProtocol.RESULT_ARGS_PERMISSIONS).getJSONArray(ShareConstants.WEB_DIALOG_PARAM_DATA);
        ArrayList arrayList = new ArrayList(jSONArray.length());
        ArrayList arrayList2 = new ArrayList(jSONArray.length());
        for (int i = 0; i < jSONArray.length(); i++) {
            JSONObject optJSONObject = jSONArray.optJSONObject(i);
            String optString2 = optJSONObject.optString("permission");
            if (!(optString2 == null || optString2.equals("installed") || (optString = optJSONObject.optString("status")) == null)) {
                if (optString.equals("granted")) {
                    arrayList.add(optString2);
                } else if (optString.equals("declined")) {
                    arrayList2.add(optString2);
                }
            }
        }
        return new PermissionsPair(arrayList, arrayList2);
    }

    public static boolean hasSameId(JSONObject jSONObject, JSONObject jSONObject2) {
        if (jSONObject == null || jSONObject2 == null || !jSONObject.has("id") || !jSONObject2.has("id")) {
            return false;
        }
        if (jSONObject.equals(jSONObject2)) {
            return true;
        }
        String optString = jSONObject.optString("id");
        String optString2 = jSONObject2.optString("id");
        if (optString == null || optString2 == null) {
            return false;
        }
        return optString.equals(optString2);
    }

    private static String hashBytes(MessageDigest messageDigest, byte[] bArr) {
        messageDigest.update(bArr);
        byte[] digest = messageDigest.digest();
        StringBuilder sb = new StringBuilder();
        for (byte b : digest) {
            sb.append(Integer.toHexString((b >> 4) & 15));
            sb.append(Integer.toHexString((b >> 0) & 15));
        }
        return sb.toString();
    }

    public static <T> HashSet<T> hashSet(T... tArr) {
        HashSet<T> hashSet = new HashSet<>(tArr.length);
        for (T add : tArr) {
            hashSet.add(add);
        }
        return hashSet;
    }

    private static String hashWithAlgorithm(String str, String str2) {
        return hashWithAlgorithm(str, str2.getBytes());
    }

    private static String hashWithAlgorithm(String str, byte[] bArr) {
        try {
            return hashBytes(MessageDigest.getInstance(str), bArr);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    public static int[] intersectRanges(int[] iArr, int[] iArr2) {
        int i;
        if (iArr == null) {
            return iArr2;
        }
        if (iArr2 == null) {
            return iArr;
        }
        int[] iArr3 = new int[(iArr.length + iArr2.length)];
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        while (true) {
            if (i3 >= iArr.length || i2 >= iArr2.length) {
                break;
            }
            int i5 = iArr[i3];
            int i6 = iArr2[i2];
            int i7 = i3 < iArr.length + -1 ? iArr[i3 + 1] : Integer.MAX_VALUE;
            int i8 = i2 < iArr2.length + -1 ? iArr2[i2 + 1] : Integer.MAX_VALUE;
            if (i5 < i6) {
                if (i7 <= i6) {
                    i = i3 + 2;
                    i6 = Integer.MIN_VALUE;
                    i7 = Integer.MAX_VALUE;
                } else if (i7 > i8) {
                    i2 += 2;
                    i = i3;
                    i7 = i8;
                } else {
                    i = i3 + 2;
                }
            } else if (i8 <= i5) {
                i2 += 2;
                i = i3;
                i6 = Integer.MIN_VALUE;
                i7 = Integer.MAX_VALUE;
            } else if (i8 > i7) {
                i = i3 + 2;
                i6 = i5;
            } else {
                i2 += 2;
                i = i3;
                i6 = i5;
                i7 = i8;
            }
            if (i6 != Integer.MIN_VALUE) {
                int i9 = i4 + 1;
                iArr3[i4] = i6;
                if (i7 == Integer.MAX_VALUE) {
                    i4 = i9;
                    break;
                }
                i4 = i9 + 1;
                iArr3[i9] = i7;
                i3 = i;
            } else {
                i3 = i;
            }
        }
        return Arrays.copyOf(iArr3, i4);
    }

    public static Object invokeMethodQuietly(Object obj, Method method, Object... objArr) {
        try {
            return method.invoke(obj, objArr);
        } catch (IllegalAccessException | InvocationTargetException e) {
            return null;
        }
    }

    public static boolean isContentUri(Uri uri) {
        return uri != null && "content".equalsIgnoreCase(uri.getScheme());
    }

    public static boolean isCurrentAccessToken(AccessToken accessToken) {
        if (accessToken != null) {
            return accessToken.equals(AccessToken.getCurrentAccessToken());
        }
        return false;
    }

    public static boolean isFileUri(Uri uri) {
        return uri != null && "file".equalsIgnoreCase(uri.getScheme());
    }

    public static boolean isNullOrEmpty(String str) {
        return str == null || str.length() == 0;
    }

    public static <T> boolean isNullOrEmpty(Collection<T> collection) {
        return collection == null || collection.size() == 0;
    }

    public static <T> boolean isSubset(Collection<T> collection, Collection<T> collection2) {
        if (collection2 == null || collection2.size() == 0) {
            return collection == null || collection.size() == 0;
        }
        HashSet hashSet = new HashSet(collection2);
        for (T contains : collection) {
            if (!hashSet.contains(contains)) {
                return false;
            }
        }
        return true;
    }

    public static boolean isWebUri(Uri uri) {
        return uri != null && (HttpHost.DEFAULT_SCHEME_NAME.equalsIgnoreCase(uri.getScheme()) || URL_SCHEME.equalsIgnoreCase(uri.getScheme()) || "fbstaging".equalsIgnoreCase(uri.getScheme()));
    }

    public static Set<String> jsonArrayToSet(JSONArray jSONArray) throws JSONException {
        HashSet hashSet = new HashSet();
        for (int i = 0; i < jSONArray.length(); i++) {
            hashSet.add(jSONArray.getString(i));
        }
        return hashSet;
    }

    public static List<String> jsonArrayToStringList(JSONArray jSONArray) throws JSONException {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < jSONArray.length(); i++) {
            arrayList.add(jSONArray.getString(i));
        }
        return arrayList;
    }

    public static void logd(String str, Exception exc) {
        if (FacebookSdk.isDebugEnabled() && str != null && exc != null) {
            Log.d(str, exc.getClass().getSimpleName() + ": " + exc.getMessage());
        }
    }

    public static void logd(String str, String str2) {
        if (FacebookSdk.isDebugEnabled() && str != null && str2 != null) {
            Log.d(str, str2);
        }
    }

    public static void logd(String str, String str2, Throwable th) {
        if (FacebookSdk.isDebugEnabled() && !isNullOrEmpty(str)) {
            Log.d(str, str2, th);
        }
    }

    public static <T, K> List<K> map(List<T> list, Mapper<T, K> mapper) {
        if (list == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (T apply : list) {
            K apply2 = mapper.apply(apply);
            if (apply2 != null) {
                arrayList.add(apply2);
            }
        }
        if (arrayList.size() != 0) {
            return arrayList;
        }
        return null;
    }

    public static String md5hash(String str) {
        return hashWithAlgorithm(HASH_ALGORITHM_MD5, str);
    }

    public static Bundle parseUrlQueryString(String str) {
        Bundle bundle = new Bundle();
        if (!isNullOrEmpty(str)) {
            for (String split : str.split("&")) {
                String[] split2 = split.split("=");
                try {
                    if (split2.length == 2) {
                        bundle.putString(URLDecoder.decode(split2[0], "UTF-8"), URLDecoder.decode(split2[1], "UTF-8"));
                    } else if (split2.length == 1) {
                        bundle.putString(URLDecoder.decode(split2[0], "UTF-8"), "");
                    }
                } catch (UnsupportedEncodingException e) {
                    logd(LOG_TAG, (Exception) e);
                }
            }
        }
        return bundle;
    }

    public static void putCommaSeparatedStringList(Bundle bundle, String str, List<String> list) {
        if (list != null) {
            StringBuilder sb = new StringBuilder();
            for (String append : list) {
                sb.append(append);
                sb.append(",");
            }
            String str2 = "";
            if (sb.length() > 0) {
                str2 = sb.substring(0, sb.length() - 1);
            }
            bundle.putString(str, str2);
        }
    }

    public static boolean putJSONValueInBundle(Bundle bundle, String str, Object obj) {
        if (obj == null) {
            bundle.remove(str);
        } else if (obj instanceof Boolean) {
            bundle.putBoolean(str, ((Boolean) obj).booleanValue());
        } else if (obj instanceof boolean[]) {
            bundle.putBooleanArray(str, (boolean[]) obj);
        } else if (obj instanceof Double) {
            bundle.putDouble(str, ((Double) obj).doubleValue());
        } else if (obj instanceof double[]) {
            bundle.putDoubleArray(str, (double[]) obj);
        } else if (obj instanceof Integer) {
            bundle.putInt(str, ((Integer) obj).intValue());
        } else if (obj instanceof int[]) {
            bundle.putIntArray(str, (int[]) obj);
        } else if (obj instanceof Long) {
            bundle.putLong(str, ((Long) obj).longValue());
        } else if (obj instanceof long[]) {
            bundle.putLongArray(str, (long[]) obj);
        } else if (obj instanceof String) {
            bundle.putString(str, (String) obj);
        } else if (obj instanceof JSONArray) {
            bundle.putString(str, obj.toString());
        } else if (!(obj instanceof JSONObject)) {
            return false;
        } else {
            bundle.putString(str, obj.toString());
        }
        return true;
    }

    public static void putNonEmptyString(Bundle bundle, String str, String str2) {
        if (!isNullOrEmpty(str2)) {
            bundle.putString(str, str2);
        }
    }

    public static void putUri(Bundle bundle, String str, Uri uri) {
        if (uri != null) {
            putNonEmptyString(bundle, str, uri.toString());
        }
    }

    public static String readStreamToString(InputStream inputStream) throws IOException {
        InputStreamReader inputStreamReader;
        BufferedInputStream bufferedInputStream;
        try {
            bufferedInputStream = new BufferedInputStream(inputStream);
            try {
                inputStreamReader = new InputStreamReader(bufferedInputStream);
                try {
                    StringBuilder sb = new StringBuilder();
                    char[] cArr = new char[2048];
                    while (true) {
                        int read = inputStreamReader.read(cArr);
                        if (read != -1) {
                            sb.append(cArr, 0, read);
                        } else {
                            String sb2 = sb.toString();
                            closeQuietly(bufferedInputStream);
                            closeQuietly(inputStreamReader);
                            return sb2;
                        }
                    }
                } catch (Throwable th) {
                    th = th;
                    closeQuietly(bufferedInputStream);
                    closeQuietly(inputStreamReader);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                inputStreamReader = null;
                closeQuietly(bufferedInputStream);
                closeQuietly(inputStreamReader);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            inputStreamReader = null;
            bufferedInputStream = null;
            closeQuietly(bufferedInputStream);
            closeQuietly(inputStreamReader);
            throw th;
        }
    }

    public static Map<String, String> readStringMapFromParcel(Parcel parcel) {
        int readInt = parcel.readInt();
        if (readInt < 0) {
            return null;
        }
        HashMap hashMap = new HashMap();
        for (int i = 0; i < readInt; i++) {
            hashMap.put(parcel.readString(), parcel.readString());
        }
        return hashMap;
    }

    private static void refreshAvailableExternalStorage() {
        try {
            if (externalStorageExists()) {
                StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
                availableExternalStorageGB = ((long) statFs.getBlockSize()) * ((long) statFs.getAvailableBlocks());
            }
            availableExternalStorageGB = convertBytesToGB((double) availableExternalStorageGB);
        } catch (Exception e) {
        }
    }

    private static int refreshBestGuessNumberOfCPUCores() {
        if (numCPUCores > 0) {
            return numCPUCores;
        }
        try {
            File[] listFiles = new File("/sys/devices/system/cpu/").listFiles(new FilenameFilter() {
                public boolean accept(File file, String str) {
                    return Pattern.matches("cpu[0-9]+", str);
                }
            });
            if (listFiles != null) {
                numCPUCores = listFiles.length;
            }
        } catch (Exception e) {
        }
        if (numCPUCores <= 0) {
            numCPUCores = Math.max(Runtime.getRuntime().availableProcessors(), 1);
        }
        return numCPUCores;
    }

    private static void refreshCarrierName(Context context) {
        if (carrierName.equals(noCarrierConstant)) {
            try {
                carrierName = ((TelephonyManager) context.getSystemService(PlaceFields.PHONE)).getNetworkOperatorName();
            } catch (Exception e) {
            }
        }
    }

    private static void refreshPeriodicExtendedDeviceInfo(Context context) {
        if (timestampOfLastCheck == -1 || System.currentTimeMillis() - timestampOfLastCheck >= 1800000) {
            timestampOfLastCheck = System.currentTimeMillis();
            refreshTimezone();
            refreshCarrierName(context);
            refreshTotalExternalStorage();
            refreshAvailableExternalStorage();
        }
    }

    private static void refreshTimezone() {
        try {
            TimeZone timeZone = TimeZone.getDefault();
            deviceTimezoneAbbreviation = timeZone.getDisplayName(timeZone.inDaylightTime(new Date()), 0);
            deviceTimeZoneName = timeZone.getID();
        } catch (Exception e) {
        }
    }

    private static void refreshTotalExternalStorage() {
        try {
            if (externalStorageExists()) {
                StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
                totalExternalStorageGB = ((long) statFs.getBlockSize()) * ((long) statFs.getBlockCount());
            }
            totalExternalStorageGB = convertBytesToGB((double) totalExternalStorageGB);
        } catch (Exception e) {
        }
    }

    public static String safeGetStringFromResponse(JSONObject jSONObject, String str) {
        return jSONObject != null ? jSONObject.optString(str, "") : "";
    }

    public static void setAppEventAttributionParameters(JSONObject jSONObject, AttributionIdentifiers attributionIdentifiers, String str, boolean z) throws JSONException {
        boolean z2 = true;
        if (!(attributionIdentifiers == null || attributionIdentifiers.getAttributionId() == null)) {
            jSONObject.put("attribution", attributionIdentifiers.getAttributionId());
        }
        if (!(attributionIdentifiers == null || attributionIdentifiers.getAndroidAdvertiserId() == null)) {
            jSONObject.put("advertiser_id", attributionIdentifiers.getAndroidAdvertiserId());
            jSONObject.put("advertiser_tracking_enabled", !attributionIdentifiers.isTrackingLimited());
        }
        if (!(attributionIdentifiers == null || attributionIdentifiers.getAndroidInstallerPackage() == null)) {
            jSONObject.put("installer_package", attributionIdentifiers.getAndroidInstallerPackage());
        }
        jSONObject.put("anon_id", str);
        if (z) {
            z2 = false;
        }
        jSONObject.put("application_tracking_enabled", z2);
    }

    public static void setAppEventExtendedDeviceInfoParameters(JSONObject jSONObject, Context context) throws JSONException {
        Locale locale;
        int i;
        int i2;
        double d;
        JSONArray jSONArray = new JSONArray();
        jSONArray.put(EXTRA_APP_EVENTS_INFO_FORMAT_VERSION);
        refreshPeriodicExtendedDeviceInfo(context);
        String packageName = context.getPackageName();
        int i3 = -1;
        String str = "";
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(packageName, 0);
            i3 = packageInfo.versionCode;
            str = packageInfo.versionName;
        } catch (PackageManager.NameNotFoundException e) {
        }
        jSONArray.put(packageName);
        jSONArray.put(i3);
        jSONArray.put(str);
        jSONArray.put(Build.VERSION.RELEASE);
        jSONArray.put(Build.MODEL);
        try {
            locale = context.getResources().getConfiguration().locale;
        } catch (Exception e2) {
            locale = Locale.getDefault();
        }
        jSONArray.put(locale.getLanguage() + "_" + locale.getCountry());
        jSONArray.put(deviceTimezoneAbbreviation);
        jSONArray.put(carrierName);
        try {
            WindowManager windowManager = (WindowManager) context.getSystemService("window");
            if (windowManager != null) {
                Display defaultDisplay = windowManager.getDefaultDisplay();
                DisplayMetrics displayMetrics = new DisplayMetrics();
                defaultDisplay.getMetrics(displayMetrics);
                i2 = displayMetrics.widthPixels;
                try {
                    i = displayMetrics.heightPixels;
                    try {
                        d = (double) displayMetrics.density;
                    } catch (Exception e3) {
                        d = 0.0d;
                        jSONArray.put(i2);
                        jSONArray.put(i);
                        jSONArray.put(String.format("%.2f", new Object[]{Double.valueOf(d)}));
                        jSONArray.put(refreshBestGuessNumberOfCPUCores());
                        jSONArray.put(totalExternalStorageGB);
                        jSONArray.put(availableExternalStorageGB);
                        jSONArray.put(deviceTimeZoneName);
                        jSONObject.put("extinfo", jSONArray.toString());
                    }
                } catch (Exception e4) {
                    i = 0;
                    d = 0.0d;
                    jSONArray.put(i2);
                    jSONArray.put(i);
                    jSONArray.put(String.format("%.2f", new Object[]{Double.valueOf(d)}));
                    jSONArray.put(refreshBestGuessNumberOfCPUCores());
                    jSONArray.put(totalExternalStorageGB);
                    jSONArray.put(availableExternalStorageGB);
                    jSONArray.put(deviceTimeZoneName);
                    jSONObject.put("extinfo", jSONArray.toString());
                }
            } else {
                d = 0.0d;
                i2 = 0;
                i = 0;
            }
        } catch (Exception e5) {
            i2 = 0;
            i = 0;
            d = 0.0d;
            jSONArray.put(i2);
            jSONArray.put(i);
            jSONArray.put(String.format("%.2f", new Object[]{Double.valueOf(d)}));
            jSONArray.put(refreshBestGuessNumberOfCPUCores());
            jSONArray.put(totalExternalStorageGB);
            jSONArray.put(availableExternalStorageGB);
            jSONArray.put(deviceTimeZoneName);
            jSONObject.put("extinfo", jSONArray.toString());
        }
        jSONArray.put(i2);
        jSONArray.put(i);
        jSONArray.put(String.format("%.2f", new Object[]{Double.valueOf(d)}));
        jSONArray.put(refreshBestGuessNumberOfCPUCores());
        jSONArray.put(totalExternalStorageGB);
        jSONArray.put(availableExternalStorageGB);
        jSONArray.put(deviceTimeZoneName);
        jSONObject.put("extinfo", jSONArray.toString());
    }

    public static String sha1hash(String str) {
        return hashWithAlgorithm(HASH_ALGORITHM_SHA1, str);
    }

    public static String sha1hash(byte[] bArr) {
        return hashWithAlgorithm(HASH_ALGORITHM_SHA1, bArr);
    }

    public static boolean stringsEqualOrEmpty(String str, String str2) {
        boolean isEmpty = TextUtils.isEmpty(str);
        boolean isEmpty2 = TextUtils.isEmpty(str2);
        if (isEmpty && isEmpty2) {
            return true;
        }
        if (isEmpty || isEmpty2) {
            return false;
        }
        return str.equals(str2);
    }

    public static JSONArray tryGetJSONArrayFromResponse(JSONObject jSONObject, String str) {
        if (jSONObject != null) {
            return jSONObject.optJSONArray(str);
        }
        return null;
    }

    public static JSONObject tryGetJSONObjectFromResponse(JSONObject jSONObject, String str) {
        if (jSONObject != null) {
            return jSONObject.optJSONObject(str);
        }
        return null;
    }

    public static <T> Collection<T> unmodifiableCollection(T... tArr) {
        return Collections.unmodifiableCollection(Arrays.asList(tArr));
    }

    public static void writeStringMapToParcel(Parcel parcel, Map<String, String> map) {
        if (map == null) {
            parcel.writeInt(-1);
            return;
        }
        parcel.writeInt(map.size());
        for (Map.Entry next : map.entrySet()) {
            parcel.writeString((String) next.getKey());
            parcel.writeString((String) next.getValue());
        }
    }
}
