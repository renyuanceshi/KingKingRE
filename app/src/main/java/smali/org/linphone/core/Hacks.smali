.class public final Lorg/linphone/core/Hacks;
.super Ljava/lang/Object;
.source "Hacks.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static dumpDeviceInformation()V
    .locals 4

    .prologue
    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, " ==== Phone information dump ====\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 165
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "DEVICE="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    const-string/jumbo v1, "MODEL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    const-string/jumbo v1, "SDK="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lorg/linphone/core/Log;->i([Ljava/lang/Object;)V

    .line 172
    return-void
.end method

.method public static galaxySSwitchToCallStreamUnMuteLowerVolume(Landroid/media/AudioManager;)V
    .locals 3
    .param p0, "am"    # Landroid/media/AudioManager;

    .prologue
    const/4 v2, 0x1

    const/16 v1, 0xc8

    const/4 v0, 0x0

    .line 139
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 140
    invoke-static {v1}, Lorg/linphone/core/Hacks;->sleep(I)V

    .line 143
    invoke-virtual {p0, v0, v2, v0}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 146
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->setMode(I)V

    .line 147
    invoke-static {v1}, Lorg/linphone/core/Hacks;->sleep(I)V

    .line 150
    invoke-virtual {p0, v2}, Landroid/media/AudioManager;->setMicrophoneMute(Z)V

    .line 151
    invoke-static {v1}, Lorg/linphone/core/Hacks;->sleep(I)V

    .line 152
    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->setMicrophoneMute(Z)V

    .line 153
    invoke-static {v1}, Lorg/linphone/core/Hacks;->sleep(I)V

    .line 154
    return-void
.end method

.method public static hasCamera()Z
    .locals 7

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 196
    const/16 v2, 0x9

    invoke-static {v2}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 197
    const/4 v1, 0x0

    .line 199
    .local v1, "nb":I
    :try_start_0
    const-class v5, Landroid/hardware/Camera;

    const-string/jumbo v6, "getNumberOfCameras"

    const/4 v2, 0x0

    check-cast v2, [Ljava/lang/Class;

    invoke-virtual {v5, v6, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v2, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 204
    :goto_0
    if-lez v1, :cond_0

    move v2, v3

    .line 209
    .end local v1    # "nb":I
    :goto_1
    return v2

    .line 201
    .restart local v1    # "nb":I
    :catch_0
    move-exception v0

    .line 202
    .local v0, "e":Ljava/lang/Exception;
    new-array v2, v3, [Ljava/lang/Object;

    const-string/jumbo v5, "Error getting number of cameras"

    aput-object v5, v2, v4

    invoke-static {v2}, Lorg/linphone/core/Log;->e([Ljava/lang/Object;)V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    move v2, v4

    .line 204
    goto :goto_1

    .line 207
    .end local v1    # "nb":I
    :cond_1
    new-array v2, v3, [Ljava/lang/Object;

    const-string/jumbo v5, "Hack: considering there IS a camera.\nIf it is not the case, report DEVICE and MODEL to linphone-users@nongnu.org"

    aput-object v5, v2, v4

    invoke-static {v2}, Lorg/linphone/core/Log;->i([Ljava/lang/Object;)V

    move v2, v3

    .line 209
    goto :goto_1
.end method

.method public static hasTwoCameras()Z
    .locals 1

    .prologue
    .line 192
    invoke-static {}, Lorg/linphone/core/Hacks;->isSPHD700()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxySOrTabWithFrontCamera()Z

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

.method public static final hasTwoCamerasRear0Front1()Z
    .locals 1

    .prologue
    .line 54
    invoke-static {}, Lorg/linphone/core/Hacks;->isSPHD700()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isADR6400()Z

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

.method private static final isADR6400()Z
    .locals 2

    .prologue
    .line 59
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "ADR6400"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string/jumbo v1, "ADR6400"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

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

.method public static isASUSPadFone2()Z
    .locals 2

    .prologue
    .line 230
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "PadFone 2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static isGT9000()Z
    .locals 2

    .prologue
    .line 72
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string/jumbo v1, "GT-I9000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static isGTP1000()Z
    .locals 2

    .prologue
    .line 80
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string/jumbo v1, "GT-P1000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isGalaxyS()Z
    .locals 1

    .prologue
    .line 50
    invoke-static {}, Lorg/linphone/core/Hacks;->isGT9000()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isSC02B()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isSGHI896()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isSPHD700()Z

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

.method public static isGalaxySOrTab()Z
    .locals 1

    .prologue
    .line 42
    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxyS()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxyTab()Z

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

.method public static isGalaxySOrTabWithFrontCamera()Z
    .locals 1

    .prologue
    .line 34
    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxySOrTab()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxySOrTabWithoutFrontCamera()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isGalaxySOrTabWithoutFrontCamera()Z
    .locals 1

    .prologue
    .line 38
    invoke-static {}, Lorg/linphone/core/Hacks;->isSC02B()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isSGHI896()Z

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

.method public static isGalaxyTab()Z
    .locals 1

    .prologue
    .line 46
    invoke-static {}, Lorg/linphone/core/Hacks;->isGTP1000()Z

    move-result v0

    return v0
.end method

.method private static final isHTCDesireZ()Z
    .locals 2

    .prologue
    .line 93
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "HTC Vision"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static final isHTCFlyer()Z
    .locals 2

    .prologue
    .line 97
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "HTC Flyer"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static final isHuaweiU8110()Z
    .locals 2

    .prologue
    .line 101
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "U8110"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static final isHuaweiU8220PLUS()Z
    .locals 2

    .prologue
    .line 105
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "U8220PLUS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static final isLGE400()Z
    .locals 2

    .prologue
    .line 125
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "LG-E400"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static final isLGE720()Z
    .locals 2

    .prologue
    .line 113
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "LG-E720"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static final isLGP350()Z
    .locals 2

    .prologue
    .line 109
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "LG-P350"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static final isLGP500()Z
    .locals 2

    .prologue
    .line 117
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "LG-P500"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static final isLGP690()Z
    .locals 2

    .prologue
    .line 121
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "LG-P690"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static final isMotoA1680()Z
    .locals 2

    .prologue
    .line 85
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string/jumbo v1, "umts_lucky"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "A1680"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static final isMotoXT316()Z
    .locals 2

    .prologue
    .line 89
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v1, "XT316"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static isSC02B()Z
    .locals 2

    .prologue
    .line 76
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string/jumbo v1, "SC-02B"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static isSGHI896()Z
    .locals 2

    .prologue
    .line 68
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string/jumbo v1, "SGH-I896"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static final isSPHD700()Z
    .locals 2

    .prologue
    .line 64
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string/jumbo v1, "SPH-D700"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static needAudioPathRecovery()Z
    .locals 1

    .prologue
    .line 226
    invoke-static {}, Lorg/linphone/core/Hacks;->isLGE400()Z

    move-result v0

    return v0
.end method

.method public static needForceSpeakerOn()Z
    .locals 1

    .prologue
    .line 222
    invoke-static {}, Lorg/linphone/core/Hacks;->isHTCFlyer()Z

    move-result v0

    return v0
.end method

.method public static needGalaxySAudioHack()Z
    .locals 1

    .prologue
    .line 183
    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxySOrTab()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isSC02B()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static needIncallModeAudio()Z
    .locals 1

    .prologue
    .line 213
    invoke-static {}, Lorg/linphone/core/Hacks;->isMotoA1680()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isMotoXT316()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isHuaweiU8110()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isHuaweiU8220PLUS()Z

    move-result v0

    if-nez v0, :cond_0

    .line 214
    invoke-static {}, Lorg/linphone/core/Hacks;->isLGP350()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isLGE720()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isLGP500()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isLGP690()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    .line 213
    :goto_0
    return v0

    .line 214
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static needPausingCallForSpeakers()Z
    .locals 1

    .prologue
    .line 188
    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxySOrTab()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isSC02B()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static needRTPStreamHack()Z
    .locals 1

    .prologue
    .line 218
    invoke-static {}, Lorg/linphone/core/Hacks;->isHTCDesireZ()Z

    move-result v0

    return v0
.end method

.method public static needRoutingAPI()Z
    .locals 1

    .prologue
    .line 179
    const/4 v0, 0x5

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkStrictlyBelow(I)Z

    move-result v0

    return v0
.end method

.method public static needSoftvolume()Z
    .locals 1

    .prologue
    .line 175
    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxySOrTab()Z

    move-result v0

    return v0
.end method

.method public static final sleep(I)V
    .locals 2
    .param p0, "time"    # I

    .prologue
    .line 158
    int-to-long v0, p0

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    :goto_0
    return-void

    .line 159
    :catch_0
    move-exception v0

    goto :goto_0
.end method
