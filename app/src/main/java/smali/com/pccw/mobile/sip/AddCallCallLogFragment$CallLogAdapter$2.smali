.class Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$2;
.super Ljava/lang/Object;
.source "AddCallCallLogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

.field final synthetic val$number:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    .prologue
    .line 775
    iput-object p1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$2;->this$1:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    iput-object p2, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$2;->val$number:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 779
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$2;->val$number:Ljava/lang/String;

    const-string/jumbo v3, "-2"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$2;->val$number:Ljava/lang/String;

    const-string/jumbo v3, "-1"

    .line 780
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 789
    :cond_0
    :goto_0
    return-void

    .line 783
    :cond_1
    const-string/jumbo v2, "tel"

    iget-object v3, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$2;->this$1:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    iget-object v3, v3, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    iget-object v4, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$2;->val$number:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->access$100(Lcom/pccw/mobile/sip/AddCallCallLogFragment;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 784
    .local v1, "numberUri":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$2;->this$1:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    iget-object v2, v2, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    invoke-static {v2}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->access$300(Lcom/pccw/mobile/sip/AddCallCallLogFragment;)Landroid/app/Activity;

    move-result-object v2

    const-class v3, Lcom/pccw/mobile/sip/AddCallActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 785
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "com.pccw.mobile.sip.service.intent.dial"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 786
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 788
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$2;->this$1:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    iget-object v2, v2, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    invoke-virtual {v2, v0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
