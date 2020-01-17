package org.linphone.core;

import org.linphone.core.LinphoneCallStats;

class LinphoneCallStatsImpl implements LinphoneCallStats {
    private float downloadBandwidth;
    private float estimatedDownloadBandwidth;
    private int iceState;
    private float jitterBufferSize;
    private long latePacketsCumulativeNumber;
    private float localLateRate;
    private float localLossRate;
    private int mediaType;
    private long nativePtr;
    private float receiverInterarrivalJitter;
    private float receiverLossRate;
    private float roundTripDelay;
    private float senderInterarrivalJitter;
    private float senderLossRate;
    private float uploadBandwidth;

    protected LinphoneCallStatsImpl(long j) {
        this.nativePtr = j;
        this.mediaType = getMediaType(j);
        this.iceState = getIceState(j);
        this.downloadBandwidth = getDownloadBandwidth(j);
        this.uploadBandwidth = getUploadBandwidth(j);
        this.estimatedDownloadBandwidth = getEstimatedDownloadBandwidth(j);
        this.senderLossRate = getSenderLossRate(j);
        this.receiverLossRate = getReceiverLossRate(j);
        this.senderInterarrivalJitter = getSenderInterarrivalJitter(j);
        this.receiverInterarrivalJitter = getReceiverInterarrivalJitter(j);
        this.roundTripDelay = getRoundTripDelay(j);
        this.latePacketsCumulativeNumber = getLatePacketsCumulativeNumber(j);
        this.jitterBufferSize = getJitterBufferSize(j);
    }

    private native float getDownloadBandwidth(long j);

    private native float getEstimatedDownloadBandwidth(long j);

    private native int getIceState(long j);

    private native int getIpFamilyOfRemote(long j);

    private native float getJitterBufferSize(long j);

    private native long getLatePacketsCumulativeNumber(long j);

    private native float getLocalLateRate(long j);

    private native float getLocalLossRate(long j);

    private native int getMediaType(long j);

    private native float getReceiverInterarrivalJitter(long j);

    private native float getReceiverLossRate(long j);

    private native float getRoundTripDelay(long j);

    private native float getSenderInterarrivalJitter(long j);

    private native float getSenderLossRate(long j);

    private native float getUploadBandwidth(long j);

    private native void updateStats(long j, int i);

    public float getDownloadBandwidth() {
        return this.downloadBandwidth;
    }

    public float getEstimatedDownloadBandwidth() {
        return this.estimatedDownloadBandwidth;
    }

    public LinphoneCallStats.IceState getIceState() {
        return LinphoneCallStats.IceState.fromInt(this.iceState);
    }

    public int getIpFamilyOfRemote() {
        return getIpFamilyOfRemote(this.nativePtr);
    }

    public float getJitterBufferSize() {
        return this.jitterBufferSize;
    }

    public long getLatePacketsCumulativeNumber() {
        return this.latePacketsCumulativeNumber;
    }

    public float getLocalLateRate() {
        return this.localLateRate;
    }

    public float getLocalLossRate() {
        return this.localLossRate;
    }

    public LinphoneCallStats.MediaType getMediaType() {
        return LinphoneCallStats.MediaType.fromInt(this.mediaType);
    }

    public float getReceiverInterarrivalJitter() {
        return this.receiverInterarrivalJitter;
    }

    public float getReceiverLossRate() {
        return this.receiverLossRate;
    }

    public float getRoundTripDelay() {
        return this.roundTripDelay;
    }

    public float getSenderInterarrivalJitter() {
        return this.senderInterarrivalJitter;
    }

    public float getSenderLossRate() {
        return this.senderLossRate;
    }

    public float getUploadBandwidth() {
        return this.uploadBandwidth;
    }
}
