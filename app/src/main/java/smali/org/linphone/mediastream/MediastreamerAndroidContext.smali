.class public Lorg/linphone/mediastream/MediastreamerAndroidContext;
.super Ljava/lang/Object;
.source "MediastreamerAndroidContext.java"


# static fields
.field private static final DEVICE_CHOICE:I = 0x0

.field public static final DEVICE_HAS_BUILTIN_AEC:I = 0x1

.field public static final DEVICE_HAS_BUILTIN_AEC_CRAPPY:I = 0x2

.field public static final DEVICE_HAS_BUILTIN_OPENSLES_AEC:I = 0x8

.field public static final DEVICE_USE_ANDROID_CAMCORDER:I = 0x200

.field public static final DEVICE_USE_ANDROID_MIC:I = 0x4

.field private static instance:Lorg/linphone/mediastream/MediastreamerAndroidContext;

.field private static mContext:Landroid/content/Context;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method public static enableFilterFromName(Ljava/lang/String;Z)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "enable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/mediastream/MediastreamException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-static {}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->getInstance()Lorg/linphone/mediastream/MediastreamerAndroidContext;

    move-result-object v0

    invoke-direct {v0, p0, p1}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->enableFilterFromNameImpl(Ljava/lang/String;Z)I

    move-result v0

    if-eqz v0, :cond_1

    .line 111
    new-instance v1, Lorg/linphone/mediastream/MediastreamException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Cannot "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p1, :cond_0

    const-string/jumbo v0, "enable"

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " filter  name ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "]"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/linphone/mediastream/MediastreamException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    const-string/jumbo v0, "disable"

    goto :goto_0

    .line 112
    :cond_1
    return-void
.end method

.method private native enableFilterFromNameImpl(Ljava/lang/String;Z)I
.end method

.method public static filterFromNameEnabled(Ljava/lang/String;)Z
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-static {}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->getInstance()Lorg/linphone/mediastream/MediastreamerAndroidContext;

    move-result-object v0

    invoke-direct {v0, p0}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->filterFromNameEnabledImpl(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private native filterFromNameEnabledImpl(Ljava/lang/String;)Z
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Lorg/linphone/mediastream/MediastreamerAndroidContext;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private static getInstance()Lorg/linphone/mediastream/MediastreamerAndroidContext;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lorg/linphone/mediastream/MediastreamerAndroidContext;->instance:Lorg/linphone/mediastream/MediastreamerAndroidContext;

    if-nez v0, :cond_0

    .line 47
    new-instance v0, Lorg/linphone/mediastream/MediastreamerAndroidContext;

    invoke-direct {v0}, Lorg/linphone/mediastream/MediastreamerAndroidContext;-><init>()V

    sput-object v0, Lorg/linphone/mediastream/MediastreamerAndroidContext;->instance:Lorg/linphone/mediastream/MediastreamerAndroidContext;

    .line 48
    :cond_0
    sget-object v0, Lorg/linphone/mediastream/MediastreamerAndroidContext;->instance:Lorg/linphone/mediastream/MediastreamerAndroidContext;

    return-object v0
.end method

.method public static getSpeakerphoneAlwaysOn(Lorg/linphone/mediastream/Factory;)Z
    .locals 1
    .param p0, "factory"    # Lorg/linphone/mediastream/Factory;

    .prologue
    .line 88
    invoke-virtual {p0}, Lorg/linphone/mediastream/Factory;->getDeviceFlags()I

    move-result v0

    and-int/lit16 v0, v0, 0x200

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static parseInt(Ljava/lang/String;I)I
    .locals 6
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "defaultValue"    # I

    .prologue
    .line 92
    move v1, p1

    .line 94
    .local v1, "returnedValue":I
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 98
    :goto_0
    return v1

    .line 95
    :catch_0
    move-exception v0

    .line 96
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Can\'t parse "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " to integer ; using default value "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v2}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static setContext(Ljava/lang/Object;)V
    .locals 13
    .param p0, "c"    # Ljava/lang/Object;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 57
    if-nez p0, :cond_0

    .line 84
    .end local p0    # "c":Ljava/lang/Object;
    .local v2, "bufferSize":I
    .local v3, "hasLowLatencyFeature":Z
    .local v4, "hasProFeature":Z
    .local v5, "mac":Lorg/linphone/mediastream/MediastreamerAndroidContext;
    .local v6, "sampleRate":I
    :goto_0
    return-void

    .line 60
    .end local v2    # "bufferSize":I
    .end local v3    # "hasLowLatencyFeature":Z
    .end local v4    # "hasProFeature":Z
    .end local v5    # "mac":Lorg/linphone/mediastream/MediastreamerAndroidContext;
    .end local v6    # "sampleRate":I
    .restart local p0    # "c":Ljava/lang/Object;
    :cond_0
    check-cast p0, Landroid/content/Context;

    .end local p0    # "c":Ljava/lang/Object;
    sput-object p0, Lorg/linphone/mediastream/MediastreamerAndroidContext;->mContext:Landroid/content/Context;

    .line 62
    sget-object v8, Lorg/linphone/mediastream/MediastreamerAndroidContext;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    const-string/jumbo v9, "android.hardware.audio.low_latency"

    invoke-virtual {v8, v9}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v3

    .line 63
    .restart local v3    # "hasLowLatencyFeature":Z
    sget-object v8, Lorg/linphone/mediastream/MediastreamerAndroidContext;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    const-string/jumbo v9, "android.hardware.audio.pro"

    invoke-virtual {v8, v9}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    .line 64
    .restart local v4    # "hasProFeature":Z
    new-array v8, v12, [Ljava/lang/Object;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "[Device] hasLowLatencyFeature: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, ", hasProFeature: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-static {v8}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 66
    const/16 v2, 0x100

    .line 67
    .restart local v2    # "bufferSize":I
    const v6, 0xac44

    .line 68
    .restart local v6    # "sampleRate":I
    invoke-static {}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->getInstance()Lorg/linphone/mediastream/MediastreamerAndroidContext;

    move-result-object v5

    .line 70
    .restart local v5    # "mac":Lorg/linphone/mediastream/MediastreamerAndroidContext;
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v9, 0x13

    if-lt v8, v9, :cond_1

    .line 72
    sget-object v8, Lorg/linphone/mediastream/MediastreamerAndroidContext;->mContext:Landroid/content/Context;

    const-string/jumbo v9, "audio"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 74
    .local v0, "audiomanager":Landroid/media/AudioManager;
    const-string/jumbo v8, "android.media.property.OUTPUT_FRAMES_PER_BUFFER"

    invoke-virtual {v0, v8}, Landroid/media/AudioManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 75
    .local v1, "bufferProperty":Ljava/lang/String;
    invoke-static {v1, v2}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->parseInt(Ljava/lang/String;I)I

    move-result v2

    .line 76
    const-string/jumbo v8, "android.media.property.OUTPUT_SAMPLE_RATE"

    invoke-virtual {v0, v8}, Landroid/media/AudioManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 77
    .local v7, "sampleRateProperty":Ljava/lang/String;
    invoke-static {v7, v6}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->parseInt(Ljava/lang/String;I)I

    move-result v6

    .line 78
    new-array v8, v12, [Ljava/lang/Object;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "[Device] Output frames per buffer: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, ", output sample rates: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, " for OpenSLES MS sound card."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-static {v8}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 79
    invoke-direct {v5, v6}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->setDeviceFavoriteSampleRate(I)V

    .line 80
    invoke-direct {v5, v2}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->setDeviceFavoriteBufferSize(I)V

    goto/16 :goto_0

    .line 82
    .end local v0    # "audiomanager":Landroid/media/AudioManager;
    .end local v1    # "bufferProperty":Ljava/lang/String;
    .end local v7    # "sampleRateProperty":Ljava/lang/String;
    :cond_1
    new-array v8, v12, [Ljava/lang/Object;

    const-string/jumbo v9, "Android < 4.4 detected, android context not used."

    aput-object v9, v8, v11

    invoke-static {v8}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    goto/16 :goto_0
.end method

.method private native setDeviceFavoriteBufferSize(I)V
.end method

.method private native setDeviceFavoriteSampleRate(I)V
.end method
