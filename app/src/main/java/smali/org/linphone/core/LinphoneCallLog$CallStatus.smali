.class public Lorg/linphone/core/LinphoneCallLog$CallStatus;
.super Ljava/lang/Object;
.source "LinphoneCallLog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/core/LinphoneCallLog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CallStatus"
.end annotation


# static fields
.field public static final Aborted:Lorg/linphone/core/LinphoneCallLog$CallStatus;

.field public static final AcceptedElsewhere:Lorg/linphone/core/LinphoneCallLog$CallStatus;

.field public static final Declined:Lorg/linphone/core/LinphoneCallLog$CallStatus;

.field public static final DeclinedElsewhere:Lorg/linphone/core/LinphoneCallLog$CallStatus;

.field public static final EarlyAborted:Lorg/linphone/core/LinphoneCallLog$CallStatus;

.field public static final Missed:Lorg/linphone/core/LinphoneCallLog$CallStatus;

.field public static final Success:Lorg/linphone/core/LinphoneCallLog$CallStatus;

.field private static values:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lorg/linphone/core/LinphoneCallLog$CallStatus;",
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
    .line 39
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->values:Ljava/util/Vector;

    .line 45
    new-instance v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;

    const/4 v1, 0x0

    const-string/jumbo v2, "Success"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCallLog$CallStatus;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->Success:Lorg/linphone/core/LinphoneCallLog$CallStatus;

    .line 49
    new-instance v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;

    const/4 v1, 0x1

    const-string/jumbo v2, "Aborted"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCallLog$CallStatus;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->Aborted:Lorg/linphone/core/LinphoneCallLog$CallStatus;

    .line 53
    new-instance v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;

    const/4 v1, 0x2

    const-string/jumbo v2, "Missed"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCallLog$CallStatus;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->Missed:Lorg/linphone/core/LinphoneCallLog$CallStatus;

    .line 57
    new-instance v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;

    const/4 v1, 0x3

    const-string/jumbo v2, "Declined"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCallLog$CallStatus;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->Declined:Lorg/linphone/core/LinphoneCallLog$CallStatus;

    .line 62
    new-instance v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;

    const/4 v1, 0x4

    const-string/jumbo v2, "Early Aborted"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCallLog$CallStatus;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->EarlyAborted:Lorg/linphone/core/LinphoneCallLog$CallStatus;

    .line 67
    new-instance v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;

    const/4 v1, 0x5

    const-string/jumbo v2, "Accepted Elsewhere"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCallLog$CallStatus;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->AcceptedElsewhere:Lorg/linphone/core/LinphoneCallLog$CallStatus;

    .line 72
    new-instance v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;

    const/4 v1, 0x6

    const-string/jumbo v2, "Declined Elsewhere"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCallLog$CallStatus;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->DeclinedElsewhere:Lorg/linphone/core/LinphoneCallLog$CallStatus;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "value"    # I
    .param p2, "stringValue"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput p1, p0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->mValue:I

    .line 77
    sget-object v0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->values:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 78
    iput-object p2, p0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->mStringValue:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public static fromInt(I)Lorg/linphone/core/LinphoneCallLog$CallStatus;
    .locals 5
    .param p0, "value"    # I

    .prologue
    .line 82
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v2, Lorg/linphone/core/LinphoneCallLog$CallStatus;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 83
    sget-object v2, Lorg/linphone/core/LinphoneCallLog$CallStatus;->values:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/linphone/core/LinphoneCallLog$CallStatus;

    .line 84
    .local v1, "state":Lorg/linphone/core/LinphoneCallLog$CallStatus;
    iget v2, v1, Lorg/linphone/core/LinphoneCallLog$CallStatus;->mValue:I

    if-ne v2, p0, :cond_0

    return-object v1

    .line 82
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 86
    .end local v1    # "state":Lorg/linphone/core/LinphoneCallLog$CallStatus;
    :cond_1
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "CallStatus not found ["

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
.method public toInt()I
    .locals 1

    .prologue
    .line 92
    iget v0, p0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->mValue:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lorg/linphone/core/LinphoneCallLog$CallStatus;->mStringValue:Ljava/lang/String;

    return-object v0
.end method
