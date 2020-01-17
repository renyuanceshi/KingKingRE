package com.facebook;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import com.facebook.internal.Logger;
import com.facebook.internal.Utility;
import com.facebook.internal.Validate;
import com.facebook.places.model.PlaceFields;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class LegacyTokenHelper {
    public static final String APPLICATION_ID_KEY = "com.facebook.TokenCachingStrategy.ApplicationId";
    public static final String DECLINED_PERMISSIONS_KEY = "com.facebook.TokenCachingStrategy.DeclinedPermissions";
    public static final String DEFAULT_CACHE_KEY = "com.facebook.SharedPreferencesTokenCachingStrategy.DEFAULT_KEY";
    public static final String EXPIRATION_DATE_KEY = "com.facebook.TokenCachingStrategy.ExpirationDate";
    private static final long INVALID_BUNDLE_MILLISECONDS = Long.MIN_VALUE;
    private static final String IS_SSO_KEY = "com.facebook.TokenCachingStrategy.IsSSO";
    private static final String JSON_VALUE = "value";
    private static final String JSON_VALUE_ENUM_TYPE = "enumType";
    private static final String JSON_VALUE_TYPE = "valueType";
    public static final String LAST_REFRESH_DATE_KEY = "com.facebook.TokenCachingStrategy.LastRefreshDate";
    public static final String PERMISSIONS_KEY = "com.facebook.TokenCachingStrategy.Permissions";
    private static final String TAG = LegacyTokenHelper.class.getSimpleName();
    public static final String TOKEN_KEY = "com.facebook.TokenCachingStrategy.Token";
    public static final String TOKEN_SOURCE_KEY = "com.facebook.TokenCachingStrategy.AccessTokenSource";
    private static final String TYPE_BOOLEAN = "bool";
    private static final String TYPE_BOOLEAN_ARRAY = "bool[]";
    private static final String TYPE_BYTE = "byte";
    private static final String TYPE_BYTE_ARRAY = "byte[]";
    private static final String TYPE_CHAR = "char";
    private static final String TYPE_CHAR_ARRAY = "char[]";
    private static final String TYPE_DOUBLE = "double";
    private static final String TYPE_DOUBLE_ARRAY = "double[]";
    private static final String TYPE_ENUM = "enum";
    private static final String TYPE_FLOAT = "float";
    private static final String TYPE_FLOAT_ARRAY = "float[]";
    private static final String TYPE_INTEGER = "int";
    private static final String TYPE_INTEGER_ARRAY = "int[]";
    private static final String TYPE_LONG = "long";
    private static final String TYPE_LONG_ARRAY = "long[]";
    private static final String TYPE_SHORT = "short";
    private static final String TYPE_SHORT_ARRAY = "short[]";
    private static final String TYPE_STRING = "string";
    private static final String TYPE_STRING_LIST = "stringList";
    private SharedPreferences cache;
    private String cacheKey;

    public LegacyTokenHelper(Context context) {
        this(context, (String) null);
    }

    public LegacyTokenHelper(Context context, String str) {
        Validate.notNull(context, PlaceFields.CONTEXT);
        this.cacheKey = Utility.isNullOrEmpty(str) ? DEFAULT_CACHE_KEY : str;
        Context applicationContext = context.getApplicationContext();
        this.cache = (applicationContext != null ? applicationContext : context).getSharedPreferences(this.cacheKey, 0);
    }

    private void deserializeKey(String str, Bundle bundle) throws JSONException {
        int i = 0;
        JSONObject jSONObject = new JSONObject(this.cache.getString(str, "{}"));
        String string = jSONObject.getString(JSON_VALUE_TYPE);
        if (string.equals(TYPE_BOOLEAN)) {
            bundle.putBoolean(str, jSONObject.getBoolean(JSON_VALUE));
        } else if (string.equals(TYPE_BOOLEAN_ARRAY)) {
            JSONArray jSONArray = jSONObject.getJSONArray(JSON_VALUE);
            boolean[] zArr = new boolean[jSONArray.length()];
            while (i < zArr.length) {
                zArr[i] = jSONArray.getBoolean(i);
                i++;
            }
            bundle.putBooleanArray(str, zArr);
        } else if (string.equals(TYPE_BYTE)) {
            bundle.putByte(str, (byte) jSONObject.getInt(JSON_VALUE));
        } else if (string.equals(TYPE_BYTE_ARRAY)) {
            JSONArray jSONArray2 = jSONObject.getJSONArray(JSON_VALUE);
            byte[] bArr = new byte[jSONArray2.length()];
            while (i < bArr.length) {
                bArr[i] = (byte) ((byte) jSONArray2.getInt(i));
                i++;
            }
            bundle.putByteArray(str, bArr);
        } else if (string.equals(TYPE_SHORT)) {
            bundle.putShort(str, (short) jSONObject.getInt(JSON_VALUE));
        } else if (string.equals(TYPE_SHORT_ARRAY)) {
            JSONArray jSONArray3 = jSONObject.getJSONArray(JSON_VALUE);
            short[] sArr = new short[jSONArray3.length()];
            while (i < sArr.length) {
                sArr[i] = (short) ((short) jSONArray3.getInt(i));
                i++;
            }
            bundle.putShortArray(str, sArr);
        } else if (string.equals("int")) {
            bundle.putInt(str, jSONObject.getInt(JSON_VALUE));
        } else if (string.equals(TYPE_INTEGER_ARRAY)) {
            JSONArray jSONArray4 = jSONObject.getJSONArray(JSON_VALUE);
            int[] iArr = new int[jSONArray4.length()];
            while (i < iArr.length) {
                iArr[i] = jSONArray4.getInt(i);
                i++;
            }
            bundle.putIntArray(str, iArr);
        } else if (string.equals(TYPE_LONG)) {
            bundle.putLong(str, jSONObject.getLong(JSON_VALUE));
        } else if (string.equals(TYPE_LONG_ARRAY)) {
            JSONArray jSONArray5 = jSONObject.getJSONArray(JSON_VALUE);
            long[] jArr = new long[jSONArray5.length()];
            while (i < jArr.length) {
                jArr[i] = jSONArray5.getLong(i);
                i++;
            }
            bundle.putLongArray(str, jArr);
        } else if (string.equals(TYPE_FLOAT)) {
            bundle.putFloat(str, (float) jSONObject.getDouble(JSON_VALUE));
        } else if (string.equals(TYPE_FLOAT_ARRAY)) {
            JSONArray jSONArray6 = jSONObject.getJSONArray(JSON_VALUE);
            float[] fArr = new float[jSONArray6.length()];
            while (i < fArr.length) {
                fArr[i] = (float) jSONArray6.getDouble(i);
                i++;
            }
            bundle.putFloatArray(str, fArr);
        } else if (string.equals("double")) {
            bundle.putDouble(str, jSONObject.getDouble(JSON_VALUE));
        } else if (string.equals(TYPE_DOUBLE_ARRAY)) {
            JSONArray jSONArray7 = jSONObject.getJSONArray(JSON_VALUE);
            double[] dArr = new double[jSONArray7.length()];
            while (i < dArr.length) {
                dArr[i] = jSONArray7.getDouble(i);
                i++;
            }
            bundle.putDoubleArray(str, dArr);
        } else if (string.equals(TYPE_CHAR)) {
            String string2 = jSONObject.getString(JSON_VALUE);
            if (string2 != null && string2.length() == 1) {
                bundle.putChar(str, string2.charAt(0));
            }
        } else if (string.equals(TYPE_CHAR_ARRAY)) {
            JSONArray jSONArray8 = jSONObject.getJSONArray(JSON_VALUE);
            char[] cArr = new char[jSONArray8.length()];
            for (int i2 = 0; i2 < cArr.length; i2++) {
                String string3 = jSONArray8.getString(i2);
                if (string3 != null && string3.length() == 1) {
                    cArr[i2] = string3.charAt(0);
                }
            }
            bundle.putCharArray(str, cArr);
        } else if (string.equals("string")) {
            bundle.putString(str, jSONObject.getString(JSON_VALUE));
        } else if (string.equals(TYPE_STRING_LIST)) {
            JSONArray jSONArray9 = jSONObject.getJSONArray(JSON_VALUE);
            int length = jSONArray9.length();
            ArrayList arrayList = new ArrayList(length);
            for (int i3 = 0; i3 < length; i3++) {
                Object obj = jSONArray9.get(i3);
                arrayList.add(i3, obj == JSONObject.NULL ? null : (String) obj);
            }
            bundle.putStringArrayList(str, arrayList);
        } else if (string.equals(TYPE_ENUM)) {
            try {
                bundle.putSerializable(str, Enum.valueOf(Class.forName(jSONObject.getString(JSON_VALUE_ENUM_TYPE)), jSONObject.getString(JSON_VALUE)));
            } catch (ClassNotFoundException | IllegalArgumentException e) {
            }
        }
    }

    public static String getApplicationId(Bundle bundle) {
        Validate.notNull(bundle, "bundle");
        return bundle.getString(APPLICATION_ID_KEY);
    }

    static Date getDate(Bundle bundle, String str) {
        if (bundle == null) {
            return null;
        }
        long j = bundle.getLong(str, INVALID_BUNDLE_MILLISECONDS);
        if (j != INVALID_BUNDLE_MILLISECONDS) {
            return new Date(j);
        }
        return null;
    }

    public static Date getExpirationDate(Bundle bundle) {
        Validate.notNull(bundle, "bundle");
        return getDate(bundle, EXPIRATION_DATE_KEY);
    }

    public static long getExpirationMilliseconds(Bundle bundle) {
        Validate.notNull(bundle, "bundle");
        return bundle.getLong(EXPIRATION_DATE_KEY);
    }

    public static Date getLastRefreshDate(Bundle bundle) {
        Validate.notNull(bundle, "bundle");
        return getDate(bundle, LAST_REFRESH_DATE_KEY);
    }

    public static long getLastRefreshMilliseconds(Bundle bundle) {
        Validate.notNull(bundle, "bundle");
        return bundle.getLong(LAST_REFRESH_DATE_KEY);
    }

    public static Set<String> getPermissions(Bundle bundle) {
        Validate.notNull(bundle, "bundle");
        ArrayList<String> stringArrayList = bundle.getStringArrayList(PERMISSIONS_KEY);
        if (stringArrayList == null) {
            return null;
        }
        return new HashSet(stringArrayList);
    }

    public static AccessTokenSource getSource(Bundle bundle) {
        Validate.notNull(bundle, "bundle");
        return bundle.containsKey(TOKEN_SOURCE_KEY) ? (AccessTokenSource) bundle.getSerializable(TOKEN_SOURCE_KEY) : bundle.getBoolean(IS_SSO_KEY) ? AccessTokenSource.FACEBOOK_APPLICATION_WEB : AccessTokenSource.WEB_VIEW;
    }

    public static String getToken(Bundle bundle) {
        Validate.notNull(bundle, "bundle");
        return bundle.getString(TOKEN_KEY);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:2:0x0006, code lost:
        r1 = r6.getString(TOKEN_KEY);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean hasTokenInformation(android.os.Bundle r6) {
        /*
            r4 = 0
            r0 = 0
            if (r6 != 0) goto L_0x0006
        L_0x0005:
            return r0
        L_0x0006:
            java.lang.String r1 = "com.facebook.TokenCachingStrategy.Token"
            java.lang.String r1 = r6.getString(r1)
            if (r1 == 0) goto L_0x0005
            int r1 = r1.length()
            if (r1 == 0) goto L_0x0005
            java.lang.String r1 = "com.facebook.TokenCachingStrategy.ExpirationDate"
            long r2 = r6.getLong(r1, r4)
            int r1 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r1 == 0) goto L_0x0005
            r0 = 1
            goto L_0x0005
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.LegacyTokenHelper.hasTokenInformation(android.os.Bundle):boolean");
    }

    public static void putApplicationId(Bundle bundle, String str) {
        Validate.notNull(bundle, "bundle");
        bundle.putString(APPLICATION_ID_KEY, str);
    }

    static void putDate(Bundle bundle, String str, Date date) {
        bundle.putLong(str, date.getTime());
    }

    public static void putDeclinedPermissions(Bundle bundle, Collection<String> collection) {
        Validate.notNull(bundle, "bundle");
        Validate.notNull(collection, JSON_VALUE);
        bundle.putStringArrayList(DECLINED_PERMISSIONS_KEY, new ArrayList(collection));
    }

    public static void putExpirationDate(Bundle bundle, Date date) {
        Validate.notNull(bundle, "bundle");
        Validate.notNull(date, JSON_VALUE);
        putDate(bundle, EXPIRATION_DATE_KEY, date);
    }

    public static void putExpirationMilliseconds(Bundle bundle, long j) {
        Validate.notNull(bundle, "bundle");
        bundle.putLong(EXPIRATION_DATE_KEY, j);
    }

    public static void putLastRefreshDate(Bundle bundle, Date date) {
        Validate.notNull(bundle, "bundle");
        Validate.notNull(date, JSON_VALUE);
        putDate(bundle, LAST_REFRESH_DATE_KEY, date);
    }

    public static void putLastRefreshMilliseconds(Bundle bundle, long j) {
        Validate.notNull(bundle, "bundle");
        bundle.putLong(LAST_REFRESH_DATE_KEY, j);
    }

    public static void putPermissions(Bundle bundle, Collection<String> collection) {
        Validate.notNull(bundle, "bundle");
        Validate.notNull(collection, JSON_VALUE);
        bundle.putStringArrayList(PERMISSIONS_KEY, new ArrayList(collection));
    }

    public static void putSource(Bundle bundle, AccessTokenSource accessTokenSource) {
        Validate.notNull(bundle, "bundle");
        bundle.putSerializable(TOKEN_SOURCE_KEY, accessTokenSource);
    }

    public static void putToken(Bundle bundle, String str) {
        Validate.notNull(bundle, "bundle");
        Validate.notNull(str, JSON_VALUE);
        bundle.putString(TOKEN_KEY, str);
    }

    private void serializeKey(String str, Bundle bundle, SharedPreferences.Editor editor) throws JSONException {
        String str2;
        JSONArray jSONArray;
        String str3;
        int i = 0;
        Object obj = bundle.get(str);
        if (obj != null) {
            JSONObject jSONObject = new JSONObject();
            if (obj instanceof Byte) {
                str3 = TYPE_BYTE;
                jSONObject.put(JSON_VALUE, ((Byte) obj).intValue());
                jSONArray = null;
            } else if (obj instanceof Short) {
                str3 = TYPE_SHORT;
                jSONObject.put(JSON_VALUE, ((Short) obj).intValue());
                jSONArray = null;
            } else if (obj instanceof Integer) {
                str3 = "int";
                jSONObject.put(JSON_VALUE, ((Integer) obj).intValue());
                jSONArray = null;
            } else if (obj instanceof Long) {
                str3 = TYPE_LONG;
                jSONObject.put(JSON_VALUE, ((Long) obj).longValue());
                jSONArray = null;
            } else if (obj instanceof Float) {
                str3 = TYPE_FLOAT;
                jSONObject.put(JSON_VALUE, ((Float) obj).doubleValue());
                jSONArray = null;
            } else if (obj instanceof Double) {
                str3 = "double";
                jSONObject.put(JSON_VALUE, ((Double) obj).doubleValue());
                jSONArray = null;
            } else if (obj instanceof Boolean) {
                str3 = TYPE_BOOLEAN;
                jSONObject.put(JSON_VALUE, ((Boolean) obj).booleanValue());
                jSONArray = null;
            } else if (obj instanceof Character) {
                str3 = TYPE_CHAR;
                jSONObject.put(JSON_VALUE, obj.toString());
                jSONArray = null;
            } else if (obj instanceof String) {
                str3 = "string";
                jSONObject.put(JSON_VALUE, (String) obj);
                jSONArray = null;
            } else if (obj instanceof Enum) {
                str3 = TYPE_ENUM;
                jSONObject.put(JSON_VALUE, obj.toString());
                jSONObject.put(JSON_VALUE_ENUM_TYPE, obj.getClass().getName());
                jSONArray = null;
            } else {
                JSONArray jSONArray2 = new JSONArray();
                if (obj instanceof byte[]) {
                    str2 = TYPE_BYTE_ARRAY;
                    byte[] bArr = (byte[]) obj;
                    int length = bArr.length;
                    while (i < length) {
                        jSONArray2.put(bArr[i]);
                        i++;
                    }
                } else if (obj instanceof short[]) {
                    str2 = TYPE_SHORT_ARRAY;
                    short[] sArr = (short[]) obj;
                    int length2 = sArr.length;
                    while (i < length2) {
                        jSONArray2.put(sArr[i]);
                        i++;
                    }
                } else if (obj instanceof int[]) {
                    str2 = TYPE_INTEGER_ARRAY;
                    int[] iArr = (int[]) obj;
                    int length3 = iArr.length;
                    while (i < length3) {
                        jSONArray2.put(iArr[i]);
                        i++;
                    }
                } else if (obj instanceof long[]) {
                    str2 = TYPE_LONG_ARRAY;
                    long[] jArr = (long[]) obj;
                    int length4 = jArr.length;
                    while (i < length4) {
                        jSONArray2.put(jArr[i]);
                        i++;
                    }
                } else if (obj instanceof float[]) {
                    str2 = TYPE_FLOAT_ARRAY;
                    float[] fArr = (float[]) obj;
                    int length5 = fArr.length;
                    while (i < length5) {
                        jSONArray2.put((double) fArr[i]);
                        i++;
                    }
                } else if (obj instanceof double[]) {
                    str2 = TYPE_DOUBLE_ARRAY;
                    double[] dArr = (double[]) obj;
                    int length6 = dArr.length;
                    while (i < length6) {
                        jSONArray2.put(dArr[i]);
                        i++;
                    }
                } else if (obj instanceof boolean[]) {
                    str2 = TYPE_BOOLEAN_ARRAY;
                    boolean[] zArr = (boolean[]) obj;
                    int length7 = zArr.length;
                    while (i < length7) {
                        jSONArray2.put(zArr[i]);
                        i++;
                    }
                } else if (obj instanceof char[]) {
                    str2 = TYPE_CHAR_ARRAY;
                    char[] cArr = (char[]) obj;
                    int length8 = cArr.length;
                    while (i < length8) {
                        jSONArray2.put(String.valueOf(cArr[i]));
                        i++;
                    }
                } else if (obj instanceof List) {
                    str2 = TYPE_STRING_LIST;
                    for (Object obj2 : (List) obj) {
                        if (obj2 == null) {
                            obj2 = JSONObject.NULL;
                        }
                        jSONArray2.put(obj2);
                    }
                } else {
                    jSONArray = null;
                    str3 = null;
                }
                jSONArray = jSONArray2;
                str3 = str2;
            }
            if (str3 != null) {
                jSONObject.put(JSON_VALUE_TYPE, str3);
                if (jSONArray != null) {
                    jSONObject.putOpt(JSON_VALUE, jSONArray);
                }
                editor.putString(str, jSONObject.toString());
            }
        }
    }

    public void clear() {
        this.cache.edit().clear().apply();
    }

    public Bundle load() {
        Bundle bundle = new Bundle();
        for (String next : this.cache.getAll().keySet()) {
            try {
                deserializeKey(next, bundle);
            } catch (JSONException e) {
                Logger.log(LoggingBehavior.CACHE, 5, TAG, "Error reading cached value for key: '" + next + "' -- " + e);
                return null;
            }
        }
        return bundle;
    }

    public void save(Bundle bundle) {
        Validate.notNull(bundle, "bundle");
        SharedPreferences.Editor edit = this.cache.edit();
        for (String str : bundle.keySet()) {
            try {
                serializeKey(str, bundle, edit);
            } catch (JSONException e) {
                Logger.log(LoggingBehavior.CACHE, 5, TAG, "Error processing value for key: '" + str + "' -- " + e);
                return;
            }
        }
        edit.apply();
    }
}
