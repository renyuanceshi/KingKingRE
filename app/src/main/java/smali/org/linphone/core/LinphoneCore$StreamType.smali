.class public final Lorg/linphone/core/LinphoneCore$StreamType;
.super Ljava/lang/Object;
.source "LinphoneCore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/core/LinphoneCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "StreamType"
.end annotation


# static fields
.field public static final Audio:Lorg/linphone/core/LinphoneCore$StreamType;

.field public static final Text:Lorg/linphone/core/LinphoneCore$StreamType;

.field public static final Unknown:Lorg/linphone/core/LinphoneCore$StreamType;

.field public static final Video:Lorg/linphone/core/LinphoneCore$StreamType;

.field private static values:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lorg/linphone/core/LinphoneCore$StreamType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mStringValue:Ljava/lang/String;

.field protected final mValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 259
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lorg/linphone/core/LinphoneCore$StreamType;->values:Ljava/util/Vector;

    .line 263
    new-instance v0, Lorg/linphone/core/LinphoneCore$StreamType;

    const/4 v1, 0x0

    const-string/jumbo v2, "Audio"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$StreamType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$StreamType;->Audio:Lorg/linphone/core/LinphoneCore$StreamType;

    .line 267
    new-instance v0, Lorg/linphone/core/LinphoneCore$StreamType;

    const/4 v1, 0x1

    const-string/jumbo v2, "Video"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$StreamType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$StreamType;->Video:Lorg/linphone/core/LinphoneCore$StreamType;

    .line 271
    new-instance v0, Lorg/linphone/core/LinphoneCore$StreamType;

    const/4 v1, 0x2

    const-string/jumbo v2, "Text"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$StreamType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$StreamType;->Text:Lorg/linphone/core/LinphoneCore$StreamType;

    .line 275
    new-instance v0, Lorg/linphone/core/LinphoneCore$StreamType;

    const/4 v1, 0x3

    const-string/jumbo v2, "Unknown"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$StreamType;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$StreamType;->Unknown:Lorg/linphone/core/LinphoneCore$StreamType;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "value"    # I
    .param p2, "stringValue"    # Ljava/lang/String;

    .prologue
    .line 279
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 280
    iput p1, p0, Lorg/linphone/core/LinphoneCore$StreamType;->mValue:I

    .line 281
    sget-object v0, Lorg/linphone/core/LinphoneCore$StreamType;->values:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 282
    iput-object p2, p0, Lorg/linphone/core/LinphoneCore$StreamType;->mStringValue:Ljava/lang/String;

    .line 283
    return-void
.end method

.method public static fromInt(I)Lorg/linphone/core/LinphoneCore$StreamType;
    .locals 5
    .param p0, "value"    # I

    .prologue
    .line 285
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v2, Lorg/linphone/core/LinphoneCore$StreamType;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 286
    sget-object v2, Lorg/linphone/core/LinphoneCore$StreamType;->values:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/linphone/core/LinphoneCore$StreamType;

    .line 287
    .local v1, "stype":Lorg/linphone/core/LinphoneCore$StreamType;
    iget v2, v1, Lorg/linphone/core/LinphoneCore$StreamType;->mValue:I

    if-ne v2, p0, :cond_0

    return-object v1

    .line 285
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 289
    .end local v1    # "stype":Lorg/linphone/core/LinphoneCore$StreamType;
    :cond_1
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "StreamType not found ["

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
    .line 292
    iget-object v0, p0, Lorg/linphone/core/LinphoneCore$StreamType;->mStringValue:Ljava/lang/String;

    return-object v0
.end method
