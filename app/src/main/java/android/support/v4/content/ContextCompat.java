package android.support.v4.content;

import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Process;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.os.BuildCompat;
import android.util.Log;
import android.util.TypedValue;
import java.io.File;

public class ContextCompat {
    private static final String DIR_ANDROID = "Android";
    private static final String DIR_OBB = "obb";
    private static final String TAG = "ContextCompat";
    private static final Object sLock = new Object();
    private static TypedValue sTempValue;

    protected ContextCompat() {
    }

    private static File buildPath(File file, String... strArr) {
        int length = strArr.length;
        int i = 0;
        File file2 = file;
        while (i < length) {
            String str = strArr[i];
            i++;
            file2 = file2 == null ? new File(str) : str != null ? new File(file2, str) : file2;
        }
        return file2;
    }

    public static int checkSelfPermission(@NonNull Context context, @NonNull String str) {
        if (str != null) {
            return context.checkPermission(str, Process.myPid(), Process.myUid());
        }
        throw new IllegalArgumentException("permission is null");
    }

    public static Context createDeviceProtectedStorageContext(Context context) {
        if (BuildCompat.isAtLeastN()) {
            return ContextCompatApi24.createDeviceProtectedStorageContext(context);
        }
        return null;
    }

    private static File createFilesDir(File file) {
        synchronized (ContextCompat.class) {
            try {
                if (!file.exists() && !file.mkdirs() && !file.exists()) {
                    Log.w(TAG, "Unable to create files subdir " + file.getPath());
                    file = null;
                }
            } catch (Throwable th) {
                Class<ContextCompat> cls = ContextCompat.class;
                throw th;
            }
        }
        return file;
    }

    public static File getCodeCacheDir(Context context) {
        return Build.VERSION.SDK_INT >= 21 ? ContextCompatApi21.getCodeCacheDir(context) : createFilesDir(new File(context.getApplicationInfo().dataDir, "code_cache"));
    }

    @ColorInt
    public static final int getColor(Context context, @ColorRes int i) {
        return Build.VERSION.SDK_INT >= 23 ? ContextCompatApi23.getColor(context, i) : context.getResources().getColor(i);
    }

    public static final ColorStateList getColorStateList(Context context, @ColorRes int i) {
        return Build.VERSION.SDK_INT >= 23 ? ContextCompatApi23.getColorStateList(context, i) : context.getResources().getColorStateList(i);
    }

    public static File getDataDir(Context context) {
        if (BuildCompat.isAtLeastN()) {
            return ContextCompatApi24.getDataDir(context);
        }
        String str = context.getApplicationInfo().dataDir;
        if (str != null) {
            return new File(str);
        }
        return null;
    }

    public static final Drawable getDrawable(Context context, @DrawableRes int i) {
        int i2;
        int i3 = Build.VERSION.SDK_INT;
        if (i3 >= 21) {
            return ContextCompatApi21.getDrawable(context, i);
        }
        if (i3 >= 16) {
            return context.getResources().getDrawable(i);
        }
        synchronized (sLock) {
            if (sTempValue == null) {
                sTempValue = new TypedValue();
            }
            context.getResources().getValue(i, sTempValue, true);
            i2 = sTempValue.resourceId;
        }
        return context.getResources().getDrawable(i2);
    }

    public static File[] getExternalCacheDirs(Context context) {
        if (Build.VERSION.SDK_INT >= 19) {
            return ContextCompatKitKat.getExternalCacheDirs(context);
        }
        return new File[]{context.getExternalCacheDir()};
    }

    public static File[] getExternalFilesDirs(Context context, String str) {
        if (Build.VERSION.SDK_INT >= 19) {
            return ContextCompatKitKat.getExternalFilesDirs(context, str);
        }
        return new File[]{context.getExternalFilesDir(str)};
    }

    public static final File getNoBackupFilesDir(Context context) {
        return Build.VERSION.SDK_INT >= 21 ? ContextCompatApi21.getNoBackupFilesDir(context) : createFilesDir(new File(context.getApplicationInfo().dataDir, "no_backup"));
    }

    public static File[] getObbDirs(Context context) {
        File buildPath;
        int i = Build.VERSION.SDK_INT;
        if (i >= 19) {
            return ContextCompatKitKat.getObbDirs(context);
        }
        if (i >= 11) {
            buildPath = ContextCompatHoneycomb.getObbDir(context);
        } else {
            buildPath = buildPath(Environment.getExternalStorageDirectory(), DIR_ANDROID, DIR_OBB, context.getPackageName());
        }
        return new File[]{buildPath};
    }

    public static boolean isDeviceProtectedStorage(Context context) {
        if (BuildCompat.isAtLeastN()) {
            return ContextCompatApi24.isDeviceProtectedStorage(context);
        }
        return false;
    }

    public static boolean startActivities(Context context, Intent[] intentArr) {
        return startActivities(context, intentArr, (Bundle) null);
    }

    public static boolean startActivities(Context context, Intent[] intentArr, Bundle bundle) {
        int i = Build.VERSION.SDK_INT;
        if (i >= 16) {
            ContextCompatJellybean.startActivities(context, intentArr, bundle);
            return true;
        } else if (i < 11) {
            return false;
        } else {
            ContextCompatHoneycomb.startActivities(context, intentArr);
            return true;
        }
    }

    public static void startActivity(Context context, Intent intent, @Nullable Bundle bundle) {
        if (Build.VERSION.SDK_INT >= 16) {
            ContextCompatJellybean.startActivity(context, intent, bundle);
        } else {
            context.startActivity(intent);
        }
    }
}
