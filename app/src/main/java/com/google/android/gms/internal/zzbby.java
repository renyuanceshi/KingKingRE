package com.google.android.gms.internal;

import android.support.annotation.NonNull;
import android.support.v4.app.FragmentActivity;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.concurrent.TimeUnit;

public class zzbby extends GoogleApiClient {
    private final UnsupportedOperationException zzaCY;

    public zzbby(String str) {
        this.zzaCY = new UnsupportedOperationException(str);
    }

    public ConnectionResult blockingConnect() {
        throw this.zzaCY;
    }

    public ConnectionResult blockingConnect(long j, @NonNull TimeUnit timeUnit) {
        throw this.zzaCY;
    }

    public PendingResult<Status> clearDefaultAccountAndReconnect() {
        throw this.zzaCY;
    }

    public void connect() {
        throw this.zzaCY;
    }

    public void disconnect() {
        throw this.zzaCY;
    }

    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        throw this.zzaCY;
    }

    @NonNull
    public ConnectionResult getConnectionResult(@NonNull Api<?> api) {
        throw this.zzaCY;
    }

    public boolean hasConnectedApi(@NonNull Api<?> api) {
        throw this.zzaCY;
    }

    public boolean isConnected() {
        throw this.zzaCY;
    }

    public boolean isConnecting() {
        throw this.zzaCY;
    }

    public boolean isConnectionCallbacksRegistered(@NonNull GoogleApiClient.ConnectionCallbacks connectionCallbacks) {
        throw this.zzaCY;
    }

    public boolean isConnectionFailedListenerRegistered(@NonNull GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        throw this.zzaCY;
    }

    public void reconnect() {
        throw this.zzaCY;
    }

    public void registerConnectionCallbacks(@NonNull GoogleApiClient.ConnectionCallbacks connectionCallbacks) {
        throw this.zzaCY;
    }

    public void registerConnectionFailedListener(@NonNull GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        throw this.zzaCY;
    }

    public void stopAutoManage(@NonNull FragmentActivity fragmentActivity) {
        throw this.zzaCY;
    }

    public void unregisterConnectionCallbacks(@NonNull GoogleApiClient.ConnectionCallbacks connectionCallbacks) {
        throw this.zzaCY;
    }

    public void unregisterConnectionFailedListener(@NonNull GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        throw this.zzaCY;
    }
}
