package com.facebook;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.AsyncTask;
import android.support.v4.media.session.PlaybackStateCompat;
import android.util.Base64;
import android.util.Log;
import com.facebook.appevents.AppEventsLogger;
import com.facebook.internal.BoltsMeasurementEventListener;
import com.facebook.internal.FetchedAppSettingsManager;
import com.facebook.internal.LockOnGetVariable;
import com.facebook.internal.NativeProtocol;
import com.facebook.internal.ServerProtocol;
import com.facebook.internal.Utility;
import com.facebook.internal.Validate;
import java.io.File;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.FutureTask;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

public final class FacebookSdk {
    public static final String APPLICATION_ID_PROPERTY = "com.facebook.sdk.ApplicationId";
    public static final String APPLICATION_NAME_PROPERTY = "com.facebook.sdk.ApplicationName";
    private static final String ATTRIBUTION_PREFERENCES = "com.facebook.sdk.attributionTracking";
    public static final String AUTO_LOG_APP_EVENTS_ENABLED_PROPERTY = "com.facebook.sdk.AutoLogAppEventsEnabled";
    static final String CALLBACK_OFFSET_CHANGED_AFTER_INIT = "The callback request code offset can't be updated once the SDK is initialized. Call FacebookSdk.setCallbackRequestCodeOffset inside your Application.onCreate method";
    static final String CALLBACK_OFFSET_NEGATIVE = "The callback request code offset can't be negative.";
    public static final String CALLBACK_OFFSET_PROPERTY = "com.facebook.sdk.CallbackOffset";
    public static final String CLIENT_TOKEN_PROPERTY = "com.facebook.sdk.ClientToken";
    private static final int DEFAULT_CALLBACK_REQUEST_CODE_OFFSET = 64206;
    private static final int DEFAULT_CORE_POOL_SIZE = 5;
    private static final int DEFAULT_KEEP_ALIVE = 1;
    private static final int DEFAULT_MAXIMUM_POOL_SIZE = 128;
    private static final int DEFAULT_THEME = R.style.com_facebook_activity_theme;
    private static final ThreadFactory DEFAULT_THREAD_FACTORY = new ThreadFactory() {
        private final AtomicInteger counter = new AtomicInteger(0);

        public Thread newThread(Runnable runnable) {
            return new Thread(runnable, "FacebookSdk #" + this.counter.incrementAndGet());
        }
    };
    private static final BlockingQueue<Runnable> DEFAULT_WORK_QUEUE = new LinkedBlockingQueue(10);
    private static final String FACEBOOK_COM = "facebook.com";
    private static final Object LOCK = new Object();
    private static final int MAX_REQUEST_CODE_RANGE = 100;
    private static final String PUBLISH_ACTIVITY_PATH = "%s/activities";
    private static final String TAG = FacebookSdk.class.getCanonicalName();
    public static final String WEB_DIALOG_THEME = "com.facebook.sdk.WebDialogTheme";
    private static volatile String appClientToken;
    /* access modifiers changed from: private */
    public static Context applicationContext;
    private static volatile String applicationId;
    private static volatile String applicationName;
    private static volatile Boolean autoLogAppEventsEnabled;
    private static LockOnGetVariable<File> cacheDir;
    private static int callbackRequestCodeOffset = DEFAULT_CALLBACK_REQUEST_CODE_OFFSET;
    private static Executor executor;
    private static volatile String facebookDomain = FACEBOOK_COM;
    private static String graphApiVersion = ServerProtocol.getDefaultAPIVersion();
    private static volatile boolean isDebugEnabled = false;
    private static boolean isLegacyTokenUpgradeSupported = false;
    private static final HashSet<LoggingBehavior> loggingBehaviors = new HashSet<>(Arrays.asList(new LoggingBehavior[]{LoggingBehavior.DEVELOPER_ERRORS}));
    private static AtomicLong onProgressThreshold = new AtomicLong(PlaybackStateCompat.ACTION_PREPARE_FROM_SEARCH);
    private static Boolean sdkInitialized = false;
    private static volatile int webDialogTheme;

    public interface InitializeCallback {
        void onInitialized();
    }

    public static void addLoggingBehavior(LoggingBehavior loggingBehavior) {
        synchronized (loggingBehaviors) {
            loggingBehaviors.add(loggingBehavior);
            updateGraphDebugBehavior();
        }
    }

    public static void clearLoggingBehaviors() {
        synchronized (loggingBehaviors) {
            loggingBehaviors.clear();
        }
    }

    public static Context getApplicationContext() {
        Validate.sdkInitialized();
        return applicationContext;
    }

    public static String getApplicationId() {
        Validate.sdkInitialized();
        return applicationId;
    }

    public static String getApplicationName() {
        Validate.sdkInitialized();
        return applicationName;
    }

    public static String getApplicationSignature(Context context) {
        PackageManager packageManager;
        Validate.sdkInitialized();
        if (context == null || (packageManager = context.getPackageManager()) == null) {
            return null;
        }
        try {
            PackageInfo packageInfo = packageManager.getPackageInfo(context.getPackageName(), 64);
            Signature[] signatureArr = packageInfo.signatures;
            if (signatureArr == null || signatureArr.length == 0) {
                return null;
            }
            try {
                MessageDigest instance = MessageDigest.getInstance("SHA-1");
                instance.update(packageInfo.signatures[0].toByteArray());
                return Base64.encodeToString(instance.digest(), 9);
            } catch (NoSuchAlgorithmException e) {
                return null;
            }
        } catch (PackageManager.NameNotFoundException e2) {
            return null;
        }
    }

    public static boolean getAutoLogAppEventsEnabled() {
        Validate.sdkInitialized();
        return autoLogAppEventsEnabled.booleanValue();
    }

    public static File getCacheDir() {
        Validate.sdkInitialized();
        return cacheDir.getValue();
    }

    public static int getCallbackRequestCodeOffset() {
        Validate.sdkInitialized();
        return callbackRequestCodeOffset;
    }

    public static String getClientToken() {
        Validate.sdkInitialized();
        return appClientToken;
    }

    public static Executor getExecutor() {
        synchronized (LOCK) {
            if (executor == null) {
                executor = AsyncTask.THREAD_POOL_EXECUTOR;
            }
        }
        return executor;
    }

    public static String getFacebookDomain() {
        return facebookDomain;
    }

    public static String getGraphApiVersion() {
        return graphApiVersion;
    }

    public static boolean getLimitEventAndDataUsage(Context context) {
        Validate.sdkInitialized();
        return context.getSharedPreferences(AppEventsLogger.APP_EVENT_PREFERENCES, 0).getBoolean("limitEventUsage", false);
    }

    public static Set<LoggingBehavior> getLoggingBehaviors() {
        Set<LoggingBehavior> unmodifiableSet;
        synchronized (loggingBehaviors) {
            unmodifiableSet = Collections.unmodifiableSet(new HashSet(loggingBehaviors));
        }
        return unmodifiableSet;
    }

    public static long getOnProgressThreshold() {
        Validate.sdkInitialized();
        return onProgressThreshold.get();
    }

    public static String getSdkVersion() {
        return FacebookSdkVersion.BUILD;
    }

    public static int getWebDialogTheme() {
        Validate.sdkInitialized();
        return webDialogTheme;
    }

    public static boolean isDebugEnabled() {
        return isDebugEnabled;
    }

    public static boolean isFacebookRequestCode(int i) {
        return i >= callbackRequestCodeOffset && i < callbackRequestCodeOffset + 100;
    }

    public static boolean isInitialized() {
        boolean booleanValue;
        synchronized (FacebookSdk.class) {
            try {
                booleanValue = sdkInitialized.booleanValue();
            } catch (Throwable th) {
                Class<FacebookSdk> cls = FacebookSdk.class;
                throw th;
            }
        }
        return booleanValue;
    }

    public static boolean isLegacyTokenUpgradeSupported() {
        return isLegacyTokenUpgradeSupported;
    }

    public static boolean isLoggingBehaviorEnabled(LoggingBehavior loggingBehavior) {
        boolean z;
        synchronized (loggingBehaviors) {
            z = isDebugEnabled() && loggingBehaviors.contains(loggingBehavior);
        }
        return z;
    }

    static void loadDefaultsFromMetadata(Context context) {
        if (context != null) {
            try {
                ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
                if (applicationInfo != null && applicationInfo.metaData != null) {
                    if (applicationId == null) {
                        Object obj = applicationInfo.metaData.get(APPLICATION_ID_PROPERTY);
                        if (obj instanceof String) {
                            String str = (String) obj;
                            if (str.toLowerCase(Locale.ROOT).startsWith("fb")) {
                                applicationId = str.substring(2);
                            } else {
                                applicationId = str;
                            }
                        } else if (obj instanceof Integer) {
                            throw new FacebookException("App Ids cannot be directly placed in the manifest.They must be prefixed by 'fb' or be placed in the string resource file.");
                        }
                    }
                    if (applicationName == null) {
                        applicationName = applicationInfo.metaData.getString(APPLICATION_NAME_PROPERTY);
                    }
                    if (appClientToken == null) {
                        appClientToken = applicationInfo.metaData.getString(CLIENT_TOKEN_PROPERTY);
                    }
                    if (webDialogTheme == 0) {
                        setWebDialogTheme(applicationInfo.metaData.getInt(WEB_DIALOG_THEME));
                    }
                    if (callbackRequestCodeOffset == DEFAULT_CALLBACK_REQUEST_CODE_OFFSET) {
                        callbackRequestCodeOffset = applicationInfo.metaData.getInt(CALLBACK_OFFSET_PROPERTY, DEFAULT_CALLBACK_REQUEST_CODE_OFFSET);
                    }
                    if (autoLogAppEventsEnabled == null) {
                        autoLogAppEventsEnabled = Boolean.valueOf(applicationInfo.metaData.getBoolean(AUTO_LOG_APP_EVENTS_ENABLED_PROPERTY, true));
                    }
                }
            } catch (PackageManager.NameNotFoundException e) {
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:24:0x00a6, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x00ae, code lost:
        throw new com.facebook.FacebookException("An error occurred while publishing install.", (java.lang.Throwable) r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:?, code lost:
        return new com.facebook.GraphResponse((com.facebook.GraphRequest) null, (java.net.HttpURLConnection) null, new com.facebook.FacebookRequestError((java.net.HttpURLConnection) null, r1));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:6:0x000f, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:7:0x0010, code lost:
        r1 = r0;
        com.facebook.internal.Utility.logd("Facebook-publish", r1);
     */
    /* JADX WARNING: Exception block dominator not found, dom blocks: [B:3:0x0007, B:10:0x005d] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    static com.facebook.GraphResponse publishInstallAndWaitForResponse(android.content.Context r14, java.lang.String r15) {
        /*
            r12 = 0
            r2 = 0
            if (r14 == 0) goto L_0x0007
            if (r15 != 0) goto L_0x0021
        L_0x0007:
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException     // Catch:{ Exception -> 0x000f }
            java.lang.String r1 = "Both context and applicationId must be non-null"
            r0.<init>(r1)     // Catch:{ Exception -> 0x000f }
            throw r0     // Catch:{ Exception -> 0x000f }
        L_0x000f:
            r0 = move-exception
            r1 = r0
            java.lang.String r0 = "Facebook-publish"
            com.facebook.internal.Utility.logd((java.lang.String) r0, (java.lang.Exception) r1)
            com.facebook.GraphResponse r0 = new com.facebook.GraphResponse
            com.facebook.FacebookRequestError r3 = new com.facebook.FacebookRequestError
            r3.<init>((java.net.HttpURLConnection) r2, (java.lang.Exception) r1)
            r0.<init>(r2, r2, r3)
        L_0x0020:
            return r0
        L_0x0021:
            com.facebook.internal.AttributionIdentifiers r0 = com.facebook.internal.AttributionIdentifiers.getAttributionIdentifiers(r14)     // Catch:{ Exception -> 0x000f }
            java.lang.String r1 = "com.facebook.sdk.attributionTracking"
            r3 = 0
            android.content.SharedPreferences r1 = r14.getSharedPreferences(r1, r3)     // Catch:{ Exception -> 0x000f }
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x000f }
            r3.<init>()     // Catch:{ Exception -> 0x000f }
            java.lang.StringBuilder r3 = r3.append(r15)     // Catch:{ Exception -> 0x000f }
            java.lang.String r4 = "ping"
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ Exception -> 0x000f }
            java.lang.String r3 = r3.toString()     // Catch:{ Exception -> 0x000f }
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x000f }
            r4.<init>()     // Catch:{ Exception -> 0x000f }
            java.lang.StringBuilder r4 = r4.append(r15)     // Catch:{ Exception -> 0x000f }
            java.lang.String r5 = "json"
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ Exception -> 0x000f }
            java.lang.String r4 = r4.toString()     // Catch:{ Exception -> 0x000f }
            r6 = 0
            long r6 = r1.getLong(r3, r6)     // Catch:{ Exception -> 0x000f }
            r5 = 0
            java.lang.String r5 = r1.getString(r4, r5)     // Catch:{ Exception -> 0x000f }
            com.facebook.internal.AppEventsLoggerUtility$GraphAPIActivityType r8 = com.facebook.internal.AppEventsLoggerUtility.GraphAPIActivityType.MOBILE_INSTALL_EVENT     // Catch:{ JSONException -> 0x00a6 }
            java.lang.String r9 = com.facebook.appevents.AppEventsLogger.getAnonymousAppDeviceGUID(r14)     // Catch:{ JSONException -> 0x00a6 }
            boolean r10 = getLimitEventAndDataUsage(r14)     // Catch:{ JSONException -> 0x00a6 }
            org.json.JSONObject r0 = com.facebook.internal.AppEventsLoggerUtility.getJSONObjectForGraphAPICall(r8, r0, r9, r10, r14)     // Catch:{ JSONException -> 0x00a6 }
            r8 = 0
            java.lang.String r9 = "%s/activities"
            r10 = 1
            java.lang.Object[] r10 = new java.lang.Object[r10]     // Catch:{ Exception -> 0x000f }
            r11 = 0
            r10[r11] = r15     // Catch:{ Exception -> 0x000f }
            java.lang.String r9 = java.lang.String.format(r9, r10)     // Catch:{ Exception -> 0x000f }
            r10 = 0
            com.facebook.GraphRequest r8 = com.facebook.GraphRequest.newPostRequest(r8, r9, r0, r10)     // Catch:{ Exception -> 0x000f }
            int r0 = (r6 > r12 ? 1 : (r6 == r12 ? 0 : -1))
            if (r0 == 0) goto L_0x00b9
            if (r5 == 0) goto L_0x00e1
            org.json.JSONObject r0 = new org.json.JSONObject     // Catch:{ JSONException -> 0x00de }
            r0.<init>(r5)     // Catch:{ JSONException -> 0x00de }
            r1 = r0
        L_0x0089:
            if (r1 != 0) goto L_0x00af
            com.facebook.GraphRequestBatch r0 = new com.facebook.GraphRequestBatch     // Catch:{ Exception -> 0x000f }
            r1 = 1
            com.facebook.GraphRequest[] r1 = new com.facebook.GraphRequest[r1]     // Catch:{ Exception -> 0x000f }
            r3 = 0
            r1[r3] = r8     // Catch:{ Exception -> 0x000f }
            r0.<init>((com.facebook.GraphRequest[]) r1)     // Catch:{ Exception -> 0x000f }
            java.lang.String r1 = "true"
            r3 = 0
            java.util.List r0 = com.facebook.GraphResponse.createResponsesFromString(r1, r3, r0)     // Catch:{ Exception -> 0x000f }
            r1 = 0
            java.lang.Object r0 = r0.get(r1)     // Catch:{ Exception -> 0x000f }
            com.facebook.GraphResponse r0 = (com.facebook.GraphResponse) r0     // Catch:{ Exception -> 0x000f }
            goto L_0x0020
        L_0x00a6:
            r0 = move-exception
            com.facebook.FacebookException r1 = new com.facebook.FacebookException     // Catch:{ Exception -> 0x000f }
            java.lang.String r3 = "An error occurred while publishing install."
            r1.<init>((java.lang.String) r3, (java.lang.Throwable) r0)     // Catch:{ Exception -> 0x000f }
            throw r1     // Catch:{ Exception -> 0x000f }
        L_0x00af:
            com.facebook.GraphResponse r0 = new com.facebook.GraphResponse     // Catch:{ Exception -> 0x000f }
            r3 = 0
            r4 = 0
            r5 = 0
            r0.<init>((com.facebook.GraphRequest) r3, (java.net.HttpURLConnection) r4, (java.lang.String) r5, (org.json.JSONObject) r1)     // Catch:{ Exception -> 0x000f }
            goto L_0x0020
        L_0x00b9:
            com.facebook.GraphResponse r0 = r8.executeAndWait()     // Catch:{ Exception -> 0x000f }
            android.content.SharedPreferences$Editor r1 = r1.edit()     // Catch:{ Exception -> 0x000f }
            long r6 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x000f }
            r1.putLong(r3, r6)     // Catch:{ Exception -> 0x000f }
            org.json.JSONObject r3 = r0.getJSONObject()     // Catch:{ Exception -> 0x000f }
            if (r3 == 0) goto L_0x00d9
            org.json.JSONObject r3 = r0.getJSONObject()     // Catch:{ Exception -> 0x000f }
            java.lang.String r3 = r3.toString()     // Catch:{ Exception -> 0x000f }
            r1.putString(r4, r3)     // Catch:{ Exception -> 0x000f }
        L_0x00d9:
            r1.apply()     // Catch:{ Exception -> 0x000f }
            goto L_0x0020
        L_0x00de:
            r0 = move-exception
            r1 = r2
            goto L_0x0089
        L_0x00e1:
            r1 = r2
            goto L_0x0089
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.FacebookSdk.publishInstallAndWaitForResponse(android.content.Context, java.lang.String):com.facebook.GraphResponse");
    }

    public static void publishInstallAsync(Context context, final String str) {
        final Context applicationContext2 = context.getApplicationContext();
        getExecutor().execute(new Runnable() {
            public void run() {
                FacebookSdk.publishInstallAndWaitForResponse(applicationContext2, str);
            }
        });
    }

    public static void removeLoggingBehavior(LoggingBehavior loggingBehavior) {
        synchronized (loggingBehaviors) {
            loggingBehaviors.remove(loggingBehavior);
        }
    }

    @Deprecated
    public static void sdkInitialize(Context context) {
        synchronized (FacebookSdk.class) {
            try {
                sdkInitialize(context, (InitializeCallback) null);
            } catch (Throwable th) {
                Class<FacebookSdk> cls = FacebookSdk.class;
                throw th;
            }
        }
    }

    @Deprecated
    public static void sdkInitialize(Context context, int i) {
        synchronized (FacebookSdk.class) {
            try {
                sdkInitialize(context, i, (InitializeCallback) null);
            } catch (Throwable th) {
                Class<FacebookSdk> cls = FacebookSdk.class;
                throw th;
            }
        }
    }

    @Deprecated
    public static void sdkInitialize(Context context, int i, InitializeCallback initializeCallback) {
        synchronized (FacebookSdk.class) {
            try {
                if (sdkInitialized.booleanValue() && i != callbackRequestCodeOffset) {
                    throw new FacebookException(CALLBACK_OFFSET_CHANGED_AFTER_INIT);
                } else if (i < 0) {
                    throw new FacebookException(CALLBACK_OFFSET_NEGATIVE);
                } else {
                    callbackRequestCodeOffset = i;
                    sdkInitialize(context, initializeCallback);
                }
            } catch (Throwable th) {
                Class<FacebookSdk> cls = FacebookSdk.class;
                throw th;
            }
        }
    }

    @Deprecated
    public static void sdkInitialize(final Context context, final InitializeCallback initializeCallback) {
        synchronized (FacebookSdk.class) {
            try {
                if (!sdkInitialized.booleanValue()) {
                    Validate.notNull(context, "applicationContext");
                    Validate.hasFacebookActivity(context, false);
                    Validate.hasInternetPermissions(context, false);
                    applicationContext = context.getApplicationContext();
                    loadDefaultsFromMetadata(applicationContext);
                    if (Utility.isNullOrEmpty(applicationId)) {
                        throw new FacebookException("A valid Facebook app id must be set in the AndroidManifest.xml or set by calling FacebookSdk.setApplicationId before initializing the sdk.");
                    }
                    sdkInitialized = true;
                    FetchedAppSettingsManager.loadAppSettingsAsync();
                    NativeProtocol.updateAllAvailableProtocolVersionsAsync();
                    BoltsMeasurementEventListener.getInstance(applicationContext);
                    cacheDir = new LockOnGetVariable<>(new Callable<File>() {
                        public File call() throws Exception {
                            return FacebookSdk.applicationContext.getCacheDir();
                        }
                    });
                    getExecutor().execute(new FutureTask(new Callable<Void>() {
                        public Void call() throws Exception {
                            AccessTokenManager.getInstance().loadCurrentAccessToken();
                            ProfileManager.getInstance().loadCurrentProfile();
                            if (AccessToken.getCurrentAccessToken() != null && Profile.getCurrentProfile() == null) {
                                Profile.fetchProfileForCurrentAccessToken();
                            }
                            if (initializeCallback != null) {
                                initializeCallback.onInitialized();
                            }
                            AppEventsLogger.newLogger(context.getApplicationContext()).flush();
                            return null;
                        }
                    }));
                } else if (initializeCallback != null) {
                    initializeCallback.onInitialized();
                }
            } catch (Throwable th) {
                Class<FacebookSdk> cls = FacebookSdk.class;
                throw th;
            }
        }
    }

    public static void setApplicationId(String str) {
        applicationId = str;
    }

    public static void setApplicationName(String str) {
        applicationName = str;
    }

    public static void setAutoLogAppEventsEnabled(boolean z) {
        autoLogAppEventsEnabled = Boolean.valueOf(z);
    }

    public static void setCacheDir(File file) {
        cacheDir = new LockOnGetVariable<>(file);
    }

    public static void setClientToken(String str) {
        appClientToken = str;
    }

    public static void setExecutor(Executor executor2) {
        Validate.notNull(executor2, "executor");
        synchronized (LOCK) {
            executor = executor2;
        }
    }

    public static void setFacebookDomain(String str) {
        Log.w(TAG, "WARNING: Calling setFacebookDomain from non-DEBUG code.");
        facebookDomain = str;
    }

    public static void setGraphApiVersion(String str) {
        if (!Utility.isNullOrEmpty(str) && !graphApiVersion.equals(str)) {
            graphApiVersion = str;
        }
    }

    public static void setIsDebugEnabled(boolean z) {
        isDebugEnabled = z;
    }

    public static void setLegacyTokenUpgradeSupported(boolean z) {
        isLegacyTokenUpgradeSupported = z;
    }

    public static void setLimitEventAndDataUsage(Context context, boolean z) {
        context.getSharedPreferences(AppEventsLogger.APP_EVENT_PREFERENCES, 0).edit().putBoolean("limitEventUsage", z).apply();
    }

    public static void setOnProgressThreshold(long j) {
        onProgressThreshold.set(j);
    }

    public static void setWebDialogTheme(int i) {
        if (i == 0) {
            i = DEFAULT_THEME;
        }
        webDialogTheme = i;
    }

    private static void updateGraphDebugBehavior() {
        if (loggingBehaviors.contains(LoggingBehavior.GRAPH_API_DEBUG_INFO) && !loggingBehaviors.contains(LoggingBehavior.GRAPH_API_DEBUG_WARNING)) {
            loggingBehaviors.add(LoggingBehavior.GRAPH_API_DEBUG_WARNING);
        }
    }
}
