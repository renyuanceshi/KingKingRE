.class public Lcom/pccw/database/entity/ChatPageInfo;
.super Ljava/lang/Object;
.source "ChatPageInfo.java"


# instance fields
.field chatId:I

.field chatType:Ljava/lang/String;

.field owner:Ljava/lang/String;

.field photo:Landroid/graphics/Bitmap;

.field recipient:Ljava/lang/String;

.field title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "owner"    # Ljava/lang/String;
    .param p2, "recipient"    # Ljava/lang/String;
    .param p3, "chatType"    # Ljava/lang/String;
    .param p4, "title"    # Ljava/lang/String;
    .param p5, "chatId"    # I
    .param p6, "photo"    # Landroid/graphics/Bitmap;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/pccw/database/entity/ChatPageInfo;->owner:Ljava/lang/String;

    .line 19
    iput-object p2, p0, Lcom/pccw/database/entity/ChatPageInfo;->recipient:Ljava/lang/String;

    .line 20
    iput-object p3, p0, Lcom/pccw/database/entity/ChatPageInfo;->chatType:Ljava/lang/String;

    .line 21
    iput-object p4, p0, Lcom/pccw/database/entity/ChatPageInfo;->title:Ljava/lang/String;

    .line 22
    iput p5, p0, Lcom/pccw/database/entity/ChatPageInfo;->chatId:I

    .line 23
    iput-object p6, p0, Lcom/pccw/database/entity/ChatPageInfo;->photo:Landroid/graphics/Bitmap;

    .line 24
    return-void
.end method


# virtual methods
.method public getChatId()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/pccw/database/entity/ChatPageInfo;->chatId:I

    return v0
.end method

.method public getChatType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/pccw/database/entity/ChatPageInfo;->chatType:Ljava/lang/String;

    return-object v0
.end method

.method public getOwner()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/pccw/database/entity/ChatPageInfo;->owner:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoto()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/pccw/database/entity/ChatPageInfo;->photo:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getRecipient()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/pccw/database/entity/ChatPageInfo;->recipient:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/pccw/database/entity/ChatPageInfo;->title:Ljava/lang/String;

    return-object v0
.end method

.method public hasPhoto()Z
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/pccw/database/entity/ChatPageInfo;->photo:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isAvaiableOnBD()Z
    .locals 2

    .prologue
    .line 75
    iget v0, p0, Lcom/pccw/database/entity/ChatPageInfo;->chatId:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isGroupChat()Z
    .locals 2

    .prologue
    .line 67
    const-string/jumbo v0, "group"

    iget-object v1, p0, Lcom/pccw/database/entity/ChatPageInfo;->chatType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isIndividualChat()Z
    .locals 2

    .prologue
    .line 71
    const-string/jumbo v0, "individual"

    iget-object v1, p0, Lcom/pccw/database/entity/ChatPageInfo;->chatType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setChatId(I)V
    .locals 0
    .param p1, "chatId"    # I

    .prologue
    .line 63
    iput p1, p0, Lcom/pccw/database/entity/ChatPageInfo;->chatId:I

    .line 64
    return-void
.end method

.method public setChatType(Ljava/lang/String;)V
    .locals 0
    .param p1, "chatType"    # Ljava/lang/String;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/pccw/database/entity/ChatPageInfo;->chatType:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public setOwner(Ljava/lang/String;)V
    .locals 0
    .param p1, "owner"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/pccw/database/entity/ChatPageInfo;->owner:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public setPhoto(Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "photo"    # Landroid/graphics/Bitmap;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/pccw/database/entity/ChatPageInfo;->photo:Landroid/graphics/Bitmap;

    .line 84
    return-void
.end method

.method public setRecipient(Ljava/lang/String;)V
    .locals 0
    .param p1, "recipient"    # Ljava/lang/String;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/pccw/database/entity/ChatPageInfo;->recipient:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/pccw/database/entity/ChatPageInfo;->title:Ljava/lang/String;

    .line 56
    return-void
.end method
