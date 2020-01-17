.class public Lcom/pccw/sms/bean/GroupInfoLayout;
.super Ljava/lang/Object;
.source "GroupInfoLayout.java"


# instance fields
.field private mAdapter:Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter",
            "<",
            "Lcom/pccw/database/entity/GroupMember;",
            ">;"
        }
    .end annotation
.end field

.field private progressBar:Landroid/widget/RelativeLayout;

.field private subscribeUserBtn:Landroid/widget/Button;

.field private subscriptionListView:Landroid/widget/ListView;


# direct methods
.method public constructor <init>(Landroid/widget/ListView;Landroid/widget/Button;Landroid/widget/RelativeLayout;)V
    .locals 1
    .param p1, "subscriptionListView"    # Landroid/widget/ListView;
    .param p2, "subscribeUserBtn"    # Landroid/widget/Button;
    .param p3, "progressBar"    # Landroid/widget/RelativeLayout;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p2, p0, Lcom/pccw/sms/bean/GroupInfoLayout;->subscribeUserBtn:Landroid/widget/Button;

    .line 19
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupInfoLayout;->subscriptionListView:Landroid/widget/ListView;

    .line 20
    iput-object p3, p0, Lcom/pccw/sms/bean/GroupInfoLayout;->progressBar:Landroid/widget/RelativeLayout;

    .line 21
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/sms/bean/GroupInfoLayout;->mAdapter:Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;

    .line 22
    return-void
.end method


# virtual methods
.method public getListAdapter()Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter",
            "<",
            "Lcom/pccw/database/entity/GroupMember;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupInfoLayout;->mAdapter:Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;

    return-object v0
.end method

.method public getProgressBar()Landroid/widget/RelativeLayout;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupInfoLayout;->progressBar:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method public getSubscribeUserBtn()Landroid/widget/Button;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupInfoLayout;->subscribeUserBtn:Landroid/widget/Button;

    return-object v0
.end method

.method public getSubscriptionListView()Landroid/widget/ListView;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupInfoLayout;->subscriptionListView:Landroid/widget/ListView;

    return-object v0
.end method

.method public setListAdapter(Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter",
            "<",
            "Lcom/pccw/database/entity/GroupMember;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p1, "adapter":Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;, "Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter<Lcom/pccw/database/entity/GroupMember;>;"
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupInfoLayout;->mAdapter:Lcom/pccw/sms/adapter/GroupInfoParticipantAdapter;

    .line 46
    return-void
.end method

.method public setProgressBar(Landroid/widget/RelativeLayout;)V
    .locals 0
    .param p1, "progressBar"    # Landroid/widget/RelativeLayout;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupInfoLayout;->progressBar:Landroid/widget/RelativeLayout;

    .line 54
    return-void
.end method

.method public setSubscribeUserBtn(Landroid/widget/Button;)V
    .locals 0
    .param p1, "subscribeUserBtn"    # Landroid/widget/Button;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupInfoLayout;->subscribeUserBtn:Landroid/widget/Button;

    .line 38
    return-void
.end method

.method public setSubscriptionListView(Landroid/widget/ListView;)V
    .locals 0
    .param p1, "subscriptionListView"    # Landroid/widget/ListView;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupInfoLayout;->subscriptionListView:Landroid/widget/ListView;

    .line 30
    return-void
.end method
