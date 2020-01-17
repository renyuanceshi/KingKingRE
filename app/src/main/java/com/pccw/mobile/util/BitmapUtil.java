package com.pccw.mobile.util;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.media.ExifInterface;
import android.media.ThumbnailUtils;
import com.pccw.sms.bean.SMSConstants;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;

public class BitmapUtil {
    private static int calculateInSampleSize(BitmapFactory.Options options, int i, int i2) {
        int i3 = options.outHeight;
        int i4 = options.outWidth;
        int i5 = 1;
        while (true) {
            if ((i4 / i5) / 2 < i && (i3 / i5) / 2 < i) {
                return i5;
            }
            i5 *= 2;
        }
    }

    public static byte[] convertBitmap2Byte(Bitmap bitmap) {
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.flush();
            byteArrayOutputStream.close();
            return byteArray;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Bitmap generateVideoThumbnail(String str) {
        System.gc();
        Bitmap createVideoThumbnail = ThumbnailUtils.createVideoThumbnail(str, 1);
        if (createVideoThumbnail != null) {
            HashMap<String, Integer> thumbnailDependantDimension = SMSConstants.getThumbnailDependantDimension(createVideoThumbnail.getWidth(), createVideoThumbnail.getHeight());
            return ThumbnailUtils.extractThumbnail(createVideoThumbnail, thumbnailDependantDimension.get("width").intValue(), thumbnailDependantDimension.get("height").intValue(), 2);
        }
        Bitmap createVideoThumbnail2 = ThumbnailUtils.createVideoThumbnail(str.replace(SMSConstants.STORAGE_ROOT_BASE + "", ""), 3);
        if (createVideoThumbnail2 == null) {
            return null;
        }
        HashMap<String, Integer> thumbnailDependantDimension2 = SMSConstants.getThumbnailDependantDimension(createVideoThumbnail2.getWidth(), createVideoThumbnail2.getHeight());
        return ThumbnailUtils.extractThumbnail(createVideoThumbnail2, thumbnailDependantDimension2.get("width").intValue(), thumbnailDependantDimension2.get("height").intValue(), 2);
    }

    private static int getBitmapOrientation(String str) {
        try {
            return new ExifInterface(str).getAttributeInt("Orientation", 1);
        } catch (IOException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static Bitmap getExternalImageThumbnail(String str) {
        return ThumbnailUtils.extractThumbnail(getSampledBitmap(str, 200), 200, 200);
    }

    public static Bitmap getImageThumbnail(String str) {
        System.gc();
        Bitmap sampledBitmap = getSampledBitmap(str, SMSConstants.MEDIA_IMAGE_THUMBNAIL_DIMENSIONS);
        if (sampledBitmap != null) {
            HashMap<String, Integer> thumbnailDependantDimension = SMSConstants.getThumbnailDependantDimension(sampledBitmap.getWidth(), sampledBitmap.getHeight());
            return ThumbnailUtils.extractThumbnail(sampledBitmap, thumbnailDependantDimension.get("width").intValue(), thumbnailDependantDimension.get("height").intValue(), 2);
        }
        Bitmap sampledBitmap2 = getSampledBitmap(str.replace(SMSConstants.STORAGE_ROOT_BASE + "", ""), SMSConstants.MEDIA_IMAGE_THUMBNAIL_DIMENSIONS);
        if (sampledBitmap2 == null) {
            return null;
        }
        HashMap<String, Integer> thumbnailDependantDimension2 = SMSConstants.getThumbnailDependantDimension(sampledBitmap2.getWidth(), sampledBitmap2.getHeight());
        return ThumbnailUtils.extractThumbnail(sampledBitmap2, thumbnailDependantDimension2.get("width").intValue(), thumbnailDependantDimension2.get("height").intValue(), 2);
    }

    public static Bitmap getProfileImageThumbnail(Context context, String str) {
        Bitmap sampledBitmap = getSampledBitmap(SMSConstants.INTERNAL_PROFILE_IMAGE_FILE_DIR(context) + str, 96);
        if (sampledBitmap != null) {
            return ThumbnailUtils.extractThumbnail(sampledBitmap, 96, 96);
        }
        return null;
    }

    public static File getResizedProfileImageFile(Context context, String str) {
        Bitmap externalImageThumbnail = getExternalImageThumbnail(str);
        if (externalImageThumbnail == null) {
            return null;
        }
        File file = new File(context.getCacheDir(), "temp.png");
        try {
            file.createNewFile();
            byte[] convertBitmap2Byte = convertBitmap2Byte(externalImageThumbnail);
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            try {
                fileOutputStream.write(convertBitmap2Byte);
                fileOutputStream.flush();
                fileOutputStream.close();
                return file;
            } catch (IOException e) {
                e = e;
                e.printStackTrace();
                return file;
            }
        } catch (IOException e2) {
            e = e2;
            e.printStackTrace();
            return file;
        }
    }

    public static Bitmap getRotatedBitmap(Bitmap bitmap, int i) {
        int i2;
        if (bitmap == null) {
            return null;
        }
        switch (i) {
            case 3:
                i2 = 180;
                break;
            case 4:
            case 5:
            case 7:
                i2 = 0;
                break;
            case 6:
                i2 = 90;
                break;
            case 8:
                i2 = 270;
                break;
            default:
                i2 = 0;
                break;
        }
        Matrix matrix = new Matrix();
        matrix.postRotate((float) i2);
        return Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
    }

    public static Bitmap getSampledBitmap(String str, int i) {
        try {
            System.gc();
            File file = new File(str);
            if (!file.isFile()) {
                return null;
            }
            int bitmapOrientation = getBitmapOrientation(str);
            BitmapFactory.Options queryBitmap = queryBitmap(str);
            queryBitmap.inJustDecodeBounds = false;
            queryBitmap.inPreferredConfig = Bitmap.Config.RGB_565;
            queryBitmap.inSampleSize = calculateInSampleSize(queryBitmap, i, (queryBitmap.outHeight * i) / queryBitmap.outWidth);
            FileInputStream fileInputStream = new FileInputStream(file);
            Bitmap decodeStream = BitmapFactory.decodeStream(fileInputStream, (Rect) null, queryBitmap);
            if (fileInputStream != null) {
                fileInputStream.close();
            }
            return getRotatedBitmap(decodeStream, bitmapOrientation);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Bitmap getVideoThumbnail(String str) {
        System.gc();
        Bitmap sampledBitmap = getSampledBitmap(str, SMSConstants.MEDIA_IMAGE_THUMBNAIL_DIMENSIONS);
        if (sampledBitmap != null) {
            HashMap<String, Integer> thumbnailDependantDimension = SMSConstants.getThumbnailDependantDimension(sampledBitmap.getWidth(), sampledBitmap.getHeight());
            return ThumbnailUtils.extractThumbnail(sampledBitmap, thumbnailDependantDimension.get("width").intValue(), thumbnailDependantDimension.get("height").intValue(), 2);
        }
        Bitmap sampledBitmap2 = getSampledBitmap(str.replace(SMSConstants.STORAGE_ROOT_BASE + "", ""), SMSConstants.MEDIA_IMAGE_THUMBNAIL_DIMENSIONS);
        if (sampledBitmap2 == null) {
            return null;
        }
        HashMap<String, Integer> thumbnailDependantDimension2 = SMSConstants.getThumbnailDependantDimension(sampledBitmap2.getWidth(), sampledBitmap2.getHeight());
        return ThumbnailUtils.extractThumbnail(sampledBitmap2, thumbnailDependantDimension2.get("width").intValue(), thumbnailDependantDimension2.get("height").intValue(), 2);
    }

    public static boolean isImageSizeEnough(String str) {
        if (!new File(str).isFile()) {
            return true;
        }
        BitmapFactory.Options queryBitmap = queryBitmap(str);
        return queryBitmap.outHeight >= 96 && queryBitmap.outWidth >= 96;
    }

    public static BitmapFactory.Options queryBitmap(String str) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        try {
            FileInputStream fileInputStream = new FileInputStream(str);
            BitmapFactory.decodeStream(fileInputStream, (Rect) null, options);
            if (fileInputStream != null) {
                fileInputStream.close();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        return options;
    }
}
