.class public Lcom/pccw/sms/bean/Emojicon;
.super Ljava/lang/Object;
.source "Emojicon.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private emoji:Ljava/lang/String;

.field private icon_char:C

.field private icon_unicode:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "emoji"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/pccw/sms/bean/Emojicon;->emoji:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public static fromChar(C)Lcom/pccw/sms/bean/Emojicon;
    .locals 2
    .param p0, "ch"    # C

    .prologue
    .line 27
    new-instance v0, Lcom/pccw/sms/bean/Emojicon;

    invoke-direct {v0}, Lcom/pccw/sms/bean/Emojicon;-><init>()V

    .line 28
    .local v0, "emoji":Lcom/pccw/sms/bean/Emojicon;
    invoke-static {p0}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/sms/bean/Emojicon;->emoji:Ljava/lang/String;

    .line 29
    return-object v0
.end method

.method public static fromChars(Ljava/lang/String;)Lcom/pccw/sms/bean/Emojicon;
    .locals 1
    .param p0, "chars"    # Ljava/lang/String;

    .prologue
    .line 33
    new-instance v0, Lcom/pccw/sms/bean/Emojicon;

    invoke-direct {v0}, Lcom/pccw/sms/bean/Emojicon;-><init>()V

    .line 34
    .local v0, "emoji":Lcom/pccw/sms/bean/Emojicon;
    iput-object p0, v0, Lcom/pccw/sms/bean/Emojicon;->emoji:Ljava/lang/String;

    .line 35
    return-object v0
.end method

.method public static fromCodePoint(I)Lcom/pccw/sms/bean/Emojicon;
    .locals 2
    .param p0, "codePoint"    # I

    .prologue
    .line 21
    new-instance v0, Lcom/pccw/sms/bean/Emojicon;

    invoke-direct {v0}, Lcom/pccw/sms/bean/Emojicon;-><init>()V

    .line 22
    .local v0, "emoji":Lcom/pccw/sms/bean/Emojicon;
    invoke-static {p0}, Lcom/pccw/sms/bean/Emojicon;->newString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/sms/bean/Emojicon;->emoji:Ljava/lang/String;

    .line 23
    return-object v0
.end method

.method public static fromResource(II)Lcom/pccw/sms/bean/Emojicon;
    .locals 2
    .param p0, "icon"    # I
    .param p1, "value"    # I

    .prologue
    .line 14
    new-instance v0, Lcom/pccw/sms/bean/Emojicon;

    invoke-direct {v0}, Lcom/pccw/sms/bean/Emojicon;-><init>()V

    .line 15
    .local v0, "emoji":Lcom/pccw/sms/bean/Emojicon;
    iput p0, v0, Lcom/pccw/sms/bean/Emojicon;->icon_unicode:I

    .line 16
    int-to-char v1, p1

    iput-char v1, v0, Lcom/pccw/sms/bean/Emojicon;->icon_char:C

    .line 17
    return-object v0
.end method

.method public static final newString(I)Ljava/lang/String;
    .locals 2
    .param p0, "codePoint"    # I

    .prologue
    .line 55
    invoke-static {p0}, Ljava/lang/Character;->charCount(I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 56
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 58
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    goto :goto_0
.end method


# virtual methods
.method public getEmoji()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/pccw/sms/bean/Emojicon;->emoji:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/pccw/sms/bean/Emojicon;->icon_unicode:I

    return v0
.end method

.method public getValue()C
    .locals 1

    .prologue
    .line 43
    iget-char v0, p0, Lcom/pccw/sms/bean/Emojicon;->icon_char:C

    return v0
.end method
