.class public Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;
.super Ljava/lang/Object;
.source "LinphoneAccountCreator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/core/LinphoneAccountCreator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PhoneNumberCheck"
.end annotation


# static fields
.field public static final CountryCodeInvalid:Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

.field public static final Invalid:Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

.field public static final Ok:Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

.field public static final TooLong:Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

.field public static final TooShort:Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

.field private static values:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;",
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
    .line 74
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->values:Ljava/util/Vector;

    .line 79
    new-instance v0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

    const/4 v1, 0x1

    const-string/jumbo v2, "Ok"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->Ok:Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

    .line 80
    new-instance v0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

    const/4 v1, 0x2

    const-string/jumbo v2, "TooShort"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->TooShort:Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

    .line 81
    new-instance v0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

    const/4 v1, 0x4

    const-string/jumbo v2, "TooLong"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->TooLong:Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

    .line 82
    new-instance v0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

    const/16 v1, 0x8

    const-string/jumbo v2, "CountryCodeInvalid"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->CountryCodeInvalid:Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

    .line 83
    new-instance v0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

    const/16 v1, 0x10

    const-string/jumbo v2, "Invalid"

    invoke-direct {v0, v1, v2}, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;-><init>(ILjava/lang/String;)V

    sput-object v0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->Invalid:Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "value"    # I
    .param p2, "stringValue"    # Ljava/lang/String;

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput p1, p0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->mValue:I

    .line 87
    sget-object v0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->values:Ljava/util/Vector;

    invoke-virtual {v0, p0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 88
    iput-object p2, p0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->mStringValue:Ljava/lang/String;

    .line 89
    return-void
.end method

.method public static fromInt(I)Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;
    .locals 5
    .param p0, "value"    # I

    .prologue
    .line 92
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v2, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 93
    sget-object v2, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->values:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;

    .line 94
    .local v1, "state":Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;
    iget v2, v1, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->mValue:I

    if-ne v2, p0, :cond_0

    return-object v1

    .line 92
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 96
    .end local v1    # "state":Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;
    :cond_1
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "UsernameCheck not found ["

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
    .line 104
    iget v0, p0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->mValue:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->mStringValue:Ljava/lang/String;

    return-object v0
.end method

.method public final value()I
    .locals 1

    .prologue
    .line 77
    iget v0, p0, Lorg/linphone/core/LinphoneAccountCreator$PhoneNumberCheck;->mValue:I

    return v0
.end method
