package com.facebook.login;

import android.app.Activity;
import android.app.Fragment;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import com.facebook.AccessToken;
import com.facebook.AccessTokenSource;
import com.facebook.CallbackManager;
import com.facebook.FacebookActivity;
import com.facebook.FacebookAuthorizationException;
import com.facebook.FacebookCallback;
import com.facebook.FacebookException;
import com.facebook.FacebookSdk;
import com.facebook.GraphResponse;
import com.facebook.LoginStatusCallback;
import com.facebook.Profile;
import com.facebook.internal.CallbackManagerImpl;
import com.facebook.internal.FragmentWrapper;
import com.facebook.internal.NativeProtocol;
import com.facebook.internal.PlatformServiceClient;
import com.facebook.internal.Utility;
import com.facebook.internal.Validate;
import com.facebook.login.LoginClient;
import com.facebook.share.internal.ShareConstants;
import com.pccw.mobile.sip.ServerMessageController;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

public class LoginManager {
    private static final String MANAGE_PERMISSION_PREFIX = "manage";
    private static final Set<String> OTHER_PUBLISH_PERMISSIONS = getOtherPublishPermissions();
    private static final String PUBLISH_PERMISSION_PREFIX = "publish";
    private static volatile LoginManager instance;
    private DefaultAudience defaultAudience = DefaultAudience.FRIENDS;
    private LoginBehavior loginBehavior = LoginBehavior.NATIVE_WITH_FALLBACK;

    private static class ActivityStartActivityDelegate implements StartActivityDelegate {
        private final Activity activity;

        ActivityStartActivityDelegate(Activity activity2) {
            Validate.notNull(activity2, "activity");
            this.activity = activity2;
        }

        public Activity getActivityContext() {
            return this.activity;
        }

        public void startActivityForResult(Intent intent, int i) {
            this.activity.startActivityForResult(intent, i);
        }
    }

    private static class FragmentStartActivityDelegate implements StartActivityDelegate {
        private final FragmentWrapper fragment;

        FragmentStartActivityDelegate(FragmentWrapper fragmentWrapper) {
            Validate.notNull(fragmentWrapper, "fragment");
            this.fragment = fragmentWrapper;
        }

        public Activity getActivityContext() {
            return this.fragment.getActivity();
        }

        public void startActivityForResult(Intent intent, int i) {
            this.fragment.startActivityForResult(intent, i);
        }
    }

    private static class LoginLoggerHolder {
        private static LoginLogger logger;

        private LoginLoggerHolder() {
        }

        /* access modifiers changed from: private */
        public static LoginLogger getLogger(Context context) {
            LoginLogger loginLogger;
            synchronized (LoginLoggerHolder.class) {
                if (context == null) {
                    try {
                        context = FacebookSdk.getApplicationContext();
                    } catch (Throwable th) {
                        Class<LoginLoggerHolder> cls = LoginLoggerHolder.class;
                        throw th;
                    }
                }
                if (context == null) {
                    loginLogger = null;
                } else {
                    if (logger == null) {
                        logger = new LoginLogger(context, FacebookSdk.getApplicationId());
                    }
                    loginLogger = logger;
                }
            }
            return loginLogger;
        }
    }

    LoginManager() {
        Validate.sdkInitialized();
    }

    static LoginResult computeLoginResult(LoginClient.Request request, AccessToken accessToken) {
        Set<String> permissions = request.getPermissions();
        HashSet hashSet = new HashSet(accessToken.getPermissions());
        if (request.isRerequest()) {
            hashSet.retainAll(permissions);
        }
        HashSet hashSet2 = new HashSet(permissions);
        hashSet2.removeAll(hashSet);
        return new LoginResult(accessToken, hashSet, hashSet2);
    }

    private LoginClient.Request createLoginRequestFromResponse(GraphResponse graphResponse) {
        Validate.notNull(graphResponse, ServerMessageController.TAG_RESPONSE);
        AccessToken accessToken = graphResponse.getRequest().getAccessToken();
        return createLoginRequest(accessToken != null ? accessToken.getPermissions() : null);
    }

    private void finishLogin(AccessToken accessToken, LoginClient.Request request, FacebookException facebookException, boolean z, FacebookCallback<LoginResult> facebookCallback) {
        if (accessToken != null) {
            AccessToken.setCurrentAccessToken(accessToken);
            Profile.fetchProfileForCurrentAccessToken();
        }
        if (facebookCallback != null) {
            LoginResult computeLoginResult = accessToken != null ? computeLoginResult(request, accessToken) : null;
            if (z || (computeLoginResult != null && computeLoginResult.getRecentlyGrantedPermissions().size() == 0)) {
                facebookCallback.onCancel();
            } else if (facebookException != null) {
                facebookCallback.onError(facebookException);
            } else if (accessToken != null) {
                facebookCallback.onSuccess(computeLoginResult);
            }
        }
    }

    public static LoginManager getInstance() {
        if (instance == null) {
            synchronized (LoginManager.class) {
                try {
                    if (instance == null) {
                        instance = new LoginManager();
                    }
                } catch (Throwable th) {
                    while (true) {
                        Class<LoginManager> cls = LoginManager.class;
                        throw th;
                    }
                }
            }
        }
        return instance;
    }

    private static Set<String> getOtherPublishPermissions() {
        return Collections.unmodifiableSet(new HashSet<String>() {
            {
                add("ads_management");
                add("create_event");
                add("rsvp_event");
            }
        });
    }

    /* access modifiers changed from: private */
    @Nullable
    public static Profile getProfileFromBundle(Bundle bundle) {
        String string = bundle.getString(NativeProtocol.EXTRA_ARGS_PROFILE_NAME);
        String string2 = bundle.getString(NativeProtocol.EXTRA_ARGS_PROFILE_FIRST_NAME);
        String string3 = bundle.getString(NativeProtocol.EXTRA_ARGS_PROFILE_MIDDLE_NAME);
        String string4 = bundle.getString(NativeProtocol.EXTRA_ARGS_PROFILE_LAST_NAME);
        String string5 = bundle.getString(NativeProtocol.EXTRA_ARGS_PROFILE_LINK);
        String string6 = bundle.getString(NativeProtocol.EXTRA_ARGS_PROFILE_USER_ID);
        if (string == null || string2 == null || string3 == null || string4 == null || string5 == null || string6 == null) {
            return null;
        }
        return new Profile(string6, string2, string3, string4, string, Uri.parse(string5));
    }

    /* access modifiers changed from: private */
    public static void handleLoginStatusError(String str, String str2, String str3, LoginLogger loginLogger, LoginStatusCallback loginStatusCallback) {
        FacebookException facebookException = new FacebookException(str + ": " + str2);
        loginLogger.logLoginStatusError(str3, facebookException);
        loginStatusCallback.onError(facebookException);
    }

    static boolean isPublishPermission(String str) {
        return str != null && (str.startsWith(PUBLISH_PERMISSION_PREFIX) || str.startsWith(MANAGE_PERMISSION_PREFIX) || OTHER_PUBLISH_PERMISSIONS.contains(str));
    }

    private void logCompleteLogin(Context context, LoginClient.Result.Code code, Map<String, String> map, Exception exc, boolean z, LoginClient.Request request) {
        LoginLogger access$000 = LoginLoggerHolder.getLogger(context);
        if (access$000 != null) {
            if (request == null) {
                access$000.logUnexpectedError("fb_mobile_login_complete", "Unexpected call to logCompleteLogin with null pendingAuthorizationRequest.");
                return;
            }
            HashMap hashMap = new HashMap();
            hashMap.put("try_login_activity", z ? "1" : "0");
            access$000.logCompleteLogin(request.getAuthId(), hashMap, code, map, exc);
        }
    }

    private void logInWithPublishPermissions(FragmentWrapper fragmentWrapper, Collection<String> collection) {
        validatePublishPermissions(collection);
        startLogin(new FragmentStartActivityDelegate(fragmentWrapper), createLoginRequest(collection));
    }

    private void logInWithReadPermissions(FragmentWrapper fragmentWrapper, Collection<String> collection) {
        validateReadPermissions(collection);
        startLogin(new FragmentStartActivityDelegate(fragmentWrapper), createLoginRequest(collection));
    }

    private void logStartLogin(Context context, LoginClient.Request request) {
        LoginLogger access$000 = LoginLoggerHolder.getLogger(context);
        if (access$000 != null && request != null) {
            access$000.logStartLogin(request);
        }
    }

    private void resolveError(FragmentWrapper fragmentWrapper, GraphResponse graphResponse) {
        startLogin(new FragmentStartActivityDelegate(fragmentWrapper), createLoginRequestFromResponse(graphResponse));
    }

    private boolean resolveIntent(Intent intent) {
        return FacebookSdk.getApplicationContext().getPackageManager().resolveActivity(intent, 0) != null;
    }

    private void retrieveLoginStatusImpl(Context context, LoginStatusCallback loginStatusCallback, long j) {
        String applicationId = FacebookSdk.getApplicationId();
        String uuid = UUID.randomUUID().toString();
        LoginStatusClient loginStatusClient = new LoginStatusClient(context, applicationId, uuid, FacebookSdk.getGraphApiVersion(), j);
        final LoginLogger loginLogger = new LoginLogger(context, applicationId);
        final String str = uuid;
        final LoginStatusCallback loginStatusCallback2 = loginStatusCallback;
        final String str2 = applicationId;
        loginStatusClient.setCompletedListener(new PlatformServiceClient.CompletedListener() {
            public void completed(Bundle bundle) {
                if (bundle != null) {
                    String string = bundle.getString(NativeProtocol.STATUS_ERROR_TYPE);
                    String string2 = bundle.getString(NativeProtocol.STATUS_ERROR_DESCRIPTION);
                    if (string != null) {
                        LoginManager.handleLoginStatusError(string, string2, str, loginLogger, loginStatusCallback2);
                        return;
                    }
                    String string3 = bundle.getString(NativeProtocol.EXTRA_ACCESS_TOKEN);
                    long j = bundle.getLong(NativeProtocol.EXTRA_EXPIRES_SECONDS_SINCE_EPOCH);
                    ArrayList<String> stringArrayList = bundle.getStringArrayList(NativeProtocol.EXTRA_PERMISSIONS);
                    String string4 = bundle.getString(NativeProtocol.RESULT_ARGS_SIGNED_REQUEST);
                    String userIDFromSignedRequest = !Utility.isNullOrEmpty(string4) ? LoginMethodHandler.getUserIDFromSignedRequest(string4) : null;
                    if (Utility.isNullOrEmpty(string3) || stringArrayList == null || stringArrayList.isEmpty() || Utility.isNullOrEmpty(userIDFromSignedRequest)) {
                        loginLogger.logLoginStatusFailure(str);
                        loginStatusCallback2.onFailure();
                        return;
                    }
                    AccessToken accessToken = new AccessToken(string3, str2, userIDFromSignedRequest, stringArrayList, (Collection<String>) null, (AccessTokenSource) null, new Date(j), (Date) null);
                    AccessToken.setCurrentAccessToken(accessToken);
                    Profile access$200 = LoginManager.getProfileFromBundle(bundle);
                    if (access$200 != null) {
                        Profile.setCurrentProfile(access$200);
                    } else {
                        Profile.fetchProfileForCurrentAccessToken();
                    }
                    loginLogger.logLoginStatusSuccess(str);
                    loginStatusCallback2.onCompleted(accessToken);
                    return;
                }
                loginLogger.logLoginStatusFailure(str);
                loginStatusCallback2.onFailure();
            }
        });
        loginLogger.logLoginStatusStart(uuid);
        if (!loginStatusClient.start()) {
            loginLogger.logLoginStatusFailure(uuid);
            loginStatusCallback.onFailure();
        }
    }

    private void startLogin(StartActivityDelegate startActivityDelegate, LoginClient.Request request) throws FacebookException {
        logStartLogin(startActivityDelegate.getActivityContext(), request);
        CallbackManagerImpl.registerStaticCallback(CallbackManagerImpl.RequestCodeOffset.Login.toRequestCode(), new CallbackManagerImpl.Callback() {
            public boolean onActivityResult(int i, Intent intent) {
                return LoginManager.this.onActivityResult(i, intent);
            }
        });
        if (!tryFacebookActivity(startActivityDelegate, request)) {
            FacebookException facebookException = new FacebookException("Log in attempt failed: FacebookActivity could not be started. Please make sure you added FacebookActivity to the AndroidManifest.");
            logCompleteLogin(startActivityDelegate.getActivityContext(), LoginClient.Result.Code.ERROR, (Map<String, String>) null, facebookException, false, request);
            throw facebookException;
        }
    }

    private boolean tryFacebookActivity(StartActivityDelegate startActivityDelegate, LoginClient.Request request) {
        Intent facebookActivityIntent = getFacebookActivityIntent(request);
        if (!resolveIntent(facebookActivityIntent)) {
            return false;
        }
        try {
            startActivityDelegate.startActivityForResult(facebookActivityIntent, LoginClient.getLoginRequestCode());
            return true;
        } catch (ActivityNotFoundException e) {
            return false;
        }
    }

    private void validatePublishPermissions(Collection<String> collection) {
        if (collection != null) {
            for (String next : collection) {
                if (!isPublishPermission(next)) {
                    throw new FacebookException(String.format("Cannot pass a read permission (%s) to a request for publish authorization", new Object[]{next}));
                }
            }
        }
    }

    private void validateReadPermissions(Collection<String> collection) {
        if (collection != null) {
            for (String next : collection) {
                if (isPublishPermission(next)) {
                    throw new FacebookException(String.format("Cannot pass a publish or manage permission (%s) to a request for read authorization", new Object[]{next}));
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public LoginClient.Request createLoginRequest(Collection<String> collection) {
        LoginClient.Request request = new LoginClient.Request(this.loginBehavior, Collections.unmodifiableSet(collection != null ? new HashSet(collection) : new HashSet()), this.defaultAudience, FacebookSdk.getApplicationId(), UUID.randomUUID().toString());
        request.setRerequest(AccessToken.getCurrentAccessToken() != null);
        return request;
    }

    public DefaultAudience getDefaultAudience() {
        return this.defaultAudience;
    }

    /* access modifiers changed from: protected */
    public Intent getFacebookActivityIntent(LoginClient.Request request) {
        Intent intent = new Intent();
        intent.setClass(FacebookSdk.getApplicationContext(), FacebookActivity.class);
        intent.setAction(request.getLoginBehavior().toString());
        Bundle bundle = new Bundle();
        bundle.putParcelable(ShareConstants.WEB_DIALOG_RESULT_PARAM_REQUEST_ID, request);
        intent.putExtra("com.facebook.LoginFragment:Request", bundle);
        return intent;
    }

    public LoginBehavior getLoginBehavior() {
        return this.loginBehavior;
    }

    public void logInWithPublishPermissions(Activity activity, Collection<String> collection) {
        validatePublishPermissions(collection);
        startLogin(new ActivityStartActivityDelegate(activity), createLoginRequest(collection));
    }

    public void logInWithPublishPermissions(Fragment fragment, Collection<String> collection) {
        logInWithPublishPermissions(new FragmentWrapper(fragment), collection);
    }

    public void logInWithPublishPermissions(android.support.v4.app.Fragment fragment, Collection<String> collection) {
        logInWithPublishPermissions(new FragmentWrapper(fragment), collection);
    }

    public void logInWithReadPermissions(Activity activity, Collection<String> collection) {
        validateReadPermissions(collection);
        startLogin(new ActivityStartActivityDelegate(activity), createLoginRequest(collection));
    }

    public void logInWithReadPermissions(Fragment fragment, Collection<String> collection) {
        logInWithReadPermissions(new FragmentWrapper(fragment), collection);
    }

    public void logInWithReadPermissions(android.support.v4.app.Fragment fragment, Collection<String> collection) {
        logInWithReadPermissions(new FragmentWrapper(fragment), collection);
    }

    public void logOut() {
        AccessToken.setCurrentAccessToken((AccessToken) null);
        Profile.setCurrentProfile((Profile) null);
    }

    /* access modifiers changed from: package-private */
    public boolean onActivityResult(int i, Intent intent) {
        return onActivityResult(i, intent, (FacebookCallback<LoginResult>) null);
    }

    /* access modifiers changed from: package-private */
    public boolean onActivityResult(int i, Intent intent, FacebookCallback<LoginResult> facebookCallback) {
        Map<String, String> map;
        LoginClient.Result.Code code;
        FacebookAuthorizationException facebookAuthorizationException;
        AccessToken accessToken;
        FacebookAuthorizationException facebookAuthorizationException2;
        AccessToken accessToken2 = null;
        LoginClient.Result.Code code2 = LoginClient.Result.Code.ERROR;
        LoginClient.Request request = null;
        boolean z = false;
        boolean z2 = false;
        if (intent != null) {
            LoginClient.Result result = (LoginClient.Result) intent.getParcelableExtra("com.facebook.LoginFragment:Result");
            if (result != null) {
                request = result.request;
                LoginClient.Result.Code code3 = result.code;
                if (i == -1) {
                    if (result.code == LoginClient.Result.Code.SUCCESS) {
                        accessToken = result.token;
                        facebookAuthorizationException2 = null;
                    } else {
                        accessToken = null;
                        facebookAuthorizationException2 = new FacebookAuthorizationException(result.errorMessage);
                    }
                } else if (i == 0) {
                    z2 = true;
                    accessToken = null;
                    facebookAuthorizationException2 = null;
                } else {
                    accessToken = null;
                    facebookAuthorizationException2 = null;
                }
                map = result.loggingExtras;
                accessToken2 = accessToken;
                z = z2;
                code = code3;
                facebookAuthorizationException = facebookAuthorizationException2;
            }
            map = null;
            code = code2;
            facebookAuthorizationException = null;
        } else {
            if (i == 0) {
                z = true;
                code = LoginClient.Result.Code.CANCEL;
                map = null;
                facebookAuthorizationException = null;
            }
            map = null;
            code = code2;
            facebookAuthorizationException = null;
        }
        FacebookException facebookException = (facebookAuthorizationException == null && accessToken2 == null && !z) ? new FacebookException("Unexpected call to LoginManager.onActivityResult") : facebookAuthorizationException;
        logCompleteLogin((Context) null, code, map, facebookException, true, request);
        finishLogin(accessToken2, request, facebookException, z, facebookCallback);
        return true;
    }

    public void registerCallback(CallbackManager callbackManager, final FacebookCallback<LoginResult> facebookCallback) {
        if (!(callbackManager instanceof CallbackManagerImpl)) {
            throw new FacebookException("Unexpected CallbackManager, please use the provided Factory.");
        }
        ((CallbackManagerImpl) callbackManager).registerCallback(CallbackManagerImpl.RequestCodeOffset.Login.toRequestCode(), new CallbackManagerImpl.Callback() {
            public boolean onActivityResult(int i, Intent intent) {
                return LoginManager.this.onActivityResult(i, intent, facebookCallback);
            }
        });
    }

    public void resolveError(Activity activity, GraphResponse graphResponse) {
        startLogin(new ActivityStartActivityDelegate(activity), createLoginRequestFromResponse(graphResponse));
    }

    public void resolveError(Fragment fragment, GraphResponse graphResponse) {
        resolveError(new FragmentWrapper(fragment), graphResponse);
    }

    public void resolveError(android.support.v4.app.Fragment fragment, GraphResponse graphResponse) {
        resolveError(new FragmentWrapper(fragment), graphResponse);
    }

    public void retrieveLoginStatus(Context context, long j, LoginStatusCallback loginStatusCallback) {
        retrieveLoginStatusImpl(context, loginStatusCallback, j);
    }

    public void retrieveLoginStatus(Context context, LoginStatusCallback loginStatusCallback) {
        retrieveLoginStatus(context, 5000, loginStatusCallback);
    }

    public LoginManager setDefaultAudience(DefaultAudience defaultAudience2) {
        this.defaultAudience = defaultAudience2;
        return this;
    }

    public LoginManager setLoginBehavior(LoginBehavior loginBehavior2) {
        this.loginBehavior = loginBehavior2;
        return this;
    }

    public void unregisterCallback(CallbackManager callbackManager) {
        if (!(callbackManager instanceof CallbackManagerImpl)) {
            throw new FacebookException("Unexpected CallbackManager, please use the provided Factory.");
        }
        ((CallbackManagerImpl) callbackManager).unregisterCallback(CallbackManagerImpl.RequestCodeOffset.Login.toRequestCode());
    }
}
