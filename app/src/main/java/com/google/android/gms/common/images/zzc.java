package com.google.android.gms.common.images;

import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.widget.ImageView;
import com.google.android.gms.common.internal.zzbe;
import com.google.android.gms.internal.zzbff;
import com.google.android.gms.internal.zzbfk;
import java.lang.ref.WeakReference;

public final class zzc extends zza {
    private WeakReference<ImageView> zzaGm;

    public zzc(ImageView imageView, int i) {
        super((Uri) null, i);
        com.google.android.gms.common.internal.zzc.zzr(imageView);
        this.zzaGm = new WeakReference<>(imageView);
    }

    public zzc(ImageView imageView, Uri uri) {
        super(uri, 0);
        com.google.android.gms.common.internal.zzc.zzr(imageView);
        this.zzaGm = new WeakReference<>(imageView);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zzc)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        ImageView imageView = (ImageView) this.zzaGm.get();
        ImageView imageView2 = (ImageView) ((zzc) obj).zzaGm.get();
        return (imageView2 == null || imageView == null || !zzbe.equal(imageView2, imageView)) ? false : true;
    }

    public final int hashCode() {
        return 0;
    }

    /* access modifiers changed from: protected */
    public final void zza(Drawable drawable, boolean z, boolean z2, boolean z3) {
        zzbff zzbff;
        Uri uri = null;
        ImageView imageView = (ImageView) this.zzaGm.get();
        if (imageView != null) {
            boolean z4 = !z2 && !z3;
            if (z4 && (imageView instanceof zzbfk)) {
                int zzqY = ((zzbfk) imageView).zzqY();
                if (this.zzaGh != 0 && zzqY == this.zzaGh) {
                    return;
                }
            }
            boolean zzc = zzc(z, z2);
            if (zzc) {
                Drawable drawable2 = imageView.getDrawable();
                if (drawable2 == null) {
                    drawable2 = null;
                } else if (drawable2 instanceof zzbff) {
                    drawable2 = ((zzbff) drawable2).zzqW();
                }
                zzbff = new zzbff(drawable2, drawable);
            } else {
                zzbff = drawable;
            }
            imageView.setImageDrawable(zzbff);
            if (imageView instanceof zzbfk) {
                zzbfk zzbfk = (zzbfk) imageView;
                if (z3) {
                    uri = this.zzaGf.uri;
                }
                zzbfk.zzo(uri);
                zzbfk.zzax(z4 ? this.zzaGh : 0);
            }
            if (zzc) {
                ((zzbff) zzbff).startTransition(250);
            }
        }
    }
}
