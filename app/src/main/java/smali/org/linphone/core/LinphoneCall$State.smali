.class public Lorg/linphone/core/LinphoneCall$State;
.super Ljava/lang/Object;
.source "LinphoneCall.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/core/LinphoneCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "State"
.end annotation


# static fields
.field public static final CallEarlyUpdatedByRemote:Lorg/linphone/core/LinphoneCall$State;

.field public static final CallEarlyUpdating:Lorg/linphone/core/LinphoneCall$State;

.field public static final CallEnd:Lorg/linphone/core/LinphoneCall$State;

.field public static final CallIncomingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

.field public static final CallReleased:Lorg/linphone/core/LinphoneCall$State;

.field public static final CallUpdatedByRemote:Lorg/linphone/core/LinphoneCall$State;

.field public static final CallUpdating:Lorg/linphone/core/LinphoneCall$State;

.field public static final Connected:Lorg/linphone/core/LinphoneCall$State;

.field public static final Error:Lorg/linphone/core/LinphoneCall$State;

.field public static final Idle:Lorg/linphone/core/LinphoneCall$State;

.field public static final IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

.field public static final OutgoingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

.field public static final OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

.field public static final OutgoingProgress:Lorg/linphone/core/LinphoneCall$State;

.field public static final OutgoingRinging:Lorg/linphone/core/LinphoneCall$State;

.field public static final Paused:Lorg/linphone/core/LinphoneCall$State;

.field public static final PausedByRemote:Lorg/linphone/core/LinphoneCall$State;

.field public static final Pausing:Lorg/linphone/core/LinphoneCall$State;

.field public static final Refered:Lorg/linphone/core/LinphoneCall$State;

.field public static final Resuming:Lorg/linphone/core/LinphoneCall$State;

.field public static final StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

.field private static values:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lorg/linphone/core/LinphoneCall$State;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mStringValue:Ljava/lang/String;

.field private final mValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 48
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->values:Ljava/util/Vector;

    .line 56
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/4 v1, 0x0

    const-string/jumbo v2, "Idle"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->Idle:Lorg/linphone/core/LinphoneCall$State;

    .line 60
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/4 v1, 0x1

    const-string/jumbo v2, "IncomingReceived"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    .line 64
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/4 v1, 0x2

    const-string/jumbo v2, "OutgoingInit"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    .line 68
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/4 v1, 0x3

    const-string/jumbo v2, "OutgoingProgress"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingProgress:Lorg/linphone/core/LinphoneCall$State;

    .line 72
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/4 v1, 0x4

    const-string/jumbo v2, "OutgoingRinging"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingRinging:Lorg/linphone/core/LinphoneCall$State;

    .line 76
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/4 v1, 0x5

    const-string/jumbo v2, "OutgoingEarlyMedia"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

    .line 80
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/4 v1, 0x6

    const-string/jumbo v2, "Connected"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->Connected:Lorg/linphone/core/LinphoneCall$State;

    .line 84
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/4 v1, 0x7

    const-string/jumbo v2, "StreamsRunning"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    .line 88
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0x8

    const-string/jumbo v2, "Pausing"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->Pausing:Lorg/linphone/core/LinphoneCall$State;

    .line 92
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0x9

    const-string/jumbo v2, "Paused"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    .line 96
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0xa

    const-string/jumbo v2, "Resuming"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->Resuming:Lorg/linphone/core/LinphoneCall$State;

    .line 100
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0xb

    const-string/jumbo v2, "Refered"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->Refered:Lorg/linphone/core/LinphoneCall$State;

    .line 104
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0xc

    const-string/jumbo v2, "Error"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->Error:Lorg/linphone/core/LinphoneCall$State;

    .line 108
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0xd

    const-string/jumbo v2, "CallEnd"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->CallEnd:Lorg/linphone/core/LinphoneCall$State;

    .line 113
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0xe

    const-string/jumbo v2, "PausedByRemote"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->PausedByRemote:Lorg/linphone/core/LinphoneCall$State;

    .line 118
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0xf

    const-string/jumbo v2, "UpdatedByRemote"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->CallUpdatedByRemote:Lorg/linphone/core/LinphoneCall$State;

    .line 123
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0x10

    const-string/jumbo v2, "IncomingEarlyMedia"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->CallIncomingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

    .line 128
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0x11

    const-string/jumbo v2, "Updating"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->CallUpdating:Lorg/linphone/core/LinphoneCall$State;

    .line 133
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0x12

    const-string/jumbo v2, "Released"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->CallReleased:Lorg/linphone/core/LinphoneCall$State;

    .line 138
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0x13

    const-string/jumbo v2, "EarlyUpdatedByRemote"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->CallEarlyUpdatedByRemote:Lorg/linphone/core/LinphoneCall$State;

    .line 143
    new-instance v0, Lorg/linphone/core/LinphoneCall$State;

    const/16 v1, 0x14

    const-string/jumbo v2, "EarlyUpdating"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCall$State;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCall$State;->CallEarlyUpdating:Lorg/linphone/core/LinphoneCall$State;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "value"    # I
    .param p2, "stringValue"    # Ljava/lang/String;

    .prologue
    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    iput p1, p0, Lorg/linphone/core/LinphoneCall$State;->mValue:I

    .line 147
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->values:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 148
    iput-object p2, p0, Lorg/linphone/core/LinphoneCall$State;->mStringValue:Ljava/lang/String;

    .line 149
    return-void
.end method

.method public static fromInt(I)Lorg/linphone/core/LinphoneCall$State;
    .locals 5
    .param p0, "value"    # I

    .prologue
    .line 153
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 154
    sget-object v2, Lorg/linphone/core/LinphoneCall$State;->values:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/linphone/core/LinphoneCall$State;

    .line 155
    .local v1, "state":Lorg/linphone/core/LinphoneCall$State;
    iget v2, v1, Lorg/linphone/core/LinphoneCall$State;->mValue:I

    if-ne v2, p0, :cond_0

    return-object v1

    .line 153
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 157
    .end local v1    # "state":Lorg/linphone/core/LinphoneCall$State;
    :cond_1
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "state not found ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lorg/linphone/core/LinphoneCall$State;->mStringValue:Ljava/lang/String;

    return-object v0
.end method

.method public final value()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lorg/linphone/core/LinphoneCall$State;->mValue:I

    return v0
.end method
