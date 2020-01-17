.class public final enum Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;
.super Ljava/lang/Enum;
.source "LinphoneSimpleListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AudioState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

.field public static final enum BLUETOOTH:Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

.field public static final enum EARPIECE:Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

.field public static final enum SPEAKER:Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 66
    new-instance v0, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    const-string/jumbo v1, "EARPIECE"

    invoke-direct {v0, v1, v2}, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;->EARPIECE:Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    new-instance v0, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    const-string/jumbo v1, "SPEAKER"

    invoke-direct {v0, v1, v3}, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;->SPEAKER:Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    new-instance v0, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    const-string/jumbo v1, "BLUETOOTH"

    invoke-direct {v0, v1, v4}, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;->BLUETOOTH:Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    .line 65
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    sget-object v1, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;->EARPIECE:Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    aput-object v1, v0, v2

    sget-object v1, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;->SPEAKER:Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    aput-object v1, v0, v3

    sget-object v1, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;->BLUETOOTH:Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    aput-object v1, v0, v4

    sput-object v0, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;->$VALUES:[Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 65
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 65
    const-class v0, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    return-object v0
.end method

.method public static values()[Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;->$VALUES:[Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    invoke-virtual {v0}, [Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    return-object v0
.end method
