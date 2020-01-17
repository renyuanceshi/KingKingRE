package com.facebook.share.internal;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.facebook.AccessToken;
import com.facebook.FacebookRequestError;
import com.facebook.GraphRequest;
import com.facebook.GraphResponse;
import com.facebook.HttpMethod;
import com.facebook.R;
import com.facebook.devicerequests.internal.DeviceRequestsHelper;
import com.facebook.internal.Validate;
import com.facebook.share.model.ShareContent;
import com.facebook.share.model.ShareLinkContent;
import com.facebook.share.model.ShareOpenGraphContent;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

public class DeviceShareDialogFragment extends DialogFragment {
    private static final String DEVICE_SHARE_ENDPOINT = "device/share";
    private static final String REQUEST_STATE_KEY = "request_state";
    public static final String TAG = "DeviceShareDialogFragment";
    private static ScheduledThreadPoolExecutor backgroundExecutor;
    private volatile ScheduledFuture codeExpiredFuture;
    private TextView confirmationCode;
    private volatile RequestState currentRequestState;
    /* access modifiers changed from: private */
    public Dialog dialog;
    private ProgressBar progressBar;
    private ShareContent shareContent;

    private static class RequestState implements Parcelable {
        public static final Parcelable.Creator<RequestState> CREATOR = new Parcelable.Creator<RequestState>() {
            public RequestState createFromParcel(Parcel parcel) {
                return new RequestState(parcel);
            }

            public RequestState[] newArray(int i) {
                return new RequestState[i];
            }
        };
        private long expiresIn;
        private String userCode;

        RequestState() {
        }

        protected RequestState(Parcel parcel) {
            this.userCode = parcel.readString();
            this.expiresIn = parcel.readLong();
        }

        public int describeContents() {
            return 0;
        }

        public long getExpiresIn() {
            return this.expiresIn;
        }

        public String getUserCode() {
            return this.userCode;
        }

        public void setExpiresIn(long j) {
            this.expiresIn = j;
        }

        public void setUserCode(String str) {
            this.userCode = str;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeString(this.userCode);
            parcel.writeLong(this.expiresIn);
        }
    }

    private void detach() {
        if (isAdded()) {
            getFragmentManager().beginTransaction().remove(this).commit();
        }
    }

    private void finishActivity(int i, Intent intent) {
        DeviceRequestsHelper.cleanUpAdvertisementService(this.currentRequestState.getUserCode());
        if (isAdded()) {
            FragmentActivity activity = getActivity();
            activity.setResult(i, intent);
            activity.finish();
        }
    }

    /* access modifiers changed from: private */
    public void finishActivityWithError(FacebookRequestError facebookRequestError) {
        detach();
        Intent intent = new Intent();
        intent.putExtra("error", facebookRequestError);
        finishActivity(-1, intent);
    }

    private static ScheduledThreadPoolExecutor getBackgroundExecutor() {
        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor;
        synchronized (DeviceShareDialogFragment.class) {
            try {
                if (backgroundExecutor == null) {
                    backgroundExecutor = new ScheduledThreadPoolExecutor(1);
                }
                scheduledThreadPoolExecutor = backgroundExecutor;
            } catch (Throwable th) {
                Class<DeviceShareDialogFragment> cls = DeviceShareDialogFragment.class;
                throw th;
            }
        }
        return scheduledThreadPoolExecutor;
    }

    private Bundle getGraphParametersForShareContent() {
        ShareContent shareContent2 = this.shareContent;
        if (shareContent2 != null) {
            if (shareContent2 instanceof ShareLinkContent) {
                return WebDialogParameters.create((ShareLinkContent) shareContent2);
            }
            if (shareContent2 instanceof ShareOpenGraphContent) {
                return WebDialogParameters.create((ShareOpenGraphContent) shareContent2);
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public void setCurrentRequestState(RequestState requestState) {
        this.currentRequestState = requestState;
        this.confirmationCode.setText(requestState.getUserCode());
        this.confirmationCode.setVisibility(0);
        this.progressBar.setVisibility(8);
        this.codeExpiredFuture = getBackgroundExecutor().schedule(new Runnable() {
            public void run() {
                DeviceShareDialogFragment.this.dialog.dismiss();
            }
        }, requestState.getExpiresIn(), TimeUnit.SECONDS);
    }

    private void startShare() {
        Bundle graphParametersForShareContent = getGraphParametersForShareContent();
        if (graphParametersForShareContent == null || graphParametersForShareContent.size() == 0) {
            finishActivityWithError(new FacebookRequestError(0, "", "Failed to get share content"));
        }
        graphParametersForShareContent.putString("access_token", Validate.hasAppID() + "|" + Validate.hasClientToken());
        graphParametersForShareContent.putString(DeviceRequestsHelper.DEVICE_INFO_PARAM, DeviceRequestsHelper.getDeviceInfo());
        new GraphRequest((AccessToken) null, DEVICE_SHARE_ENDPOINT, graphParametersForShareContent, HttpMethod.POST, new GraphRequest.Callback() {
            public void onCompleted(GraphResponse graphResponse) {
                FacebookRequestError error = graphResponse.getError();
                if (error != null) {
                    DeviceShareDialogFragment.this.finishActivityWithError(error);
                    return;
                }
                JSONObject jSONObject = graphResponse.getJSONObject();
                RequestState requestState = new RequestState();
                try {
                    requestState.setUserCode(jSONObject.getString("user_code"));
                    requestState.setExpiresIn(jSONObject.getLong(AccessToken.EXPIRES_IN_KEY));
                    DeviceShareDialogFragment.this.setCurrentRequestState(requestState);
                } catch (JSONException e) {
                    DeviceShareDialogFragment.this.finishActivityWithError(new FacebookRequestError(0, "", "Malformed server response"));
                }
            }
        }).executeAsync();
    }

    @NonNull
    public Dialog onCreateDialog(Bundle bundle) {
        this.dialog = new Dialog(getActivity(), R.style.com_facebook_auth_dialog);
        View inflate = getActivity().getLayoutInflater().inflate(R.layout.com_facebook_device_auth_dialog_fragment, (ViewGroup) null);
        this.progressBar = (ProgressBar) inflate.findViewById(R.id.progress_bar);
        this.confirmationCode = (TextView) inflate.findViewById(R.id.confirmation_code);
        ((Button) inflate.findViewById(R.id.cancel_button)).setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                DeviceShareDialogFragment.this.dialog.dismiss();
            }
        });
        ((TextView) inflate.findViewById(R.id.com_facebook_device_auth_instructions)).setText(Html.fromHtml(getString(R.string.com_facebook_device_auth_instructions)));
        this.dialog.setContentView(inflate);
        startShare();
        return this.dialog;
    }

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        RequestState requestState;
        View onCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        if (!(bundle == null || (requestState = (RequestState) bundle.getParcelable(REQUEST_STATE_KEY)) == null)) {
            setCurrentRequestState(requestState);
        }
        return onCreateView;
    }

    public void onDismiss(DialogInterface dialogInterface) {
        super.onDismiss(dialogInterface);
        if (this.codeExpiredFuture != null) {
            this.codeExpiredFuture.cancel(true);
        }
        finishActivity(-1, new Intent());
    }

    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (this.currentRequestState != null) {
            bundle.putParcelable(REQUEST_STATE_KEY, this.currentRequestState);
        }
    }

    public void setShareContent(ShareContent shareContent2) {
        this.shareContent = shareContent2;
    }
}
