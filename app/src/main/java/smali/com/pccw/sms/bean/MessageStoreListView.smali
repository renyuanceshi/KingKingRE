.class public Lcom/pccw/sms/bean/MessageStoreListView;
.super Ljava/lang/Object;
.source "MessageStoreListView.java"


# instance fields
.field private chatId:I

.field private listView:Landroid/widget/ListView;

.field private recipient:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/widget/ListView;ILjava/lang/String;)V
    .locals 0
    .param p1, "listView"    # Landroid/widget/ListView;
    .param p2, "chatId"    # I
    .param p3, "recipient"    # Ljava/lang/String;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/pccw/sms/bean/MessageStoreListView;->listView:Landroid/widget/ListView;

    .line 13
    iput p2, p0, Lcom/pccw/sms/bean/MessageStoreListView;->chatId:I

    .line 14
    invoke-virtual {p0, p3}, Lcom/pccw/sms/bean/MessageStoreListView;->setRecipient(Ljava/lang/String;)V

    .line 15
    return-void
.end method


# virtual methods
.method public getChatId()I
    .locals 1

    .prologue
    .line 24
    iget v0, p0, Lcom/pccw/sms/bean/MessageStoreListView;->chatId:I

    return v0
.end method

.method public getListView()Landroid/widget/ListView;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/pccw/sms/bean/MessageStoreListView;->listView:Landroid/widget/ListView;

    return-object v0
.end method

.method public getRecipient()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/pccw/sms/bean/MessageStoreListView;->recipient:Ljava/lang/String;

    return-object v0
.end method

.method public setChatId(I)V
    .locals 0
    .param p1, "chatId"    # I

    .prologue
    .line 27
    iput p1, p0, Lcom/pccw/sms/bean/MessageStoreListView;->chatId:I

    .line 28
    return-void
.end method

.method public setListView(Landroid/widget/ListView;)V
    .locals 0
    .param p1, "listView"    # Landroid/widget/ListView;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/pccw/sms/bean/MessageStoreListView;->listView:Landroid/widget/ListView;

    .line 22
    return-void
.end method

.method public setRecipient(Ljava/lang/String;)V
    .locals 0
    .param p1, "recipient"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/pccw/sms/bean/MessageStoreListView;->recipient:Ljava/lang/String;

    .line 36
    return-void
.end method
