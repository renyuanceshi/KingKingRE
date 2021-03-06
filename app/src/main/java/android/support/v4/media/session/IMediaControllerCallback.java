package android.support.v4.media.session;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.session.MediaSessionCompat;
import android.text.TextUtils;
import java.util.List;

public interface IMediaControllerCallback extends IInterface {

    public static abstract class Stub extends Binder implements IMediaControllerCallback {
        private static final String DESCRIPTOR = "android.support.v4.media.session.IMediaControllerCallback";
        static final int TRANSACTION_onEvent = 1;
        static final int TRANSACTION_onExtrasChanged = 7;
        static final int TRANSACTION_onMetadataChanged = 4;
        static final int TRANSACTION_onPlaybackStateChanged = 3;
        static final int TRANSACTION_onQueueChanged = 5;
        static final int TRANSACTION_onQueueTitleChanged = 6;
        static final int TRANSACTION_onRepeatModeChanged = 9;
        static final int TRANSACTION_onSessionDestroyed = 2;
        static final int TRANSACTION_onShuffleModeChanged = 10;
        static final int TRANSACTION_onVolumeInfoChanged = 8;

        private static class Proxy implements IMediaControllerCallback {
            private IBinder mRemote;

            Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            public void onEvent(String str, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(1, obtain, (Parcel) null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onExtrasChanged(Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(7, obtain, (Parcel) null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onMetadataChanged(MediaMetadataCompat mediaMetadataCompat) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (mediaMetadataCompat != null) {
                        obtain.writeInt(1);
                        mediaMetadataCompat.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(4, obtain, (Parcel) null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onPlaybackStateChanged(PlaybackStateCompat playbackStateCompat) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (playbackStateCompat != null) {
                        obtain.writeInt(1);
                        playbackStateCompat.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(3, obtain, (Parcel) null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onQueueChanged(List<MediaSessionCompat.QueueItem> list) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeTypedList(list);
                    this.mRemote.transact(5, obtain, (Parcel) null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onQueueTitleChanged(CharSequence charSequence) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (charSequence != null) {
                        obtain.writeInt(1);
                        TextUtils.writeToParcel(charSequence, obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(6, obtain, (Parcel) null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onRepeatModeChanged(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeInt(i);
                    this.mRemote.transact(9, obtain, (Parcel) null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onSessionDestroyed() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(2, obtain, (Parcel) null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onShuffleModeChanged(boolean z) throws RemoteException {
                int i = 1;
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (!z) {
                        i = 0;
                    }
                    obtain.writeInt(i);
                    this.mRemote.transact(10, obtain, (Parcel) null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onVolumeInfoChanged(ParcelableVolumeInfo parcelableVolumeInfo) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (parcelableVolumeInfo != null) {
                        obtain.writeInt(1);
                        parcelableVolumeInfo.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(8, obtain, (Parcel) null, 1);
                } finally {
                    obtain.recycle();
                }
            }
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IMediaControllerCallback asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            return (queryLocalInterface == null || !(queryLocalInterface instanceof IMediaControllerCallback)) ? new Proxy(iBinder) : (IMediaControllerCallback) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v10, resolved type: android.support.v4.media.session.ParcelableVolumeInfo} */
        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v15, resolved type: android.os.Bundle} */
        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v29, resolved type: android.support.v4.media.MediaMetadataCompat} */
        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v34, resolved type: android.support.v4.media.session.PlaybackStateCompat} */
        /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v41, resolved type: android.os.Bundle} */
        /* JADX WARNING: type inference failed for: r0v0 */
        /* JADX WARNING: type inference failed for: r0v20, types: [java.lang.CharSequence] */
        /* JADX WARNING: type inference failed for: r0v49 */
        /* JADX WARNING: type inference failed for: r0v50 */
        /* JADX WARNING: type inference failed for: r0v51 */
        /* JADX WARNING: type inference failed for: r0v52 */
        /* JADX WARNING: type inference failed for: r0v53 */
        /* JADX WARNING: type inference failed for: r0v54 */
        /* JADX WARNING: Multi-variable type inference failed */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public boolean onTransact(int r5, android.os.Parcel r6, android.os.Parcel r7, int r8) throws android.os.RemoteException {
            /*
                r4 = this;
                r1 = 1
                r0 = 0
                switch(r5) {
                    case 1: goto L_0x0011;
                    case 2: goto L_0x002d;
                    case 3: goto L_0x0037;
                    case 4: goto L_0x004f;
                    case 5: goto L_0x0067;
                    case 6: goto L_0x0077;
                    case 7: goto L_0x0090;
                    case 8: goto L_0x00a9;
                    case 9: goto L_0x00c2;
                    case 10: goto L_0x00d1;
                    case 1598968902: goto L_0x000a;
                    default: goto L_0x0005;
                }
            L_0x0005:
                boolean r0 = super.onTransact(r5, r6, r7, r8)
            L_0x0009:
                return r0
            L_0x000a:
                java.lang.String r0 = "android.support.v4.media.session.IMediaControllerCallback"
                r7.writeString(r0)
                r0 = r1
                goto L_0x0009
            L_0x0011:
                java.lang.String r2 = "android.support.v4.media.session.IMediaControllerCallback"
                r6.enforceInterface(r2)
                java.lang.String r2 = r6.readString()
                int r3 = r6.readInt()
                if (r3 == 0) goto L_0x0028
                android.os.Parcelable$Creator r0 = android.os.Bundle.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r6)
                android.os.Bundle r0 = (android.os.Bundle) r0
            L_0x0028:
                r4.onEvent(r2, r0)
                r0 = r1
                goto L_0x0009
            L_0x002d:
                java.lang.String r0 = "android.support.v4.media.session.IMediaControllerCallback"
                r6.enforceInterface(r0)
                r4.onSessionDestroyed()
                r0 = r1
                goto L_0x0009
            L_0x0037:
                java.lang.String r2 = "android.support.v4.media.session.IMediaControllerCallback"
                r6.enforceInterface(r2)
                int r2 = r6.readInt()
                if (r2 == 0) goto L_0x004a
                android.os.Parcelable$Creator<android.support.v4.media.session.PlaybackStateCompat> r0 = android.support.v4.media.session.PlaybackStateCompat.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r6)
                android.support.v4.media.session.PlaybackStateCompat r0 = (android.support.v4.media.session.PlaybackStateCompat) r0
            L_0x004a:
                r4.onPlaybackStateChanged(r0)
                r0 = r1
                goto L_0x0009
            L_0x004f:
                java.lang.String r2 = "android.support.v4.media.session.IMediaControllerCallback"
                r6.enforceInterface(r2)
                int r2 = r6.readInt()
                if (r2 == 0) goto L_0x0062
                android.os.Parcelable$Creator<android.support.v4.media.MediaMetadataCompat> r0 = android.support.v4.media.MediaMetadataCompat.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r6)
                android.support.v4.media.MediaMetadataCompat r0 = (android.support.v4.media.MediaMetadataCompat) r0
            L_0x0062:
                r4.onMetadataChanged(r0)
                r0 = r1
                goto L_0x0009
            L_0x0067:
                java.lang.String r0 = "android.support.v4.media.session.IMediaControllerCallback"
                r6.enforceInterface(r0)
                android.os.Parcelable$Creator<android.support.v4.media.session.MediaSessionCompat$QueueItem> r0 = android.support.v4.media.session.MediaSessionCompat.QueueItem.CREATOR
                java.util.ArrayList r0 = r6.createTypedArrayList(r0)
                r4.onQueueChanged(r0)
                r0 = r1
                goto L_0x0009
            L_0x0077:
                java.lang.String r2 = "android.support.v4.media.session.IMediaControllerCallback"
                r6.enforceInterface(r2)
                int r2 = r6.readInt()
                if (r2 == 0) goto L_0x008a
                android.os.Parcelable$Creator r0 = android.text.TextUtils.CHAR_SEQUENCE_CREATOR
                java.lang.Object r0 = r0.createFromParcel(r6)
                java.lang.CharSequence r0 = (java.lang.CharSequence) r0
            L_0x008a:
                r4.onQueueTitleChanged(r0)
                r0 = r1
                goto L_0x0009
            L_0x0090:
                java.lang.String r2 = "android.support.v4.media.session.IMediaControllerCallback"
                r6.enforceInterface(r2)
                int r2 = r6.readInt()
                if (r2 == 0) goto L_0x00a3
                android.os.Parcelable$Creator r0 = android.os.Bundle.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r6)
                android.os.Bundle r0 = (android.os.Bundle) r0
            L_0x00a3:
                r4.onExtrasChanged(r0)
                r0 = r1
                goto L_0x0009
            L_0x00a9:
                java.lang.String r2 = "android.support.v4.media.session.IMediaControllerCallback"
                r6.enforceInterface(r2)
                int r2 = r6.readInt()
                if (r2 == 0) goto L_0x00bc
                android.os.Parcelable$Creator<android.support.v4.media.session.ParcelableVolumeInfo> r0 = android.support.v4.media.session.ParcelableVolumeInfo.CREATOR
                java.lang.Object r0 = r0.createFromParcel(r6)
                android.support.v4.media.session.ParcelableVolumeInfo r0 = (android.support.v4.media.session.ParcelableVolumeInfo) r0
            L_0x00bc:
                r4.onVolumeInfoChanged(r0)
                r0 = r1
                goto L_0x0009
            L_0x00c2:
                java.lang.String r0 = "android.support.v4.media.session.IMediaControllerCallback"
                r6.enforceInterface(r0)
                int r0 = r6.readInt()
                r4.onRepeatModeChanged(r0)
                r0 = r1
                goto L_0x0009
            L_0x00d1:
                java.lang.String r0 = "android.support.v4.media.session.IMediaControllerCallback"
                r6.enforceInterface(r0)
                int r0 = r6.readInt()
                if (r0 == 0) goto L_0x00e3
                r0 = r1
            L_0x00dd:
                r4.onShuffleModeChanged(r0)
                r0 = r1
                goto L_0x0009
            L_0x00e3:
                r0 = 0
                goto L_0x00dd
            */
            throw new UnsupportedOperationException("Method not decompiled: android.support.v4.media.session.IMediaControllerCallback.Stub.onTransact(int, android.os.Parcel, android.os.Parcel, int):boolean");
        }
    }

    void onEvent(String str, Bundle bundle) throws RemoteException;

    void onExtrasChanged(Bundle bundle) throws RemoteException;

    void onMetadataChanged(MediaMetadataCompat mediaMetadataCompat) throws RemoteException;

    void onPlaybackStateChanged(PlaybackStateCompat playbackStateCompat) throws RemoteException;

    void onQueueChanged(List<MediaSessionCompat.QueueItem> list) throws RemoteException;

    void onQueueTitleChanged(CharSequence charSequence) throws RemoteException;

    void onRepeatModeChanged(int i) throws RemoteException;

    void onSessionDestroyed() throws RemoteException;

    void onShuffleModeChanged(boolean z) throws RemoteException;

    void onVolumeInfoChanged(ParcelableVolumeInfo parcelableVolumeInfo) throws RemoteException;
}
