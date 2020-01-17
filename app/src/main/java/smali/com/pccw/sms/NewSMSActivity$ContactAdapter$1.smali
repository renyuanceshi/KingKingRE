.class Lcom/pccw/sms/NewSMSActivity$ContactAdapter$1;
.super Ljava/lang/Object;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

.field final synthetic val$phoneNumber:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/sms/NewSMSActivity$ContactAdapter;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    .prologue
    .line 811
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter$1;->this$1:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    iput-object p2, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter$1;->val$phoneNumber:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 815
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter$1;->this$1:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity;->recipientLayout:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 816
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter$1;->this$1:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-static {v0}, Lcom/pccw/sms/NewSMSActivity;->access$600(Lcom/pccw/sms/NewSMSActivity;)V

    .line 817
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter$1;->this$1:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter$1;->val$phoneNumber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/pccw/sms/NewSMSActivity;->addRecipientTextView(Ljava/lang/String;)V

    .line 818
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter$1;->this$1:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-static {v0}, Lcom/pccw/sms/NewSMSActivity;->access$000(Lcom/pccw/sms/NewSMSActivity;)V

    .line 819
    return-void
.end method
