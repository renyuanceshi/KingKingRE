package org.linphone.core;

import org.linphone.core.LinphonePlayer;

public class LinphonePlayerImpl implements LinphonePlayer {
    private long nativePtr = 0;

    LinphonePlayerImpl(long j) {
        this.nativePtr = j;
        init(j);
    }

    private native void close(long j);

    private native void destroy(long j);

    private native int getCurrentPosition(long j);

    private native int getDuration(long j);

    private native int getState(long j);

    private native void init(long j);

    private native int open(long j, String str);

    private native int pause(long j);

    private native int seek(long j, int i);

    private native int start(long j);

    public void close() {
        synchronized (this) {
            close(this.nativePtr);
        }
    }

    /* access modifiers changed from: protected */
    public void finalize() {
        destroy(this.nativePtr);
    }

    public int getCurrentPosition() {
        int currentPosition;
        synchronized (this) {
            currentPosition = getCurrentPosition(this.nativePtr);
        }
        return currentPosition;
    }

    public int getDuration() {
        int duration;
        synchronized (this) {
            duration = getDuration(this.nativePtr);
        }
        return duration;
    }

    public LinphonePlayer.State getState() {
        LinphonePlayer.State fromValue;
        synchronized (this) {
            fromValue = LinphonePlayer.State.fromValue(getState(this.nativePtr));
        }
        return fromValue;
    }

    public int open(String str) {
        int open;
        synchronized (this) {
            open = open(this.nativePtr, str);
        }
        return open;
    }

    public int pause() {
        int pause;
        synchronized (this) {
            pause = pause(this.nativePtr);
        }
        return pause;
    }

    public int seek(int i) {
        int seek;
        synchronized (this) {
            seek = seek(this.nativePtr, i);
        }
        return seek;
    }

    public int start() {
        int start;
        synchronized (this) {
            start = start(this.nativePtr);
        }
        return start;
    }
}
