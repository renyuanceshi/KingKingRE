package org.linphone.mediastream;

import android.annotation.TargetApi;
import android.content.Context;
import android.media.AudioManager;
import android.os.Build;

public class MediastreamerAndroidContext {
    private static final int DEVICE_CHOICE = 0;
    public static final int DEVICE_HAS_BUILTIN_AEC = 1;
    public static final int DEVICE_HAS_BUILTIN_AEC_CRAPPY = 2;
    public static final int DEVICE_HAS_BUILTIN_OPENSLES_AEC = 8;
    public static final int DEVICE_USE_ANDROID_CAMCORDER = 512;
    public static final int DEVICE_USE_ANDROID_MIC = 4;
    private static MediastreamerAndroidContext instance;
    private static Context mContext;

    private MediastreamerAndroidContext() {
    }

    public static void enableFilterFromName(String str, boolean z) throws MediastreamException {
        if (getInstance().enableFilterFromNameImpl(str, z) != 0) {
            throw new MediastreamException("Cannot " + (z ? "enable" : "disable") + " filter  name [" + str + "]");
        }
    }

    private native int enableFilterFromNameImpl(String str, boolean z);

    public static boolean filterFromNameEnabled(String str) {
        return getInstance().filterFromNameEnabledImpl(str);
    }

    private native boolean filterFromNameEnabledImpl(String str);

    public static Context getContext() {
        return mContext;
    }

    private static MediastreamerAndroidContext getInstance() {
        if (instance == null) {
            instance = new MediastreamerAndroidContext();
        }
        return instance;
    }

    public static boolean getSpeakerphoneAlwaysOn(Factory factory) {
        return (factory.getDeviceFlags() & 512) != 0;
    }

    private static int parseInt(String str, int i) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            Log.e("Can't parse " + str + " to integer ; using default value " + i);
            return i;
        }
    }

    @TargetApi(19)
    public static void setContext(Object obj) {
        if (obj != null) {
            mContext = (Context) obj;
            boolean hasSystemFeature = mContext.getPackageManager().hasSystemFeature("android.hardware.audio.low_latency");
            Log.i("[Device] hasLowLatencyFeature: " + hasSystemFeature + ", hasProFeature: " + mContext.getPackageManager().hasSystemFeature("android.hardware.audio.pro"));
            MediastreamerAndroidContext instance2 = getInstance();
            if (Build.VERSION.SDK_INT >= 19) {
                AudioManager audioManager = (AudioManager) mContext.getSystemService(AUDIO_SERVICE);
                int parseInt = parseInt(audioManager.getProperty("android.media.property.OUTPUT_FRAMES_PER_BUFFER"), 256);
                int parseInt2 = parseInt(audioManager.getProperty("android.media.property.OUTPUT_SAMPLE_RATE"), 44100);
                Log.i("[Device] Output frames per buffer: " + parseInt + ", output sample rates: " + parseInt2 + " for OpenSLES MS sound card.");
                instance2.setDeviceFavoriteSampleRate(parseInt2);
                instance2.setDeviceFavoriteBufferSize(parseInt);
                return;
            }
            Log.i("Android < 4.4 detected, android context not used.");
        }
    }

    private native void setDeviceFavoriteBufferSize(int i);

    private native void setDeviceFavoriteSampleRate(int i);
}
