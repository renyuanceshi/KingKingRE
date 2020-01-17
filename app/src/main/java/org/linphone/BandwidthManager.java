package org.linphone;

import com.pccw.mobile.sip.ClientStateManager;
import java.util.List;
import org.linphone.core.AndroidCameraRecordManager;
import org.linphone.core.LinphoneCallParams;
import org.linphone.core.LinphoneCore;
import org.linphone.core.Log;
import org.linphone.core.VideoSize;
import org.linphone.mediastream.Version;

public class BandwidthManager {
    public static final int HIGH_RESOLUTION = 0;
    public static final int LOW_BANDWIDTH = 2;
    public static final int LOW_RESOLUTION = 1;
    private static final int[][] bandwidthes = {new int[]{256, 256}, new int[]{200, 200}, new int[]{80, 80}};
    private static BandwidthManager instance;
    private int currentProfile = 0;
    private boolean userRestriction;

    private BandwidthManager() {
    }

    private void computeNewProfile() {
        int i = this.userRestriction ? 1 : 0;
        if (i != this.currentProfile) {
            this.currentProfile = i;
            onProfileChanged(this.currentProfile);
        }
    }

    public static final BandwidthManager getInstance() {
        BandwidthManager bandwidthManager;
        synchronized (BandwidthManager.class) {
            try {
                if (instance == null) {
                    instance = new BandwidthManager();
                }
                bandwidthManager = instance;
            } catch (Throwable th) {
                Class<BandwidthManager> cls = BandwidthManager.class;
                throw th;
            }
        }
        return bandwidthManager;
    }

    private VideoSize getMaximumVideoSize(boolean z) {
        return maximumVideoSize(this.currentProfile, z);
    }

    public static boolean isRoamSaveVideoEnable() {
        return Version.isVideoCapable() && ClientStateManager.isPostpaid(LinphoneActivity.instance());
    }

    private VideoSize maxSupportedVideoSize(boolean z, VideoSize videoSize, List<VideoSize> list) {
        Log.d("Searching for maximum video size for ", z ? "portrait" : "landscape", "capture from (", videoSize);
        VideoSize createStandard = VideoSize.createStandard(3, z);
        VideoSize videoSize2 = createStandard;
        for (VideoSize next : list) {
            int i = next.width;
            int i2 = next.height;
            if (next.isPortrait() != z) {
                i = next.height;
                i2 = next.width;
            }
            if (i <= videoSize.width && i2 <= videoSize.height && videoSize2.width < i && videoSize2.height < i2) {
                VideoSize videoSize3 = new VideoSize(i, i2);
                Log.d("A better video size has been found: ", videoSize3);
                videoSize2 = videoSize3;
            }
        }
        return videoSize2;
    }

    private VideoSize maximumVideoSize(int i, boolean z) {
        switch (i) {
            case 0:
                return VideoSize.createStandard(3, z);
            case 1:
                return VideoSize.createStandard(0, z);
            default:
                throw new RuntimeException("profile not managed : " + i);
        }
    }

    private void onProfileChanged(int i) {
        LinphoneCore linphoneCore = LinphoneService.instance().getLinphoneCore();
        linphoneCore.setUploadBandwidth(bandwidthes[i][0]);
        linphoneCore.setDownloadBandwidth(bandwidthes[i][1]);
        if (linphoneCore.isIncall()) {
            CallManager.getInstance().reinvite();
        } else {
            updateWithProfileSettings(linphoneCore, (LinphoneCallParams) null);
        }
    }

    public int getCurrentProfile() {
        return this.currentProfile;
    }

    public boolean isUserRestriction() {
        return this.userRestriction;
    }

    public boolean isVideoPossible() {
        return this.currentProfile != 2;
    }

    public void setUserRestriction(boolean z) {
        this.userRestriction = z;
        computeNewProfile();
    }

    public void updateWithProfileSettings(LinphoneCore linphoneCore, LinphoneCallParams linphoneCallParams) {
        boolean isVideoPossible = isVideoPossible();
        if (isVideoPossible && isRoamSaveVideoEnable()) {
            boolean isCameraOrientationPortrait = AndroidCameraRecordManager.getInstance().isCameraOrientationPortrait();
            VideoSize videoSize = new VideoSize(0, 0);
            linphoneCore.setPreferredVideoSize(VideoSize.createStandard(3, isCameraOrientationPortrait));
            if (!videoSize.equals(linphoneCore.getPreferredVideoSize())) {
                linphoneCore.setPreferredVideoSize(VideoSize.createStandard(3, videoSize.isPortrait()));
            }
        }
        if (linphoneCallParams == null) {
            return;
        }
        if (!isVideoPossible) {
            linphoneCallParams.setVideoEnabled(false);
            linphoneCallParams.setAudioBandwidth(40);
            return;
        }
        linphoneCallParams.setVideoEnabled(true);
        linphoneCallParams.setAudioBandwidth(0);
    }
}
