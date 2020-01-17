.class public Lorg/linphone/core/LinphoneCoreFactoryImpl;
.super Lorg/linphone/core/LinphoneCoreFactory;
.source "LinphoneCoreFactoryImpl.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    const-string/jumbo v0, "c++_shared"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 47
    const-string/jumbo v0, "ffmpeg-linphone"

    invoke-static {v0}, Lorg/linphone/core/LinphoneCoreFactoryImpl;->loadOptionalLibrary(Ljava/lang/String;)Z

    .line 48
    const-string/jumbo v0, "bctoolbox"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 49
    const-string/jumbo v0, "ortp"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 50
    const-string/jumbo v0, "mediastreamer_base"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 51
    const-string/jumbo v0, "mediastreamer_voip"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 52
    const-string/jumbo v0, "linphone"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 53
    invoke-static {}, Lorg/linphone/mediastream/Version;->dumpCapabilities()V

    .line 54
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreFactory;-><init>()V

    return-void
.end method

.method private native _createTunnelConfig()Ljava/lang/Object;
.end method

.method private native _setLogHandler(Ljava/lang/Object;)V
.end method

.method private native createErrorInfoNative()J
.end method

.method private native getAllDialPlanNative()[Lorg/linphone/core/DialPlan;
.end method

.method public static isArmv7()Z
    .locals 2

    .prologue
    .line 180
    const-string/jumbo v0, "os.arch"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "armv7"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method private static loadOptionalLibrary(Ljava/lang/String;)Z
    .locals 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 37
    :try_start_0
    invoke-static {p0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    const/4 v1, 0x1

    .line 42
    :goto_0
    return v1

    .line 39
    :catch_0
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/Throwable;
    const-string/jumbo v1, "LinphoneCoreFactoryImpl"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unable to load optional library "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private loadingDownloadedOpenH264(Landroid/content/Context;)Z
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 82
    new-instance v1, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v5

    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/libmsopenh264.so"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 84
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 85
    new-array v4, v6, [Ljava/lang/Object;

    const-string/jumbo v5, "LinphoneCoreFactoryImpl"

    aput-object v5, v4, v2

    const-string/jumbo v5, " libmsopenh264 not found, we disable the download of Openh264"

    aput-object v5, v4, v3

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 96
    :goto_0
    return v2

    .line 89
    :cond_0
    new-instance v0, Lorg/linphone/tools/OpenH264DownloadHelper;

    invoke-direct {v0, p1}, Lorg/linphone/tools/OpenH264DownloadHelper;-><init>(Landroid/content/Context;)V

    .line 90
    .local v0, "downloadHelper":Lorg/linphone/tools/OpenH264DownloadHelper;
    invoke-virtual {v0}, Lorg/linphone/tools/OpenH264DownloadHelper;->isCodecFound()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 91
    new-array v4, v6, [Ljava/lang/Object;

    const-string/jumbo v5, "LinphoneCoreFactoryImpl"

    aput-object v5, v4, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, " Loading OpenH264 downloaded plugin:"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/linphone/tools/OpenH264DownloadHelper;->getFullPathLib()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v3

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 92
    invoke-virtual {v0}, Lorg/linphone/tools/OpenH264DownloadHelper;->getFullPathLib()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/System;->load(Ljava/lang/String;)V

    :goto_1
    move v2, v3

    .line 96
    goto :goto_0

    .line 94
    :cond_1
    new-array v4, v6, [Ljava/lang/Object;

    const-string/jumbo v5, "LinphoneCoreFactoryImpl"

    aput-object v5, v4, v2

    const-string/jumbo v2, " Cannot load OpenH264 downloaded plugin"

    aput-object v2, v4, v3

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    goto :goto_1
.end method

.method private setSpeaker(Lorg/linphone/core/LinphoneCore;)V
    .locals 2
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;

    .prologue
    .line 100
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getMSFactory()Lorg/linphone/mediastream/Factory;

    move-result-object v1

    invoke-static {v1}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->getSpeakerphoneAlwaysOn(Lorg/linphone/mediastream/Factory;)Z

    move-result v0

    .line 101
    .local v0, "value":Z
    invoke-interface {p1, v0}, Lorg/linphone/core/LinphoneCore;->setSpeakerphoneAlwaysOn(Z)V

    .line 102
    invoke-interface {p1, v0}, Lorg/linphone/core/LinphoneCore;->enableSpeaker(Z)V

    .line 103
    return-void
.end method


# virtual methods
.method public createAccountCreator(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)Lorg/linphone/core/LinphoneAccountCreator;
    .locals 1
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 234
    new-instance v0, Lorg/linphone/core/LinphoneAccountCreatorImpl;

    invoke-direct {v0, p1, p2}, Lorg/linphone/core/LinphoneAccountCreatorImpl;-><init>(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V

    return-object v0
.end method

.method public createAuthInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/linphone/core/LinphoneAuthInfo;
    .locals 1
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "realm"    # Ljava/lang/String;
    .param p4, "domain"    # Ljava/lang/String;

    .prologue
    .line 58
    new-instance v0, Lorg/linphone/core/LinphoneAuthInfoImpl;

    invoke-direct {v0, p1, p2, p3, p4}, Lorg/linphone/core/LinphoneAuthInfoImpl;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public createAuthInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/linphone/core/LinphoneAuthInfo;
    .locals 7
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "userid"    # Ljava/lang/String;
    .param p3, "passwd"    # Ljava/lang/String;
    .param p4, "ha1"    # Ljava/lang/String;
    .param p5, "realm"    # Ljava/lang/String;
    .param p6, "domain"    # Ljava/lang/String;

    .prologue
    .line 186
    new-instance v0, Lorg/linphone/core/LinphoneAuthInfoImpl;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lorg/linphone/core/LinphoneAuthInfoImpl;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public createErrorInfo()Lorg/linphone/core/ErrorInfo;
    .locals 4

    .prologue
    .line 246
    new-instance v0, Lorg/linphone/core/ErrorInfoImpl;

    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreFactoryImpl;->createErrorInfoNative()J

    move-result-wide v2

    const/4 v1, 0x1

    invoke-direct {v0, v2, v3, v1}, Lorg/linphone/core/ErrorInfoImpl;-><init>(JZ)V

    return-object v0
.end method

.method public createLinphoneAddress(Ljava/lang/String;)Lorg/linphone/core/LinphoneAddress;
    .locals 1
    .param p1, "identity"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 69
    new-instance v0, Lorg/linphone/core/LinphoneAddressImpl;

    invoke-direct {v0, p1}, Lorg/linphone/core/LinphoneAddressImpl;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public createLinphoneAddress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/linphone/core/LinphoneAddress;
    .locals 1
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "domain"    # Ljava/lang/String;
    .param p3, "displayName"    # Ljava/lang/String;

    .prologue
    .line 64
    new-instance v0, Lorg/linphone/core/LinphoneAddressImpl;

    invoke-direct {v0, p1, p2, p3}, Lorg/linphone/core/LinphoneAddressImpl;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public createLinphoneContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/linphone/core/LinphoneContent;
    .locals 3
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "subType"    # Ljava/lang/String;
    .param p3, "data"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 198
    new-instance v2, Lorg/linphone/core/LinphoneContentImpl;

    if-nez p3, :cond_0

    move-object v0, v1

    :goto_0
    invoke-direct {v2, p1, p2, v0, v1}, Lorg/linphone/core/LinphoneContentImpl;-><init>(Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;)V

    return-object v2

    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    goto :goto_0
.end method

.method public createLinphoneContent(Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;)Lorg/linphone/core/LinphoneContent;
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "subType"    # Ljava/lang/String;
    .param p3, "data"    # [B
    .param p4, "encoding"    # Ljava/lang/String;

    .prologue
    .line 192
    new-instance v0, Lorg/linphone/core/LinphoneContentImpl;

    invoke-direct {v0, p1, p2, p3, p4}, Lorg/linphone/core/LinphoneContentImpl;-><init>(Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;)V

    return-object v0
.end method

.method public createLinphoneCore(Lorg/linphone/core/LinphoneCoreListener;Ljava/lang/Object;)Lorg/linphone/core/LinphoneCore;
    .locals 6
    .param p1, "listener"    # Lorg/linphone/core/LinphoneCoreListener;
    .param p2, "context"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 128
    :try_start_0
    move-object v0, p2

    check-cast v0, Landroid/content/Context;

    move-object v4, v0

    iput-object v4, p0, Lorg/linphone/core/LinphoneCoreFactoryImpl;->fcontext:Landroid/content/Context;

    .line 129
    const/4 v3, 0x0

    .line 130
    .local v3, "openh264DownloadEnabled":Z
    if-eqz p2, :cond_0

    iget-object v4, p0, Lorg/linphone/core/LinphoneCoreFactoryImpl;->fcontext:Landroid/content/Context;

    invoke-direct {p0, v4}, Lorg/linphone/core/LinphoneCoreFactoryImpl;->loadingDownloadedOpenH264(Landroid/content/Context;)Z

    move-result v3

    .line 131
    :cond_0
    invoke-static {p2}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->setContext(Ljava/lang/Object;)V

    .line 132
    new-instance v2, Lorg/linphone/core/LinphoneCoreImpl;

    invoke-direct {v2, p1, p2}, Lorg/linphone/core/LinphoneCoreImpl;-><init>(Lorg/linphone/core/LinphoneCoreListener;Ljava/lang/Object;)V

    .line 133
    .local v2, "lc":Lorg/linphone/core/LinphoneCore;
    invoke-direct {p0, v2}, Lorg/linphone/core/LinphoneCoreFactoryImpl;->setSpeaker(Lorg/linphone/core/LinphoneCore;)V

    .line 134
    invoke-interface {v2, v3}, Lorg/linphone/core/LinphoneCore;->enableDownloadOpenH264(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    return-object v2

    .line 136
    .end local v2    # "lc":Lorg/linphone/core/LinphoneCore;
    .end local v3    # "openh264DownloadEnabled":Z
    :catch_0
    move-exception v1

    .line 137
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Lorg/linphone/core/LinphoneCoreException;

    const-string/jumbo v5, "Cannot create LinphoneCore"

    invoke-direct {v4, v5, v1}, Lorg/linphone/core/LinphoneCoreException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public createLinphoneCore(Lorg/linphone/core/LinphoneCoreListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/linphone/core/LinphoneCore;
    .locals 9
    .param p1, "listener"    # Lorg/linphone/core/LinphoneCoreListener;
    .param p2, "userConfig"    # Ljava/lang/String;
    .param p3, "factoryConfig"    # Ljava/lang/String;
    .param p4, "userdata"    # Ljava/lang/Object;
    .param p5, "context"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 110
    :try_start_0
    move-object v0, p5

    check-cast v0, Landroid/content/Context;

    move-object v2, v0

    iput-object v2, p0, Lorg/linphone/core/LinphoneCoreFactoryImpl;->fcontext:Landroid/content/Context;

    .line 111
    const/4 v8, 0x0

    .line 112
    .local v8, "openh264DownloadEnabled":Z
    if-eqz p5, :cond_0

    iget-object v2, p0, Lorg/linphone/core/LinphoneCoreFactoryImpl;->fcontext:Landroid/content/Context;

    invoke-direct {p0, v2}, Lorg/linphone/core/LinphoneCoreFactoryImpl;->loadingDownloadedOpenH264(Landroid/content/Context;)Z

    move-result v8

    .line 113
    :cond_0
    invoke-static {p5}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->setContext(Ljava/lang/Object;)V

    .line 114
    if-nez p2, :cond_1

    move-object v3, v4

    .line 115
    .local v3, "user":Ljava/io/File;
    :goto_0
    if-nez p3, :cond_2

    .line 116
    .local v4, "factory":Ljava/io/File;
    :goto_1
    new-instance v1, Lorg/linphone/core/LinphoneCoreImpl;

    move-object v2, p1

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v1 .. v6}, Lorg/linphone/core/LinphoneCoreImpl;-><init>(Lorg/linphone/core/LinphoneCoreListener;Ljava/io/File;Ljava/io/File;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 117
    .local v1, "lc":Lorg/linphone/core/LinphoneCore;
    invoke-direct {p0, v1}, Lorg/linphone/core/LinphoneCoreFactoryImpl;->setSpeaker(Lorg/linphone/core/LinphoneCore;)V

    .line 118
    invoke-interface {v1, v8}, Lorg/linphone/core/LinphoneCore;->enableDownloadOpenH264(Z)V

    .line 119
    return-object v1

    .line 114
    .end local v1    # "lc":Lorg/linphone/core/LinphoneCore;
    .end local v3    # "user":Ljava/io/File;
    .end local v4    # "factory":Ljava/io/File;
    :cond_1
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 120
    .end local v8    # "openh264DownloadEnabled":Z
    :catch_0
    move-exception v7

    .line 121
    .local v7, "e":Ljava/io/IOException;
    new-instance v2, Lorg/linphone/core/LinphoneCoreException;

    const-string/jumbo v5, "Cannot create LinphoneCore"

    invoke-direct {v2, v5, v7}, Lorg/linphone/core/LinphoneCoreException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 115
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v3    # "user":Ljava/io/File;
    .restart local v8    # "openh264DownloadEnabled":Z
    :cond_2
    :try_start_1
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public createLinphoneFriend()Lorg/linphone/core/LinphoneFriend;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 169
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/linphone/core/LinphoneCoreFactoryImpl;->createLinphoneFriend(Ljava/lang/String;)Lorg/linphone/core/LinphoneFriend;

    move-result-object v0

    return-object v0
.end method

.method public createLinphoneFriend(Ljava/lang/String;)Lorg/linphone/core/LinphoneFriend;
    .locals 1
    .param p1, "friendUri"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 163
    new-instance v0, Lorg/linphone/core/LinphoneFriendImpl;

    invoke-direct {v0, p1}, Lorg/linphone/core/LinphoneFriendImpl;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public createLpConfig(Ljava/lang/String;)Lorg/linphone/core/LpConfig;
    .locals 1
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 74
    invoke-static {p1}, Lorg/linphone/core/LpConfigImpl;->fromFile(Ljava/lang/String;)Lorg/linphone/core/LpConfigImpl;

    move-result-object v0

    return-object v0
.end method

.method public createLpConfigFromString(Ljava/lang/String;)Lorg/linphone/core/LpConfig;
    .locals 1
    .param p1, "buffer"    # Ljava/lang/String;

    .prologue
    .line 78
    invoke-static {p1}, Lorg/linphone/core/LpConfigImpl;->fromBuffer(Ljava/lang/String;)Lorg/linphone/core/LpConfigImpl;

    move-result-object v0

    return-object v0
.end method

.method public createOpenH264DownloadHelper()Lorg/linphone/tools/OpenH264DownloadHelper;
    .locals 2

    .prologue
    .line 153
    iget-object v0, p0, Lorg/linphone/core/LinphoneCoreFactoryImpl;->fcontext:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 154
    new-instance v0, Lorg/linphone/core/LinphoneCoreException;

    const-string/jumbo v1, "Cannot create OpenH264DownloadHelper"

    invoke-direct {v0, v1}, Lorg/linphone/core/LinphoneCoreException;-><init>(Ljava/lang/String;)V

    .line 155
    const/4 v0, 0x0

    .line 157
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/linphone/tools/OpenH264DownloadHelper;

    iget-object v1, p0, Lorg/linphone/core/LinphoneCoreFactoryImpl;->fcontext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lorg/linphone/tools/OpenH264DownloadHelper;-><init>(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public createPresenceActivity(Lorg/linphone/core/PresenceActivityType;Ljava/lang/String;)Lorg/linphone/core/PresenceActivity;
    .locals 1
    .param p1, "type"    # Lorg/linphone/core/PresenceActivityType;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 203
    new-instance v0, Lorg/linphone/core/PresenceActivityImpl;

    invoke-direct {v0, p1, p2}, Lorg/linphone/core/PresenceActivityImpl;-><init>(Lorg/linphone/core/PresenceActivityType;Ljava/lang/String;)V

    return-object v0
.end method

.method public createPresenceModel()Lorg/linphone/core/PresenceModel;
    .locals 1

    .prologue
    .line 213
    new-instance v0, Lorg/linphone/core/PresenceModelImpl;

    invoke-direct {v0}, Lorg/linphone/core/PresenceModelImpl;-><init>()V

    return-object v0
.end method

.method public createPresenceModel(Lorg/linphone/core/PresenceActivityType;Ljava/lang/String;)Lorg/linphone/core/PresenceModel;
    .locals 1
    .param p1, "type"    # Lorg/linphone/core/PresenceActivityType;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 218
    new-instance v0, Lorg/linphone/core/PresenceModelImpl;

    invoke-direct {v0, p1, p2}, Lorg/linphone/core/PresenceModelImpl;-><init>(Lorg/linphone/core/PresenceActivityType;Ljava/lang/String;)V

    return-object v0
.end method

.method public createPresenceModel(Lorg/linphone/core/PresenceActivityType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/linphone/core/PresenceModel;
    .locals 1
    .param p1, "type"    # Lorg/linphone/core/PresenceActivityType;
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "note"    # Ljava/lang/String;
    .param p4, "lang"    # Ljava/lang/String;

    .prologue
    .line 223
    new-instance v0, Lorg/linphone/core/PresenceModelImpl;

    invoke-direct {v0, p1, p2, p3, p4}, Lorg/linphone/core/PresenceModelImpl;-><init>(Lorg/linphone/core/PresenceActivityType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public createPresenceService(Ljava/lang/String;Lorg/linphone/core/PresenceBasicStatus;Ljava/lang/String;)Lorg/linphone/core/PresenceService;
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "status"    # Lorg/linphone/core/PresenceBasicStatus;
    .param p3, "contact"    # Ljava/lang/String;

    .prologue
    .line 208
    new-instance v0, Lorg/linphone/core/PresenceServiceImpl;

    invoke-direct {v0, p1, p2, p3}, Lorg/linphone/core/PresenceServiceImpl;-><init>(Ljava/lang/String;Lorg/linphone/core/PresenceBasicStatus;Ljava/lang/String;)V

    return-object v0
.end method

.method public createTunnelConfig()Lorg/linphone/core/TunnelConfig;
    .locals 1

    .prologue
    .line 229
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreFactoryImpl;->_createTunnelConfig()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/TunnelConfig;

    return-object v0
.end method

.method public native enableLogCollection(Z)V
.end method

.method public getAllDialPlan()[Lorg/linphone/core/DialPlan;
    .locals 1

    .prologue
    .line 240
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreFactoryImpl;->getAllDialPlanNative()[Lorg/linphone/core/DialPlan;

    move-result-object v0

    return-object v0
.end method

.method public native setDebugMode(ZLjava/lang/String;)V
.end method

.method public native setLogCollectionPath(Ljava/lang/String;)V
.end method

.method public setLogHandler(Lorg/linphone/core/LinphoneLogHandler;)V
    .locals 0
    .param p1, "handler"    # Lorg/linphone/core/LinphoneLogHandler;

    .prologue
    .line 148
    invoke-direct {p0, p1}, Lorg/linphone/core/LinphoneCoreFactoryImpl;->_setLogHandler(Ljava/lang/Object;)V

    .line 149
    return-void
.end method
