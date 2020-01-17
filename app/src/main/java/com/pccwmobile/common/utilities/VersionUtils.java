package com.pccwmobile.common.utilities;

import android.content.Context;

public class VersionUtils {

    private static class Version {
        private int majorVersion = 0;
        private int minorVersion = 0;
        private int revision = 0;

        public Version(String str) {
            int indexOf = str.indexOf(".");
            if (indexOf >= 0) {
                try {
                    this.majorVersion = Integer.parseInt(str.substring(0, indexOf));
                } catch (Exception e) {
                }
                int indexOf2 = str.indexOf(".", indexOf + 1);
                if (indexOf2 >= 0) {
                    try {
                        this.minorVersion = Integer.parseInt(str.substring(indexOf + 1, indexOf2).trim());
                    } catch (Exception e2) {
                    }
                    try {
                        this.revision = Integer.parseInt(str.substring(indexOf2 + 1).trim());
                    } catch (Exception e3) {
                    }
                } else {
                    try {
                        this.minorVersion = Integer.parseInt(str.substring(indexOf + 1).trim());
                    } catch (Exception e4) {
                    }
                }
            } else {
                try {
                    this.majorVersion = Integer.parseInt(str.trim());
                } catch (Exception e5) {
                }
            }
        }

        public boolean isNewerMajorVersion(Version version) {
            return version.majorVersion > this.majorVersion;
        }

        public boolean isNewerMinorVersion(Version version) {
            return version.majorVersion == this.majorVersion && version.minorVersion > this.minorVersion;
        }

        public boolean isNewerRevision(Version version) {
            return version.majorVersion == this.majorVersion && version.minorVersion == version.minorVersion && version.revision > this.revision;
        }
    }

    public static String getClientVersionNum(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean isNewerMajorVersion(String str, String str2) {
        return new Version(str).isNewerMajorVersion(new Version(str2));
    }

    public static boolean isNewerMinorVersion(String str, String str2) {
        return new Version(str).isNewerMinorVersion(new Version(str2));
    }

    public static boolean isNewerRevision(String str, String str2) {
        return new Version(str).isNewerRevision(new Version(str2));
    }

    public static boolean isNewerVersion(String str, String str2) {
        return versionNumToNumeric(str2) > versionNumToNumeric(str);
    }

    private static int versionNumToNumeric(String str) {
        String replaceAll = str.replaceAll("\\.", "");
        if (replaceAll.length() == 3) {
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append(replaceAll);
            stringBuffer.append("0");
            stringBuffer.append("0");
            return Integer.parseInt(stringBuffer.toString());
        } else if (replaceAll.length() != 2) {
            return Integer.parseInt(replaceAll);
        } else {
            StringBuffer stringBuffer2 = new StringBuffer();
            stringBuffer2.append(replaceAll);
            stringBuffer2.append("0");
            return Integer.parseInt(stringBuffer2.toString());
        }
    }
}
