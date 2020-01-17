.class public Lcom/pccw/mobile/sip/Constants;
.super Ljava/lang/Object;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/Constants$TransportConstants;
    }
.end annotation


# static fields
.field public static final AUTH_GET_IMSI_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/authGetimsi.do"

.field public static final CALL_FORWARD_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/callforward.do"

.field public static final CHAT_TYPE_GROUP:Ljava/lang/String; = "group"

.field public static final CHAT_TYPE_INDIVIDUAL:Ljava/lang/String; = "individual"

.field public static final CHECK_LOCATION_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/checkLocation.do"

.field public static final CHECK_PREPAID_BALANCE_LOWER_THAN_THREAHOLD_TRUE:Ljava/lang/String; = "true"

.field public static final CHECK_PREPAID_BALANCE_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/checkPrepaidBalance.do"

.field public static final CHECK_SMS_DELIVERY_STATUS_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/smsstatus.do"

.field public static final CHECK_VERSION_URL:Ljava/lang/String; = "http://sip.pccwmobile.com/voip02/version.do"

.field public static final CONFERENCE_ROOM_CALLER_ID:Ljava/lang/String; = "conference@pccwone.com"

.field public static final CONFERENCE_ROOM_CALLER_PREFIX:Ljava/lang/String; = "conference@"

.field public static final CONFIRM_NUMBER_TYPE:Ljava/lang/String; = "numberType"

.field public static final CONFIRM_REGISTRATION_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/confirmRegistration.do"

.field public static final CONFIRM_REG_ACTIVATION_FIRST_TIME:Ljava/lang/String; = "True"

.field public static final CONFIRM_REG_IS_FREE_TRIAL_KEY:Ljava/lang/String; = "isFreeTrial"

.field public static final CONFIRM_REG_MSISDN_KEY:Ljava/lang/String; = "msisdn"

.field public static final CSL_PREPAID_TOPUP_NUM:Ljava/lang/String; = "179179"

.field public static final ConversationParticipantItemService:Ljava/lang/String; = "ConversationParticipantItemService"

.field public static final FACEBOOK_SHARE_EN_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/sharing/fbPost_en.xml"

.field public static final FACEBOOK_SHARE_ZH_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/sharing/fbPost_ch.xml"

.field public static final FORCE_CHECK_VERSION_TIME:J = 0x6ddd00L

.field public static final GET_CALLEE_STATUS_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/getCalleeStatus.do"

.field public static final GET_LANG_ENGLISH:Ljava/lang/String; = "en"

.field public static final GET_LANG_TRADITIONAL_CHINESE:Ljava/lang/String; = "zh_HK"

.field public static final GET_MSISDN_BY_IMSI_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/getDImsi.do"

.field public static final GET_NUMBER_INFO_ALLOW_RS_TRUE:Ljava/lang/String; = "true"

.field public static final GET_NUMBER_INFO_BRAND_1010:Ljava/lang/String; = "1010"

.field public static final GET_NUMBER_INFO_BRAND_NEWWORLD:Ljava/lang/String; = "nw"

.field public static final GET_NUMBER_INFO_BRAND_ONE2FREE:Ljava/lang/String; = "one2free"

.field public static final GET_NUMBER_INFO_CLASS_CSL_PREPAID:Ljava/lang/String; = "csl"

.field public static final GET_NUMBER_INFO_CLASS_HELLO_PREPAID:Ljava/lang/String; = "Hello"

.field public static final GET_NUMBER_INFO_CLASS_NORMAL_PREPAID:Ljava/lang/String; = "Normal"

.field public static final GET_NUMBER_INFO_FREE_TRIAL_PROMOTION_ACTIVE:Ljava/lang/String; = "Available"

.field public static final GET_NUMBER_INFO_IS_FREE_TRIAL_NUM:Ljava/lang/String; = "true"

.field public static final GET_NUMBER_INFO_IS_PURCHASED_VIRTUAL_NUMBER:Ljava/lang/String; = "true"

.field public static final GET_NUMBER_INFO_OPERATOR_CSL:Ljava/lang/String; = "csl"

.field public static final GET_NUMBER_INFO_OPERATOR_PCCW:Ljava/lang/String; = "hkt"

.field public static final GET_NUMBER_INFO_REGISTERED_FREE_TRIAL:Ljava/lang/String; = "true"

.field public static final GET_NUMBER_INFO_SIMTYPE_2N:Ljava/lang/String; = "2N"

.field public static final GET_NUMBER_INFO_SIMTYPE_POSTPAID:Ljava/lang/String; = "postpaid"

.field public static final GET_NUMBER_INFO_SIMTYPE_PREPAID:Ljava/lang/String; = "prepaid"

.field public static final GET_NUMBER_INFO_STATUS_ACTIVE:Ljava/lang/String; = "active"

.field public static final GET_NUMBER_INFO_STATUS_IDLE:Ljava/lang/String; = "idle"

.field public static final GET_NUMBER_INFO_VIRTUAL_NUMBER_STATUS_ACTIVE:Ljava/lang/String; = "active"

.field public static final GET_NUMBER_TYPE_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/getNumberType.do"

.field public static final GET_SMS_TYPE:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/getSMSType.do"

.field public static final GET_VIRTUAL_NUMBER_IS_PROMOTION_KEY:Ljava/lang/String; = "isInPromotionPeriod"

.field public static final GET_VIRTUAL_NUMBER_URL_KEY:Ljava/lang/String; = "url"

.field public static final HEARTBEAT_NORMAL_INTERVAL:I = 0x7530

.field public static final HEARTBEAT_RETRY_INTERVAL:I = 0x2710

.field public static final HEARTBEAT_RETRY_INTERVAL_MIN:I = 0x64

.field public static final HEARTBEAT_RETRY_MAX:I = 0x2

.field public static final HEARTBEAT_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/heartbeat.do"

.field public static final HELLO_PREPAID_TOPUP_NUM:Ljava/lang/String; = "1833808"

.field public static final HKT_HOTLINE_HTML_URL_CH:Ljava/lang/String; = "http://sip.pccwmobile.com/voip02/message/toll_free_numbers_ch.html"

.field public static final HKT_HOTLINE_HTML_URL_EN:Ljava/lang/String; = "http://sip.pccwmobile.com/voip02/message/toll_free_numbers_en.html"

.field public static final HKT_TOLL_FREE_NUMBER:Ljava/lang/String; = "+85228888333"

.field public static final HTTPS_LOGIN_PATH:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/login.do"

.field public static final IM_IMSIDN_VERIFY_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/imsiDVerify.do"

.field public static final IM_REGISTRATION_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/kkim/api/registration.do"

.field public static final INTENT_ALERT_AUTOLOGIN_PROCESSING:Ljava/lang/String; = "com.pccw.mobile.sip.intent.autologinprocessing"

.field public static final INTENT_ALERT_CALLFORWARD_SUCCEED:Ljava/lang/String; = "com.pccw.mobile.sip.intent.callforwardsucceed"

.field public static final INTENT_ALERT_LOGIN_DISCONNECTED:Ljava/lang/String; = "com.pccw.mobile.sip.intent.logindisconnected"

.field public static final INTENT_ALERT_LOGIN_DISCONNECTED_EXTRA_NEED_SHOW_MESSAGE:Ljava/lang/String; = "NEED_SHOW_MESSAGE"

.field public static final INTENT_ALERT_LOGIN_DISCONNECTING:Ljava/lang/String; = "com.pccw.mobile.sip.intent.logindisconnecting"

.field public static final INTENT_ALERT_LOGIN_ERROR:Ljava/lang/String; = "com.pccw.mobile.sip.intent.loginerror"

.field public static final INTENT_ALERT_LOGIN_FINISHED:Ljava/lang/String; = "com.pccw.mobile.sip.intent.loginfinished"

.field public static final INTENT_ALERT_LOGIN_PASSWORD_ERROR:Ljava/lang/String; = "com.pccw.mobile.sip.intent.loginpassworderror"

.field public static final INTENT_ALERT_LOGIN_WARNING:Ljava/lang/String; = "com.pccw.mobile.sip.intent.loginwarning"

.field public static final INTENT_ALERT_RELOGIN_PROCESSING:Ljava/lang/String; = "com.pccw.mobile.sip.intent.reloginprocessing"

.field public static final INTENT_ALERT_SYNC_IMUSER_FINISH:Ljava/lang/String; = "com.pccw.mobile.sip.intent.syncimuserfinish"

.field public static final INTENT_DIAL_ACTION:Ljava/lang/String; = "com.pccw.mobile.sip.service.intent.dial"

.field public static final INTENT_MORE_ACTION:Ljava/lang/String; = "com.pccw.mobile.sip.service.intent.more"

.field public static final INTENT_PREFIX:Ljava/lang/String; = "com.pccw.mobile.sip"

.field public static final INTERT_ALERT_DAYPASS:Ljava/lang/String; = "com.pccw.mobile.sip.intent.daypass"

.field public static final LOG_TAG:Ljava/lang/String; = "PCCW_MOBILE_SIP"

.field public static final LOG_TAG_DEV:Ljava/lang/String; = "testing"

.field public static final MAX_SIP_FAIL_ATTEMPTS:I = 0x1

.field public static final MISSED_CALL_NOTIFICATION:I = 0x3

.field public static final NETWORK_SHARE_PREF:Ljava/lang/String; = "NETWORK_SHARE_PREF"

.field public static final NORMAL_PREPAID_TOPUP_NUM:Ljava/lang/String; = "1833803"

.field public static final POSTPAID_MAX_CALL:I = 0x3

.field public static final PREPAID_MAX_CALL:I = 0x1

.field public static final PREPAID_TOPUP_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/prepaidTopUp.do?msisdn=MSISDN_VALUE&r=R_VALUE"

.field public static final ROAM_SAVE_AUTHEN_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/roamSaveAuthen02/RoamSaveAuthen"

.field public static final SEND_SMS_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/deliverSMS.do"

.field public static final SHOW_DAYPASS_MESSAGE:Ljava/lang/String; = "SHOW_DAYPASS_MESSAGE"

.field public static final SMS_INVITE_API_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/sendSharingSms.do"

.field public static final SMS_INVITE_EN_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/sharing/smsSharingEn.xml"

.field public static final SMS_INVITE_ZH_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/sharing/smsSharingCh.xml"

.field public static final SPLASH_SCREEN_MIN_SHOW_TIME:J = 0x3e8L

.field public static final T_AND_C_RECORD_ACCEPT_URL:Ljava/lang/String; = "https://sip.pccwmobile.com/voip02/acceptTandC.do"

.field public static final URL_PCCW_MOBILE:Landroid/net/Uri;

.field public static final VOICE_MAIL_NUMBER:Ljava/lang/String; = "*988"

.field public static final VOICE_MAIL_NUMBER_CSL:Ljava/lang/String; = "*988"

.field public static final bypassTargetDay:Z = false

.field public static final canShowImsi:Z = false

.field public static final contactBatchLimit:I = 0x32

.field public static domainName:Ljava/lang/String; = null

.field public static final echoServerHost:Ljava/lang/String; = "echoServerHost"

.field public static final echoServerHost1:Ljava/lang/String; = "echoServerHost1"

.field public static final echoServerHost2:Ljava/lang/String; = "echoServerHost2"

.field public static final echoServerHostTest:Ljava/lang/String; = "echoServerHostTest"

.field public static final enableAutoCodecSelection:Z = true

.field public static final hasKKUserSyncFeature:Z = false

.field public static final isByPassHeartBeatServerErrorResp:Z = false

.field public static final minCallCountDuration:I = 0x3c

.field public static mockACC:I = 0x0

.field public static final mockHttpsLogin:Z = false

.field public static mockOrientationMode:I = 0x0

.field public static final mockVideoCallACC:Z = false

.field public static final release:Z = true

.field public static final shouldIgnoreNonPccwIdd:Z = true

.field public static final showProdFAQ:Z = true

.field public static final showProdUserGuide:Z = true

.field public static final targetDayInterval:I = 0xe

.field public static final targetNumOfCall:I = 0x5

.field public static final validEchoServerHost:Ljava/lang/String; = "validEchoServerHost"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const-string/jumbo v0, "http://pccwmobile.com"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/pccw/mobile/sip/Constants;->URL_PCCW_MOBILE:Landroid/net/Uri;

    .line 116
    const-string/jumbo v0, "imxmpp.pccw-hkt.com"

    sput-object v0, Lcom/pccw/mobile/sip/Constants;->domainName:Ljava/lang/String;

    .line 214
    const/4 v0, 0x0

    sput v0, Lcom/pccw/mobile/sip/Constants;->mockACC:I

    .line 215
    const/4 v0, 0x1

    sput v0, Lcom/pccw/mobile/sip/Constants;->mockOrientationMode:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
