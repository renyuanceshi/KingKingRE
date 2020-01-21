package com.pccw.mobile.util;

import android.content.Context;
import com.pccw.mobile.server.CheckLocationApi;
import com.pccw.mobile.server.api.ApiResponse;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.response.CheckLocationResponse;

import de.timroes.axmlrpc.serializer.SerializerHandler;
import java.util.concurrent.ExecutionException;

public class ErrorMsgUtil {
    static CheckOverseaResult oversea = CheckOverseaResult.LOCAL;

    public enum CheckOverseaResult {
        LOCAL,
        OVERSEA,
        FAIL
    }

    public static String getLocalErrorMsg(String str, String str2, Context context) {
        String str3 = "";
        try {
            str3 = context.getString(context.getResources().getIdentifier(str + str2, SerializerHandler.TYPE_STRING, context.getPackageName()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        String overseaLocalErrorMsgIfNeeded = getOverseaLocalErrorMsgIfNeeded(str3, str + str2, context);
        if (overseaLocalErrorMsgIfNeeded != null && !overseaLocalErrorMsgIfNeeded.equals("")) {
            return overseaLocalErrorMsgIfNeeded;
        }
        return String.format(context.getResources().getString(R.string.contact_dialog_unknow_message), new Object[]{str2});
    }

    public static String getOverseaLocalErrorMsgIfNeeded(String str, String str2, Context context) {
        if ((!str.contains("2512-3123") && !str.contains("2888-1000")) || isOversea(context) != CheckOverseaResult.OVERSEA) {
            return str;
        }
        try {
            return context.getString(context.getResources().getIdentifier(str2 + "_oversea", SerializerHandler.TYPE_STRING, context.getPackageName()));
        } catch (Exception e) {
            e.printStackTrace();
            return str;
        }
    }

    private static CheckOverseaResult isOversea(Context context) {
        oversea = CheckOverseaResult.LOCAL;
        try {
            new CheckLocationApi(new ApiResponseListener() {
                public void onResponseFailed() {
                    ErrorMsgUtil.oversea = CheckOverseaResult.FAIL;
                }

                public void onResponseSuccess(ApiResponse apiResponse) {
                    if (Boolean.valueOf(((CheckLocationResponse) apiResponse).isHK).booleanValue()) {
                        ErrorMsgUtil.oversea = CheckOverseaResult.LOCAL;
                    } else {
                        ErrorMsgUtil.oversea = CheckOverseaResult.OVERSEA;
                    }
                }
            }, context).execute(new String[]{""}).get();
        } catch (InterruptedException e) {
            oversea = CheckOverseaResult.FAIL;
            e.printStackTrace();
        } catch (ExecutionException e2) {
            oversea = CheckOverseaResult.FAIL;
            e2.printStackTrace();
        }
        return oversea;
    }

    public static boolean shouldShowOverseaXmlErrorMsg(String str, Context context) {
        if (!str.contains("2512-3123") && !str.contains("2888-1010")) {
            return false;
        }
        switch (isOversea(context)) {
            case OVERSEA:
                return true;
            default:
                return false;
        }
    }

    public static CheckOverseaResult shouldShowOverseaXmlErrorMsgWithFailCase(String str, Context context) {
        return (str.contains("2512-3123") || str.contains("2888-1010")) ? isOversea(context) : CheckOverseaResult.LOCAL;
    }
}
