package com.facebook.login;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.text.Html;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.facebook.AccessToken;
import com.facebook.AccessTokenSource;
import com.facebook.FacebookActivity;
import com.facebook.FacebookException;
import com.facebook.FacebookRequestError;
import com.facebook.FacebookSdk;
import com.facebook.GraphRequest;
import com.facebook.GraphRequestAsyncTask;
import com.facebook.GraphResponse;
import com.facebook.HttpMethod;
import com.facebook.R;
import com.facebook.appevents.AppEventsLogger;
import com.facebook.devicerequests.internal.DeviceRequestsHelper;
import com.facebook.internal.AnalyticsEvents;
import com.facebook.internal.FetchedAppSettingsManager;
import com.facebook.internal.ServerProtocol;
import com.facebook.internal.SmartLoginOption;
import com.facebook.internal.Utility;
import com.facebook.internal.Validate;
import com.facebook.login.LoginClient;
import java.util.Collection;
import java.util.Date;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

public class DeviceAuthDialog extends DialogFragment {
    private static final String DEVICE_LOGIN_ENDPOINT = "device/login";
    private static final String DEVICE_LOGIN_STATUS_ENDPOINT = "device/login_status";
    private static final int LOGIN_ERROR_SUBCODE_AUTHORIZATION_DECLINED = 1349173;
    private static final int LOGIN_ERROR_SUBCODE_AUTHORIZATION_PENDING = 1349174;
    private static final int LOGIN_ERROR_SUBCODE_CODE_EXPIRED = 1349152;
    private static final int LOGIN_ERROR_SUBCODE_EXCESSIVE_POLLING = 1349172;
    private static final String REQUEST_STATE_KEY = "request_state";
    /* access modifiers changed from: private */
    public AtomicBoolean completed = new AtomicBoolean();
    private TextView confirmationCode;
    private volatile GraphRequestAsyncTask currentGraphRequestPoll;
    /* access modifiers changed from: private */
    public volatile RequestState currentRequestState;
    private DeviceAuthMethodHandler deviceAuthMethodHandler;
    /* access modifiers changed from: private */
    public Dialog dialog;
    /* access modifiers changed from: private */
    public boolean isBeingDestroyed = false;
    /* access modifiers changed from: private */
    public boolean isRetry = false;
    /* access modifiers changed from: private */
    public LoginClient.Request mRequest = null;
    private ProgressBar progressBar;
    private volatile ScheduledFuture scheduledPoll;

    private static class RequestState implements Parcelable {
        public static final Parcelable.Creator<RequestState> CREATOR = new Parcelable.Creator<RequestState>() {
            public RequestState createFromParcel(Parcel parcel) {
                return new RequestState(parcel);
            }

            public RequestState[] newArray(int i) {
                return new RequestState[i];
            }
        };
        private long interval;
        private long lastPoll;
        private String requestCode;
        private String userCode;

        RequestState() {
        }

        protected RequestState(Parcel parcel) {
            this.userCode = parcel.readString();
            this.requestCode = parcel.readString();
            this.interval = parcel.readLong();
            this.lastPoll = parcel.readLong();
        }

        public int describeContents() {
            return 0;
        }

        public long getInterval() {
            return this.interval;
        }

        public String getRequestCode() {
            return this.requestCode;
        }

        public String getUserCode() {
            return this.userCode;
        }

        public void setInterval(long j) {
            this.interval = j;
        }

        public void setLastPoll(long j) {
            this.lastPoll = j;
        }

        public void setRequestCode(String str) {
            this.requestCode = str;
        }

        public void setUserCode(String str) {
            this.userCode = str;
        }

        public boolean withinLastRefreshWindow() {
            return this.lastPoll != 0 && (new Date().getTime() - this.lastPoll) - (this.interval * 1000) < 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeString(this.userCode);
            parcel.writeString(this.requestCode);
            parcel.writeLong(this.interval);
            parcel.writeLong(this.lastPoll);
        }
    }

    /* access modifiers changed from: private */
    public void completeLogin(String str, Utility.PermissionsPair permissionsPair, String str2) {
        this.deviceAuthMethodHandler.onSuccess(str2, FacebookSdk.getApplicationId(), str, permissionsPair.getGrantedPermissions(), permissionsPair.getDeclinedPermissions(), AccessTokenSource.DEVICE_AUTH, (Date) null, (Date) null);
        this.dialog.dismiss();
    }

    private GraphRequest getPollRequest() {
        Bundle bundle = new Bundle();
        bundle.putString("code", this.currentRequestState.getRequestCode());
        return new GraphRequest((AccessToken) null, DEVICE_LOGIN_STATUS_ENDPOINT, bundle, HttpMethod.POST, new GraphRequest.Callback() {
            public void onCompleted(GraphResponse graphResponse) {
                if (!DeviceAuthDialog.this.completed.get()) {
                    FacebookRequestError error = graphResponse.getError();
                    if (error != null) {
                        switch (error.getSubErrorCode()) {
                            case DeviceAuthDialog.LOGIN_ERROR_SUBCODE_CODE_EXPIRED /*1349152*/:
                            case DeviceAuthDialog.LOGIN_ERROR_SUBCODE_AUTHORIZATION_DECLINED /*1349173*/:
                                DeviceAuthDialog.this.onCancel();
                                return;
                            case DeviceAuthDialog.LOGIN_ERROR_SUBCODE_EXCESSIVE_POLLING /*1349172*/:
                            case DeviceAuthDialog.LOGIN_ERROR_SUBCODE_AUTHORIZATION_PENDING /*1349174*/:
                                DeviceAuthDialog.this.schedulePoll();
                                return;
                            default:
                                DeviceAuthDialog.this.onError(graphResponse.getError().getException());
                                return;
                        }
                    } else {
                        try {
                            DeviceAuthDialog.this.onSuccess(graphResponse.getJSONObject().getString("access_token"));
                        } catch (JSONException e) {
                            DeviceAuthDialog.this.onError(new FacebookException((Throwable) e));
                        }
                    }
                }
            }
        });
    }

    /* access modifiers changed from: private */
    public View initializeContentView(boolean z) {
        LayoutInflater layoutInflater = getActivity().getLayoutInflater();
        View inflate = z ? layoutInflater.inflate(R.layout.com_facebook_smart_device_dialog_fragment, (ViewGroup) null) : layoutInflater.inflate(R.layout.com_facebook_device_auth_dialog_fragment, (ViewGroup) null);
        this.progressBar = (ProgressBar) inflate.findViewById(R.id.progress_bar);
        this.confirmationCode = (TextView) inflate.findViewById(R.id.confirmation_code);
        ((Button) inflate.findViewById(R.id.cancel_button)).setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                DeviceAuthDialog.this.onCancel();
            }
        });
        ((TextView) inflate.findViewById(R.id.com_facebook_device_auth_instructions)).setText(Html.fromHtml(getString(R.string.com_facebook_device_auth_instructions)));
        return inflate;
    }

    /* access modifiers changed from: private */
    public void onCancel() {
        if (this.completed.compareAndSet(false, true)) {
            if (this.currentRequestState != null) {
                DeviceRequestsHelper.cleanUpAdvertisementService(this.currentRequestState.getUserCode());
            }
            if (this.deviceAuthMethodHandler != null) {
                this.deviceAuthMethodHandler.onCancel();
            }
            this.dialog.dismiss();
        }
    }

    /* access modifiers changed from: private */
    public void onError(FacebookException facebookException) {
        if (this.completed.compareAndSet(false, true)) {
            if (this.currentRequestState != null) {
                DeviceRequestsHelper.cleanUpAdvertisementService(this.currentRequestState.getUserCode());
            }
            this.deviceAuthMethodHandler.onError(facebookException);
            this.dialog.dismiss();
        }
    }

    /* access modifiers changed from: private */
    public void onSuccess(final String str) {
        Bundle bundle = new Bundle();
        bundle.putString(GraphRequest.FIELDS_PARAM, "id,permissions,name");
        new GraphRequest(new AccessToken(str, FacebookSdk.getApplicationId(), "0", (Collection<String>) null, (Collection<String>) null, (AccessTokenSource) null, (Date) null, (Date) null), "me", bundle, HttpMethod.GET, new GraphRequest.Callback() {
            public void onCompleted(GraphResponse graphResponse) {
                if (!DeviceAuthDialog.this.completed.get()) {
                    if (graphResponse.getError() != null) {
                        DeviceAuthDialog.this.onError(graphResponse.getError().getException());
                        return;
                    }
                    try {
                        JSONObject jSONObject = graphResponse.getJSONObject();
                        String string = jSONObject.getString("id");
                        Utility.PermissionsPair handlePermissionResponse = Utility.handlePermissionResponse(jSONObject);
                        String string2 = jSONObject.getString("name");
                        DeviceRequestsHelper.cleanUpAdvertisementService(DeviceAuthDialog.this.currentRequestState.getUserCode());
                        if (!FetchedAppSettingsManager.getAppSettingsWithoutQuery(FacebookSdk.getApplicationId()).getSmartLoginOptions().contains(SmartLoginOption.RequireConfirm) || DeviceAuthDialog.this.isRetry) {
                            DeviceAuthDialog.this.completeLogin(string, handlePermissionResponse, str);
                            return;
                        }
                        boolean unused = DeviceAuthDialog.this.isRetry = true;
                        DeviceAuthDialog.this.presentConfirmation(string, handlePermissionResponse, str, string2);
                    } catch (JSONException e) {
                        DeviceAuthDialog.this.onError(new FacebookException((Throwable) e));
                    }
                }
            }
        }).executeAsync();
    }

    /* access modifiers changed from: private */
    public void poll() {
        this.currentRequestState.setLastPoll(new Date().getTime());
        this.currentGraphRequestPoll = getPollRequest().executeAsync();
    }

    /* access modifiers changed from: private */
    public void presentConfirmation(final String str, final Utility.PermissionsPair permissionsPair, final String str2, String str3) {
        String string = getResources().getString(R.string.com_facebook_smart_login_confirmation_title);
        String string2 = getResources().getString(R.string.com_facebook_smart_login_confirmation_continue_as);
        String string3 = getResources().getString(R.string.com_facebook_smart_login_confirmation_cancel);
        String format = String.format(string2, new Object[]{str3});
        AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
        builder.setMessage(string).setCancelable(true).setNegativeButton(format, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                DeviceAuthDialog.this.completeLogin(str, permissionsPair, str2);
            }
        }).setPositiveButton(string3, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                DeviceAuthDialog.this.dialog.setContentView(DeviceAuthDialog.this.initializeContentView(false));
                DeviceAuthDialog.this.startLogin(DeviceAuthDialog.this.mRequest);
            }
        });
        builder.create().show();
    }

    /* access modifiers changed from: private */
    public void schedulePoll() {
        this.scheduledPoll = DeviceAuthMethodHandler.getBackgroundExecutor().schedule(new Runnable() {
            public void run() {
                DeviceAuthDialog.this.poll();
            }
        }, this.currentRequestState.getInterval(), TimeUnit.SECONDS);
    }

    /* access modifiers changed from: private */
    public void setCurrentRequestState(RequestState requestState) {
        this.currentRequestState = requestState;
        this.confirmationCode.setText(requestState.getUserCode());
        this.confirmationCode.setVisibility(0);
        this.progressBar.setVisibility(8);
        if (!this.isRetry && DeviceRequestsHelper.startAdvertisementService(requestState.getUserCode())) {
            AppEventsLogger.newLogger(getContext()).logSdkEvent(AnalyticsEvents.EVENT_SMART_LOGIN_SERVICE, (Double) null, (Bundle) null);
        }
        if (requestState.withinLastRefreshWindow()) {
            schedulePoll();
        } else {
            poll();
        }
    }

    @NonNull
    public Dialog onCreateDialog(Bundle bundle) {
        this.dialog = new Dialog(getActivity(), R.style.com_facebook_auth_dialog);
        getActivity().getLayoutInflater();
        this.dialog.setContentView(initializeContentView(DeviceRequestsHelper.isAvailable() && !this.isRetry));
        return this.dialog;
    }

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        RequestState requestState;
        View onCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        this.deviceAuthMethodHandler = (DeviceAuthMethodHandler) ((LoginFragment) ((FacebookActivity) getActivity()).getCurrentFragment()).getLoginClient().getCurrentHandler();
        if (!(bundle == null || (requestState = (RequestState) bundle.getParcelable(REQUEST_STATE_KEY)) == null)) {
            setCurrentRequestState(requestState);
        }
        return onCreateView;
    }

    public void onDestroy() {
        this.isBeingDestroyed = true;
        this.completed.set(true);
        super.onDestroy();
        if (this.currentGraphRequestPoll != null) {
            this.currentGraphRequestPoll.cancel(true);
        }
        if (this.scheduledPoll != null) {
            this.scheduledPoll.cancel(true);
        }
    }

    public void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        if (!this.isBeingDestroyed) {
            onCancel();
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (this.currentRequestState != null) {
            bundle.putParcelable(REQUEST_STATE_KEY, this.currentRequestState);
        }
    }

    public void startLogin(LoginClient.Request request) {
        this.mRequest = request;
        Bundle bundle = new Bundle();
        bundle.putString("scope", TextUtils.join(",", request.getPermissions()));
        String deviceRedirectUriString = request.getDeviceRedirectUriString();
        if (deviceRedirectUriString != null) {
            bundle.putString(ServerProtocol.DIALOG_PARAM_REDIRECT_URI, deviceRedirectUriString);
        }
        bundle.putString("access_token", Validate.hasAppID() + "|" + Validate.hasClientToken());
        bundle.putString(DeviceRequestsHelper.DEVICE_INFO_PARAM, DeviceRequestsHelper.getDeviceInfo());
        new GraphRequest((AccessToken) null, DEVICE_LOGIN_ENDPOINT, bundle, HttpMethod.POST, new GraphRequest.Callback() {
            public void onCompleted(GraphResponse graphResponse) {
                if (!DeviceAuthDialog.this.isBeingDestroyed) {
                    if (graphResponse.getError() != null) {
                        DeviceAuthDialog.this.onError(graphResponse.getError().getException());
                        return;
                    }
                    JSONObject jSONObject = graphResponse.getJSONObject();
                    RequestState requestState = new RequestState();
                    try {
                        requestState.setUserCode(jSONObject.getString("user_code"));
                        requestState.setRequestCode(jSONObject.getString("code"));
                        requestState.setInterval(jSONObject.getLong("interval"));
                        DeviceAuthDialog.this.setCurrentRequestState(requestState);
                    } catch (JSONException e) {
                        DeviceAuthDialog.this.onError(new FacebookException((Throwable) e));
                    }
                }
            }
        }).executeAsync();
    }
}
