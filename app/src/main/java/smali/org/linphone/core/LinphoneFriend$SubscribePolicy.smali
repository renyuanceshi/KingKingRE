.class public Lorg/linphone/core/LinphoneFriend$SubscribePolicy;
.super Ljava/lang/Object;
.source "LinphoneFriend.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/core/LinphoneFriend;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SubscribePolicy"
.end annotation


# static fields
.field public static final SPAccept:Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

.field public static final SPDeny:Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

.field public static final SPWait:Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

.field private static values:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lorg/linphone/core/LinphoneFriend$SubscribePolicy;",
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
    .line 39
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->values:Ljava/util/Vector;

    .line 46
    new-instance v0, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

    const/4 v1, 0x0

    const-string/jumbo v2, "SPWait"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->SPWait:Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

    .line 50
    new-instance v0, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

    const/4 v1, 0x1

    const-string/jumbo v2, "SPDeny"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->SPDeny:Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

    .line 54
    new-instance v0, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

    const/4 v1, 0x2

    const-string/jumbo v2, "SPAccept"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->SPAccept:Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "value"    # I
    .param p2, "stringValue"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput p1, p0, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->mValue:I

    .line 59
    sget-object v0, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->values:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 60
    iput-object p2, p0, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->mStringValue:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public static fromInt(I)Lorg/linphone/core/LinphoneFriend$SubscribePolicy;
    .locals 5
    .param p0, "value"    # I

    .prologue
    .line 64
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v2, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 65
    sget-object v2, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->values:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

    .line 66
    .local v1, "policy":Lorg/linphone/core/LinphoneFriend$SubscribePolicy;
    iget v2, v1, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->mValue:I

    if-ne v2, p0, :cond_0

    return-object v1

    .line 64
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 68
    .end local v1    # "policy":Lorg/linphone/core/LinphoneFriend$SubscribePolicy;
    :cond_1
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Policy not found ["

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
    .line 71
    iget-object v0, p0, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->mStringValue:Ljava/lang/String;

    return-object v0
.end method
