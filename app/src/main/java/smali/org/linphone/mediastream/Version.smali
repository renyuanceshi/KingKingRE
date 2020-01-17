.class public Lorg/linphone/mediastream/Version;
.super Ljava/lang/Object;
.source "Version.java"


# static fields
.field public static final API03_CUPCAKE_15:I = 0x3

.field public static final API04_DONUT_16:I = 0x4

.field public static final API05_ECLAIR_20:I = 0x5

.field public static final API06_ECLAIR_201:I = 0x6

.field public static final API07_ECLAIR_21:I = 0x7

.field public static final API08_FROYO_22:I = 0x8

.field public static final API09_GINGERBREAD_23:I = 0x9

.field public static final API10_GINGERBREAD_MR1_233:I = 0xa

.field public static final API11_HONEYCOMB_30:I = 0xb

.field public static final API12_HONEYCOMB_MR1_31X:I = 0xc

.field public static final API13_HONEYCOMB_MR2_32:I = 0xd

.field public static final API14_ICE_CREAM_SANDWICH_40:I = 0xe

.field public static final API15_ICE_CREAM_SANDWICH_403:I = 0xf

.field public static final API16_JELLY_BEAN_41:I = 0x10

.field public static final API17_JELLY_BEAN_42:I = 0x11

.field public static final API18_JELLY_BEAN_43:I = 0x12

.field public static final API19_KITKAT_44:I = 0x13

.field public static final API21_LOLLIPOP_50:I = 0x15

.field public static final API22_LOLLIPOP_51:I = 0x16

.field public static final API23_MARSHMALLOW_60:I = 0x17

.field public static final API24_NOUGAT_70:I = 0x18

.field public static final API25_NOUGAT_71:I = 0x19

.field public static final API26_O_80:I = 0x1a

.field private static final buildVersion:I

.field private static hasNeon:Ljava/lang/Boolean;

.field private static sCacheHasZrtp:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 64
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    sput v0, Lorg/linphone/mediastream/Version;->buildVersion:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dumpCapabilities()V
    .locals 4

    .prologue
    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, " ==== Capabilities dump ====\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 163
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-static {}, Lorg/linphone/mediastream/Version;->isArmv7()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, "Has neon: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lorg/linphone/mediastream/Version;->hasNeon()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    :cond_0
    const-string/jumbo v1, "Has ZRTP: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lorg/linphone/mediastream/Version;->hasZrtp()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 166
    return-void
.end method

.method public static getCpuAbis()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 87
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .local v3, "cpuabis":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v5, 0x15

    invoke-static {v5}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 90
    :try_start_0
    const-class v5, Landroid/os/Build;

    const-string/jumbo v7, "SUPPORTED_ABIS"

    invoke-virtual {v5, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    move-object v0, v5

    check-cast v0, [Ljava/lang/String;

    move-object v2, v0

    .line 91
    .local v2, "abis":[Ljava/lang/String;
    array-length v7, v2

    move v5, v6

    :goto_0
    if-ge v5, v7, :cond_0

    aget-object v1, v2, v5

    .line 92
    .local v1, "abi":Ljava/lang/String;
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 94
    .end local v1    # "abi":Ljava/lang/String;
    .end local v2    # "abis":[Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 95
    .local v4, "e":Ljava/lang/Throwable;
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v4, v5, v6

    invoke-static {v5}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    .line 101
    .end local v4    # "e":Ljava/lang/Throwable;
    :cond_0
    :goto_1
    return-object v3

    .line 98
    :cond_1
    sget-object v5, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    sget-object v5, Landroid/os/Build;->CPU_ABI2:Ljava/lang/String;

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public static hasFastCpu()Z
    .locals 1

    .prologue
    .line 140
    invoke-static {}, Lorg/linphone/mediastream/Version;->isArmv5()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static hasFastCpuWithAsmOptim()Z
    .locals 1

    .prologue
    .line 143
    invoke-static {}, Lorg/linphone/mediastream/Version;->isX86()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/mediastream/Version;->isArm64()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/mediastream/Version;->isArmv5()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lorg/linphone/mediastream/Version;->hasNeon()Z

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

.method public static hasNeon()Z
    .locals 1

    .prologue
    .line 136
    sget-object v0, Lorg/linphone/mediastream/Version;->hasNeon:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/mediastream/Version;->nativeHasNeon()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lorg/linphone/mediastream/Version;->hasNeon:Ljava/lang/Boolean;

    .line 137
    :cond_0
    sget-object v0, Lorg/linphone/mediastream/Version;->hasNeon:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public static hasZrtp()Z
    .locals 1

    .prologue
    .line 155
    sget-object v0, Lorg/linphone/mediastream/Version;->sCacheHasZrtp:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 156
    invoke-static {}, Lorg/linphone/mediastream/Version;->nativeHasZrtp()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lorg/linphone/mediastream/Version;->sCacheHasZrtp:Ljava/lang/Boolean;

    .line 158
    :cond_0
    sget-object v0, Lorg/linphone/mediastream/Version;->sCacheHasZrtp:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method private static isArm64()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 105
    :try_start_0
    invoke-static {}, Lorg/linphone/mediastream/Version;->getCpuAbis()Ljava/util/List;

    move-result-object v1

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string/jumbo v3, "arm64-v8a"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 109
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    return v1

    .line 106
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_0
    move-exception v0

    .line 107
    .restart local v0    # "e":Ljava/lang/Throwable;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v2

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    move v1, v2

    .line 109
    goto :goto_0
.end method

.method private static isArmv5()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 129
    :try_start_0
    invoke-static {}, Lorg/linphone/mediastream/Version;->getCpuAbis()Ljava/util/List;

    move-result-object v1

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string/jumbo v3, "armeabi"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 133
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    return v1

    .line 130
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_0
    move-exception v0

    .line 131
    .restart local v0    # "e":Ljava/lang/Throwable;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v2

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    move v1, v2

    .line 133
    goto :goto_0
.end method

.method private static isArmv7()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 113
    :try_start_0
    invoke-static {}, Lorg/linphone/mediastream/Version;->getCpuAbis()Ljava/util/List;

    move-result-object v1

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string/jumbo v3, "armeabi-v7"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 117
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    return v1

    .line 114
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_0
    move-exception v0

    .line 115
    .restart local v0    # "e":Ljava/lang/Throwable;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v2

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    move v1, v2

    .line 117
    goto :goto_0
.end method

.method public static isHDVideoCapable()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 149
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    .line 150
    .local v0, "availableCores":I
    invoke-static {}, Lorg/linphone/mediastream/Version;->isVideoCapable()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Lorg/linphone/mediastream/Version;->hasFastCpuWithAsmOptim()Z

    move-result v2

    if-eqz v2, :cond_0

    if-le v0, v1, :cond_0

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isVideoCapable()Z
    .locals 1

    .prologue
    .line 146
    const/4 v0, 0x5

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkStrictlyBelow(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/linphone/mediastream/Version;->hasFastCpu()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isX86()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 121
    :try_start_0
    invoke-static {}, Lorg/linphone/mediastream/Version;->getCpuAbis()Ljava/util/List;

    move-result-object v1

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string/jumbo v3, "x86"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 125
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    return v1

    .line 122
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_0
    move-exception v0

    .line 123
    .restart local v0    # "e":Ljava/lang/Throwable;
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v2

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    move v1, v2

    .line 125
    goto :goto_0
.end method

.method public static isXLargeScreen(Landroid/content/Context;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 71
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v0, v0, 0xf

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static native nativeHasNeon()Z
.end method

.method private static native nativeHasZrtp()Z
.end method

.method public static sdk()I
    .locals 1

    .prologue
    .line 83
    sget v0, Lorg/linphone/mediastream/Version;->buildVersion:I

    return v0
.end method

.method public static final sdkAboveOrEqual(I)Z
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 75
    sget v0, Lorg/linphone/mediastream/Version;->buildVersion:I

    if-lt v0, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static final sdkStrictlyBelow(I)Z
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 79
    sget v0, Lorg/linphone/mediastream/Version;->buildVersion:I

    if-ge v0, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
