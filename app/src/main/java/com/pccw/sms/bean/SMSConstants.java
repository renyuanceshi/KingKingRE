package com.pccw.sms.bean;

import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.ColorFilter;
import android.graphics.ColorMatrixColorFilter;
import android.os.Environment;
import android.text.TextUtils;
import com.facebook.places.model.PlaceFields;
import com.pccw.mobile.sip.ContactFragment;
import com.pccw.sms.service.PhoneListService;
import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class SMSConstants {
    public static final boolean ALLOW_LONG_CLICK_ON_MESSAGE = true;
    public static final boolean AUTO_SPLIT_LONG_MESSAGE = false;
    public static final int CALLLOG_LASTMESSAGE_DISPLAY_LENGTH = 30;
    public static int CALL_LOG_DELETE_CHAT = 0;
    public static final int CHATSTATUS_STOP_TYPING = 1;
    public static final int CHATSTATUS_TYPING = 0;
    public static final int CHAT_OUTGOING_MESSAGE_LENGTH = 1000;
    public static final String CHAT_TYPE_GROUP = "group";
    public static final String CHAT_TYPE_INDIVIDUAL = "individual";
    public static String COLOR_BLACK = "BLACK";
    public static String COLOR_WHITE = "WHITE";
    public static final String EXTRA_LOCAL_ONLY = "android.intent.extra.LOCAL_ONLY";
    public static int GROUP_CHAT_DELETE_PARTICIPANT_INDEX = 2;
    public static int GROUP_CHAT_MESSAGE_PARTICIPANT_INDEX = 1;
    public static int GROUP_CHAT_VIEW_PARTICIPANT_INFO_INDEX = 0;
    public static final String GROUP_PROFILE_PIC_FILE_TYPE = "image/png";
    public static final String GROUP_TYPE_OWNER = "Node owners";
    public static final String GROUP_TYPE_PUBLISHER = "Node publishers";
    public static final int LONG_PRESS_TIME = 1000;
    public static final int MEDIA_AUDIO_MAX_MB_SIZE = 10;
    public static final int MEDIA_IMAGE_MAX_MB_SIZE = 20;
    public static final int MEDIA_IMAGE_THUMBNAIL_DIMENSIONS = getThumbnailWidth();
    public static final int MEDIA_VIDEO_MAX_MB_SIZE = 100;
    public static final int MESSAGE_IN = 0;
    public static String MESSAGE_LABEL_MISSING_CALL = "Missed Call";
    public static final int MESSAGE_OUT = 1;
    public static String MESSAGE_STATUS_DELIVERED = "delivered";
    public static String MESSAGE_STATUS_FAILED = "failed";
    public static String MESSAGE_STATUS_FAILED_RESEND = "failedR";
    public static String MESSAGE_STATUS_LOCAL = "local";
    public static String MESSAGE_STATUS_SENDING = "sending";
    public static String MESSAGE_STATUS_SENT = "sent";
    public static final int MESSAGE_SYSTEM = 2;
    public static String MESSAGE_SYSTEM_SEPARATOR = ":";
    public static String MESSAGE_TYPE_INCOMING_CALL = "incoming_call";
    public static String MESSAGE_TYPE_LOCATION = PlaceFields.LOCATION;
    public static String MESSAGE_TYPE_MISSING_CALL = "missing_call";
    public static String MESSAGE_TYPE_OTHERS_CALL = "others_call";
    public static String MESSAGE_TYPE_OUTGOING_CALL = "outgoing_call";
    public static String MESSAGE_TYPE_SYSTEM_ADD = "system_group_add";
    public static String MESSAGE_TYPE_SYSTEM_DELETE = "system_group_remove";
    public static String MESSAGE_TYPE_TEXT = "text";
    public static String MESSAGE_TYPE_VCARD = "vcard";
    public static final int PROFILE_NAME_LENGTH = 30;
    public static final int PROFILE_PIC_DIMENSIONS = 200;
    public static final int PROFILE_PIC_THUMBNAIL_DIMENSIONS = 96;
    public static final int PROFILE_STATUS_LENGTH = 150;
    public static final String RECORD_AUDIO_FILE_EXTENSION = ".3gp";
    public static final int RECORD_STATE_CANCELLED = 4;
    public static final int RECORD_STATE_CANCELLING = 3;
    public static final int RECORD_STATE_IDLE = 0;
    public static final int RECORD_STATE_PREPARE = 7;
    public static final int RECORD_STATE_PREPARE_CANCEL = 8;
    public static final int RECORD_STATE_RECORDING = 2;
    public static final int RECORD_STATE_START_RECORD = 1;
    public static final int RECORD_STATE_SUCCESS = 6;
    public static final int RECORD_STATE_TOO_SHORT = 5;
    public static int RESULT_LOAD_IMAGE = 1;
    public static int RESULT_LOAD_VIDEO = 2;
    public static final String SENDER_ID = "735459362065";
    public static final String STORAGE_AUDIO_SENT_FOLDER = "Sent/";
    public static final String STORAGE_MEDIA_AUDIO_FOLDER = "Audio/";
    public static final String STORAGE_MEDIA_FOLDER = "Media/";
    public static final String STORAGE_MEDIA_IMAGE_FOLDER = "Image/";
    public static final String STORAGE_MEDIA_VIDEO_FOLDER = "Video/";
    public static final String STORAGE_PROFILE_FOLDER = "Profile/";
    public static final File STORAGE_ROOT_BASE = Environment.getExternalStorageDirectory();
    public static final String STORAGE_ROOT_FOLDER = "/KingKing/";
    public static final String[] SUPPORTED_AUDIO_FILE_TYPE = {"audio/mp4", "audio/mpeg", "audio/x-ms-wma", "audio/x-wav", "audio/ogg", "application/ogg", "audio/amr", "audio/3gpp"};
    public static final String[] SUPPORTED_IMAGE_FILE_TYPE = {"image/jpeg", GROUP_PROFILE_PIC_FILE_TYPE, "image/gif", "image/bmp"};
    public static final String[] SUPPORTED_VIDEO_FILE_TYPE = {"video/mp4", "video/m4v", "video/3gpp"};
    public static final long asyncTaskDownloadTimeLimit = 600000;
    public static final long asyncTaskUploadTimeLimit = 1200000;
    public static ColorFilter cf_black = new ColorMatrixColorFilter(transform_black);
    public static ColorFilter cf_white = new ColorMatrixColorFilter(transform_white);
    public static final Map<String, ColorFilter> colorFilterMap;
    public static String domainName = "imxmpp.pccw-hkt.com";
    public static final String downloadTask_fileType_originalphoto = "photo";
    public static final String downloadTask_fileType_thumbnail = "thumbnail";
    public static String groupDomainName = "pubsub.imxmpp.pccw-hkt.com";
    public static final String groupProfilePic_thumbnail_suffix = "_group_profile.png";
    public static String hostIP = "imxmpp.pccw-hkt.com";
    public static String kkimResource = "KingKingIM";
    public static String loginPref = "LOGIN_PREF";
    public static String mainPref = "MAIN_PREF";
    public static String mainPref_isFirstLauch = "IS_FIRST_LAUCH";
    public static final String myProfilePic_thumbnail_file = "myProfilePic_thumbnail.png";
    public static final int pageSize = 20;
    public static int port = 80;
    public static final String thumbnailExtension = ".png";
    public static final String thumbnailSuffix = "tn";
    public static float[] transform_black = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f};
    public static float[] transform_white = {1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f};
    public static final String userProfilePic_thumbnail_suffix = "_profile.png";

    static {
        HashMap hashMap = new HashMap();
        hashMap.put(COLOR_WHITE, cf_white);
        hashMap.put(COLOR_BLACK, cf_black);
        colorFilterMap = Collections.unmodifiableMap(hashMap);
    }

    public static final String DOWNLOADED_IMAGE_FILEPATH(String str) {
        String str2 = STORAGE_ROOT_BASE + STORAGE_ROOT_FOLDER + STORAGE_MEDIA_FOLDER + STORAGE_MEDIA_IMAGE_FOLDER;
        IS_DIRECTORY_EXIST(str2);
        return str2 + str;
    }

    public static final String DOWNLOADED_IMAGE_THUMBNAIL_FILEPATH(Context context, String str, boolean z) {
        return INTERNAL_IMAGE_THUMBNAIL_FILE_DIR(context, z) + str;
    }

    public static final String DOWNLOADED_VIDEO_FILEPATH(String str) {
        String str2 = STORAGE_ROOT_BASE + STORAGE_ROOT_FOLDER + STORAGE_MEDIA_FOLDER + STORAGE_MEDIA_VIDEO_FOLDER;
        IS_DIRECTORY_EXIST(str2);
        return str2 + str;
    }

    public static final String DOWNLOADED_VIDEO_THUMBNAIL_FILEPATH(Context context, String str, boolean z) {
        return INTERNAL_VIDEO_THUMBNAIL_FILE_DIR(context, z) + str;
    }

    public static final String EXTRACTED_DB_FILEPATH() {
        String str = STORAGE_ROOT_BASE + STORAGE_ROOT_FOLDER;
        IS_DIRECTORY_EXIST(str);
        return str;
    }

    public static final String GROUP_PROFILE_IMAGE_FILE_NAME(String str) {
        return str + groupProfilePic_thumbnail_suffix;
    }

    public static final String INTERNAL_FILES_DIR(Context context) {
        return context.getFilesDir().toString();
    }

    public static final String INTERNAL_IMAGE_THUMBNAIL_FILE_DIR(Context context, boolean z) {
        String str = INTERNAL_FILES_DIR(context) + STORAGE_ROOT_FOLDER + STORAGE_MEDIA_FOLDER + STORAGE_MEDIA_IMAGE_FOLDER;
        if (!z) {
            str = str + STORAGE_AUDIO_SENT_FOLDER;
        }
        IS_DIRECTORY_EXIST(str);
        return str;
    }

    public static final String INTERNAL_PROFILE_IMAGE_FILE_DIR(Context context) {
        String str = INTERNAL_FILES_DIR(context) + STORAGE_ROOT_FOLDER + STORAGE_PROFILE_FOLDER;
        IS_DIRECTORY_EXIST(str);
        return str;
    }

    public static final String INTERNAL_VIDEO_THUMBNAIL_FILE_DIR(Context context, boolean z) {
        String str = INTERNAL_FILES_DIR(context) + STORAGE_ROOT_FOLDER + STORAGE_MEDIA_FOLDER + STORAGE_MEDIA_VIDEO_FOLDER;
        if (!z) {
            str = str + STORAGE_AUDIO_SENT_FOLDER;
        }
        IS_DIRECTORY_EXIST(str);
        return str;
    }

    public static final boolean IS_AUDIO_MESSAGE(String str) {
        for (String equals : SUPPORTED_AUDIO_FILE_TYPE) {
            if (equals.equals(str)) {
                return true;
            }
        }
        return false;
    }

    public static final void IS_DIRECTORY_EXIST(String str) {
        File file = new File(str);
        if (!file.exists()) {
            file.mkdirs();
        }
    }

    public static final boolean IS_IMAGE_MESSAGE(String str) {
        for (String equals : SUPPORTED_IMAGE_FILE_TYPE) {
            if (equals.equals(str)) {
                return true;
            }
        }
        return false;
    }

    public static final boolean IS_VIDEO_MESSAGE(String str) {
        for (String equals : SUPPORTED_VIDEO_FILE_TYPE) {
            if (equals.equals(str)) {
                return true;
            }
        }
        return false;
    }

    public static final String MEDIA_IMAGE_FILEPATH_WITHOUT_ROOTNAME(Context context, String str, boolean z) {
        String str2 = "/KingKing/Media/Image/";
        if (!z) {
            str2 = "/KingKing/Media/Image/" + STORAGE_AUDIO_SENT_FOLDER;
        }
        IS_DIRECTORY_EXIST(INTERNAL_FILES_DIR(context) + str2);
        return str2 + str;
    }

    public static final String MEDIA_VIDEO_FILEPATH_WITHOUT_ROOTNAME(Context context, String str, boolean z) {
        String str2 = "/KingKing/Media/Video/";
        if (!z) {
            str2 = "/KingKing/Media/Video/" + STORAGE_AUDIO_SENT_FOLDER;
        }
        IS_DIRECTORY_EXIST(INTERNAL_FILES_DIR(context) + str2);
        return str2 + str;
    }

    public static final String MY_PROFILE_IMAGE_FILE_NAME(Context context) {
        return myProfilePic_thumbnail_file;
    }

    public static final String RECEIVED_AUDIO_FILEPATH(String str) {
        String str2 = STORAGE_ROOT_BASE + STORAGE_ROOT_FOLDER + STORAGE_MEDIA_FOLDER + STORAGE_MEDIA_AUDIO_FOLDER;
        IS_DIRECTORY_EXIST(str2);
        return str2 + str;
    }

    public static final String RECORDED_AUDIO_FILEPATH(String str) {
        String str2 = STORAGE_ROOT_BASE + STORAGE_ROOT_FOLDER + STORAGE_MEDIA_FOLDER + STORAGE_MEDIA_AUDIO_FOLDER + STORAGE_AUDIO_SENT_FOLDER;
        IS_DIRECTORY_EXIST(str2);
        return str2 + str;
    }

    public static final String SENT_IMAGE_FILEPATH(String str) {
        String str2 = STORAGE_ROOT_BASE + STORAGE_ROOT_FOLDER + STORAGE_MEDIA_FOLDER + STORAGE_MEDIA_IMAGE_FOLDER + STORAGE_AUDIO_SENT_FOLDER;
        IS_DIRECTORY_EXIST(str2);
        return str2 + str;
    }

    public static final String SENT_VIDEO_FILEPATH(String str) {
        String str2 = STORAGE_ROOT_BASE + STORAGE_ROOT_FOLDER + STORAGE_MEDIA_FOLDER + STORAGE_MEDIA_VIDEO_FOLDER + STORAGE_AUDIO_SENT_FOLDER;
        IS_DIRECTORY_EXIST(str2);
        return str2 + str;
    }

    public static void SET_GROUP_CHAT_ACTION_VIEW_NUMBER(boolean z, boolean z2) {
        GROUP_CHAT_VIEW_PARTICIPANT_INFO_INDEX = -1;
        GROUP_CHAT_MESSAGE_PARTICIPANT_INDEX = -1;
        GROUP_CHAT_DELETE_PARTICIPANT_INDEX = -1;
        if (z) {
            if (z2) {
                GROUP_CHAT_VIEW_PARTICIPANT_INFO_INDEX = 0;
                GROUP_CHAT_MESSAGE_PARTICIPANT_INDEX = 1;
                GROUP_CHAT_DELETE_PARTICIPANT_INDEX = 2;
                return;
            }
            GROUP_CHAT_MESSAGE_PARTICIPANT_INDEX = 0;
            GROUP_CHAT_DELETE_PARTICIPANT_INDEX = 1;
        } else if (z2) {
            GROUP_CHAT_VIEW_PARTICIPANT_INFO_INDEX = 0;
            GROUP_CHAT_MESSAGE_PARTICIPANT_INDEX = 1;
        } else {
            GROUP_CHAT_MESSAGE_PARTICIPANT_INDEX = 0;
        }
    }

    public static final String USER_ID_WITH_DOMAIN_NAME(String str) {
        return str + "@" + domainName;
    }

    public static final String USER_PROFILE_IMAGE_FILE_NAME(Context context, String str) {
        return str + userProfilePic_thumbnail_suffix;
    }

    public static int dpToPx(int i) {
        return (int) (((float) i) * Resources.getSystem().getDisplayMetrics().density);
    }

    public static String formatPhoneNumber(String str) {
        return TextUtils.isEmpty(str) ? "" : str.startsWith("852") ? "+" + str : str;
    }

    public static int getDeviceScreenWidth() {
        return Resources.getSystem().getDisplayMetrics().widthPixels;
    }

    public static final String getPhoneNumberLookUpKey(Context context, String str) {
        StringBuilder sb = new StringBuilder();
        Cursor query = context.getContentResolver().query(ContactFragment.AllPhoneNumberQuery.URI, ContactFragment.AllPhoneNumberQuery.PROJECTION, (String) null, (String[]) null, "data1");
        query.moveToFirst();
        sb.append(" (");
        while (!query.isAfterLast()) {
            if (str.contains(PhoneListService.normalizeContactNumber(query.getString(1)))) {
                if (sb.length() < 3) {
                    sb.append("'" + query.getString(2) + "'");
                } else {
                    sb.append(", '" + query.getString(2) + "'");
                }
            }
            query.moveToNext();
        }
        query.close();
        sb.append(")");
        return sb.toString();
    }

    public static HashMap<String, Integer> getThumbnailDependantDimension(int i, int i2) {
        HashMap<String, Integer> hashMap = new HashMap<>();
        hashMap.put("width", Integer.valueOf(getThumbnailWidth()));
        hashMap.put("height", Integer.valueOf(getThumbnailHeight(i, i2)));
        return hashMap;
    }

    public static int getThumbnailHeight(int i, int i2) {
        return i2 > getThumbnailWidth() ? getThumbnailWidth() : i2;
    }

    public static int getThumbnailWidth() {
        return (int) (((double) getDeviceScreenWidth()) * 0.67d);
    }
}
