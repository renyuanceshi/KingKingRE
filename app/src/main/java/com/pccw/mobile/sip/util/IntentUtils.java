package com.pccw.mobile.sip.util;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.pccw.mobile.sip.Constants;
import org.linphone.LinphoneActivity;

public class IntentUtils {
    public static final Intent genDialScreenIntent(String str) {
        return new Intent(Constants.INTENT_DIAL_ACTION, Uri.fromParts("tel", str, (String) null));
    }

    public static final Intent genDialScreenIntent(String str, Context context) {
        Uri fromParts = Uri.fromParts("tel", str, (String) null);
        Intent intent = new Intent(context, LinphoneActivity.class);
        intent.setAction(Constants.INTENT_DIAL_ACTION);
        intent.setData(fromParts);
        return intent;
    }

    public static final Intent genSipCallIntent(String str) {
        return new Intent("android.intent.action.CALL", Uri.fromParts("sip", str, (String) null));
    }
}
