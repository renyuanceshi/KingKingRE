.class Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$2;
.super Ljava/lang/Object;
.source "GroupInfoActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

.field final synthetic val$number:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    .prologue
    .line 413
    iput-object p1, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$2;->this$1:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    iput-object p2, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$2;->val$number:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 416
    iget-object v0, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$2;->this$1:Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;

    iget-object v0, v0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    iget-object v1, p0, Lcom/pccw/sms/GroupInfoActivity$GroupParticipantAdapter$2;->val$number:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/pccw/sms/GroupInfoActivity;->access$400(Lcom/pccw/sms/GroupInfoActivity;Ljava/lang/String;)V

    .line 417
    return-void
.end method
