package org.linphone.core;

import android.hardware.Camera;
import android.media.AudioManager;
import android.os.Build;
import org.apache.commons.lang3.StringUtils;
import org.linphone.mediastream.Version;

public final class Hacks {
    private Hacks() {
    }

    public static void dumpDeviceInformation() {
        StringBuilder sb = new StringBuilder(" ==== Phone information dump ====\n");
        sb.append("DEVICE=").append(Build.DEVICE).append(StringUtils.LF);
        sb.append("MODEL=").append(Build.MODEL).append(StringUtils.LF);
        sb.append("SDK=").append(Build.VERSION.SDK);
        Log.i(sb.toString());
    }

    public static void galaxySSwitchToCallStreamUnMuteLowerVolume(AudioManager audioManager) {
        audioManager.setSpeakerphoneOn(false);
        sleep(200);
        audioManager.setStreamVolume(0, 1, 0);
        audioManager.setMode(0);
        sleep(200);
        audioManager.setMicrophoneMute(true);
        sleep(200);
        audioManager.setMicrophoneMute(false);
        sleep(200);
    }

    public static boolean hasCamera() {
        int i;
        if (Version.sdkAboveOrEqual(9)) {
            try {
                i = ((Integer) Camera.class.getMethod("getNumberOfCameras", (Class[]) null).invoke((Object) null, new Object[0])).intValue();
            } catch (Exception e) {
                Log.e("Error getting number of cameras");
                i = 0;
            }
            return i > 0;
        }
        Log.i("Hack: considering there IS a camera.\nIf it is not the case, report DEVICE and MODEL to linphone-users@nongnu.org");
        return true;
    }

    public static boolean hasTwoCameras() {
        return isSPHD700() || isGalaxySOrTabWithFrontCamera();
    }

    public static final boolean hasTwoCamerasRear0Front1() {
        return isSPHD700() || isADR6400();
    }

    private static final boolean isADR6400() {
        return Build.MODEL.startsWith("ADR6400") || Build.DEVICE.startsWith("ADR6400");
    }

    public static boolean isASUSPadFone2() {
        return Build.MODEL.startsWith("PadFone 2");
    }

    private static boolean isGT9000() {
        return Build.DEVICE.startsWith("GT-I9000");
    }

    private static boolean isGTP1000() {
        return Build.DEVICE.startsWith("GT-P1000");
    }

    public static boolean isGalaxyS() {
        return isGT9000() || isSC02B() || isSGHI896() || isSPHD700();
    }

    public static boolean isGalaxySOrTab() {
        return isGalaxyS() || isGalaxyTab();
    }

    public static boolean isGalaxySOrTabWithFrontCamera() {
        return isGalaxySOrTab() && !isGalaxySOrTabWithoutFrontCamera();
    }

    private static boolean isGalaxySOrTabWithoutFrontCamera() {
        return isSC02B() || isSGHI896();
    }

    public static boolean isGalaxyTab() {
        return isGTP1000();
    }

    private static final boolean isHTCDesireZ() {
        return Build.MODEL.startsWith("HTC Vision");
    }

    private static final boolean isHTCFlyer() {
        return Build.MODEL.startsWith("HTC Flyer");
    }

    private static final boolean isHuaweiU8110() {
        return Build.MODEL.startsWith("U8110");
    }

    private static final boolean isHuaweiU8220PLUS() {
        return Build.MODEL.startsWith("U8220PLUS");
    }

    private static final boolean isLGE400() {
        return Build.MODEL.startsWith("LG-E400");
    }

    private static final boolean isLGE720() {
        return Build.MODEL.startsWith("LG-E720");
    }

    private static final boolean isLGP350() {
        return Build.MODEL.startsWith("LG-P350");
    }

    private static final boolean isLGP500() {
        return Build.MODEL.startsWith("LG-P500");
    }

    private static final boolean isLGP690() {
        return Build.MODEL.startsWith("LG-P690");
    }

    private static final boolean isMotoA1680() {
        return Build.DEVICE.startsWith("umts_lucky") && Build.MODEL.startsWith("A1680");
    }

    private static final boolean isMotoXT316() {
        return Build.MODEL.startsWith("XT316");
    }

    private static boolean isSC02B() {
        return Build.DEVICE.startsWith("SC-02B");
    }

    private static boolean isSGHI896() {
        return Build.DEVICE.startsWith("SGH-I896");
    }

    private static final boolean isSPHD700() {
        return Build.DEVICE.startsWith("SPH-D700");
    }

    public static boolean needAudioPathRecovery() {
        return isLGE400();
    }

    public static boolean needForceSpeakerOn() {
        return isHTCFlyer();
    }

    public static boolean needGalaxySAudioHack() {
        return isGalaxySOrTab() && !isSC02B();
    }

    public static boolean needIncallModeAudio() {
        return isMotoA1680() || isMotoXT316() || isHuaweiU8110() || isHuaweiU8220PLUS() || isLGP350() || isLGE720() || isLGP500() || isLGP690();
    }

    public static boolean needPausingCallForSpeakers() {
        return isGalaxySOrTab() && !isSC02B();
    }

    public static boolean needRTPStreamHack() {
        return isHTCDesireZ();
    }

    public static boolean needRoutingAPI() {
        return Version.sdkStrictlyBelow(5);
    }

    public static boolean needSoftvolume() {
        return isGalaxySOrTab();
    }

    public static final void sleep(int i) {
        try {
            Thread.sleep((long) i);
        } catch (InterruptedException e) {
        }
    }
}
