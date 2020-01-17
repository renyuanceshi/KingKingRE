.class Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;
.super Ljava/lang/Object;
.source "CallLogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

.field final synthetic val$contactName:Ljava/lang/String;

.field final synthetic val$number:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    .prologue
    .line 1401
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;->this$1:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    iput-object p2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;->val$number:Ljava/lang/String;

    iput-object p3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;->val$contactName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1405
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;->val$number:Ljava/lang/String;

    const-string/jumbo v3, "-2"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;->val$number:Ljava/lang/String;

    const-string/jumbo v3, "-1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;->val$number:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1416
    :cond_0
    :goto_0
    return-void

    .line 1409
    :cond_1
    new-instance v0, Lcom/pccw/mobile/sms/helper/ContactsHelper;

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;->val$number:Ljava/lang/String;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lcom/pccw/mobile/sms/helper/ContactsHelper;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 1411
    .local v0, "helper":Lcom/pccw/mobile/sms/helper/ContactsHelper;
    new-instance v1, Landroid/content/Intent;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$1500()Landroid/app/Activity;

    move-result-object v2

    const-class v3, Lcom/pccw/mobile/sip/CallLogGroupedActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1412
    .local v1, "mIntent":Landroid/content/Intent;
    const-string/jumbo v2, "contactNumber"

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;->val$number:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1413
    const-string/jumbo v2, "contactName"

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;->val$contactName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1414
    const-string/jumbo v2, "contactPhoto"

    invoke-virtual {v0}, Lcom/pccw/mobile/sms/helper/ContactsHelper;->getPhoto()Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1415
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;->this$1:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    iget-object v2, v2, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-virtual {v2, v1}, Lcom/pccw/mobile/sip/CallLogFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
