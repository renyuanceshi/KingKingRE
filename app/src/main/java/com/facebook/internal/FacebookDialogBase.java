package com.facebook.internal;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;
import com.facebook.CallbackManager;
import com.facebook.FacebookCallback;
import com.facebook.FacebookDialog;
import com.facebook.FacebookException;
import com.facebook.FacebookSdk;
import com.facebook.LoggingBehavior;
import java.util.Iterator;
import java.util.List;

public abstract class FacebookDialogBase<CONTENT, RESULT> implements FacebookDialog<CONTENT, RESULT> {
    protected static final Object BASE_AUTOMATIC_MODE = new Object();
    private static final String TAG = "FacebookDialog";
    private final Activity activity;
    private final FragmentWrapper fragmentWrapper;
    private List<FacebookDialogBase<CONTENT, RESULT>.ModeHandler> modeHandlers;
    private int requestCode;

    protected abstract class ModeHandler {
        protected ModeHandler() {
        }

        public abstract boolean canShow(CONTENT content, boolean z);

        public abstract AppCall createAppCall(CONTENT content);

        public Object getMode() {
            return FacebookDialogBase.BASE_AUTOMATIC_MODE;
        }
    }

    protected FacebookDialogBase(Activity activity2, int i) {
        Validate.notNull(activity2, "activity");
        this.activity = activity2;
        this.fragmentWrapper = null;
        this.requestCode = i;
    }

    protected FacebookDialogBase(FragmentWrapper fragmentWrapper2, int i) {
        Validate.notNull(fragmentWrapper2, "fragmentWrapper");
        this.fragmentWrapper = fragmentWrapper2;
        this.activity = null;
        this.requestCode = i;
        if (fragmentWrapper2.getActivity() == null) {
            throw new IllegalArgumentException("Cannot use a fragment that is not attached to an activity");
        }
    }

    private List<FacebookDialogBase<CONTENT, RESULT>.ModeHandler> cachedModeHandlers() {
        if (this.modeHandlers == null) {
            this.modeHandlers = getOrderedModeHandlers();
        }
        return this.modeHandlers;
    }

    private AppCall createAppCallForMode(CONTENT content, Object obj) {
        AppCall appCall;
        boolean z = obj == BASE_AUTOMATIC_MODE;
        Iterator<FacebookDialogBase<CONTENT, RESULT>.ModeHandler> it = cachedModeHandlers().iterator();
        while (true) {
            if (!it.hasNext()) {
                appCall = null;
                break;
            }
            ModeHandler next = it.next();
            if ((z || Utility.areObjectsEqual(next.getMode(), obj)) && next.canShow(content, true)) {
                try {
                    appCall = next.createAppCall(content);
                    break;
                } catch (FacebookException e) {
                    appCall = createBaseAppCall();
                    DialogPresenter.setupAppCallForValidationError(appCall, e);
                }
            }
        }
        if (appCall != null) {
            return appCall;
        }
        AppCall createBaseAppCall = createBaseAppCall();
        DialogPresenter.setupAppCallForCannotShowError(createBaseAppCall);
        return createBaseAppCall;
    }

    public boolean canShow(CONTENT content) {
        return canShowImpl(content, BASE_AUTOMATIC_MODE);
    }

    /* access modifiers changed from: protected */
    public boolean canShowImpl(CONTENT content, Object obj) {
        boolean z = obj == BASE_AUTOMATIC_MODE;
        for (ModeHandler next : cachedModeHandlers()) {
            if ((z || Utility.areObjectsEqual(next.getMode(), obj)) && next.canShow(content, false)) {
                return true;
            }
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public abstract AppCall createBaseAppCall();

    /* access modifiers changed from: protected */
    public Activity getActivityContext() {
        if (this.activity != null) {
            return this.activity;
        }
        if (this.fragmentWrapper != null) {
            return this.fragmentWrapper.getActivity();
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public abstract List<FacebookDialogBase<CONTENT, RESULT>.ModeHandler> getOrderedModeHandlers();

    public int getRequestCode() {
        return this.requestCode;
    }

    public final void registerCallback(CallbackManager callbackManager, FacebookCallback<RESULT> facebookCallback) {
        if (!(callbackManager instanceof CallbackManagerImpl)) {
            throw new FacebookException("Unexpected CallbackManager, please use the provided Factory.");
        }
        registerCallbackImpl((CallbackManagerImpl) callbackManager, facebookCallback);
    }

    public final void registerCallback(CallbackManager callbackManager, FacebookCallback<RESULT> facebookCallback, int i) {
        setRequestCode(i);
        registerCallback(callbackManager, facebookCallback);
    }

    /* access modifiers changed from: protected */
    public abstract void registerCallbackImpl(CallbackManagerImpl callbackManagerImpl, FacebookCallback<RESULT> facebookCallback);

    /* access modifiers changed from: protected */
    public void setRequestCode(int i) {
        if (FacebookSdk.isFacebookRequestCode(i)) {
            throw new IllegalArgumentException("Request code " + i + " cannot be within the range reserved by the Facebook SDK.");
        }
        this.requestCode = i;
    }

    public void show(CONTENT content) {
        showImpl(content, BASE_AUTOMATIC_MODE);
    }

    /* access modifiers changed from: protected */
    public void showImpl(CONTENT content, Object obj) {
        AppCall createAppCallForMode = createAppCallForMode(content, obj);
        if (createAppCallForMode == null) {
            Log.e(TAG, "No code path should ever result in a null appCall");
            if (FacebookSdk.isDebugEnabled()) {
                throw new IllegalStateException("No code path should ever result in a null appCall");
            }
        } else if (this.fragmentWrapper != null) {
            DialogPresenter.present(createAppCallForMode, this.fragmentWrapper);
        } else {
            DialogPresenter.present(createAppCallForMode, this.activity);
        }
    }

    /* access modifiers changed from: protected */
    public void startActivityForResult(Intent intent, int i) {
        String str = null;
        if (this.activity != null) {
            this.activity.startActivityForResult(intent, i);
        } else if (this.fragmentWrapper == null) {
            str = "Failed to find Activity or Fragment to startActivityForResult ";
        } else if (this.fragmentWrapper.getNativeFragment() != null) {
            this.fragmentWrapper.getNativeFragment().startActivityForResult(intent, i);
        } else if (this.fragmentWrapper.getSupportFragment() != null) {
            this.fragmentWrapper.getSupportFragment().startActivityForResult(intent, i);
        } else {
            str = "Failed to find Activity or Fragment to startActivityForResult ";
        }
        if (str != null) {
            Logger.log(LoggingBehavior.DEVELOPER_ERRORS, 6, getClass().getName(), str);
        }
    }
}
