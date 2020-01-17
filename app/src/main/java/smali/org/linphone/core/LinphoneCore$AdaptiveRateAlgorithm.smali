.class public final Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;
.super Ljava/lang/Object;
.source "LinphoneCore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/core/LinphoneCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AdaptiveRateAlgorithm"
.end annotation


# static fields
.field public static final Simple:Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;

.field public static final Stateful:Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;

.field private static values:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;",
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
    .line 387
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;->values:Ljava/util/Vector;

    .line 391
    new-instance v0, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;

    const/4 v1, 0x0

    const-string/jumbo v2, "Simple"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;->Simple:Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;

    .line 395
    new-instance v0, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;

    const/4 v1, 0x1

    const-string/jumbo v2, "Stateful"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;->Stateful:Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "value"    # I
    .param p2, "stringValue"    # Ljava/lang/String;

    .prologue
    .line 400
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 401
    iput p1, p0, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;->mValue:I

    .line 402
    sget-object v0, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;->values:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 403
    iput-object p2, p0, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;->mStringValue:Ljava/lang/String;

    .line 404
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;
    .locals 5
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 407
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v2, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 408
    sget-object v2, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;->values:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;

    .line 409
    .local v0, "alg":Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;
    iget-object v2, v0, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;->mStringValue:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v0

    .line 407
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 411
    .end local v0    # "alg":Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;
    :cond_1
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "AdaptiveRateAlgorithm not found ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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
    .line 414
    iget-object v0, p0, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;->mStringValue:Ljava/lang/String;

    return-object v0
.end method
