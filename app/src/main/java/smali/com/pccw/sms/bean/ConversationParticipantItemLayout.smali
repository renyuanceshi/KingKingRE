.class public Lcom/pccw/sms/bean/ConversationParticipantItemLayout;
.super Ljava/lang/Object;
.source "ConversationParticipantItemLayout.java"


# instance fields
.field private listview:Landroid/widget/ListView;


# direct methods
.method public constructor <init>(Landroid/widget/ListView;)V
    .locals 0
    .param p1, "listview"    # Landroid/widget/ListView;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/pccw/sms/bean/ConversationParticipantItemLayout;->listview:Landroid/widget/ListView;

    .line 10
    return-void
.end method


# virtual methods
.method public getListview()Landroid/widget/ListView;
    .locals 1

    .prologue
    .line 13
    iget-object v0, p0, Lcom/pccw/sms/bean/ConversationParticipantItemLayout;->listview:Landroid/widget/ListView;

    return-object v0
.end method

.method public setListview(Landroid/widget/ListView;)V
    .locals 0
    .param p1, "listview"    # Landroid/widget/ListView;

    .prologue
    .line 17
    iput-object p1, p0, Lcom/pccw/sms/bean/ConversationParticipantItemLayout;->listview:Landroid/widget/ListView;

    .line 18
    return-void
.end method
