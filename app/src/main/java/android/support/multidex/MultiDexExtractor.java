package android.support.multidex;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.os.Build;
import android.util.Log;
import com.facebook.GraphResponse;
import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileFilter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

final class MultiDexExtractor {
    private static final int BUFFER_SIZE = 16384;
    private static final String DEX_PREFIX = "classes";
    private static final String DEX_SUFFIX = ".dex";
    private static final String EXTRACTED_NAME_EXT = ".classes";
    private static final String EXTRACTED_SUFFIX = ".zip";
    private static final String KEY_CRC = "crc";
    private static final String KEY_DEX_NUMBER = "dex.number";
    private static final String KEY_TIME_STAMP = "timestamp";
    private static final int MAX_EXTRACT_ATTEMPTS = 3;
    private static final long NO_VALUE = -1;
    private static final String PREFS_FILE = "multidex.version";
    private static final String TAG = "MultiDex";
    private static Method sApplyMethod;

    static {
        try {
            sApplyMethod = SharedPreferences.Editor.class.getMethod("apply", new Class[0]);
        } catch (NoSuchMethodException e) {
            sApplyMethod = null;
        }
    }

    MultiDexExtractor() {
    }

    private static void apply(SharedPreferences.Editor editor) {
        if (sApplyMethod != null) {
            try {
                sApplyMethod.invoke(editor, new Object[0]);
                return;
            } catch (IllegalAccessException | InvocationTargetException e) {
            }
        }
        editor.commit();
    }

    private static void closeQuietly(Closeable closeable) {
        try {
            closeable.close();
        } catch (IOException e) {
            Log.w(TAG, "Failed to close resource", e);
        }
    }

    private static void extract(ZipFile zipFile, ZipEntry zipEntry, File file, String str) throws IOException, FileNotFoundException {
        InputStream inputStream = zipFile.getInputStream(zipEntry);
        File createTempFile = File.createTempFile(str, EXTRACTED_SUFFIX, file.getParentFile());
        Log.i(TAG, "Extracting " + createTempFile.getPath());
        try {
            ZipOutputStream zipOutputStream = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(createTempFile)));
            try {
                ZipEntry zipEntry2 = new ZipEntry("classes.dex");
                zipEntry2.setTime(zipEntry.getTime());
                zipOutputStream.putNextEntry(zipEntry2);
                byte[] bArr = new byte[16384];
                for (int read = inputStream.read(bArr); read != -1; read = inputStream.read(bArr)) {
                    zipOutputStream.write(bArr, 0, read);
                }
                zipOutputStream.closeEntry();
                zipOutputStream.close();
                Log.i(TAG, "Renaming to " + file.getPath());
                if (!createTempFile.renameTo(file)) {
                    throw new IOException("Failed to rename \"" + createTempFile.getAbsolutePath() + "\" to \"" + file.getAbsolutePath() + "\"");
                }
                closeQuietly(inputStream);
                createTempFile.delete();
            } catch (Throwable th) {
                th = th;
                closeQuietly(inputStream);
                createTempFile.delete();
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            closeQuietly(inputStream);
            createTempFile.delete();
            throw th;
        }
    }

    private static SharedPreferences getMultiDexPreferences(Context context) {
        return context.getSharedPreferences(PREFS_FILE, Build.VERSION.SDK_INT < 11 ? 0 : 4);
    }

    private static long getTimeStamp(File file) {
        long lastModified = file.lastModified();
        return lastModified == -1 ? lastModified - 1 : lastModified;
    }

    private static long getZipCrc(File file) throws IOException {
        long zipCrc = ZipUtil.getZipCrc(file);
        return zipCrc == -1 ? zipCrc - 1 : zipCrc;
    }

    private static boolean isModified(Context context, File file, long j) {
        SharedPreferences multiDexPreferences = getMultiDexPreferences(context);
        return (multiDexPreferences.getLong(KEY_TIME_STAMP, -1) == getTimeStamp(file) && multiDexPreferences.getLong(KEY_CRC, -1) == j) ? false : true;
    }

    static List<File> load(Context context, ApplicationInfo applicationInfo, File file, boolean z) throws IOException {
        List<File> performExtractions;
        Log.i(TAG, "MultiDexExtractor.load(" + applicationInfo.sourceDir + ", " + z + ")");
        File file2 = new File(applicationInfo.sourceDir);
        long zipCrc = getZipCrc(file2);
        if (z || isModified(context, file2, zipCrc)) {
            Log.i(TAG, "Detected that extraction must be performed.");
            performExtractions = performExtractions(file2, file);
            putStoredApkInfo(context, getTimeStamp(file2), zipCrc, performExtractions.size() + 1);
        } else {
            try {
                performExtractions = loadExistingExtractions(context, file2, file);
            } catch (IOException e) {
                Log.w(TAG, "Failed to reload existing extracted secondary dex files, falling back to fresh extraction", e);
                performExtractions = performExtractions(file2, file);
                putStoredApkInfo(context, getTimeStamp(file2), zipCrc, performExtractions.size() + 1);
            }
        }
        Log.i(TAG, "load found " + performExtractions.size() + " secondary dex files");
        return performExtractions;
    }

    private static List<File> loadExistingExtractions(Context context, File file, File file2) throws IOException {
        Log.i(TAG, "loading existing secondary dex files");
        String str = file.getName() + EXTRACTED_NAME_EXT;
        int i = getMultiDexPreferences(context).getInt(KEY_DEX_NUMBER, 1);
        ArrayList arrayList = new ArrayList(i);
        int i2 = 2;
        while (i2 <= i) {
            File file3 = new File(file2, str + i2 + EXTRACTED_SUFFIX);
            if (file3.isFile()) {
                arrayList.add(file3);
                if (!verifyZipFile(file3)) {
                    Log.i(TAG, "Invalid zip file: " + file3);
                    throw new IOException("Invalid ZIP file.");
                }
                i2++;
            } else {
                throw new IOException("Missing extracted secondary dex file '" + file3.getPath() + "'");
            }
        }
        return arrayList;
    }

    private static void mkdirChecked(File file) throws IOException {
        file.mkdir();
        if (!file.isDirectory()) {
            File parentFile = file.getParentFile();
            if (parentFile == null) {
                Log.e(TAG, "Failed to create dir " + file.getPath() + ". Parent file is null.");
            } else {
                Log.e(TAG, "Failed to create dir " + file.getPath() + ". parent file is a dir " + parentFile.isDirectory() + ", a file " + parentFile.isFile() + ", exists " + parentFile.exists() + ", readable " + parentFile.canRead() + ", writable " + parentFile.canWrite());
            }
            throw new IOException("Failed to create cache directory " + file.getPath());
        }
    }

    private static List<File> performExtractions(File file, File file2) throws IOException {
        String str = file.getName() + EXTRACTED_NAME_EXT;
        prepareDexDir(file2, str);
        ArrayList arrayList = new ArrayList();
        ZipFile zipFile = new ZipFile(file);
        try {
            int i = 2;
            ZipEntry entry = zipFile.getEntry(DEX_PREFIX + 2 + DEX_SUFFIX);
            while (entry != null) {
                File file3 = new File(file2, str + i + EXTRACTED_SUFFIX);
                arrayList.add(file3);
                Log.i(TAG, "Extraction is needed for file " + file3);
                boolean z = false;
                int i2 = 0;
                while (i2 < 3 && !z) {
                    i2++;
                    extract(zipFile, entry, file3, str);
                    boolean verifyZipFile = verifyZipFile(file3);
                    Log.i(TAG, "Extraction " + (verifyZipFile ? GraphResponse.SUCCESS_KEY : "failed") + " - length " + file3.getAbsolutePath() + ": " + file3.length());
                    if (!verifyZipFile) {
                        file3.delete();
                        if (file3.exists()) {
                            Log.w(TAG, "Failed to delete corrupted secondary dex '" + file3.getPath() + "'");
                            z = verifyZipFile;
                        }
                    }
                    z = verifyZipFile;
                }
                if (!z) {
                    throw new IOException("Could not create zip file " + file3.getAbsolutePath() + " for secondary dex (" + i + ")");
                }
                int i3 = i + 1;
                i = i3;
                entry = zipFile.getEntry(DEX_PREFIX + i3 + DEX_SUFFIX);
            }
            try {
            } catch (IOException e) {
                Log.w(TAG, "Failed to close resource", e);
            }
            return arrayList;
        } finally {
            try {
                zipFile.close();
            } catch (IOException e2) {
                Log.w(TAG, "Failed to close resource", e2);
            }
        }
    }

    private static void prepareDexDir(File file, final String str) throws IOException {
        mkdirChecked(file.getParentFile());
        mkdirChecked(file);
        File[] listFiles = file.listFiles(new FileFilter() {
            public boolean accept(File file) {
                return !file.getName().startsWith(str);
            }
        });
        if (listFiles == null) {
            Log.w(TAG, "Failed to list secondary dex dir content (" + file.getPath() + ").");
            return;
        }
        for (File file2 : listFiles) {
            Log.i(TAG, "Trying to delete old file " + file2.getPath() + " of size " + file2.length());
            if (!file2.delete()) {
                Log.w(TAG, "Failed to delete old file " + file2.getPath());
            } else {
                Log.i(TAG, "Deleted old file " + file2.getPath());
            }
        }
    }

    private static void putStoredApkInfo(Context context, long j, long j2, int i) {
        SharedPreferences.Editor edit = getMultiDexPreferences(context).edit();
        edit.putLong(KEY_TIME_STAMP, j);
        edit.putLong(KEY_CRC, j2);
        edit.putInt(KEY_DEX_NUMBER, i);
        apply(edit);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x002a, code lost:
        android.util.Log.w(TAG, "File " + r4.getAbsolutePath() + " is not a valid zip file.", r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:7:?, code lost:
        android.util.Log.w(TAG, "Failed to close zip file: " + r4.getAbsolutePath());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0029, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:9:0x0029 A[ExcHandler: ZipException (r0v1 'e' java.util.zip.ZipException A[CUSTOM_DECLARE]), Splitter:B:0:0x0000] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    static boolean verifyZipFile(java.io.File r4) {
        /*
            java.util.zip.ZipFile r0 = new java.util.zip.ZipFile     // Catch:{ ZipException -> 0x0029, IOException -> 0x004d }
            r0.<init>(r4)     // Catch:{ ZipException -> 0x0029, IOException -> 0x004d }
            r0.close()     // Catch:{ IOException -> 0x000a, ZipException -> 0x0029 }
            r0 = 1
        L_0x0009:
            return r0
        L_0x000a:
            r0 = move-exception
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ ZipException -> 0x0029, IOException -> 0x004d }
            r0.<init>()     // Catch:{ ZipException -> 0x0029, IOException -> 0x004d }
            java.lang.String r1 = "MultiDex"
            java.lang.String r2 = "Failed to close zip file: "
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ ZipException -> 0x0029, IOException -> 0x004d }
            java.lang.String r2 = r4.getAbsolutePath()     // Catch:{ ZipException -> 0x0029, IOException -> 0x004d }
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ ZipException -> 0x0029, IOException -> 0x004d }
            java.lang.String r0 = r0.toString()     // Catch:{ ZipException -> 0x0029, IOException -> 0x004d }
            android.util.Log.w(r1, r0)     // Catch:{ ZipException -> 0x0029, IOException -> 0x004d }
        L_0x0027:
            r0 = 0
            goto L_0x0009
        L_0x0029:
            r0 = move-exception
            java.lang.String r1 = "MultiDex"
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r2.<init>()
            java.lang.String r3 = "File "
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r3 = r4.getAbsolutePath()
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r3 = " is not a valid zip file."
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r2 = r2.toString()
            android.util.Log.w(r1, r2, r0)
            goto L_0x0027
        L_0x004d:
            r0 = move-exception
            java.lang.String r1 = "MultiDex"
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r2.<init>()
            java.lang.String r3 = "Got an IOException trying to open zip file: "
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r3 = r4.getAbsolutePath()
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r2 = r2.toString()
            android.util.Log.w(r1, r2, r0)
            goto L_0x0027
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.multidex.MultiDexExtractor.verifyZipFile(java.io.File):boolean");
    }
}
