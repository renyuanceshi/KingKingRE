package com.facebook.login;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import com.facebook.AccessTokenSource;
import com.facebook.FacebookException;
import com.facebook.internal.AnalyticsEvents;
import com.facebook.internal.NativeProtocol;
import com.facebook.internal.ServerProtocol;
import com.facebook.internal.Utility;
import com.facebook.login.LoginClient;

abstract class NativeAppLoginMethodHandler extends LoginMethodHandler {
    NativeAppLoginMethodHandler(Parcel parcel) {
        super(parcel);
    }

    NativeAppLoginMethodHandler(LoginClient loginClient) {
        super(loginClient);
    }

    private String getError(Bundle bundle) {
        String string = bundle.getString("error");
        return string == null ? bundle.getString(NativeProtocol.BRIDGE_ARG_ERROR_TYPE) : string;
    }

    private String getErrorMessage(Bundle bundle) {
        String string = bundle.getString(AnalyticsEvents.PARAMETER_SHARE_ERROR_MESSAGE);
        return string == null ? bundle.getString(NativeProtocol.BRIDGE_ARG_ERROR_DESCRIPTION) : string;
    }

    private LoginClient.Result handleResultCancel(LoginClient.Request request, Intent intent) {
        Bundle extras = intent.getExtras();
        String error = getError(extras);
        String string = extras.getString(NativeProtocol.BRIDGE_ARG_ERROR_CODE);
        return ServerProtocol.errorConnectionFailure.equals(string) ? LoginClient.Result.createErrorResult(request, error, getErrorMessage(extras), string) : LoginClient.Result.createCancelResult(request, error);
    }

    private LoginClient.Result handleResultOk(LoginClient.Request request, Intent intent) {
        Bundle extras = intent.getExtras();
        String error = getError(extras);
        String string = extras.getString(NativeProtocol.BRIDGE_ARG_ERROR_CODE);
        String errorMessage = getErrorMessage(extras);
        String string2 = extras.getString("e2e");
        if (!Utility.isNullOrEmpty(string2)) {
            logWebLoginCompleted(string2);
        }
        if (error == null && string == null && errorMessage == null) {
            try {
                return LoginClient.Result.createTokenResult(request, createAccessTokenFromWebBundle(request.getPermissions(), extras, AccessTokenSource.FACEBOOK_APPLICATION_WEB, request.getApplicationId()));
            } catch (FacebookException e) {
                return LoginClient.Result.createErrorResult(request, (String) null, e.getMessage());
            }
        } else if (!ServerProtocol.errorsProxyAuthDisabled.contains(error)) {
            return ServerProtocol.errorsUserCanceled.contains(error) ? LoginClient.Result.createCancelResult(request, (String) null) : LoginClient.Result.createErrorResult(request, error, errorMessage, string);
        } else {
            return null;
        }
    }

    /* access modifiers changed from: package-private */
    public boolean onActivityResult(int i, int i2, Intent intent) {
        LoginClient.Request pendingRequest = this.loginClient.getPendingRequest();
        LoginClient.Result createCancelResult = intent == null ? LoginClient.Result.createCancelResult(pendingRequest, "Operation canceled") : i2 == 0 ? handleResultCancel(pendingRequest, intent) : i2 != -1 ? LoginClient.Result.createErrorResult(pendingRequest, "Unexpected resultCode from authorization.", (String) null) : handleResultOk(pendingRequest, intent);
        if (createCancelResult != null) {
            this.loginClient.completeAndValidate(createCancelResult);
            return true;
        }
        this.loginClient.tryNextHandler();
        return true;
    }

    /* access modifiers changed from: package-private */
    public abstract boolean tryAuthorize(LoginClient.Request request);

    /* access modifiers changed from: protected */
    public boolean tryIntent(Intent intent, int i) {
        if (intent == null) {
            return false;
        }
        try {
            this.loginClient.getFragment().startActivityForResult(intent, i);
            return true;
        } catch (ActivityNotFoundException e) {
            return false;
        }
    }
}
