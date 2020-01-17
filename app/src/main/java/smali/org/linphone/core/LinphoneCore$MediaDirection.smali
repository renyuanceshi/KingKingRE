.class public final Lorg/linphone/core/LinphoneCore$MediaDirection;
.super Ljava/lang/Object;
.source "LinphoneCore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/core/LinphoneCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MediaDirection"
.end annotation


# static fields
.field public static final Inactive:Lorg/linphone/core/LinphoneCore$MediaDirection;

.field public static final Invalid:Lorg/linphone/core/LinphoneCore$MediaDirection;

.field public static final RecvOnly:Lorg/linphone/core/LinphoneCore$MediaDirection;

.field public static final SendOnly:Lorg/linphone/core/LinphoneCore$MediaDirection;

.field public static final SendRecv:Lorg/linphone/core/LinphoneCore$MediaDirection;

.field private static values:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lorg/linphone/core/LinphoneCore$MediaDirection;",
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
    .line 301
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lorg/linphone/core/LinphoneCore$MediaDirection;->values:Ljava/util/Vector;

    .line 305
    new-instance v0, Lorg/linphone/core/LinphoneCore$MediaDirection;

    const/4 v1, -0x1

    const-string/jumbo v2, "Invalid"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$MediaDirection;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$MediaDirection;->Invalid:Lorg/linphone/core/LinphoneCore$MediaDirection;

    .line 309
    new-instance v0, Lorg/linphone/core/LinphoneCore$MediaDirection;

    const/4 v1, 0x0

    const-string/jumbo v2, "Inactive"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$MediaDirection;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$MediaDirection;->Inactive:Lorg/linphone/core/LinphoneCore$MediaDirection;

    .line 313
    new-instance v0, Lorg/linphone/core/LinphoneCore$MediaDirection;

    const/4 v1, 0x1

    const-string/jumbo v2, "SendOnly"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$MediaDirection;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$MediaDirection;->SendOnly:Lorg/linphone/core/LinphoneCore$MediaDirection;

    .line 317
    new-instance v0, Lorg/linphone/core/LinphoneCore$MediaDirection;

    const/4 v1, 0x2

    const-string/jumbo v2, "RecvOnly"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$MediaDirection;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$MediaDirection;->RecvOnly:Lorg/linphone/core/LinphoneCore$MediaDirection;

    .line 321
    new-instance v0, Lorg/linphone/core/LinphoneCore$MediaDirection;

    const/4 v1, 0x3

    const-string/jumbo v2, "SendRecv"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$MediaDirection;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$MediaDirection;->SendRecv:Lorg/linphone/core/LinphoneCore$MediaDirection;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "value"    # I
    .param p2, "stringValue"    # Ljava/lang/String;

    .prologue
    .line 325
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 326
    iput p1, p0, Lorg/linphone/core/LinphoneCore$MediaDirection;->mValue:I

    .line 327
    sget-object v0, Lorg/linphone/core/LinphoneCore$MediaDirection;->values:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 328
    iput-object p2, p0, Lorg/linphone/core/LinphoneCore$MediaDirection;->mStringValue:Ljava/lang/String;

    .line 329
    return-void
.end method

.method public static fromInt(I)Lorg/linphone/core/LinphoneCore$MediaDirection;
    .locals 5
    .param p0, "value"    # I

    .prologue
    .line 331
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v2, Lorg/linphone/core/LinphoneCore$MediaDirection;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 332
    sget-object v2, Lorg/linphone/core/LinphoneCore$MediaDirection;->values:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneCore$MediaDirection;

    .line 333
    .local v0, "dir":Lorg/linphone/core/LinphoneCore$MediaDirection;
    iget v2, v0, Lorg/linphone/core/LinphoneCore$MediaDirection;->mValue:I

    if-ne v2, p0, :cond_0

    return-object v0

    .line 331
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 335
    .end local v0    # "dir":Lorg/linphone/core/LinphoneCore$MediaDirection;
    :cond_1
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "MediaDirection not found ["

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
    .line 338
    iget-object v0, p0, Lorg/linphone/core/LinphoneCore$MediaDirection;->mStringValue:Ljava/lang/String;

    return-object v0
.end method
