package org.linphone;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.provider.Contacts;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ImageView;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import org.apache.http.HttpHost;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreException;
import org.linphone.core.LinphoneCoreFactory;
import org.linphone.mediastream.Log;
import org.linphone.mediastream.Version;

public final class LinphoneUtils {
    private static boolean preventVolumeBarToDisplay = false;

    private LinphoneUtils() {
    }

    public static final int countConferenceCalls(LinphoneCore linphoneCore) {
        int conferenceSize = linphoneCore.getConferenceSize();
        return linphoneCore.isInConference() ? conferenceSize - 1 : conferenceSize;
    }

    public static int countNonConferenceCalls(LinphoneCore linphoneCore) {
        return linphoneCore.getCallsNb() - countConferenceCalls(linphoneCore);
    }

    public static int countVirtualCalls(LinphoneCore linphoneCore) {
        return linphoneCore.getCallsNb() - countConferenceCalls(linphoneCore);
    }

    public static Bitmap downloadBitmap(Uri uri) {
        InputStream inputStream;
        Throwable th;
        Bitmap bitmap = null;
        try {
            inputStream = new URL(uri.toString()).openStream();
            try {
                bitmap = BitmapFactory.decodeStream(inputStream);
                try {
                    inputStream.close();
                } catch (IOException e) {
                }
            } catch (MalformedURLException e2) {
                e = e2;
            } catch (IOException e3) {
                e = e3;
                Log.e(e, e.getMessage());
                try {
                    inputStream.close();
                } catch (IOException e4) {
                }
                return bitmap;
            }
        } catch (MalformedURLException e5) {
            e = e5;
            inputStream = null;
        } catch (IOException e6) {
            e = e6;
            inputStream = null;
            Log.e(e, e.getMessage());
            inputStream.close();
            return bitmap;
        } catch (Throwable th2) {
            th = th2;
            inputStream = null;
            try {
                inputStream.close();
            } catch (IOException e7) {
            }
            throw th;
        }
        return bitmap;
        try {
            Log.e(e, e.getMessage());
            try {
                inputStream.close();
            } catch (IOException e8) {
            }
            return bitmap;
        } catch (Throwable th3) {
            th = th3;
            inputStream.close();
            throw th;
        }
    }

    public static void enableView(View view, int i, View.OnClickListener onClickListener, boolean z) {
        View findViewById = view.findViewById(i);
        findViewById.setVisibility(z ? 0 : 8);
        findViewById.setOnClickListener(onClickListener);
    }

    public static final List<LinphoneCall> getCallsInState(LinphoneCore linphoneCore, Collection<LinphoneCall.State> collection) {
        ArrayList arrayList = new ArrayList();
        for (LinphoneCall next : getLinphoneCalls(linphoneCore)) {
            if (collection.contains(next.getState())) {
                arrayList.add(next);
            }
        }
        return arrayList;
    }

    public static final List<LinphoneCall> getLinphoneCalls(LinphoneCore linphoneCore) {
        return new ArrayList(Arrays.asList(linphoneCore.getCalls()));
    }

    public static final List<LinphoneCall> getLinphoneCallsInConf(LinphoneCore linphoneCore) {
        ArrayList arrayList = new ArrayList();
        for (LinphoneCall linphoneCall : linphoneCore.getCalls()) {
            if (linphoneCall.isInConference()) {
                arrayList.add(linphoneCall);
            }
        }
        return arrayList;
    }

    public static final List<LinphoneCall> getLinphoneCallsNotInConf(LinphoneCore linphoneCore) {
        ArrayList arrayList = new ArrayList();
        for (LinphoneCall linphoneCall : linphoneCore.getCalls()) {
            if (!linphoneCall.isInConference()) {
                arrayList.add(linphoneCall);
            }
        }
        return arrayList;
    }

    public static final List<LinphoneCall> getRunningOrPausedCalls(LinphoneCore linphoneCore) {
        return getCallsInState(linphoneCore, Arrays.asList(new LinphoneCall.State[]{LinphoneCall.State.Paused, LinphoneCall.State.PausedByRemote, LinphoneCall.State.StreamsRunning}));
    }

    public static String getUsernameFromAddress(String str) {
        if (str.contains("sip:")) {
            str = str.replace("sip:", "");
        }
        return str.contains("@") ? str.split("@")[0] : str;
    }

    public static final boolean hasExistingResumeableCall(LinphoneCore linphoneCore) {
        for (LinphoneCall state : getLinphoneCalls(linphoneCore)) {
            if (state.getState() == LinphoneCall.State.Paused) {
                return true;
            }
        }
        return false;
    }

    public static boolean isCallEstablished(LinphoneCall linphoneCall) {
        if (linphoneCall == null) {
            return false;
        }
        LinphoneCall.State state = linphoneCall.getState();
        return isCallRunning(linphoneCall) || state == LinphoneCall.State.Paused || state == LinphoneCall.State.PausedByRemote || state == LinphoneCall.State.Pausing;
    }

    public static boolean isCallPaused(LinphoneCall linphoneCall) {
        if (linphoneCall == null) {
            return false;
        }
        LinphoneCall.State state = linphoneCall.getState();
        return state == LinphoneCall.State.Paused || state == LinphoneCall.State.PausedByRemote || state == LinphoneCall.State.Pausing;
    }

    public static boolean isCallRunning(LinphoneCall linphoneCall) {
        if (linphoneCall == null) {
            return false;
        }
        LinphoneCall.State state = linphoneCall.getState();
        return state == LinphoneCall.State.Connected || state == LinphoneCall.State.CallUpdating || state == LinphoneCall.State.CallUpdatedByRemote || state == LinphoneCall.State.StreamsRunning || state == LinphoneCall.State.Resuming;
    }

    private static boolean isConnectionFast(int i, int i2) {
        if (i != 1) {
            if (i != 0) {
                return false;
            }
            switch (i2) {
                case 3:
                case 6:
                case 8:
                case 9:
                case 10:
                case 11:
                case 12:
                case 13:
                case 14:
                case 15:
                    break;
                default:
                    return false;
            }
        }
        return true;
    }

    public static boolean isHightBandwidthConnection(Context context) {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnected() && isConnectionFast(activeNetworkInfo.getType(), activeNetworkInfo.getSubtype());
    }

    public static boolean isSipAddress(String str) {
        try {
            LinphoneCoreFactory.instance().createLinphoneAddress(str);
            return true;
        } catch (LinphoneCoreException e) {
            return false;
        }
    }

    public static boolean isStrictSipAddress(String str) {
        return isSipAddress(str) && str.startsWith("sip:");
    }

    public static boolean onKeyBackGoHome(Activity activity, int i, KeyEvent keyEvent) {
        if (i != 4 || keyEvent.getRepeatCount() != 0) {
            return false;
        }
        activity.startActivity(new Intent().setAction("android.intent.action.MAIN").addCategory("android.intent.category.HOME"));
        return true;
    }

    public static int pixelsToDpi(Resources resources, int i) {
        return (int) TypedValue.applyDimension(1, (float) i, resources.getDisplayMetrics());
    }

    public static void setImagePictureFromUri(Context context, ImageView imageView, Uri uri, int i) {
        if (uri == null) {
            imageView.setImageResource(i);
        } else if (uri.getScheme().startsWith(HttpHost.DEFAULT_SCHEME_NAME)) {
            Bitmap downloadBitmap = downloadBitmap(uri);
            if (downloadBitmap == null) {
                imageView.setImageResource(i);
            }
            imageView.setImageBitmap(downloadBitmap);
        } else if (Version.sdkAboveOrEqual(6)) {
            imageView.setImageURI(uri);
        } else {
            imageView.setImageBitmap(Contacts.People.loadContactPhoto(context, uri, i, (BitmapFactory.Options) null));
        }
    }

    public static void setVisibility(View view, int i, boolean z) {
        view.findViewById(i).setVisibility(z ? 0 : 8);
    }

    public static void setVisibility(View view, boolean z) {
        view.setVisibility(z ? 0 : 8);
    }
}
