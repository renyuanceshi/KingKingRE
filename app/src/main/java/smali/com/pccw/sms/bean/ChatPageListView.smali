.class public Lcom/pccw/sms/bean/ChatPageListView;
.super Ljava/lang/Object;
.source "ChatPageListView.java"


# instance fields
.field private currentPage:I

.field private listView:Landroid/widget/ListView;

.field private messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;


# direct methods
.method public constructor <init>(Landroid/widget/ListView;ILcom/pccw/sms/adapter/MessageAdapter;)V
    .locals 0
    .param p1, "listView"    # Landroid/widget/ListView;
    .param p2, "currentPage"    # I
    .param p3, "adapter"    # Lcom/pccw/sms/adapter/MessageAdapter;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/pccw/sms/bean/ChatPageListView;->listView:Landroid/widget/ListView;

    .line 15
    iput p2, p0, Lcom/pccw/sms/bean/ChatPageListView;->currentPage:I

    .line 16
    iput-object p3, p0, Lcom/pccw/sms/bean/ChatPageListView;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    .line 17
    return-void
.end method


# virtual methods
.method public getCurrentPage()I
    .locals 1

    .prologue
    .line 27
    iget v0, p0, Lcom/pccw/sms/bean/ChatPageListView;->currentPage:I

    return v0
.end method

.method public getListView()Landroid/widget/ListView;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/pccw/sms/bean/ChatPageListView;->listView:Landroid/widget/ListView;

    return-object v0
.end method

.method public getMessageAdapter()Lcom/pccw/sms/adapter/MessageAdapter;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/pccw/sms/bean/ChatPageListView;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    return-object v0
.end method

.method public setCurrentPage(I)V
    .locals 0
    .param p1, "currentPage"    # I

    .prologue
    .line 31
    iput p1, p0, Lcom/pccw/sms/bean/ChatPageListView;->currentPage:I

    .line 32
    return-void
.end method

.method public setListView(Landroid/widget/ListView;)V
    .locals 0
    .param p1, "listView"    # Landroid/widget/ListView;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/pccw/sms/bean/ChatPageListView;->listView:Landroid/widget/ListView;

    .line 24
    return-void
.end method

.method public setMessageAdapter(Lcom/pccw/sms/adapter/MessageAdapter;)V
    .locals 0
    .param p1, "messageAdapter"    # Lcom/pccw/sms/adapter/MessageAdapter;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/pccw/sms/bean/ChatPageListView;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    .line 40
    return-void
.end method
