package com.facebook.appevents;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.util.Log;
import bolts.AppLinks;
import com.facebook.AccessToken;
import com.facebook.FacebookException;
import com.facebook.FacebookSdk;
import com.facebook.GraphRequest;
import com.facebook.HttpMethod;
import com.facebook.LoggingBehavior;
import com.facebook.appevents.internal.ActivityLifecycleTracker;
import com.facebook.internal.AttributionIdentifiers;
import com.facebook.internal.BundleJSONConverter;
import com.facebook.internal.FetchedAppSettingsManager;
import com.facebook.internal.Logger;
import com.facebook.internal.Utility;
import com.facebook.internal.Validate;
import com.facebook.share.internal.ShareConstants;
import java.math.BigDecimal;
import java.util.Currency;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AppEventsLogger {
    public static final String ACTION_APP_EVENTS_FLUSHED = "com.facebook.sdk.APP_EVENTS_FLUSHED";
    public static final String APP_EVENTS_EXTRA_FLUSH_RESULT = "com.facebook.sdk.APP_EVENTS_FLUSH_RESULT";
    public static final String APP_EVENTS_EXTRA_NUM_EVENTS_FLUSHED = "com.facebook.sdk.APP_EVENTS_NUM_EVENTS_FLUSHED";
    private static final String APP_EVENT_NAME_PUSH_OPENED = "fb_mobile_push_opened";
    public static final String APP_EVENT_PREFERENCES = "com.facebook.sdk.appEventPreferences";
    private static final String APP_EVENT_PUSH_PARAMETER_ACTION = "fb_push_action";
    private static final String APP_EVENT_PUSH_PARAMETER_CAMPAIGN = "fb_push_campaign";
    private static final int APP_SUPPORTS_ATTRIBUTION_ID_RECHECK_PERIOD_IN_SECONDS = 86400;
    private static final int FLUSH_APP_SESSION_INFO_IN_SECONDS = 30;
    private static final String PUSH_PAYLOAD_CAMPAIGN_KEY = "campaign";
    private static final String PUSH_PAYLOAD_KEY = "fb_push_payload";
    private static final String SOURCE_APPLICATION_HAS_BEEN_SET_BY_THIS_INTENT = "_fbSourceApplicationHasBeenSet";
    /* access modifiers changed from: private */
    public static final String TAG = AppEventsLogger.class.getCanonicalName();
    private static String anonymousAppDeviceGUID;
    /* access modifiers changed from: private */
    public static ScheduledThreadPoolExecutor backgroundExecutor;
    private static String externalAnalyticsUserID;
    private static FlushBehavior flushBehavior = FlushBehavior.AUTO;
    private static boolean isActivateAppEventRequested;
    private static boolean isOpenedByApplink;
    private static String pushNotificationsRegistrationId;
    private static String sourceApplication;
    private static Object staticLock = new Object();
    private final AccessTokenAppIdPair accessTokenAppId;
    private final String contextName;

    public enum FlushBehavior {
        AUTO,
        EXPLICIT_ONLY
    }

    static class PersistedAppSessionInfo {
        private static final String PERSISTED_SESSION_INFO_FILENAME = "AppEventsLogger.persistedsessioninfo";
        private static final Runnable appSessionInfoFlushRunnable = new Runnable() {
            public void run() {
                PersistedAppSessionInfo.saveAppSessionInformation(FacebookSdk.getApplicationContext());
            }
        };
        private static Map<AccessTokenAppIdPair, FacebookTimeSpentData> appSessionInfoMap;
        private static boolean hasChanges = false;
        private static boolean isLoaded = false;
        private static final Object staticLock = new Object();

        PersistedAppSessionInfo() {
        }

        private static FacebookTimeSpentData getTimeSpentData(Context context, AccessTokenAppIdPair accessTokenAppIdPair) {
            restoreAppSessionInformation(context);
            FacebookTimeSpentData facebookTimeSpentData = appSessionInfoMap.get(accessTokenAppIdPair);
            if (facebookTimeSpentData != null) {
                return facebookTimeSpentData;
            }
            FacebookTimeSpentData facebookTimeSpentData2 = new FacebookTimeSpentData();
            appSessionInfoMap.put(accessTokenAppIdPair, facebookTimeSpentData2);
            return facebookTimeSpentData2;
        }

        static void onResume(Context context, AccessTokenAppIdPair accessTokenAppIdPair, AppEventsLogger appEventsLogger, long j, String str) {
            synchronized (staticLock) {
                getTimeSpentData(context, accessTokenAppIdPair).onResume(appEventsLogger, j, str);
                onTimeSpentDataUpdate();
            }
        }

        static void onSuspend(Context context, AccessTokenAppIdPair accessTokenAppIdPair, AppEventsLogger appEventsLogger, long j) {
            synchronized (staticLock) {
                getTimeSpentData(context, accessTokenAppIdPair).onSuspend(appEventsLogger, j);
                onTimeSpentDataUpdate();
            }
        }

        private static void onTimeSpentDataUpdate() {
            if (!hasChanges) {
                hasChanges = true;
                AppEventsLogger.backgroundExecutor.schedule(appSessionInfoFlushRunnable, 30, TimeUnit.SECONDS);
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:21:0x004d A[Catch:{ FileNotFoundException -> 0x003f, Exception -> 0x005e, all -> 0x005b }] */
        /* JADX WARNING: Removed duplicated region for block: B:33:0x008a A[Catch:{ FileNotFoundException -> 0x003f, Exception -> 0x005e, all -> 0x005b }] */
        /* JADX WARNING: Removed duplicated region for block: B:39:0x00a7 A[Catch:{ FileNotFoundException -> 0x003f, Exception -> 0x005e, all -> 0x005b }] */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        private static void restoreAppSessionInformation(android.content.Context r6) {
            /*
                r0 = 0
                java.lang.Object r4 = staticLock
                monitor-enter(r4)
                boolean r1 = isLoaded     // Catch:{ all -> 0x005b }
                if (r1 != 0) goto L_0x003d
                java.io.ObjectInputStream r1 = new java.io.ObjectInputStream     // Catch:{ FileNotFoundException -> 0x003f, Exception -> 0x005e }
                java.lang.String r2 = "AppEventsLogger.persistedsessioninfo"
                java.io.FileInputStream r2 = r6.openFileInput(r2)     // Catch:{ FileNotFoundException -> 0x003f, Exception -> 0x005e }
                r1.<init>(r2)     // Catch:{ FileNotFoundException -> 0x003f, Exception -> 0x005e }
                java.lang.Object r0 = r1.readObject()     // Catch:{ FileNotFoundException -> 0x00bc, Exception -> 0x00b9, all -> 0x00b5 }
                java.util.HashMap r0 = (java.util.HashMap) r0     // Catch:{ FileNotFoundException -> 0x00bc, Exception -> 0x00b9, all -> 0x00b5 }
                appSessionInfoMap = r0     // Catch:{ FileNotFoundException -> 0x00bc, Exception -> 0x00b9, all -> 0x00b5 }
                com.facebook.LoggingBehavior r0 = com.facebook.LoggingBehavior.APP_EVENTS     // Catch:{ FileNotFoundException -> 0x00bc, Exception -> 0x00b9, all -> 0x00b5 }
                java.lang.String r2 = "AppEvents"
                java.lang.String r3 = "App session info loaded"
                com.facebook.internal.Logger.log(r0, r2, r3)     // Catch:{ FileNotFoundException -> 0x00bc, Exception -> 0x00b9, all -> 0x00b5 }
                com.facebook.internal.Utility.closeQuietly(r1)     // Catch:{ all -> 0x00be }
                java.lang.String r0 = "AppEventsLogger.persistedsessioninfo"
                r6.deleteFile(r0)     // Catch:{ all -> 0x00be }
                java.util.Map<com.facebook.appevents.AccessTokenAppIdPair, com.facebook.appevents.FacebookTimeSpentData> r0 = appSessionInfoMap     // Catch:{ all -> 0x00be }
                if (r0 != 0) goto L_0x0037
                java.util.HashMap r0 = new java.util.HashMap     // Catch:{ all -> 0x00be }
                r0.<init>()     // Catch:{ all -> 0x00be }
                appSessionInfoMap = r0     // Catch:{ all -> 0x00be }
            L_0x0037:
                r0 = 1
                isLoaded = r0     // Catch:{ all -> 0x00be }
                r0 = 0
                hasChanges = r0     // Catch:{ all -> 0x00be }
            L_0x003d:
                monitor-exit(r4)     // Catch:{ all -> 0x005b }
                return
            L_0x003f:
                r1 = move-exception
                r1 = r0
            L_0x0041:
                com.facebook.internal.Utility.closeQuietly(r1)     // Catch:{ all -> 0x005b }
                java.lang.String r0 = "AppEventsLogger.persistedsessioninfo"
                r6.deleteFile(r0)     // Catch:{ all -> 0x005b }
                java.util.Map<com.facebook.appevents.AccessTokenAppIdPair, com.facebook.appevents.FacebookTimeSpentData> r0 = appSessionInfoMap     // Catch:{ all -> 0x005b }
                if (r0 != 0) goto L_0x0054
                java.util.HashMap r0 = new java.util.HashMap     // Catch:{ all -> 0x005b }
                r0.<init>()     // Catch:{ all -> 0x005b }
                appSessionInfoMap = r0     // Catch:{ all -> 0x005b }
            L_0x0054:
                r0 = 1
                isLoaded = r0     // Catch:{ all -> 0x005b }
                r0 = 0
                hasChanges = r0     // Catch:{ all -> 0x005b }
                goto L_0x003d
            L_0x005b:
                r0 = move-exception
            L_0x005c:
                monitor-exit(r4)     // Catch:{ all -> 0x005b }
                throw r0
            L_0x005e:
                r1 = move-exception
                r2 = r1
            L_0x0060:
                java.lang.String r1 = com.facebook.appevents.AppEventsLogger.TAG     // Catch:{ all -> 0x0098 }
                java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch:{ all -> 0x0098 }
                r3.<init>()     // Catch:{ all -> 0x0098 }
                java.lang.String r5 = "Got unexpected exception restoring app session info: "
                java.lang.StringBuilder r3 = r3.append(r5)     // Catch:{ all -> 0x0098 }
                java.lang.String r2 = r2.toString()     // Catch:{ all -> 0x0098 }
                java.lang.StringBuilder r2 = r3.append(r2)     // Catch:{ all -> 0x0098 }
                java.lang.String r2 = r2.toString()     // Catch:{ all -> 0x0098 }
                android.util.Log.w(r1, r2)     // Catch:{ all -> 0x0098 }
                com.facebook.internal.Utility.closeQuietly(r0)     // Catch:{ all -> 0x005b }
                java.lang.String r0 = "AppEventsLogger.persistedsessioninfo"
                r6.deleteFile(r0)     // Catch:{ all -> 0x005b }
                java.util.Map<com.facebook.appevents.AccessTokenAppIdPair, com.facebook.appevents.FacebookTimeSpentData> r0 = appSessionInfoMap     // Catch:{ all -> 0x005b }
                if (r0 != 0) goto L_0x0091
                java.util.HashMap r0 = new java.util.HashMap     // Catch:{ all -> 0x005b }
                r0.<init>()     // Catch:{ all -> 0x005b }
                appSessionInfoMap = r0     // Catch:{ all -> 0x005b }
            L_0x0091:
                r0 = 1
                isLoaded = r0     // Catch:{ all -> 0x005b }
                r0 = 0
                hasChanges = r0     // Catch:{ all -> 0x005b }
                goto L_0x003d
            L_0x0098:
                r1 = move-exception
                r2 = r1
                r3 = r0
            L_0x009b:
                com.facebook.internal.Utility.closeQuietly(r3)     // Catch:{ all -> 0x005b }
                java.lang.String r0 = "AppEventsLogger.persistedsessioninfo"
                r6.deleteFile(r0)     // Catch:{ all -> 0x005b }
                java.util.Map<com.facebook.appevents.AccessTokenAppIdPair, com.facebook.appevents.FacebookTimeSpentData> r0 = appSessionInfoMap     // Catch:{ all -> 0x005b }
                if (r0 != 0) goto L_0x00ae
                java.util.HashMap r0 = new java.util.HashMap     // Catch:{ all -> 0x005b }
                r0.<init>()     // Catch:{ all -> 0x005b }
                appSessionInfoMap = r0     // Catch:{ all -> 0x005b }
            L_0x00ae:
                r0 = 1
                isLoaded = r0     // Catch:{ all -> 0x005b }
                r0 = 0
                hasChanges = r0     // Catch:{ all -> 0x005b }
                throw r2     // Catch:{ all -> 0x005b }
            L_0x00b5:
                r0 = move-exception
                r2 = r0
                r3 = r1
                goto L_0x009b
            L_0x00b9:
                r2 = move-exception
                r0 = r1
                goto L_0x0060
            L_0x00bc:
                r0 = move-exception
                goto L_0x0041
            L_0x00be:
                r0 = move-exception
                goto L_0x005c
            */
            throw new UnsupportedOperationException("Method not decompiled: com.facebook.appevents.AppEventsLogger.PersistedAppSessionInfo.restoreAppSessionInformation(android.content.Context):void");
        }

        /* JADX WARNING: Unknown top exception splitter block from list: {B:24:0x0057=Splitter:B:24:0x0057, B:11:0x002d=Splitter:B:11:0x002d} */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        static void saveAppSessionInformation(android.content.Context r6) {
            /*
                r2 = 0
                java.lang.Object r3 = staticLock
                monitor-enter(r3)
                boolean r0 = hasChanges     // Catch:{ all -> 0x0053 }
                if (r0 == 0) goto L_0x002d
                java.io.ObjectOutputStream r1 = new java.io.ObjectOutputStream     // Catch:{ Exception -> 0x002f, all -> 0x005f }
                java.io.BufferedOutputStream r0 = new java.io.BufferedOutputStream     // Catch:{ Exception -> 0x002f, all -> 0x005f }
                java.lang.String r4 = "AppEventsLogger.persistedsessioninfo"
                r5 = 0
                java.io.FileOutputStream r4 = r6.openFileOutput(r4, r5)     // Catch:{ Exception -> 0x002f, all -> 0x005f }
                r0.<init>(r4)     // Catch:{ Exception -> 0x002f, all -> 0x005f }
                r1.<init>(r0)     // Catch:{ Exception -> 0x002f, all -> 0x005f }
                java.util.Map<com.facebook.appevents.AccessTokenAppIdPair, com.facebook.appevents.FacebookTimeSpentData> r0 = appSessionInfoMap     // Catch:{ Exception -> 0x005d, all -> 0x0056 }
                r1.writeObject(r0)     // Catch:{ Exception -> 0x005d, all -> 0x0056 }
                r0 = 0
                hasChanges = r0     // Catch:{ Exception -> 0x005d, all -> 0x0056 }
                com.facebook.LoggingBehavior r0 = com.facebook.LoggingBehavior.APP_EVENTS     // Catch:{ Exception -> 0x005d, all -> 0x0056 }
                java.lang.String r2 = "AppEvents"
                java.lang.String r4 = "App session info saved"
                com.facebook.internal.Logger.log(r0, r2, r4)     // Catch:{ Exception -> 0x005d, all -> 0x0056 }
                com.facebook.internal.Utility.closeQuietly(r1)     // Catch:{ all -> 0x005b }
            L_0x002d:
                monitor-exit(r3)     // Catch:{ all -> 0x0053 }
                return
            L_0x002f:
                r0 = move-exception
                r1 = r2
            L_0x0031:
                java.lang.String r2 = com.facebook.appevents.AppEventsLogger.TAG     // Catch:{ all -> 0x0062 }
                java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ all -> 0x0062 }
                r4.<init>()     // Catch:{ all -> 0x0062 }
                java.lang.String r5 = "Got unexpected exception while writing app session info: "
                java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ all -> 0x0062 }
                java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x0062 }
                java.lang.StringBuilder r0 = r4.append(r0)     // Catch:{ all -> 0x0062 }
                java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x0062 }
                android.util.Log.w(r2, r0)     // Catch:{ all -> 0x0062 }
                com.facebook.internal.Utility.closeQuietly(r1)     // Catch:{ all -> 0x0053 }
                goto L_0x002d
            L_0x0053:
                r0 = move-exception
            L_0x0054:
                monitor-exit(r3)     // Catch:{ all -> 0x0053 }
                throw r0
            L_0x0056:
                r0 = move-exception
            L_0x0057:
                com.facebook.internal.Utility.closeQuietly(r1)     // Catch:{ all -> 0x0053 }
                throw r0     // Catch:{ all -> 0x0053 }
            L_0x005b:
                r0 = move-exception
                goto L_0x0054
            L_0x005d:
                r0 = move-exception
                goto L_0x0031
            L_0x005f:
                r0 = move-exception
                r1 = r2
                goto L_0x0057
            L_0x0062:
                r0 = move-exception
                goto L_0x0057
            */
            throw new UnsupportedOperationException("Method not decompiled: com.facebook.appevents.AppEventsLogger.PersistedAppSessionInfo.saveAppSessionInformation(android.content.Context):void");
        }
    }

    private AppEventsLogger(Context context, String str, AccessToken accessToken) {
        this(Utility.getActivityName(context), str, accessToken);
    }

    protected AppEventsLogger(String str, String str2, AccessToken accessToken) {
        Validate.sdkInitialized();
        this.contextName = str;
        accessToken = accessToken == null ? AccessToken.getCurrentAccessToken() : accessToken;
        if (accessToken == null || (str2 != null && !str2.equals(accessToken.getApplicationId()))) {
            this.accessTokenAppId = new AccessTokenAppIdPair((String) null, str2 == null ? Utility.getMetadataApplicationId(FacebookSdk.getApplicationContext()) : str2);
        } else {
            this.accessTokenAppId = new AccessTokenAppIdPair(accessToken);
        }
        initializeTimersIfNeeded();
    }

    public static void activateApp(Application application) {
        activateApp(application, (String) null);
    }

    public static void activateApp(Application application, String str) {
        if (!FacebookSdk.isInitialized()) {
            throw new FacebookException("The Facebook sdk must be initialized before calling activateApp");
        }
        AnalyticsUserIDStore.initStore();
        if (str == null) {
            str = FacebookSdk.getApplicationId();
        }
        FacebookSdk.publishInstallAsync(application, str);
        ActivityLifecycleTracker.startTracking(application, str);
    }

    @Deprecated
    public static void activateApp(Context context) {
        if (ActivityLifecycleTracker.isTracking()) {
            Log.w(TAG, "activateApp events are being logged automatically. There's no need to call activateApp explicitly, this is safe to remove.");
            return;
        }
        FacebookSdk.sdkInitialize(context);
        activateApp(context, Utility.getMetadataApplicationId(context));
    }

    @Deprecated
    public static void activateApp(Context context, String str) {
        if (ActivityLifecycleTracker.isTracking()) {
            Log.w(TAG, "activateApp events are being logged automatically. There's no need to call activateApp explicitly, this is safe to remove.");
        } else if (context == null || str == null) {
            throw new IllegalArgumentException("Both context and applicationId must be non-null");
        } else {
            AnalyticsUserIDStore.initStore();
            if (context instanceof Activity) {
                setSourceApplication((Activity) context);
            } else {
                resetSourceApplication();
                Log.d(AppEventsLogger.class.getName(), "To set source application the context of activateApp must be an instance of Activity");
            }
            FacebookSdk.publishInstallAsync(context, str);
            AppEventsLogger appEventsLogger = new AppEventsLogger(context, str, (AccessToken) null);
            final long currentTimeMillis = System.currentTimeMillis();
            final String sourceApplication2 = getSourceApplication();
            backgroundExecutor.execute(new Runnable(appEventsLogger) {
                final /* synthetic */ AppEventsLogger val$logger;

                {
                    this.val$logger = r1;
                }

                public void run() {
                    this.val$logger.logAppSessionResumeEvent(currentTimeMillis, sourceApplication2);
                }
            });
        }
    }

    public static void clearUserID() {
        AnalyticsUserIDStore.setUserID((String) null);
    }

    @Deprecated
    public static void deactivateApp(Context context) {
        if (ActivityLifecycleTracker.isTracking()) {
            Log.w(TAG, "deactivateApp events are being logged automatically. There's no need to call deactivateApp, this is safe to remove.");
        } else {
            deactivateApp(context, Utility.getMetadataApplicationId(context));
        }
    }

    @Deprecated
    public static void deactivateApp(Context context, String str) {
        if (ActivityLifecycleTracker.isTracking()) {
            Log.w(TAG, "deactivateApp events are being logged automatically. There's no need to call deactivateApp, this is safe to remove.");
        } else if (context == null || str == null) {
            throw new IllegalArgumentException("Both context and applicationId must be non-null");
        } else {
            resetSourceApplication();
            AppEventsLogger appEventsLogger = new AppEventsLogger(context, str, (AccessToken) null);
            final long currentTimeMillis = System.currentTimeMillis();
            backgroundExecutor.execute(new Runnable(appEventsLogger) {
                final /* synthetic */ AppEventsLogger val$logger;

                {
                    this.val$logger = r1;
                }

                public void run() {
                    this.val$logger.logAppSessionSuspendEvent(currentTimeMillis);
                }
            });
        }
    }

    static void eagerFlush() {
        if (getFlushBehavior() != FlushBehavior.EXPLICIT_ONLY) {
            AppEventQueue.flush(FlushReason.EAGER_FLUSHING_EVENT);
        }
    }

    static Executor getAnalyticsExecutor() {
        if (backgroundExecutor == null) {
            initializeTimersIfNeeded();
        }
        return backgroundExecutor;
    }

    public static String getAnonymousAppDeviceGUID(Context context) {
        if (anonymousAppDeviceGUID == null) {
            synchronized (staticLock) {
                if (anonymousAppDeviceGUID == null) {
                    anonymousAppDeviceGUID = context.getSharedPreferences(APP_EVENT_PREFERENCES, 0).getString("anonymousAppDeviceGUID", (String) null);
                    if (anonymousAppDeviceGUID == null) {
                        anonymousAppDeviceGUID = "XZ" + UUID.randomUUID().toString();
                        context.getSharedPreferences(APP_EVENT_PREFERENCES, 0).edit().putString("anonymousAppDeviceGUID", anonymousAppDeviceGUID).apply();
                    }
                }
            }
        }
        return anonymousAppDeviceGUID;
    }

    public static FlushBehavior getFlushBehavior() {
        FlushBehavior flushBehavior2;
        synchronized (staticLock) {
            flushBehavior2 = flushBehavior;
        }
        return flushBehavior2;
    }

    static String getPushNotificationsRegistrationId() {
        String str;
        synchronized (staticLock) {
            str = pushNotificationsRegistrationId;
        }
        return str;
    }

    static String getSourceApplication() {
        String str = "Unclassified";
        if (isOpenedByApplink) {
            str = "Applink";
        }
        return sourceApplication != null ? str + "(" + sourceApplication + ")" : str;
    }

    public static String getUserID() {
        return AnalyticsUserIDStore.getUserID();
    }

    private static void initializeTimersIfNeeded() {
        synchronized (staticLock) {
            if (backgroundExecutor == null) {
                backgroundExecutor = new ScheduledThreadPoolExecutor(1);
                backgroundExecutor.scheduleAtFixedRate(new Runnable() {
                    public void run() {
                        HashSet<String> hashSet = new HashSet<>();
                        for (AccessTokenAppIdPair applicationId : AppEventQueue.getKeySet()) {
                            hashSet.add(applicationId.getApplicationId());
                        }
                        for (String queryAppSettings : hashSet) {
                            FetchedAppSettingsManager.queryAppSettings(queryAppSettings, true);
                        }
                    }
                }, 0, 86400, TimeUnit.SECONDS);
            }
        }
    }

    /* access modifiers changed from: private */
    public void logAppSessionResumeEvent(long j, String str) {
        PersistedAppSessionInfo.onResume(FacebookSdk.getApplicationContext(), this.accessTokenAppId, this, j, str);
    }

    /* access modifiers changed from: private */
    public void logAppSessionSuspendEvent(long j) {
        PersistedAppSessionInfo.onSuspend(FacebookSdk.getApplicationContext(), this.accessTokenAppId, this, j);
    }

    private static void logEvent(Context context, AppEvent appEvent, AccessTokenAppIdPair accessTokenAppIdPair) {
        AppEventQueue.add(accessTokenAppIdPair, appEvent);
        if (!appEvent.getIsImplicit() && !isActivateAppEventRequested) {
            if (appEvent.getName() == AppEventsConstants.EVENT_NAME_ACTIVATED_APP) {
                isActivateAppEventRequested = true;
            } else {
                Logger.log(LoggingBehavior.APP_EVENTS, "AppEvents", "Warning: Please call AppEventsLogger.activateApp(...)from the long-lived activity's onResume() methodbefore logging other app events.");
            }
        }
    }

    private void logEvent(String str, Double d, Bundle bundle, boolean z, @Nullable UUID uuid) {
        try {
            logEvent(FacebookSdk.getApplicationContext(), new AppEvent(this.contextName, str, d, bundle, z, uuid), this.accessTokenAppId);
        } catch (JSONException e) {
            Logger.log(LoggingBehavior.APP_EVENTS, "AppEvents", "JSON encoding for app event failed: '%s'", e.toString());
        } catch (FacebookException e2) {
            Logger.log(LoggingBehavior.APP_EVENTS, "AppEvents", "Invalid app event: %s", e2.toString());
        }
    }

    public static AppEventsLogger newLogger(Context context) {
        return new AppEventsLogger(context, (String) null, (AccessToken) null);
    }

    public static AppEventsLogger newLogger(Context context, AccessToken accessToken) {
        return new AppEventsLogger(context, (String) null, accessToken);
    }

    public static AppEventsLogger newLogger(Context context, String str) {
        return new AppEventsLogger(context, str, (AccessToken) null);
    }

    public static AppEventsLogger newLogger(Context context, String str, AccessToken accessToken) {
        return new AppEventsLogger(context, str, accessToken);
    }

    private static void notifyDeveloperError(String str) {
        Logger.log(LoggingBehavior.DEVELOPER_ERRORS, "AppEvents", str);
    }

    public static void onContextStop() {
        AppEventQueue.persistToDisk();
    }

    static void resetSourceApplication() {
        sourceApplication = null;
        isOpenedByApplink = false;
    }

    public static void setFlushBehavior(FlushBehavior flushBehavior2) {
        synchronized (staticLock) {
            flushBehavior = flushBehavior2;
        }
    }

    public static void setPushNotificationsRegistrationId(String str) {
        synchronized (staticLock) {
            if (!Utility.stringsEqualOrEmpty(pushNotificationsRegistrationId, str)) {
                pushNotificationsRegistrationId = str;
                AppEventsLogger newLogger = newLogger(FacebookSdk.getApplicationContext());
                newLogger.logEvent(AppEventsConstants.EVENT_NAME_PUSH_TOKEN_OBTAINED);
                if (getFlushBehavior() != FlushBehavior.EXPLICIT_ONLY) {
                    newLogger.flush();
                }
            }
        }
    }

    private static void setSourceApplication(Activity activity) {
        ComponentName callingActivity = activity.getCallingActivity();
        if (callingActivity != null) {
            String packageName = callingActivity.getPackageName();
            if (packageName.equals(activity.getPackageName())) {
                resetSourceApplication();
                return;
            }
            sourceApplication = packageName;
        }
        Intent intent = activity.getIntent();
        if (intent == null || intent.getBooleanExtra(SOURCE_APPLICATION_HAS_BEEN_SET_BY_THIS_INTENT, false)) {
            resetSourceApplication();
            return;
        }
        Bundle appLinkData = AppLinks.getAppLinkData(intent);
        if (appLinkData == null) {
            resetSourceApplication();
            return;
        }
        isOpenedByApplink = true;
        Bundle bundle = appLinkData.getBundle("referer_app_link");
        if (bundle == null) {
            sourceApplication = null;
            return;
        }
        sourceApplication = bundle.getString("package");
        intent.putExtra(SOURCE_APPLICATION_HAS_BEEN_SET_BY_THIS_INTENT, true);
    }

    static void setSourceApplication(String str, boolean z) {
        sourceApplication = str;
        isOpenedByApplink = z;
    }

    public static void setUserID(String str) {
        AnalyticsUserIDStore.setUserID(str);
    }

    public static void updateUserProperties(Bundle bundle, GraphRequest.Callback callback) {
        updateUserProperties(bundle, FacebookSdk.getApplicationId(), callback);
    }

    public static void updateUserProperties(final Bundle bundle, final String str, final GraphRequest.Callback callback) {
        final String userID = getUserID();
        if (userID == null || userID.isEmpty()) {
            Logger.log(LoggingBehavior.APP_EVENTS, TAG, "AppEventsLogger userID cannot be null or empty");
        } else {
            getAnalyticsExecutor().execute(new Runnable() {
                public void run() {
                    Bundle bundle = new Bundle();
                    bundle.putString("user_unique_id", userID);
                    bundle.putBundle("custom_data", bundle);
                    AttributionIdentifiers attributionIdentifiers = AttributionIdentifiers.getAttributionIdentifiers(FacebookSdk.getApplicationContext());
                    if (!(attributionIdentifiers == null || attributionIdentifiers.getAndroidAdvertiserId() == null)) {
                        bundle.putString("advertiser_id", attributionIdentifiers.getAndroidAdvertiserId());
                    }
                    Bundle bundle2 = new Bundle();
                    try {
                        JSONObject convertToJSON = BundleJSONConverter.convertToJSON(bundle);
                        JSONArray jSONArray = new JSONArray();
                        jSONArray.put(convertToJSON);
                        bundle2.putString(ShareConstants.WEB_DIALOG_PARAM_DATA, jSONArray.toString());
                        GraphRequest graphRequest = new GraphRequest(AccessToken.getCurrentAccessToken(), String.format(Locale.US, "%s/user_properties", new Object[]{str}), bundle2, HttpMethod.POST, callback);
                        graphRequest.setSkipClientToken(true);
                        graphRequest.executeAsync();
                    } catch (JSONException e) {
                        throw new FacebookException("Failed to construct request", (Throwable) e);
                    }
                }
            });
        }
    }

    public void flush() {
        AppEventQueue.flush(FlushReason.EXPLICIT);
    }

    public String getApplicationId() {
        return this.accessTokenAppId.getApplicationId();
    }

    public boolean isValidForAccessToken(AccessToken accessToken) {
        return this.accessTokenAppId.equals(new AccessTokenAppIdPair(accessToken));
    }

    public void logEvent(String str) {
        logEvent(str, (Bundle) null);
    }

    public void logEvent(String str, double d) {
        logEvent(str, d, (Bundle) null);
    }

    public void logEvent(String str, double d, Bundle bundle) {
        logEvent(str, Double.valueOf(d), bundle, false, ActivityLifecycleTracker.getCurrentSessionGuid());
    }

    public void logEvent(String str, Bundle bundle) {
        logEvent(str, (Double) null, bundle, false, ActivityLifecycleTracker.getCurrentSessionGuid());
    }

    public void logPurchase(BigDecimal bigDecimal, Currency currency) {
        logPurchase(bigDecimal, currency, (Bundle) null);
    }

    public void logPurchase(BigDecimal bigDecimal, Currency currency, Bundle bundle) {
        if (bigDecimal == null) {
            notifyDeveloperError("purchaseAmount cannot be null");
        } else if (currency == null) {
            notifyDeveloperError("currency cannot be null");
        } else {
            if (bundle == null) {
                bundle = new Bundle();
            }
            bundle.putString(AppEventsConstants.EVENT_PARAM_CURRENCY, currency.getCurrencyCode());
            logEvent(AppEventsConstants.EVENT_NAME_PURCHASED, bigDecimal.doubleValue(), bundle);
            eagerFlush();
        }
    }

    public void logPushNotificationOpen(Bundle bundle) {
        logPushNotificationOpen(bundle, (String) null);
    }

    public void logPushNotificationOpen(Bundle bundle, String str) {
        String str2 = null;
        try {
            String string = bundle.getString(PUSH_PAYLOAD_KEY);
            if (!Utility.isNullOrEmpty(string)) {
                str2 = new JSONObject(string).getString(PUSH_PAYLOAD_CAMPAIGN_KEY);
                if (str2 == null) {
                    Logger.log(LoggingBehavior.DEVELOPER_ERRORS, TAG, "Malformed payload specified for logging a push notification open.");
                    return;
                }
                Bundle bundle2 = new Bundle();
                bundle2.putString(APP_EVENT_PUSH_PARAMETER_CAMPAIGN, str2);
                if (str != null) {
                    bundle2.putString(APP_EVENT_PUSH_PARAMETER_ACTION, str);
                }
                logEvent(APP_EVENT_NAME_PUSH_OPENED, bundle2);
            }
        } catch (JSONException e) {
        }
    }

    public void logSdkEvent(String str, Double d, Bundle bundle) {
        logEvent(str, d, bundle, true, ActivityLifecycleTracker.getCurrentSessionGuid());
    }
}
