package android.support.v4.os;

import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;

public final class ParcelableCompat {

    static class CompatCreator<T> implements Parcelable.Creator<T> {
        final ParcelableCompatCreatorCallbacks<T> mCallbacks;

        public CompatCreator(ParcelableCompatCreatorCallbacks<T> parcelableCompatCreatorCallbacks) {
            this.mCallbacks = parcelableCompatCreatorCallbacks;
        }

        public T createFromParcel(Parcel parcel) {
            return this.mCallbacks.createFromParcel(parcel, (ClassLoader) null);
        }

        public T[] newArray(int i) {
            return this.mCallbacks.newArray(i);
        }
    }

    private ParcelableCompat() {
    }

    public static <T> Parcelable.Creator<T> newCreator(ParcelableCompatCreatorCallbacks<T> parcelableCompatCreatorCallbacks) {
        return Build.VERSION.SDK_INT >= 13 ? ParcelableCompatCreatorHoneycombMR2Stub.instantiate(parcelableCompatCreatorCallbacks) : new CompatCreator(parcelableCompatCreatorCallbacks);
    }
}
