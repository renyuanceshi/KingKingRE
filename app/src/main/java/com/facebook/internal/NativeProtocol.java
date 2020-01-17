package com.facebook.internal;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.facebook.FacebookException;
import com.facebook.FacebookOperationCanceledException;
import com.facebook.FacebookSdk;
import com.facebook.login.DefaultAudience;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;

public final class NativeProtocol {
    public static final String ACTION_APPINVITE_DIALOG = "com.facebook.platform.action.request.APPINVITES_DIALOG";
    public static final String ACTION_FEED_DIALOG = "com.facebook.platform.action.request.FEED_DIALOG";
    public static final String ACTION_LIKE_DIALOG = "com.facebook.platform.action.request.LIKE_DIALOG";
    public static final String ACTION_MESSAGE_DIALOG = "com.facebook.platform.action.request.MESSAGE_DIALOG";
    public static final String ACTION_OGACTIONPUBLISH_DIALOG = "com.facebook.platform.action.request.OGACTIONPUBLISH_DIALOG";
    public static final String ACTION_OGMESSAGEPUBLISH_DIALOG = "com.facebook.platform.action.request.OGMESSAGEPUBLISH_DIALOG";
    public static final String AUDIENCE_EVERYONE = "everyone";
    public static final String AUDIENCE_FRIENDS = "friends";
    public static final String AUDIENCE_ME = "only_me";
    public static final String BRIDGE_ARG_ACTION_ID_STRING = "action_id";
    public static final String BRIDGE_ARG_APP_NAME_STRING = "app_name";
    public static final String BRIDGE_ARG_ERROR_BUNDLE = "error";
    public static final String BRIDGE_ARG_ERROR_CODE = "error_code";
    public static final String BRIDGE_ARG_ERROR_DESCRIPTION = "error_description";
    public static final String BRIDGE_ARG_ERROR_JSON = "error_json";
    public static final String BRIDGE_ARG_ERROR_SUBCODE = "error_subcode";
    public static final String BRIDGE_ARG_ERROR_TYPE = "error_type";
    private static final String CONTENT_SCHEME = "content://";
    public static final String ERROR_APPLICATION_ERROR = "ApplicationError";
    public static final String ERROR_NETWORK_ERROR = "NetworkError";
    public static final String ERROR_PERMISSION_DENIED = "PermissionDenied";
    public static final String ERROR_PROTOCOL_ERROR = "ProtocolError";
    public static final String ERROR_SERVICE_DISABLED = "ServiceDisabled";
    public static final String ERROR_UNKNOWN_ERROR = "UnknownError";
    public static final String ERROR_USER_CANCELED = "UserCanceled";
    public static final String EXTRA_ACCESS_TOKEN = "com.facebook.platform.extra.ACCESS_TOKEN";
    public static final String EXTRA_APPLICATION_ID = "com.facebook.platform.extra.APPLICATION_ID";
    public static final String EXTRA_APPLICATION_NAME = "com.facebook.platform.extra.APPLICATION_NAME";
    public static final String EXTRA_ARGS_PROFILE = "com.facebook.platform.extra.PROFILE";
    public static final String EXTRA_ARGS_PROFILE_FIRST_NAME = "com.facebook.platform.extra.PROFILE_FIRST_NAME";
    public static final String EXTRA_ARGS_PROFILE_LAST_NAME = "com.facebook.platform.extra.PROFILE_LAST_NAME";
    public static final String EXTRA_ARGS_PROFILE_LINK = "com.facebook.platform.extra.PROFILE_LINK";
    public static final String EXTRA_ARGS_PROFILE_MIDDLE_NAME = "com.facebook.platform.extra.PROFILE_MIDDLE_NAME";
    public static final String EXTRA_ARGS_PROFILE_NAME = "com.facebook.platform.extra.PROFILE_NAME";
    public static final String EXTRA_ARGS_PROFILE_USER_ID = "com.facebook.platform.extra.PROFILE_USER_ID";
    public static final String EXTRA_DIALOG_COMPLETE_KEY = "com.facebook.platform.extra.DID_COMPLETE";
    public static final String EXTRA_DIALOG_COMPLETION_GESTURE_KEY = "com.facebook.platform.extra.COMPLETION_GESTURE";
    public static final String EXTRA_EXPIRES_SECONDS_SINCE_EPOCH = "com.facebook.platform.extra.EXPIRES_SECONDS_SINCE_EPOCH";
    public static final String EXTRA_GET_INSTALL_DATA_PACKAGE = "com.facebook.platform.extra.INSTALLDATA_PACKAGE";
    public static final String EXTRA_GRAPH_API_VERSION = "com.facebook.platform.extra.GRAPH_API_VERSION";
    public static final String EXTRA_LOGGER_REF = "com.facebook.platform.extra.LOGGER_REF";
    public static final String EXTRA_PERMISSIONS = "com.facebook.platform.extra.PERMISSIONS";
    public static final String EXTRA_PROTOCOL_ACTION = "com.facebook.platform.protocol.PROTOCOL_ACTION";
    public static final String EXTRA_PROTOCOL_BRIDGE_ARGS = "com.facebook.platform.protocol.BRIDGE_ARGS";
    public static final String EXTRA_PROTOCOL_CALL_ID = "com.facebook.platform.protocol.CALL_ID";
    public static final String EXTRA_PROTOCOL_METHOD_ARGS = "com.facebook.platform.protocol.METHOD_ARGS";
    public static final String EXTRA_PROTOCOL_METHOD_RESULTS = "com.facebook.platform.protocol.RESULT_ARGS";
    public static final String EXTRA_PROTOCOL_VERSION = "com.facebook.platform.protocol.PROTOCOL_VERSION";
    static final String EXTRA_PROTOCOL_VERSIONS = "com.facebook.platform.extra.PROTOCOL_VERSIONS";
    public static final String EXTRA_TOAST_DURATION_MS = "com.facebook.platform.extra.EXTRA_TOAST_DURATION_MS";
    public static final String EXTRA_USER_ID = "com.facebook.platform.extra.USER_ID";
    private static final String FACEBOOK_PROXY_AUTH_ACTIVITY = "com.facebook.katana.ProxyAuth";
    public static final String FACEBOOK_PROXY_AUTH_APP_ID_KEY = "client_id";
    public static final String FACEBOOK_PROXY_AUTH_E2E_KEY = "e2e";
    public static final String FACEBOOK_PROXY_AUTH_PERMISSIONS_KEY = "scope";
    public static final String FACEBOOK_SDK_VERSION_KEY = "facebook_sdk_version";
    private static final String FACEBOOK_TOKEN_REFRESH_ACTIVITY = "com.facebook.katana.platform.TokenRefreshService";
    public static final String IMAGE_URL_KEY = "url";
    public static final String IMAGE_USER_GENERATED_KEY = "user_generated";
    static final String INTENT_ACTION_PLATFORM_ACTIVITY = "com.facebook.platform.PLATFORM_ACTIVITY";
    static final String INTENT_ACTION_PLATFORM_SERVICE = "com.facebook.platform.PLATFORM_SERVICE";
    private static final List<Integer> KNOWN_PROTOCOL_VERSIONS = Arrays.asList(new Integer[]{Integer.valueOf(PROTOCOL_VERSION_20160327), Integer.valueOf(PROTOCOL_VERSION_20141218), Integer.valueOf(PROTOCOL_VERSION_20141107), Integer.valueOf(PROTOCOL_VERSION_20141028), Integer.valueOf(PROTOCOL_VERSION_20141001), Integer.valueOf(PROTOCOL_VERSION_20140701), Integer.valueOf(PROTOCOL_VERSION_20140324), Integer.valueOf(PROTOCOL_VERSION_20140204), Integer.valueOf(PROTOCOL_VERSION_20131107), Integer.valueOf(PROTOCOL_VERSION_20130618), Integer.valueOf(PROTOCOL_VERSION_20130502), Integer.valueOf(PROTOCOL_VERSION_20121101)});
    public static final int MESSAGE_GET_ACCESS_TOKEN_REPLY = 65537;
    public static final int MESSAGE_GET_ACCESS_TOKEN_REQUEST = 65536;
    public static final int MESSAGE_GET_AK_SEAMLESS_TOKEN_REPLY = 65545;
    public static final int MESSAGE_GET_AK_SEAMLESS_TOKEN_REQUEST = 65544;
    public static final int MESSAGE_GET_INSTALL_DATA_REPLY = 65541;
    public static final int MESSAGE_GET_INSTALL_DATA_REQUEST = 65540;
    public static final int MESSAGE_GET_LIKE_STATUS_REPLY = 65543;
    public static final int MESSAGE_GET_LIKE_STATUS_REQUEST = 65542;
    public static final int MESSAGE_GET_LOGIN_STATUS_REPLY = 65547;
    public static final int MESSAGE_GET_LOGIN_STATUS_REQUEST = 65546;
    static final int MESSAGE_GET_PROTOCOL_VERSIONS_REPLY = 65539;
    static final int MESSAGE_GET_PROTOCOL_VERSIONS_REQUEST = 65538;
    public static final int NO_PROTOCOL_AVAILABLE = -1;
    public static final String OPEN_GRAPH_CREATE_OBJECT_KEY = "fbsdk:create_object";
    private static final String PLATFORM_PROVIDER = ".provider.PlatformProvider";
    private static final String PLATFORM_PROVIDER_VERSIONS = ".provider.PlatformProvider/versions";
    private static final String PLATFORM_PROVIDER_VERSION_COLUMN = "version";
    public static final int PROTOCOL_VERSION_20121101 = 20121101;
    public static final int PROTOCOL_VERSION_20130502 = 20130502;
    public static final int PROTOCOL_VERSION_20130618 = 20130618;
    public static final int PROTOCOL_VERSION_20131107 = 20131107;
    public static final int PROTOCOL_VERSION_20140204 = 20140204;
    public static final int PROTOCOL_VERSION_20140324 = 20140324;
    public static final int PROTOCOL_VERSION_20140701 = 20140701;
    public static final int PROTOCOL_VERSION_20141001 = 20141001;
    public static final int PROTOCOL_VERSION_20141028 = 20141028;
    public static final int PROTOCOL_VERSION_20141107 = 20141107;
    public static final int PROTOCOL_VERSION_20141218 = 20141218;
    public static final int PROTOCOL_VERSION_20160327 = 20160327;
    public static final int PROTOCOL_VERSION_20170411 = 20170411;
    public static final String RESULT_ARGS_ACCESS_TOKEN = "access_token";
    public static final String RESULT_ARGS_DIALOG_COMPLETE_KEY = "didComplete";
    public static final String RESULT_ARGS_DIALOG_COMPLETION_GESTURE_KEY = "completionGesture";
    public static final String RESULT_ARGS_EXPIRES_SECONDS_SINCE_EPOCH = "expires_seconds_since_epoch";
    public static final String RESULT_ARGS_PERMISSIONS = "permissions";
    public static final String RESULT_ARGS_SIGNED_REQUEST = "signed request";
    public static final String STATUS_ERROR_CODE = "com.facebook.platform.status.ERROR_CODE";
    public static final String STATUS_ERROR_DESCRIPTION = "com.facebook.platform.status.ERROR_DESCRIPTION";
    public static final String STATUS_ERROR_JSON = "com.facebook.platform.status.ERROR_JSON";
    public static final String STATUS_ERROR_SUBCODE = "com.facebook.platform.status.ERROR_SUBCODE";
    public static final String STATUS_ERROR_TYPE = "com.facebook.platform.status.ERROR_TYPE";
    private static final String TAG = NativeProtocol.class.getName();
    public static final String WEB_DIALOG_ACTION = "action";
    public static final String WEB_DIALOG_IS_FALLBACK = "is_fallback";
    public static final String WEB_DIALOG_PARAMS = "params";
    public static final String WEB_DIALOG_URL = "url";
    private static Map<String, List<NativeAppInfo>> actionToAppInfoMap = buildActionToAppInfoMap();
    /* access modifiers changed from: private */
    public static List<NativeAppInfo> facebookAppInfoList = buildFacebookAppList();
    /* access modifiers changed from: private */
    public static AtomicBoolean protocolVersionsAsyncUpdating = new AtomicBoolean(false);

    private static class FBLiteAppInfo extends NativeAppInfo {
        static final String FACEBOOK_LITE_ACTIVITY = "com.facebook.lite.platform.LoginGDPDialogActivity";
        static final String FBLITE_PACKAGE = "com.facebook.lite";

        private FBLiteAppInfo() {
            super();
        }

        /* access modifiers changed from: protected */
        public String getLoginActivity() {
            return FACEBOOK_LITE_ACTIVITY;
        }

        /* access modifiers changed from: protected */
        public String getPackage() {
            return FBLITE_PACKAGE;
        }
    }

    private static class KatanaAppInfo extends NativeAppInfo {
        static final String KATANA_PACKAGE = "com.facebook.katana";

        private KatanaAppInfo() {
            super();
        }

        /* access modifiers changed from: protected */
        public String getLoginActivity() {
            return NativeProtocol.FACEBOOK_PROXY_AUTH_ACTIVITY;
        }

        /* access modifiers changed from: protected */
        public String getPackage() {
            return KATANA_PACKAGE;
        }
    }

    private static class MessengerAppInfo extends NativeAppInfo {
        static final String MESSENGER_PACKAGE = "com.facebook.orca";

        private MessengerAppInfo() {
            super();
        }

        /* access modifiers changed from: protected */
        public String getLoginActivity() {
            return null;
        }

        /* access modifiers changed from: protected */
        public String getPackage() {
            return "com.facebook.orca";
        }
    }

    private static abstract class NativeAppInfo {
        private TreeSet<Integer> availableVersions;

        private NativeAppInfo() {
        }

        /* access modifiers changed from: private */
        /* JADX WARNING: Code restructure failed: missing block: B:4:0x0005, code lost:
            if (r1.availableVersions == null) goto L_0x0007;
         */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void fetchAvailableVersions(boolean r2) {
            /*
                r1 = this;
                monitor-enter(r1)
                if (r2 != 0) goto L_0x0007
                java.util.TreeSet<java.lang.Integer> r0 = r1.availableVersions     // Catch:{ all -> 0x000f }
                if (r0 != 0) goto L_0x000d
            L_0x0007:
                java.util.TreeSet r0 = com.facebook.internal.NativeProtocol.fetchAllAvailableProtocolVersionsForAppInfo(r1)     // Catch:{ all -> 0x000f }
                r1.availableVersions = r0     // Catch:{ all -> 0x000f }
            L_0x000d:
                monitor-exit(r1)
                return
            L_0x000f:
                r0 = move-exception
                monitor-exit(r1)
                throw r0
            */
            throw new UnsupportedOperationException("Method not decompiled: com.facebook.internal.NativeProtocol.NativeAppInfo.fetchAvailableVersions(boolean):void");
        }

        public TreeSet<Integer> getAvailableVersions() {
            if (this.availableVersions == null) {
                fetchAvailableVersions(false);
            }
            return this.availableVersions;
        }

        /* access modifiers changed from: protected */
        public abstract String getLoginActivity();

        /* access modifiers changed from: protected */
        public abstract String getPackage();
    }

    public static class ProtocolVersionQueryResult {
        /* access modifiers changed from: private */
        public NativeAppInfo nativeAppInfo;
        /* access modifiers changed from: private */
        public int protocolVersion;

        private ProtocolVersionQueryResult() {
        }

        public static ProtocolVersionQueryResult create(NativeAppInfo nativeAppInfo2, int i) {
            ProtocolVersionQueryResult protocolVersionQueryResult = new ProtocolVersionQueryResult();
            protocolVersionQueryResult.nativeAppInfo = nativeAppInfo2;
            protocolVersionQueryResult.protocolVersion = i;
            return protocolVersionQueryResult;
        }

        public static ProtocolVersionQueryResult createEmpty() {
            ProtocolVersionQueryResult protocolVersionQueryResult = new ProtocolVersionQueryResult();
            protocolVersionQueryResult.protocolVersion = -1;
            return protocolVersionQueryResult;
        }

        @Nullable
        public NativeAppInfo getAppInfo() {
            return this.nativeAppInfo;
        }

        public int getProtocolVersion() {
            return this.protocolVersion;
        }
    }

    private static class WakizashiAppInfo extends NativeAppInfo {
        static final String WAKIZASHI_PACKAGE = "com.facebook.wakizashi";

        private WakizashiAppInfo() {
            super();
        }

        /* access modifiers changed from: protected */
        public String getLoginActivity() {
            return NativeProtocol.FACEBOOK_PROXY_AUTH_ACTIVITY;
        }

        /* access modifiers changed from: protected */
        public String getPackage() {
            return WAKIZASHI_PACKAGE;
        }
    }

    private static Map<String, List<NativeAppInfo>> buildActionToAppInfoMap() {
        HashMap hashMap = new HashMap();
        ArrayList arrayList = new ArrayList();
        arrayList.add(new MessengerAppInfo());
        hashMap.put(ACTION_OGACTIONPUBLISH_DIALOG, facebookAppInfoList);
        hashMap.put(ACTION_FEED_DIALOG, facebookAppInfoList);
        hashMap.put(ACTION_LIKE_DIALOG, facebookAppInfoList);
        hashMap.put(ACTION_APPINVITE_DIALOG, facebookAppInfoList);
        hashMap.put(ACTION_MESSAGE_DIALOG, arrayList);
        hashMap.put(ACTION_OGMESSAGEPUBLISH_DIALOG, arrayList);
        return hashMap;
    }

    private static List<NativeAppInfo> buildFacebookAppList() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new KatanaAppInfo());
        arrayList.add(new WakizashiAppInfo());
        return arrayList;
    }

    private static Uri buildPlatformProviderVersionURI(NativeAppInfo nativeAppInfo) {
        return Uri.parse(CONTENT_SCHEME + nativeAppInfo.getPackage() + PLATFORM_PROVIDER_VERSIONS);
    }

    public static int computeLatestAvailableVersionFromVersionSpec(TreeSet<Integer> treeSet, int i, int[] iArr) {
        Iterator<Integer> descendingIterator = treeSet.descendingIterator();
        int i2 = -1;
        int length = iArr.length - 1;
        while (descendingIterator.hasNext()) {
            int intValue = descendingIterator.next().intValue();
            int max = Math.max(i2, intValue);
            while (length >= 0 && iArr[length] > intValue) {
                length--;
            }
            if (length < 0) {
                return -1;
            }
            if (iArr[length] != intValue) {
                i2 = max;
            } else if (length % 2 == 0) {
                return Math.min(max, i);
            } else {
                return -1;
            }
        }
        return -1;
    }

    public static Bundle createBundleForException(FacebookException facebookException) {
        if (facebookException == null) {
            return null;
        }
        Bundle bundle = new Bundle();
        bundle.putString(BRIDGE_ARG_ERROR_DESCRIPTION, facebookException.toString());
        if (!(facebookException instanceof FacebookOperationCanceledException)) {
            return bundle;
        }
        bundle.putString(BRIDGE_ARG_ERROR_TYPE, ERROR_USER_CANCELED);
        return bundle;
    }

    public static Intent createFacebookLiteIntent(Context context, String str, Collection<String> collection, String str2, boolean z, boolean z2, DefaultAudience defaultAudience, String str3) {
        FBLiteAppInfo fBLiteAppInfo = new FBLiteAppInfo();
        return validateActivityIntent(context, createNativeAppIntent(fBLiteAppInfo, str, collection, str2, z, z2, defaultAudience, str3), fBLiteAppInfo);
    }

    private static Intent createNativeAppIntent(NativeAppInfo nativeAppInfo, String str, Collection<String> collection, String str2, boolean z, boolean z2, DefaultAudience defaultAudience, String str3) {
        String loginActivity = nativeAppInfo.getLoginActivity();
        if (loginActivity == null) {
            return null;
        }
        Intent putExtra = new Intent().setClassName(nativeAppInfo.getPackage(), loginActivity).putExtra("client_id", str);
        putExtra.putExtra(FACEBOOK_SDK_VERSION_KEY, FacebookSdk.getSdkVersion());
        if (!Utility.isNullOrEmpty(collection)) {
            putExtra.putExtra("scope", TextUtils.join(",", collection));
        }
        if (!Utility.isNullOrEmpty(str2)) {
            putExtra.putExtra("e2e", str2);
        }
        putExtra.putExtra(ServerProtocol.DIALOG_PARAM_STATE, str3);
        putExtra.putExtra(ServerProtocol.DIALOG_PARAM_RESPONSE_TYPE, ServerProtocol.DIALOG_RESPONSE_TYPE_TOKEN_AND_SIGNED_REQUEST);
        putExtra.putExtra(ServerProtocol.DIALOG_PARAM_RETURN_SCOPES, "true");
        if (z2) {
            putExtra.putExtra(ServerProtocol.DIALOG_PARAM_DEFAULT_AUDIENCE, defaultAudience.getNativeProtocolAudience());
        }
        putExtra.putExtra(ServerProtocol.DIALOG_PARAM_LEGACY_OVERRIDE, FacebookSdk.getGraphApiVersion());
        putExtra.putExtra(ServerProtocol.DIALOG_PARAM_AUTH_TYPE, ServerProtocol.DIALOG_REREQUEST_AUTH_TYPE);
        return putExtra;
    }

    public static Intent createPlatformActivityIntent(Context context, String str, String str2, ProtocolVersionQueryResult protocolVersionQueryResult, Bundle bundle) {
        NativeAppInfo access$600;
        Intent validateActivityIntent;
        if (protocolVersionQueryResult == null || (access$600 = protocolVersionQueryResult.nativeAppInfo) == null || (validateActivityIntent = validateActivityIntent(context, new Intent().setAction(INTENT_ACTION_PLATFORM_ACTIVITY).setPackage(access$600.getPackage()).addCategory("android.intent.category.DEFAULT"), access$600)) == null) {
            return null;
        }
        setupProtocolRequestIntent(validateActivityIntent, str, str2, protocolVersionQueryResult.protocolVersion, bundle);
        return validateActivityIntent;
    }

    public static Intent createPlatformServiceIntent(Context context) {
        for (NativeAppInfo next : facebookAppInfoList) {
            Intent validateServiceIntent = validateServiceIntent(context, new Intent(INTENT_ACTION_PLATFORM_SERVICE).setPackage(next.getPackage()).addCategory("android.intent.category.DEFAULT"), next);
            if (validateServiceIntent != null) {
                return validateServiceIntent;
            }
        }
        return null;
    }

    public static Intent createProtocolResultIntent(Intent intent, Bundle bundle, FacebookException facebookException) {
        UUID callIdFromIntent = getCallIdFromIntent(intent);
        if (callIdFromIntent == null) {
            return null;
        }
        Intent intent2 = new Intent();
        intent2.putExtra(EXTRA_PROTOCOL_VERSION, getProtocolVersionFromIntent(intent));
        Bundle bundle2 = new Bundle();
        bundle2.putString("action_id", callIdFromIntent.toString());
        if (facebookException != null) {
            bundle2.putBundle("error", createBundleForException(facebookException));
        }
        intent2.putExtra(EXTRA_PROTOCOL_BRIDGE_ARGS, bundle2);
        if (bundle == null) {
            return intent2;
        }
        intent2.putExtra(EXTRA_PROTOCOL_METHOD_RESULTS, bundle);
        return intent2;
    }

    public static Intent createProxyAuthIntent(Context context, String str, Collection<String> collection, String str2, boolean z, boolean z2, DefaultAudience defaultAudience, String str3) {
        for (NativeAppInfo next : facebookAppInfoList) {
            Intent validateActivityIntent = validateActivityIntent(context, createNativeAppIntent(next, str, collection, str2, z, z2, defaultAudience, str3), next);
            if (validateActivityIntent != null) {
                return validateActivityIntent;
            }
        }
        return null;
    }

    public static Intent createTokenRefreshIntent(Context context) {
        for (NativeAppInfo next : facebookAppInfoList) {
            Intent validateServiceIntent = validateServiceIntent(context, new Intent().setClassName(next.getPackage(), FACEBOOK_TOKEN_REFRESH_ACTIVITY), next);
            if (validateServiceIntent != null) {
                return validateServiceIntent;
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:17:0x0064  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static java.util.TreeSet<java.lang.Integer> fetchAllAvailableProtocolVersionsForAppInfo(com.facebook.internal.NativeProtocol.NativeAppInfo r8) {
        /*
            r6 = 0
            java.util.TreeSet r7 = new java.util.TreeSet
            r7.<init>()
            android.content.Context r0 = com.facebook.FacebookSdk.getApplicationContext()
            android.content.ContentResolver r0 = r0.getContentResolver()
            android.net.Uri r1 = buildPlatformProviderVersionURI(r8)
            android.content.Context r2 = com.facebook.FacebookSdk.getApplicationContext()     // Catch:{ all -> 0x0085 }
            android.content.pm.PackageManager r2 = r2.getPackageManager()     // Catch:{ all -> 0x0085 }
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch:{ all -> 0x0085 }
            r3.<init>()     // Catch:{ all -> 0x0085 }
            java.lang.String r4 = r8.getPackage()     // Catch:{ all -> 0x0085 }
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ all -> 0x0085 }
            java.lang.String r4 = ".provider.PlatformProvider"
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ all -> 0x0085 }
            java.lang.String r3 = r3.toString()     // Catch:{ all -> 0x0085 }
            r4 = 0
            android.content.pm.ProviderInfo r2 = r2.resolveContentProvider(r3, r4)     // Catch:{ RuntimeException -> 0x0068 }
        L_0x0036:
            if (r2 == 0) goto L_0x007c
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch:{ NullPointerException -> 0x0083, SecurityException -> 0x0072 }
            r3 = 0
            java.lang.String r4 = "version"
            r2[r3] = r4     // Catch:{ NullPointerException -> 0x0083, SecurityException -> 0x0072 }
            r3 = 0
            r4 = 0
            r5 = 0
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5)     // Catch:{ NullPointerException -> 0x0083, SecurityException -> 0x0072 }
        L_0x0047:
            if (r1 == 0) goto L_0x007d
        L_0x0049:
            boolean r0 = r1.moveToNext()     // Catch:{ all -> 0x0061 }
            if (r0 == 0) goto L_0x007d
            java.lang.String r0 = "version"
            int r0 = r1.getColumnIndex(r0)     // Catch:{ all -> 0x0061 }
            int r0 = r1.getInt(r0)     // Catch:{ all -> 0x0061 }
            java.lang.Integer r0 = java.lang.Integer.valueOf(r0)     // Catch:{ all -> 0x0061 }
            r7.add(r0)     // Catch:{ all -> 0x0061 }
            goto L_0x0049
        L_0x0061:
            r0 = move-exception
        L_0x0062:
            if (r1 == 0) goto L_0x0067
            r1.close()
        L_0x0067:
            throw r0
        L_0x0068:
            r2 = move-exception
            java.lang.String r3 = TAG     // Catch:{ all -> 0x0085 }
            java.lang.String r4 = "Failed to query content resolver."
            android.util.Log.e(r3, r4, r2)     // Catch:{ all -> 0x0085 }
            r2 = r6
            goto L_0x0036
        L_0x0072:
            r0 = move-exception
        L_0x0073:
            java.lang.String r0 = TAG     // Catch:{ all -> 0x0085 }
            java.lang.String r1 = "Failed to query content resolver."
            android.util.Log.e(r0, r1)     // Catch:{ all -> 0x0085 }
            r1 = r6
            goto L_0x0047
        L_0x007c:
            r1 = r6
        L_0x007d:
            if (r1 == 0) goto L_0x0082
            r1.close()
        L_0x0082:
            return r7
        L_0x0083:
            r0 = move-exception
            goto L_0x0073
        L_0x0085:
            r0 = move-exception
            r1 = r6
            goto L_0x0062
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.internal.NativeProtocol.fetchAllAvailableProtocolVersionsForAppInfo(com.facebook.internal.NativeProtocol$NativeAppInfo):java.util.TreeSet");
    }

    public static Bundle getBridgeArgumentsFromIntent(Intent intent) {
        if (!isVersionCompatibleWithBucketedIntent(getProtocolVersionFromIntent(intent))) {
            return null;
        }
        return intent.getBundleExtra(EXTRA_PROTOCOL_BRIDGE_ARGS);
    }

    public static UUID getCallIdFromIntent(Intent intent) {
        String stringExtra;
        if (intent == null) {
            return null;
        }
        if (isVersionCompatibleWithBucketedIntent(getProtocolVersionFromIntent(intent))) {
            Bundle bundleExtra = intent.getBundleExtra(EXTRA_PROTOCOL_BRIDGE_ARGS);
            stringExtra = bundleExtra != null ? bundleExtra.getString("action_id") : null;
        } else {
            stringExtra = intent.getStringExtra(EXTRA_PROTOCOL_CALL_ID);
        }
        if (stringExtra == null) {
            return null;
        }
        try {
            return UUID.fromString(stringExtra);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    public static Bundle getErrorDataFromResultIntent(Intent intent) {
        if (!isErrorResult(intent)) {
            return null;
        }
        Bundle bridgeArgumentsFromIntent = getBridgeArgumentsFromIntent(intent);
        return bridgeArgumentsFromIntent != null ? bridgeArgumentsFromIntent.getBundle("error") : intent.getExtras();
    }

    public static FacebookException getExceptionFromErrorData(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        String string = bundle.getString(BRIDGE_ARG_ERROR_TYPE);
        if (string == null) {
            string = bundle.getString(STATUS_ERROR_TYPE);
        }
        String string2 = bundle.getString(BRIDGE_ARG_ERROR_DESCRIPTION);
        if (string2 == null) {
            string2 = bundle.getString(STATUS_ERROR_DESCRIPTION);
        }
        return (string == null || !string.equalsIgnoreCase(ERROR_USER_CANCELED)) ? new FacebookException(string2) : new FacebookOperationCanceledException(string2);
    }

    public static ProtocolVersionQueryResult getLatestAvailableProtocolVersionForAction(String str, int[] iArr) {
        return getLatestAvailableProtocolVersionForAppInfoList(actionToAppInfoMap.get(str), iArr);
    }

    private static ProtocolVersionQueryResult getLatestAvailableProtocolVersionForAppInfoList(List<NativeAppInfo> list, int[] iArr) {
        updateAllAvailableProtocolVersionsAsync();
        if (list == null) {
            return ProtocolVersionQueryResult.createEmpty();
        }
        for (NativeAppInfo next : list) {
            int computeLatestAvailableVersionFromVersionSpec = computeLatestAvailableVersionFromVersionSpec(next.getAvailableVersions(), getLatestKnownVersion(), iArr);
            if (computeLatestAvailableVersionFromVersionSpec != -1) {
                return ProtocolVersionQueryResult.create(next, computeLatestAvailableVersionFromVersionSpec);
            }
        }
        return ProtocolVersionQueryResult.createEmpty();
    }

    public static int getLatestAvailableProtocolVersionForService(int i) {
        return getLatestAvailableProtocolVersionForAppInfoList(facebookAppInfoList, new int[]{i}).getProtocolVersion();
    }

    public static final int getLatestKnownVersion() {
        return KNOWN_PROTOCOL_VERSIONS.get(0).intValue();
    }

    public static Bundle getMethodArgumentsFromIntent(Intent intent) {
        return !isVersionCompatibleWithBucketedIntent(getProtocolVersionFromIntent(intent)) ? intent.getExtras() : intent.getBundleExtra(EXTRA_PROTOCOL_METHOD_ARGS);
    }

    public static int getProtocolVersionFromIntent(Intent intent) {
        return intent.getIntExtra(EXTRA_PROTOCOL_VERSION, 0);
    }

    public static Bundle getSuccessResultsFromIntent(Intent intent) {
        int protocolVersionFromIntent = getProtocolVersionFromIntent(intent);
        Bundle extras = intent.getExtras();
        return (!isVersionCompatibleWithBucketedIntent(protocolVersionFromIntent) || extras == null) ? extras : extras.getBundle(EXTRA_PROTOCOL_METHOD_RESULTS);
    }

    public static boolean isErrorResult(Intent intent) {
        Bundle bridgeArgumentsFromIntent = getBridgeArgumentsFromIntent(intent);
        return bridgeArgumentsFromIntent != null ? bridgeArgumentsFromIntent.containsKey("error") : intent.hasExtra(STATUS_ERROR_TYPE);
    }

    public static boolean isVersionCompatibleWithBucketedIntent(int i) {
        return KNOWN_PROTOCOL_VERSIONS.contains(Integer.valueOf(i)) && i >= 20140701;
    }

    public static void setupProtocolRequestIntent(Intent intent, String str, String str2, int i, Bundle bundle) {
        String applicationId = FacebookSdk.getApplicationId();
        String applicationName = FacebookSdk.getApplicationName();
        intent.putExtra(EXTRA_PROTOCOL_VERSION, i).putExtra(EXTRA_PROTOCOL_ACTION, str2).putExtra(EXTRA_APPLICATION_ID, applicationId);
        if (isVersionCompatibleWithBucketedIntent(i)) {
            Bundle bundle2 = new Bundle();
            bundle2.putString("action_id", str);
            Utility.putNonEmptyString(bundle2, BRIDGE_ARG_APP_NAME_STRING, applicationName);
            intent.putExtra(EXTRA_PROTOCOL_BRIDGE_ARGS, bundle2);
            if (bundle == null) {
                bundle = new Bundle();
            }
            intent.putExtra(EXTRA_PROTOCOL_METHOD_ARGS, bundle);
            return;
        }
        intent.putExtra(EXTRA_PROTOCOL_CALL_ID, str);
        if (!Utility.isNullOrEmpty(applicationName)) {
            intent.putExtra(EXTRA_APPLICATION_NAME, applicationName);
        }
        intent.putExtras(bundle);
    }

    public static void updateAllAvailableProtocolVersionsAsync() {
        if (protocolVersionsAsyncUpdating.compareAndSet(false, true)) {
            FacebookSdk.getExecutor().execute(new Runnable() {
                public void run() {
                    try {
                        for (NativeAppInfo access$900 : NativeProtocol.facebookAppInfoList) {
                            access$900.fetchAvailableVersions(true);
                        }
                    } finally {
                        NativeProtocol.protocolVersionsAsyncUpdating.set(false);
                    }
                }
            });
        }
    }

    static Intent validateActivityIntent(Context context, Intent intent, NativeAppInfo nativeAppInfo) {
        if (intent == null) {
            return null;
        }
        ResolveInfo resolveActivity = context.getPackageManager().resolveActivity(intent, 0);
        if (resolveActivity == null) {
            return null;
        }
        if (!FacebookSignatureValidator.validateSignature(context, resolveActivity.activityInfo.packageName)) {
            return null;
        }
        return intent;
    }

    static Intent validateServiceIntent(Context context, Intent intent, NativeAppInfo nativeAppInfo) {
        if (intent == null) {
            return null;
        }
        ResolveInfo resolveService = context.getPackageManager().resolveService(intent, 0);
        if (resolveService == null) {
            return null;
        }
        if (!FacebookSignatureValidator.validateSignature(context, resolveService.serviceInfo.packageName)) {
            return null;
        }
        return intent;
    }
}
