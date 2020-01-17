.class public Lorg/linphone/core/LinphoneCore$RegistrationState;
.super Ljava/lang/Object;
.source "LinphoneCore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/core/LinphoneCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RegistrationState"
.end annotation


# static fields
.field public static RegistrationCleared:Lorg/linphone/core/LinphoneCore$RegistrationState;

.field public static RegistrationFailed:Lorg/linphone/core/LinphoneCore$RegistrationState;

.field public static RegistrationNone:Lorg/linphone/core/LinphoneCore$RegistrationState;

.field public static RegistrationOk:Lorg/linphone/core/LinphoneCore$RegistrationState;

.field public static RegistrationProgress:Lorg/linphone/core/LinphoneCore$RegistrationState;

.field private static values:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lorg/linphone/core/LinphoneCore$RegistrationState;",
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
    .line 129
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lorg/linphone/core/LinphoneCore$RegistrationState;->values:Ljava/util/Vector;

    .line 133
    new-instance v0, Lorg/linphone/core/LinphoneCore$RegistrationState;

    const/4 v1, 0x0

    const-string/jumbo v2, "RegistrationNone"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$RegistrationState;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$RegistrationState;->RegistrationNone:Lorg/linphone/core/LinphoneCore$RegistrationState;

    .line 137
    new-instance v0, Lorg/linphone/core/LinphoneCore$RegistrationState;

    const/4 v1, 0x1

    const-string/jumbo v2, "RegistrationProgress"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$RegistrationState;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$RegistrationState;->RegistrationProgress:Lorg/linphone/core/LinphoneCore$RegistrationState;

    .line 141
    new-instance v0, Lorg/linphone/core/LinphoneCore$RegistrationState;

    const/4 v1, 0x2

    const-string/jumbo v2, "RegistrationOk"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$RegistrationState;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$RegistrationState;->RegistrationOk:Lorg/linphone/core/LinphoneCore$RegistrationState;

    .line 145
    new-instance v0, Lorg/linphone/core/LinphoneCore$RegistrationState;

    const/4 v1, 0x3

    const-string/jumbo v2, "RegistrationCleared"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$RegistrationState;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$RegistrationState;->RegistrationCleared:Lorg/linphone/core/LinphoneCore$RegistrationState;

    .line 149
    new-instance v0, Lorg/linphone/core/LinphoneCore$RegistrationState;

    const/4 v1, 0x4

    const-string/jumbo v2, "RegistrationFailed"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneCore$RegistrationState;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneCore$RegistrationState;->RegistrationFailed:Lorg/linphone/core/LinphoneCore$RegistrationState;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "value"    # I
    .param p2, "stringValue"    # Ljava/lang/String;

    .prologue
    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    iput p1, p0, Lorg/linphone/core/LinphoneCore$RegistrationState;->mValue:I

    .line 156
    sget-object v0, Lorg/linphone/core/LinphoneCore$RegistrationState;->values:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 157
    iput-object p2, p0, Lorg/linphone/core/LinphoneCore$RegistrationState;->mStringValue:Ljava/lang/String;

    .line 158
    return-void
.end method

.method public static fromInt(I)Lorg/linphone/core/LinphoneCore$RegistrationState;
    .locals 5
    .param p0, "value"    # I

    .prologue
    .line 161
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v2, Lorg/linphone/core/LinphoneCore$RegistrationState;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 162
    sget-object v2, Lorg/linphone/core/LinphoneCore$RegistrationState;->values:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/linphone/core/LinphoneCore$RegistrationState;

    .line 163
    .local v1, "state":Lorg/linphone/core/LinphoneCore$RegistrationState;
    iget v2, v1, Lorg/linphone/core/LinphoneCore$RegistrationState;->mValue:I

    if-ne v2, p0, :cond_0

    return-object v1

    .line 161
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 165
    .end local v1    # "state":Lorg/linphone/core/LinphoneCore$RegistrationState;
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
    .line 168
    iget-object v0, p0, Lorg/linphone/core/LinphoneCore$RegistrationState;->mStringValue:Ljava/lang/String;

    return-object v0
.end method
