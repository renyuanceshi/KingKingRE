package com.pccw.android.common.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.support.v4.media.session.PlaybackStateCompat;
import android.support.v4.util.LruCache;
import android.text.TextUtils;
import android.util.Log;
import android.widget.ImageView;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.util.BitmapUtil;
import com.pccw.mobile.util.UserPhotoUtil;
import java.util.HashMap;

public class ImageLoader {
    private static final int TYPE_CALLLOG = 0;
    private static final int TYPE_MEDIA = 1;
    private static int max = 0;
    /* access modifiers changed from: private */
    public HashMap<String, Bitmap> defaultImageList = new HashMap<>();
    Bitmap group_default = null;
    private HashMap<ImageView, String> imageViewHashMap = new HashMap<>();
    Bitmap image_default = null;
    Bitmap individual_default = null;
    private Context mContext;
    private LruCache<String, Bitmap> mMemoryCache;
    boolean onPause = false;
    Bitmap video_default = null;

    class LoadCallLogProfilePicTask extends AsyncTask<String, Integer, Bitmap> {
        private PhotoToLoad mPhoto;

        public LoadCallLogProfilePicTask(String str, ImageView imageView, int i) {
            this.mPhoto = new PhotoToLoad(str, imageView, i);
        }

        /* access modifiers changed from: protected */
        public Bitmap doInBackground(String... strArr) {
            if (ImageLoader.this.imageViewReused(this.mPhoto)) {
                return null;
            }
            Bitmap access$100 = ImageLoader.this.getProfileBitmap(this.mPhoto.url, this.mPhoto.placeHolder);
            if (access$100 == null) {
                ImageLoader.this.defaultImageList.put(this.mPhoto.url, this.mPhoto.placeHolder == 2130837709 ? ImageLoader.this.group_default : ImageLoader.this.individual_default);
                return null;
            }
            ImageLoader.this.addBitmapToMemoryCache(this.mPhoto.url, access$100);
            return access$100;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Bitmap bitmap) {
            if (!ImageLoader.this.imageViewReused(this.mPhoto) && bitmap != null) {
                this.mPhoto.imageView.setImageBitmap(bitmap);
            }
        }
    }

    class LoadMediaThumbnailTask extends AsyncTask<String, Integer, Bitmap> {
        private PhotoToLoad mPhoto;

        public LoadMediaThumbnailTask(String str, ImageView imageView, int i) {
            this.mPhoto = new PhotoToLoad(str, imageView, i);
        }

        /* access modifiers changed from: protected */
        public Bitmap doInBackground(String... strArr) {
            Bitmap imageThumbnail;
            if (ImageLoader.this.imageViewReused(this.mPhoto)) {
                return null;
            }
            switch (this.mPhoto.placeHolder) {
                case R.drawable.ic_placeholder_image /*2130838603*/:
                    imageThumbnail = BitmapUtil.getImageThumbnail(this.mPhoto.url);
                    break;
                case R.drawable.ic_placeholder_video /*2130838604*/:
                    imageThumbnail = BitmapUtil.getVideoThumbnail(this.mPhoto.url);
                    break;
                default:
                    imageThumbnail = null;
                    break;
            }
            if (imageThumbnail == null) {
                return null;
            }
            ImageLoader.this.addBitmapToMemoryCache(this.mPhoto.url, imageThumbnail);
            return imageThumbnail;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Bitmap bitmap) {
            if (!ImageLoader.this.imageViewReused(this.mPhoto)) {
                if (bitmap != null) {
                    this.mPhoto.imageView.setImageBitmap(bitmap);
                } else {
                    this.mPhoto.imageView.setImageBitmap((Bitmap) null);
                }
            }
        }
    }

    public class PhotoToLoad {
        public ImageView imageView;
        public int placeHolder;
        public String url;

        public PhotoToLoad(String str, ImageView imageView2, int i) {
            this.url = str;
            this.imageView = imageView2;
            this.placeHolder = i;
        }
    }

    public ImageLoader(Context context) {
        this.mContext = context;
        init(context);
    }

    /* access modifiers changed from: private */
    public Bitmap getProfileBitmap(String str, int i) {
        if (i == 2130837709 || i == 2130837710) {
            return UserPhotoUtil.getIMContactPhotoWithPhotoUri(this.mContext, str);
        }
        if (i == -1) {
            return loadContactPhotoThumbnail(str);
        }
        return null;
    }

    /* access modifiers changed from: private */
    public boolean imageViewReused(PhotoToLoad photoToLoad) {
        String str = this.imageViewHashMap.get(photoToLoad.imageView);
        return str == null || !str.equals(photoToLoad.url);
    }

    private void init(Context context) {
        int maxMemory = ((int) (Runtime.getRuntime().maxMemory() / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID)) / 8;
        max = maxMemory;
        this.mMemoryCache = new LruCache<String, Bitmap>(maxMemory) {
            /* access modifiers changed from: protected */
            public int sizeOf(String str, Bitmap bitmap) {
                return (bitmap.getRowBytes() * bitmap.getHeight()) / 1024;
            }
        };
        this.group_default = BitmapFactory.decodeResource(context.getResources(), R.drawable.default_group_pic);
        this.individual_default = BitmapFactory.decodeResource(context.getResources(), R.drawable.default_profile_pic);
        this.video_default = BitmapFactory.decodeResource(context.getResources(), R.drawable.ic_placeholder_video);
        this.image_default = BitmapFactory.decodeResource(context.getResources(), R.drawable.ic_placeholder_image);
    }

    /* JADX WARNING: Removed duplicated region for block: B:35:0x0061 A[SYNTHETIC, Splitter:B:35:0x0061] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private android.graphics.Bitmap loadContactPhotoThumbnail(java.lang.String r5) {
        /*
            r4 = this;
            r1 = 0
            r0 = 11
            boolean r0 = org.linphone.mediastream.Version.sdkAboveOrEqual(r0)     // Catch:{ FileNotFoundException -> 0x004c, all -> 0x005e }
            if (r0 == 0) goto L_0x002d
            android.net.Uri r0 = android.net.Uri.parse(r5)     // Catch:{ FileNotFoundException -> 0x004c, all -> 0x005e }
        L_0x000d:
            android.content.Context r2 = r4.mContext     // Catch:{ FileNotFoundException -> 0x004c, all -> 0x005e }
            android.content.ContentResolver r2 = r2.getContentResolver()     // Catch:{ FileNotFoundException -> 0x004c, all -> 0x005e }
            java.io.InputStream r2 = r2.openInputStream(r0)     // Catch:{ FileNotFoundException -> 0x004c, all -> 0x005e }
            android.graphics.BitmapFactory$Options r0 = new android.graphics.BitmapFactory$Options     // Catch:{ FileNotFoundException -> 0x006d }
            r0.<init>()     // Catch:{ FileNotFoundException -> 0x006d }
            android.graphics.Bitmap$Config r3 = android.graphics.Bitmap.Config.RGB_565     // Catch:{ FileNotFoundException -> 0x006d }
            r0.inPreferredConfig = r3     // Catch:{ FileNotFoundException -> 0x006d }
            if (r2 == 0) goto L_0x003f
            r3 = 0
            android.graphics.Bitmap r0 = android.graphics.BitmapFactory.decodeStream(r2, r3, r0)     // Catch:{ FileNotFoundException -> 0x006d }
            if (r2 == 0) goto L_0x002c
            r2.close()     // Catch:{ IOException -> 0x003a }
        L_0x002c:
            return r0
        L_0x002d:
            android.net.Uri r0 = android.provider.ContactsContract.Contacts.CONTENT_URI     // Catch:{ FileNotFoundException -> 0x004c, all -> 0x005e }
            android.net.Uri r0 = android.net.Uri.withAppendedPath(r0, r5)     // Catch:{ FileNotFoundException -> 0x004c, all -> 0x005e }
            java.lang.String r2 = "photo"
            android.net.Uri r0 = android.net.Uri.withAppendedPath(r0, r2)     // Catch:{ FileNotFoundException -> 0x004c, all -> 0x005e }
            goto L_0x000d
        L_0x003a:
            r1 = move-exception
            r1.printStackTrace()
            goto L_0x002c
        L_0x003f:
            if (r2 == 0) goto L_0x006f
            r2.close()     // Catch:{ IOException -> 0x0046 }
            r0 = r1
            goto L_0x002c
        L_0x0046:
            r0 = move-exception
            r0.printStackTrace()
            r0 = r1
            goto L_0x002c
        L_0x004c:
            r0 = move-exception
            r2 = r1
        L_0x004e:
            r0.printStackTrace()     // Catch:{ all -> 0x006a }
            if (r2 == 0) goto L_0x006f
            r2.close()     // Catch:{ IOException -> 0x0058 }
            r0 = r1
            goto L_0x002c
        L_0x0058:
            r0 = move-exception
            r0.printStackTrace()
            r0 = r1
            goto L_0x002c
        L_0x005e:
            r0 = move-exception
        L_0x005f:
            if (r1 == 0) goto L_0x0064
            r1.close()     // Catch:{ IOException -> 0x0065 }
        L_0x0064:
            throw r0
        L_0x0065:
            r1 = move-exception
            r1.printStackTrace()
            goto L_0x0064
        L_0x006a:
            r0 = move-exception
            r1 = r2
            goto L_0x005f
        L_0x006d:
            r0 = move-exception
            goto L_0x004e
        L_0x006f:
            r0 = r1
            goto L_0x002c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.pccw.android.common.widget.ImageLoader.loadContactPhotoThumbnail(java.lang.String):android.graphics.Bitmap");
    }

    private void queuePhoto(String str, ImageView imageView, int i, int i2) {
        if (i2 == 0) {
            new LoadCallLogProfilePicTask(str, imageView, i).execute(new String[]{str});
            return;
        }
        new LoadMediaThumbnailTask(str, imageView, i).execute(new String[]{str});
    }

    public void addBitmapToMemoryCache(String str, Bitmap bitmap) {
        if (str != null && bitmap != null && getBitmapFromMemCache(str) == null) {
            this.mMemoryCache.put(str, bitmap);
        }
    }

    public void clearCache() {
        this.mMemoryCache.evictAll();
        synchronized (this.imageViewHashMap) {
            this.imageViewHashMap.clear();
        }
        synchronized (this.defaultImageList) {
            this.defaultImageList.clear();
        }
    }

    public Bitmap getBitmapFromMemCache(String str) {
        Log.i("Loader", "ImageLoader , from internal: " + this.mMemoryCache.size() + " /" + max);
        return this.mMemoryCache.get(str);
    }

    public void loadBitmap(String str, ImageView imageView, int i) {
        Bitmap bitmap;
        int i2 = R.drawable.default_group_pic;
        if (!TextUtils.isEmpty(str)) {
            this.imageViewHashMap.put(imageView, str);
            Bitmap bitmapFromMemCache = getBitmapFromMemCache(str);
            if (bitmapFromMemCache == null) {
                bitmapFromMemCache = this.defaultImageList.get(str);
            }
            if (bitmapFromMemCache != null) {
                imageView.setImageBitmap(bitmapFromMemCache);
            } else if (!this.onPause) {
                imageView.setImageResource(i == 2130837709 ? 2130837709 : 2130837710);
                switch (i) {
                    case -1:
                        bitmap = loadContactPhotoThumbnail(str);
                        break;
                    case R.drawable.default_group_pic /*2130837709*/:
                        queuePhoto(str, imageView, i, 0);
                        bitmap = bitmapFromMemCache;
                        break;
                    case R.drawable.default_profile_pic /*2130837710*/:
                        queuePhoto(str, imageView, i, 0);
                        bitmap = bitmapFromMemCache;
                        break;
                    default:
                        bitmap = bitmapFromMemCache;
                        break;
                }
                if (bitmap != null) {
                    imageView.setImageBitmap(bitmap);
                    addBitmapToMemoryCache(str, bitmap);
                    return;
                }
                this.defaultImageList.put(str, i == 2130837709 ? this.group_default : this.individual_default);
            }
        } else {
            if (i != 2130837709) {
                i2 = 2130837710;
            }
            imageView.setImageResource(i2);
        }
    }

    public void loadMediaImageBitmap(String str, ImageView imageView, int i) {
        if (str != null && !"".equals(str)) {
            this.imageViewHashMap.put(imageView, str);
            Bitmap bitmapFromMemCache = getBitmapFromMemCache(str);
            if (bitmapFromMemCache != null) {
                imageView.setImageBitmap(bitmapFromMemCache);
            } else if (!this.onPause) {
                queuePhoto(str, imageView, i, 1);
            }
        }
    }

    public void setPause(boolean z) {
        this.onPause = z;
    }
}
