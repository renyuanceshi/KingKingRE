.class public Lcom/pccw/mobile/sip/ClientStateManager;
.super Ljava/lang/Object;
.source "ClientStateManager.java"


# static fields
.field private static final CLIENT_CSL_PREPAID_TNC_KEY:Ljava/lang/String; = "CLIENT_CSL_PREPAID_TNC_KEY"

.field private static final CLIENT_CSL_TNC_KEY:Ljava/lang/String; = "CLIENT_STATE_CSL_TNC_KEY"

.field private static final CLIENT_MODE_MASK_JUST_SWITCH_ACCOUNT:I = 0x20

.field private static final CLIENT_MODE_MASK_JUST_SWITCH_ACCOUNT_TC_ACCEPTED:I = 0x40

.field private static final CLIENT_MODE_MASK_KNOWNMODE:I = 0x1

.field private static final CLIENT_MODE_MASK_REGISTRATION_ACCEPTED:I = 0x10

.field private static final CLIENT_MODE_MASK_REGISTRATION_SUBMITTED:I = 0x8

.field private static final CLIENT_MODE_MASK_TC_ACCEPTED:I = 0x4

.field private static final CLIENT_POSTPAID_TNC_KEY:Ljava/lang/String; = "CLIENT_STATE_POSTPAID_TNC_KEY"

.field private static final CLIENT_PREPAID_TNC_KEY:Ljava/lang/String; = "CLIENT_STATE_PREPAID_TNC_KEY"

.field private static final CLIENT_STATE_ENCRYPTED_OTP_KEY:Ljava/lang/String; = "CLIENT_STATE_ENCRYPTED_OTP_KEY"

.field private static final CLIENT_STATE_ENCRYPTED_PCCW_IMSI2_KEY:Ljava/lang/String; = "CLIENT_STATE_ENCRYPTED_PCCW_IMSI2_KEY"

.field private static final CLIENT_STATE_ENCRYPTED_PCCW_IMSI_KEY:Ljava/lang/String; = "CLIENT_STATE_ENCRYPTED_PCCW_IMSI_KEY"

.field private static final CLIENT_STATE_ENCRYPTED_PHONE_KEY:Ljava/lang/String; = "CLIENT_STATE_ENCRYPTED_PHONE_KEY"

.field private static final CLIENT_STATE_MODE_KEY:Ljava/lang/String; = "CLIENT_STATE_MODE_KEY"

.field private static final IM_LOGIN_ID_KEY:Ljava/lang/String; = "IM_LOGIN_ID"

.field private static final IM_PASSWORD_KEY:Ljava/lang/String; = "IM_PASSWORD"

.field private static final IM_XMPP_DOMAIN_KEY:Ljava/lang/String; = "IM_XMPP_DOMAIN"

.field private static final NOT_SHOW_SMS_CONSUME_WARMING_CHECKBOX_KEY:Ljava/lang/String; = "NOT_SHOW_SMS_CONSUME_WARMING_CHECKBOX_KEY"

.field private static final POSTPAID_PREPAID_MODE_PREFERENCE_KEY:Ljava/lang/String; = "PREF_POSTPAID_PREPAID_MODE_PREFERENCE_KEY"

.field private static final PREPAID_IS_REGISTERED_PREFENENCE_KEY:Ljava/lang/String; = "PREF_IS_REGISTERED_PREPAID"

.field private static final PREPAID_REGISTERED_NUMBER_PASSWORD_PREFENENCE_KEY:Ljava/lang/String; = "PREF_PREPAID_REGISTERED_NUMBER_PASSWORD"

.field private static final PREPAID_REGISTERED_NUMBER_PREFENENCE_KEY:Ljava/lang/String; = "PREF_PREPAID_REGISTERED_NUMBER"

.field private static final PUSH_NOTI_REGID:Ljava/lang/String; = "PUSH_NOTI_REGID"

.field private static final PUSH_NOTI_REG_VERSION:Ljava/lang/String; = "PUSH_NOTI_REG_VERSION"

.field private static final REGISTERED_NUMBER_PREFENENCE_KEY:Ljava/lang/String; = "PREF_REGISTERED_NUMBER_PREFENENCE_KEY"

.field public static final STATE_CHANGE:I = 0x1

.field public static final STATE_CSL_1010_POSTPAID:I = 0x6

.field public static final STATE_CSL_ONE2FREE_POSTPAID:I = 0x5

.field public static final STATE_CSL_PREPAID:I = 0x7

.field public static final STATE_HKT_HELLO_PREPAID:I = 0x4

.field public static final STATE_HKT_NORMAL_PREPAID:I = 0x3

.field public static final STATE_HKT_POSTPAID:I = 0x2

.field public static final STATE_UNCHANGE:I = 0x0

.field public static final STATE_UNKNOWN:I = 0x63

.field private static final USE_FIRST_SIM_SLOT_PREFENENCE_KEY:Ljava/lang/String; = "PREF_USE_FIRST_SIM_SLOT"

.field private static encryptedDeviceId:Ljava/lang/String;

.field private static encryptedPccwImsi:Ljava/lang/String;

.field private static encryptedPccwImsi2:Ljava/lang/String;

.field private static isGoingToResetPrepaidAccount:Z

.field private static isInit:Z

.field private static mode:I

.field private static otp:Ljava/lang/String;

.field private static phone:Ljava/lang/String;

.field private static postpaid_prepaid_mode:I

.field private static useFirstSim:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 63
    sput v1, Lcom/pccw/mobile/sip/ClientStateManager;->mode:I

    .line 64
    const-string/jumbo v0, ""

    sput-object v0, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi:Ljava/lang/String;

    .line 65
    const-string/jumbo v0, ""

    sput-object v0, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi2:Ljava/lang/String;

    .line 66
    const-string/jumbo v0, ""

    sput-object v0, Lcom/pccw/mobile/sip/ClientStateManager;->otp:Ljava/lang/String;

    .line 67
    const-string/jumbo v0, ""

    sput-object v0, Lcom/pccw/mobile/sip/ClientStateManager;->phone:Ljava/lang/String;

    .line 68
    const-string/jumbo v0, ""

    sput-object v0, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedDeviceId:Ljava/lang/String;

    .line 69
    const/4 v0, 0x1

    sput-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->useFirstSim:Z

    .line 70
    sput-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    .line 85
    const/4 v0, 0x3

    sput v0, Lcom/pccw/mobile/sip/ClientStateManager;->postpaid_prepaid_mode:I

    .line 87
    sput-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isGoingToResetPrepaidAccount:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static changeNumber(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 473
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v1, :cond_0

    .line 474
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 475
    :cond_0
    if-nez p1, :cond_1

    const-string/jumbo v1, ""

    :goto_0
    sput-object v1, Lcom/pccw/mobile/sip/ClientStateManager;->phone:Ljava/lang/String;

    .line 476
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 477
    .local v0, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CLIENT_STATE_ENCRYPTED_PHONE_KEY"

    sget-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->phone:Ljava/lang/String;

    .line 479
    invoke-static {v3}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByMasterKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 478
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 479
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 480
    return-void

    .line 475
    .end local v0    # "pref":Landroid/content/SharedPreferences;
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static checkPostpaidPrepaidMode(Landroid/content/Context;)I
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1067
    sget-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v0, :cond_0

    .line 1068
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 1069
    :cond_0
    sget v0, Lcom/pccw/mobile/sip/ClientStateManager;->postpaid_prepaid_mode:I

    return v0
.end method

.method public static checkSimState(Landroid/content/Context;Z)I
    .locals 7
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "updateStateAlso"    # Z

    .prologue
    const/4 v5, 0x0

    .line 425
    sget-boolean v6, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v6, :cond_0

    .line 426
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 427
    :cond_0
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v4, v5

    .line 463
    :cond_1
    :goto_0
    return v4

    .line 434
    :cond_2
    const-string/jumbo v2, ""

    .line 435
    .local v2, "newImsi":Ljava/lang/String;
    const-string/jumbo v3, ""

    .line 436
    .local v3, "newImsi2":Ljava/lang/String;
    const-string/jumbo v0, ""

    .line 437
    .local v0, "newEncryptedImsi":Ljava/lang/String;
    const-string/jumbo v1, ""

    .line 438
    .local v1, "newEncryptedImsi2":Ljava/lang/String;
    const/4 v4, 0x1

    .line 440
    .local v4, "returnState":I
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->obtainFirstImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 441
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->obtainSecondImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 443
    if-eqz v2, :cond_3

    invoke-static {v2}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 444
    invoke-static {v2}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByMasterKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 447
    :cond_3
    if-eqz v3, :cond_4

    invoke-static {v3}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 448
    invoke-static {v3}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByMasterKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 451
    :cond_4
    sget-object v6, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    sget-object v6, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi2:Ljava/lang/String;

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    move v4, v5

    .line 452
    goto :goto_0

    .line 458
    :cond_5
    if-eqz p1, :cond_1

    .line 459
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->detectAndUpdateSimSlot(Landroid/content/Context;)V

    .line 460
    const/4 v5, 0x1

    sput-boolean v5, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    goto :goto_0
.end method

.method private static detectAndUpdateSimSlot(Landroid/content/Context;)V
    .locals 7
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 887
    const/4 v3, 0x1

    .line 888
    .local v3, "useFirstSimTemp":Z
    const-string/jumbo v0, ""

    .line 889
    .local v0, "firstImsi":Ljava/lang/String;
    const-string/jumbo v2, ""

    .line 891
    .local v2, "secondImsi":Ljava/lang/String;
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->obtainFirstImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 892
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->obtainSecondImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 894
    const-string/jumbo v4, ""

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 895
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isFirstOperatorPccw(Landroid/content/Context;)Z

    move-result v4

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isFirstOperatorCSL(Landroid/content/Context;)Z

    move-result v5

    or-int/2addr v4, v5

    if-eqz v4, :cond_0

    .line 896
    const/4 v3, 0x1

    .line 909
    :goto_0
    if-eqz v0, :cond_2

    invoke-static {v0}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 910
    invoke-static {v0}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByMasterKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi:Ljava/lang/String;

    .line 915
    :goto_1
    if-eqz v2, :cond_3

    invoke-static {v2}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 916
    invoke-static {v2}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByMasterKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi2:Ljava/lang/String;

    .line 921
    :goto_2
    sput-boolean v3, Lcom/pccw/mobile/sip/ClientStateManager;->useFirstSim:Z

    .line 922
    const-string/jumbo v4, ""

    sput-object v4, Lcom/pccw/mobile/sip/ClientStateManager;->phone:Ljava/lang/String;

    .line 924
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 925
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "CLIENT_STATE_ENCRYPTED_PCCW_IMSI_KEY"

    sget-object v6, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi:Ljava/lang/String;

    .line 926
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "CLIENT_STATE_ENCRYPTED_PCCW_IMSI2_KEY"

    sget-object v6, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi2:Ljava/lang/String;

    .line 927
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "CLIENT_STATE_ENCRYPTED_PHONE_KEY"

    sget-object v6, Lcom/pccw/mobile/sip/ClientStateManager;->phone:Ljava/lang/String;

    .line 928
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "PREF_USE_FIRST_SIM_SLOT"

    sget-boolean v6, Lcom/pccw/mobile/sip/ClientStateManager;->useFirstSim:Z

    .line 929
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 930
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 931
    return-void

    .line 898
    .end local v1    # "pref":Landroid/content/SharedPreferences;
    :cond_0
    const-string/jumbo v4, ""

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 899
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isSecondOperatorPccw(Landroid/content/Context;)Z

    move-result v4

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isSecondOperatorCSL(Landroid/content/Context;)Z

    move-result v5

    or-int/2addr v4, v5

    if-eqz v4, :cond_1

    .line 900
    const/4 v3, 0x0

    goto :goto_0

    .line 902
    :cond_1
    const/4 v3, 0x1

    goto :goto_0

    .line 912
    :cond_2
    const-string/jumbo v4, ""

    sput-object v4, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi:Ljava/lang/String;

    goto :goto_1

    .line 918
    :cond_3
    const-string/jumbo v4, ""

    sput-object v4, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi2:Ljava/lang/String;

    goto :goto_2
.end method

.method public static getEncryptedDeviceId(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 143
    sget-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v0, :cond_0

    .line 144
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 145
    :cond_0
    sget-object v0, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedDeviceId:Ljava/lang/String;

    return-object v0
.end method

.method public static getEncryptedPccwImsi(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 101
    sget-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v0, :cond_0

    .line 102
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 103
    :cond_0
    sget-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->useFirstSim:Z

    if-eqz v0, :cond_1

    .line 104
    sget-object v0, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi:Ljava/lang/String;

    .line 106
    :goto_0
    return-object v0

    :cond_1
    sget-object v0, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi2:Ljava/lang/String;

    goto :goto_0
.end method

.method private static getInfoBySlot(Landroid/telephony/TelephonyManager;Ljava/lang/String;I)Ljava/lang/String;
    .locals 9
    .param p0, "telManager"    # Landroid/telephony/TelephonyManager;
    .param p1, "predictedMethodName"    # Ljava/lang/String;
    .param p2, "slotID"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 935
    const/4 v5, 0x0

    .line 938
    .local v5, "str":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 940
    .local v6, "telephonyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v7, 0x1

    new-array v4, v7, [Ljava/lang/Class;

    .line 941
    .local v4, "parameter":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v7, 0x0

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v8, v4, v7

    .line 942
    invoke-virtual {v6, p1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 944
    .local v1, "getSimID":Ljava/lang/reflect/Method;
    const/4 v7, 0x1

    new-array v2, v7, [Ljava/lang/Object;

    .line 945
    .local v2, "obParameter":[Ljava/lang/Object;
    const/4 v7, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v2, v7

    .line 946
    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 948
    .local v3, "ob_phone":Ljava/lang/Object;
    if-eqz v3, :cond_0

    .line 949
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 956
    :cond_0
    return-object v5

    .line 952
    .end local v1    # "getSimID":Ljava/lang/reflect/Method;
    .end local v2    # "obParameter":[Ljava/lang/Object;
    .end local v3    # "ob_phone":Ljava/lang/Object;
    .end local v4    # "parameter":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v6    # "telephonyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v0

    .line 953
    .local v0, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/lang/Exception;

    invoke-direct {v7, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method public static getOtp(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 134
    sget-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v0, :cond_0

    .line 135
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 136
    :cond_0
    sget-object v0, Lcom/pccw/mobile/sip/ClientStateManager;->otp:Ljava/lang/String;

    return-object v0
.end method

.method public static getPhone(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 115
    sget-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v0, :cond_0

    .line 116
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 117
    :cond_0
    sget-object v0, Lcom/pccw/mobile/sip/ClientStateManager;->phone:Ljava/lang/String;

    return-object v0
.end method

.method public static getPhoneWithHKCountryCode(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 125
    sget-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v0, :cond_0

    .line 126
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 127
    :cond_0
    sget-object v0, Lcom/pccw/mobile/sip/ClientStateManager;->phone:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "852"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/pccw/mobile/sip/ClientStateManager;->phone:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getPushNotificationRegId(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1197
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "PUSH_NOTI_REGID"

    const-string/jumbo v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPushNotificationRegVersion(Landroid/content/Context;)I
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1211
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "PUSH_NOTI_REG_VERSION"

    const/high16 v2, -0x80000000

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1093
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v2, "PREF_REGISTERED_NUMBER_PREFENENCE_KEY"

    const-string/jumbo v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1094
    .local v0, "number":Ljava/lang/String;
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1095
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredPrepaidNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 1096
    invoke-static {p0, v0}, Lcom/pccw/mobile/sip/ClientStateManager;->setRegisteredNumber(Landroid/content/Context;Ljava/lang/String;)Z

    .line 1098
    :cond_0
    return-object v0
.end method

.method public static getRegisteredNumberWithHKCountryCode(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1107
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 1108
    .local v0, "number":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, ""

    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "852"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private static getRegisteredPrepaidNumber(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1153
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1154
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "PREF_PREPAID_REGISTERED_NUMBER"

    const-string/jumbo v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1157
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public static getRegisteredPrepaidNumberPassword(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1162
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1163
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "PREF_PREPAID_REGISTERED_NUMBER_PASSWORD"

    const-string/jumbo v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1166
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method private static getSecondImsi(Landroid/telephony/TelephonyManager;)Ljava/lang/String;
    .locals 4
    .param p0, "telManager"    # Landroid/telephony/TelephonyManager;

    .prologue
    .line 834
    const/4 v1, 0x0

    .line 836
    .local v1, "secondImsi":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v2, "getSubscriberIdGemini"

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Lcom/pccw/mobile/sip/ClientStateManager;->getInfoBySlot(Landroid/telephony/TelephonyManager;Ljava/lang/String;I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 849
    :goto_0
    return-object v1

    .line 837
    :catch_0
    move-exception v0

    .line 842
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v2, "getSubscriberId"

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Lcom/pccw/mobile/sip/ClientStateManager;->getInfoBySlot(Landroid/telephony/TelephonyManager;Ljava/lang/String;I)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    goto :goto_0

    .line 843
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method private static getSecondSimOperator(Landroid/telephony/TelephonyManager;)Ljava/lang/String;
    .locals 4
    .param p0, "telManager"    # Landroid/telephony/TelephonyManager;

    .prologue
    .line 853
    const/4 v1, 0x0

    .line 855
    .local v1, "secondSimOperator":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v2, "getSimOperatorGemini"

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Lcom/pccw/mobile/sip/ClientStateManager;->getInfoBySlot(Landroid/telephony/TelephonyManager;Ljava/lang/String;I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 869
    :goto_0
    if-nez v1, :cond_0

    .line 870
    const-string/jumbo v1, ""

    .line 873
    :cond_0
    return-object v1

    .line 856
    :catch_0
    move-exception v0

    .line 861
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v2, "getSimOperator"

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Lcom/pccw/mobile/sip/ClientStateManager;->getInfoBySlot(Landroid/telephony/TelephonyManager;Ljava/lang/String;I)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    goto :goto_0

    .line 862
    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method public static hasRegisterNumber(Landroid/content/Context;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1112
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v2, "PREF_REGISTERED_NUMBER_PREFENENCE_KEY"

    const-string/jumbo v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1114
    .local v0, "number":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isCSL(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1007
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPostpaid(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isCSL1010Postpaid(Landroid/content/Context;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 1017
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "PREF_POSTPAID_PREPAID_MODE_PREFERENCE_KEY"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 1019
    .local v0, "prepaidPostpaidMode":I
    const/4 v2, 0x6

    if-ne v0, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public static isCSLOne2freePostpaid(Landroid/content/Context;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 1011
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "PREF_POSTPAID_PREPAID_MODE_PREFERENCE_KEY"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 1013
    .local v0, "prepaidPostpaidMode":I
    const/4 v2, 0x5

    if-ne v0, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public static isCSLPostpaid(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1003
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLOne2freePostpaid(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSL1010Postpaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isCSLPostpaidTCAccepted(Landroid/content/Context;)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 205
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v1, :cond_0

    .line 206
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 208
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 209
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string/jumbo v1, "CLIENT_STATE_CSL_TNC_KEY"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public static isCSLPrepaid(Landroid/content/Context;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 992
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "PREF_POSTPAID_PREPAID_MODE_PREFERENCE_KEY"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 993
    .local v0, "prepaidPostpaidMode":I
    const/4 v2, 0x7

    if-ne v0, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public static isCSLPrepaidTCAccepted(Landroid/content/Context;)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 213
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v1, :cond_0

    .line 214
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 216
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 217
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string/jumbo v1, "CLIENT_CSL_PREPAID_TNC_KEY"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public static isClientStateRegistered(Landroid/content/Context;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, -0x1

    .line 960
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v2, "PREF_POSTPAID_PREPAID_MODE_PREFERENCE_KEY"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 962
    .local v0, "prepaidPostpaidMode":I
    if-eq v0, v3, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isFirstOperatorCSL(Landroid/content/Context;)Z
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 306
    const/4 v0, 0x0

    .line 308
    .local v0, "isCSLSim":Z
    :try_start_0
    const-string/jumbo v3, "phone"

    .line 309
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 310
    .local v2, "telManager":Landroid/telephony/TelephonyManager;
    if-eqz v2, :cond_1

    .line 311
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    const/4 v4, 0x5

    if-ne v3, v4, :cond_1

    .line 312
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 315
    .local v1, "operator":Ljava/lang/String;
    const-string/jumbo v3, "45400"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "45402"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "45410"

    .line 316
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "45418"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_2

    :cond_0
    const/4 v0, 0x1

    .line 323
    .end local v1    # "operator":Ljava/lang/String;
    .end local v2    # "telManager":Landroid/telephony/TelephonyManager;
    :cond_1
    :goto_0
    return v0

    .line 316
    .restart local v1    # "operator":Ljava/lang/String;
    .restart local v2    # "telManager":Landroid/telephony/TelephonyManager;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 319
    .end local v1    # "operator":Ljava/lang/String;
    .end local v2    # "telManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static isFirstOperatorPccw(Landroid/content/Context;)Z
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 242
    const/4 v0, 0x0

    .line 244
    .local v0, "isPccwSim":Z
    :try_start_0
    const-string/jumbo v3, "phone"

    .line 245
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 246
    .local v2, "telManager":Landroid/telephony/TelephonyManager;
    if-eqz v2, :cond_1

    .line 247
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    const/4 v4, 0x5

    if-ne v3, v4, :cond_1

    .line 248
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 251
    .local v1, "operator":Ljava/lang/String;
    const-string/jumbo v3, "45416"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "45419"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_2

    :cond_0
    const/4 v0, 0x1

    .line 258
    .end local v1    # "operator":Ljava/lang/String;
    .end local v2    # "telManager":Landroid/telephony/TelephonyManager;
    :cond_1
    :goto_0
    return v0

    .line 251
    .restart local v1    # "operator":Ljava/lang/String;
    .restart local v2    # "telManager":Landroid/telephony/TelephonyManager;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 254
    .end local v1    # "operator":Ljava/lang/String;
    .end local v2    # "telManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static isGoingToResetPrepaidAccount(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1074
    sget-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v0, :cond_0

    .line 1075
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 1076
    :cond_0
    sget-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->isGoingToResetPrepaidAccount:Z

    return v0
.end method

.method public static isHKT(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 970
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isNormalPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isHelloPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPostpaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isHKTPostpaid(Landroid/content/Context;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 997
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "PREF_POSTPAID_PREPAID_MODE_PREFERENCE_KEY"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 999
    .local v0, "prepaidPostpaidMode":I
    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public static isHKTPostpaidTCAccepted(Landroid/content/Context;)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 184
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v1, :cond_0

    .line 185
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 192
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 193
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string/jumbo v1, "CLIENT_STATE_POSTPAID_TNC_KEY"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public static isHKTPrepaid(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 988
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isNormalPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isHelloPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isHKTPrepaidTCAccepted(Landroid/content/Context;)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 197
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v1, :cond_0

    .line 198
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 200
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 201
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string/jumbo v1, "CLIENT_STATE_PREPAID_TNC_KEY"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public static isHelloPrepaid(Landroid/content/Context;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 983
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "PREF_POSTPAID_PREPAID_MODE_PREFERENCE_KEY"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 984
    .local v0, "prepaidPostpaidMode":I
    const/4 v2, 0x4

    if-ne v0, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public static isNormalPrepaid(Landroid/content/Context;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 978
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "PREF_POSTPAID_PREPAID_MODE_PREFERENCE_KEY"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 979
    .local v0, "prepaidPostpaidMode":I
    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public static isNotShowSMSConsumeWarmingCheckBox(Landroid/content/Context;)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1129
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v1, :cond_0

    .line 1130
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 1137
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1138
    .local v0, "pref":Landroid/content/SharedPreferences;
    const-string/jumbo v1, "NOT_SHOW_SMS_CONSUME_WARMING_CHECKBOX_KEY"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method public static isOperatorCSL(Landroid/content/Context;)Z
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 291
    const/4 v0, 0x0

    .line 293
    .local v0, "isCSLSim":Z
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->useFirstSim:Z

    if-eqz v1, :cond_0

    .line 294
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isFirstOperatorCSL(Landroid/content/Context;)Z

    move-result v0

    .line 298
    :goto_0
    return v0

    .line 296
    :cond_0
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isSecondOperatorCSL(Landroid/content/Context;)Z

    move-result v0

    goto :goto_0
.end method

.method public static isOperatorPccw(Landroid/content/Context;)Z
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 225
    const/4 v0, 0x0

    .line 227
    .local v0, "isPccwSim":Z
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->useFirstSim:Z

    if-eqz v1, :cond_0

    .line 229
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isFirstOperatorPccw(Landroid/content/Context;)Z

    move-result v0

    .line 234
    :goto_0
    return v0

    .line 232
    :cond_0
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isSecondOperatorPccw(Landroid/content/Context;)Z

    move-result v0

    goto :goto_0
.end method

.method public static isPostpaid(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 966
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPostpaid(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPostpaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isPrepaid(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 974
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isNormalPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isHelloPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isRegisteredPrepaid(Landroid/content/Context;)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1028
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "PREF_IS_REGISTERED_PREPAID"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSecondOperatorCSL(Landroid/content/Context;)Z
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 331
    const/4 v0, 0x0

    .line 333
    .local v0, "isCSLSim":Z
    :try_start_0
    const-string/jumbo v3, "phone"

    .line 334
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 335
    .local v2, "telManager":Landroid/telephony/TelephonyManager;
    if-eqz v2, :cond_1

    .line 336
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    const/4 v4, 0x5

    if-ne v3, v4, :cond_1

    .line 337
    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->getSecondSimOperator(Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 340
    .local v1, "operator":Ljava/lang/String;
    const-string/jumbo v3, "45400"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "45402"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "45410"

    .line 341
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "45418"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_2

    :cond_0
    const/4 v0, 0x1

    .line 348
    .end local v1    # "operator":Ljava/lang/String;
    .end local v2    # "telManager":Landroid/telephony/TelephonyManager;
    :cond_1
    :goto_0
    return v0

    .line 341
    .restart local v1    # "operator":Ljava/lang/String;
    .restart local v2    # "telManager":Landroid/telephony/TelephonyManager;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 344
    .end local v1    # "operator":Ljava/lang/String;
    .end local v2    # "telManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static isSecondOperatorPccw(Landroid/content/Context;)Z
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 266
    const/4 v0, 0x0

    .line 268
    .local v0, "isPccwSim":Z
    :try_start_0
    const-string/jumbo v3, "phone"

    .line 269
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 270
    .local v2, "telManager":Landroid/telephony/TelephonyManager;
    if-eqz v2, :cond_1

    .line 271
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    const/4 v4, 0x5

    if-ne v3, v4, :cond_1

    .line 272
    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->getSecondSimOperator(Landroid/telephony/TelephonyManager;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 275
    .local v1, "operator":Ljava/lang/String;
    const-string/jumbo v3, "45416"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "45419"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_2

    :cond_0
    const/4 v0, 0x1

    .line 282
    .end local v1    # "operator":Ljava/lang/String;
    .end local v2    # "telManager":Landroid/telephony/TelephonyManager;
    :cond_1
    :goto_0
    return v0

    .line 275
    .restart local v1    # "operator":Ljava/lang/String;
    .restart local v2    # "telManager":Landroid/telephony/TelephonyManager;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 278
    .end local v1    # "operator":Ljava/lang/String;
    .end local v2    # "telManager":Landroid/telephony/TelephonyManager;
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static isSecondOperatorSim(Landroid/content/Context;)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 357
    const/4 v0, 0x0

    .line 358
    .local v0, "is2NSim":Z
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isOperatorPccw(Landroid/content/Context;)Z

    move-result v1

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isOperatorCSL(Landroid/content/Context;)Z

    move-result v2

    or-int/2addr v1, v2

    if-nez v1, :cond_0

    const/4 v0, 0x1

    .line 363
    :goto_0
    return v0

    .line 358
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isSupportSMS(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1182
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isPostpaid(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public static isUnknownMode(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 154
    sget-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v0, :cond_0

    .line 155
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 156
    :cond_0
    sget v0, Lcom/pccw/mobile/sip/ClientStateManager;->mode:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static obtainFirstImsi(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 763
    const-string/jumbo v2, "phone"

    .line 764
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 770
    .local v1, "telManager":Landroid/telephony/TelephonyManager;
    if-nez v1, :cond_1

    .line 771
    const-string/jumbo v0, ""

    .line 795
    :cond_0
    :goto_0
    return-object v0

    .line 773
    :cond_1
    const/4 v0, 0x0

    .line 775
    .local v0, "newImsi":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v2

    const/4 v3, 0x5

    if-ne v2, v3, :cond_2

    .line 777
    :try_start_0
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 784
    :cond_2
    :goto_1
    if-nez v0, :cond_3

    .line 785
    const-string/jumbo v0, ""

    goto :goto_0

    .line 787
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 788
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xf

    if-eq v2, v3, :cond_0

    .line 789
    const-string/jumbo v0, ""

    goto :goto_0

    .line 778
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method public static obtainImsi(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 747
    const/4 v0, 0x0

    .line 748
    .local v0, "newImsi":Ljava/lang/String;
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->useFirstSim:Z

    if-eqz v1, :cond_0

    .line 750
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->obtainFirstImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 759
    :goto_0
    return-object v0

    .line 753
    :cond_0
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->obtainSecondImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static obtainSecondImsi(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 799
    const-string/jumbo v2, "phone"

    .line 800
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 805
    .local v1, "telManager":Landroid/telephony/TelephonyManager;
    if-nez v1, :cond_1

    .line 806
    const-string/jumbo v0, ""

    .line 830
    :cond_0
    :goto_0
    return-object v0

    .line 808
    :cond_1
    const/4 v0, 0x0

    .line 810
    .local v0, "newImsi":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v2

    const/4 v3, 0x5

    if-ne v2, v3, :cond_2

    .line 812
    :try_start_0
    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->getSecondImsi(Landroid/telephony/TelephonyManager;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 819
    :cond_2
    :goto_1
    if-nez v0, :cond_3

    .line 820
    const-string/jumbo v0, ""

    goto :goto_0

    .line 822
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 823
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xf

    if-eq v2, v3, :cond_0

    .line 824
    const-string/jumbo v0, ""

    goto :goto_0

    .line 813
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method private static readLastState(Landroid/content/Context;)V
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    .line 709
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 711
    .local v1, "pref":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "CLIENT_STATE_ENCRYPTED_PCCW_IMSI_KEY"

    const-string/jumbo v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi:Ljava/lang/String;

    .line 712
    const-string/jumbo v3, "CLIENT_STATE_ENCRYPTED_PCCW_IMSI2_KEY"

    const-string/jumbo v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi2:Ljava/lang/String;

    .line 713
    const-string/jumbo v3, "PREF_USE_FIRST_SIM_SLOT"

    invoke-interface {v1, v3, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lcom/pccw/mobile/sip/ClientStateManager;->useFirstSim:Z

    .line 719
    const-string/jumbo v3, "CLIENT_STATE_ENCRYPTED_PHONE_KEY"

    const-string/jumbo v4, ""

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->phone:Ljava/lang/String;

    .line 720
    sget-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->phone:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 721
    sget-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->phone:Ljava/lang/String;

    invoke-static {v3}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesDecryptByMasterKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->phone:Ljava/lang/String;

    .line 722
    :cond_0
    const-string/jumbo v3, "phone"

    .line 723
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/telephony/TelephonyManager;

    .line 724
    .local v2, "telManager":Landroid/telephony/TelephonyManager;
    if-eqz v2, :cond_2

    .line 726
    :try_start_0
    invoke-virtual {v2}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedDeviceId:Ljava/lang/String;

    .line 727
    sget-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedDeviceId:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 728
    sget-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedDeviceId:Ljava/lang/String;

    .line 729
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 728
    invoke-static {v3}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByMasterKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedDeviceId:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 739
    :goto_0
    sput-boolean v5, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    .line 740
    return-void

    .line 731
    :cond_1
    :try_start_1
    const-string/jumbo v3, "Unknown Device"

    sput-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedDeviceId:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 732
    :catch_0
    move-exception v0

    .line 735
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v3, "Unknown Device"

    sput-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedDeviceId:Ljava/lang/String;

    goto :goto_0

    .line 738
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    const-string/jumbo v3, "Unknown Device"

    sput-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedDeviceId:Ljava/lang/String;

    goto :goto_0
.end method

.method public static reset(Landroid/content/Context;)V
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 705
    const/4 v0, 0x0

    sput-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    .line 706
    return-void
.end method

.method public static resetRegisteredPrepaid(Landroid/content/Context;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1042
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1043
    .local v0, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "PREF_IS_REGISTERED_PREPAID"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1045
    const/4 v1, 0x1

    return v1
.end method

.method public static setCSLPostpaidTcAccepted(Landroid/content/Context;Z)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "accepted"    # Z

    .prologue
    .line 616
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v1, :cond_0

    .line 617
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 619
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 621
    .local v0, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CLIENT_STATE_CSL_TNC_KEY"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 622
    const/4 v1, 0x1

    return v1
.end method

.method public static setCSLPrepaidTcAccepted(Landroid/content/Context;Z)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "accepted"    # Z

    .prologue
    .line 626
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v1, :cond_0

    .line 627
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 629
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 631
    .local v0, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CLIENT_CSL_PREPAID_TNC_KEY"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 632
    const/4 v1, 0x1

    return v1
.end method

.method public static setIsGoingToResetPrepaidAccount(Landroid/content/Context;Z)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "state"    # Z

    .prologue
    .line 1081
    sget-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v0, :cond_0

    .line 1082
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 1083
    :cond_0
    sput-boolean p1, Lcom/pccw/mobile/sip/ClientStateManager;->isGoingToResetPrepaidAccount:Z

    .line 1084
    const/4 v0, 0x1

    return v0
.end method

.method public static setJustSwitchAccount(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 692
    sget-boolean v0, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v0, :cond_0

    .line 693
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 698
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public static setPostpaidPrepaidMode(Landroid/content/Context;I)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "state"    # I

    .prologue
    const/16 v2, 0x63

    .line 1049
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v1, :cond_0

    .line 1050
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 1051
    :cond_0
    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    const/4 v1, 0x3

    if-eq p1, v1, :cond_1

    const/4 v1, 0x4

    if-eq p1, v1, :cond_1

    const/4 v1, 0x5

    if-eq p1, v1, :cond_1

    const/4 v1, 0x6

    if-eq p1, v1, :cond_1

    const/4 v1, 0x7

    if-eq p1, v1, :cond_1

    if-ne p1, v2, :cond_2

    .line 1054
    :cond_1
    sput p1, Lcom/pccw/mobile/sip/ClientStateManager;->postpaid_prepaid_mode:I

    .line 1056
    if-eq p1, v2, :cond_2

    .line 1058
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1059
    .local v0, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "PREF_POSTPAID_PREPAID_MODE_PREFERENCE_KEY"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1063
    .end local v0    # "pref":Landroid/content/SharedPreferences;
    :cond_2
    const/4 v1, 0x1

    return v1
.end method

.method public static setPostpaidTcAccepted(Landroid/content/Context;Z)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "accepted"    # Z

    .prologue
    .line 579
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v1, :cond_0

    .line 580
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 582
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 601
    .local v0, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CLIENT_STATE_POSTPAID_TNC_KEY"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 602
    const/4 v1, 0x1

    return v1
.end method

.method public static setPrepaidTcAccepted(Landroid/content/Context;Z)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "accepted"    # Z

    .prologue
    .line 606
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v1, :cond_0

    .line 607
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 609
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 611
    .local v0, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CLIENT_STATE_PREPAID_TNC_KEY"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 612
    const/4 v1, 0x1

    return v1
.end method

.method public static setPushNotificationRegId(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "regId"    # Ljava/lang/String;

    .prologue
    .line 1188
    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1189
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "PUSH_NOTI_REGID"

    invoke-interface {v2, v3, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1193
    const/4 v2, 0x1

    .end local v1    # "pref":Landroid/content/SharedPreferences;
    :goto_0
    return v2

    .line 1190
    :catch_0
    move-exception v0

    .line 1191
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static setPushNotificationRegVersion(Landroid/content/Context;I)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "version"    # I

    .prologue
    .line 1202
    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1203
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "PUSH_NOTI_REG_VERSION"

    invoke-interface {v2, v3, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1207
    const/4 v2, 0x1

    .end local v1    # "pref":Landroid/content/SharedPreferences;
    :goto_0
    return v2

    .line 1204
    :catch_0
    move-exception v0

    .line 1205
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static setRegisteredNumber(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "prepaidNumber"    # Ljava/lang/String;

    .prologue
    .line 1119
    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1120
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "PREF_REGISTERED_NUMBER_PREFENENCE_KEY"

    invoke-interface {v2, v3, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1124
    const/4 v2, 0x1

    .end local v1    # "pref":Landroid/content/SharedPreferences;
    :goto_0
    return v2

    .line 1121
    :catch_0
    move-exception v0

    .line 1122
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static setRegisteredPrepaid(Landroid/content/Context;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x1

    .line 1034
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1035
    .local v0, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "PREF_IS_REGISTERED_PREPAID"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1037
    return v3
.end method

.method public static setRegisteredPrepaidNumberPassword(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "prepaidNumber"    # Ljava/lang/String;

    .prologue
    .line 1172
    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1173
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "PREF_PREPAID_REGISTERED_NUMBER_PASSWORD"

    invoke-interface {v2, v3, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 1174
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1178
    const/4 v2, 0x1

    .end local v1    # "pref":Landroid/content/SharedPreferences;
    :goto_0
    return v2

    .line 1175
    :catch_0
    move-exception v0

    .line 1176
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static setSMSConsumeWarmingCheckBoxStatus(Landroid/content/Context;)Z
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 1143
    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1144
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "NOT_SHOW_SMS_CONSUME_WARMING_CHECKBOX_KEY"

    const/4 v5, 0x1

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1148
    .end local v1    # "pref":Landroid/content/SharedPreferences;
    :goto_0
    return v2

    .line 1145
    :catch_0
    move-exception v0

    .line 1146
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static updatePccwImsi(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "imsiEncrypted"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    .line 508
    sget-boolean v1, Lcom/pccw/mobile/sip/ClientStateManager;->isInit:Z

    if-nez v1, :cond_0

    .line 509
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->readLastState(Landroid/content/Context;)V

    .line 511
    :cond_0
    if-nez p1, :cond_1

    const-string/jumbo p1, ""

    .end local p1    # "imsiEncrypted":Ljava/lang/String;
    :cond_1
    sput-object p1, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi:Ljava/lang/String;

    .line 512
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 513
    .local v0, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CLIENT_STATE_ENCRYPTED_PCCW_IMSI_KEY"

    sget-object v3, Lcom/pccw/mobile/sip/ClientStateManager;->encryptedPccwImsi:Ljava/lang/String;

    .line 514
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CLIENT_STATE_ENCRYPTED_PCCW_IMSI2_KEY"

    const-string/jumbo v3, ""

    .line 515
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "PREF_USE_FIRST_SIM_SLOT"

    .line 516
    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 517
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 518
    return v4
.end method

.method public static updatePrefForSimChange(Landroid/content/Context;)V
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 403
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->detectAndUpdateSimSlot(Landroid/content/Context;)V

    .line 405
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 407
    .local v0, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CLIENT_STATE_ENCRYPTED_PHONE_KEY"

    const-string/jumbo v3, ""

    .line 408
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CLIENT_STATE_POSTPAID_TNC_KEY"

    .line 409
    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CLIENT_STATE_PREPAID_TNC_KEY"

    .line 410
    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CLIENT_STATE_CSL_TNC_KEY"

    .line 411
    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CLIENT_CSL_PREPAID_TNC_KEY"

    .line 412
    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 414
    return-void
.end method
