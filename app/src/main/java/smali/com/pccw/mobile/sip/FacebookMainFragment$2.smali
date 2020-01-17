.class Lcom/pccw/mobile/sip/FacebookMainFragment$2;
.super Ljava/lang/Object;
.source "FacebookMainFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/FacebookMainFragment;->showShareDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/FacebookMainFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/FacebookMainFragment;

    .prologue
    .line 231
    iput-object p1, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$2;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 234
    iget-object v2, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$2;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-static {v2}, Lcom/pccw/mobile/sip/FacebookMainFragment;->access$100(Lcom/pccw/mobile/sip/FacebookMainFragment;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 235
    iget-object v2, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$2;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-virtual {v2}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/FacebookMainFragment$2$1;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/FacebookMainFragment$2$1;-><init>(Lcom/pccw/mobile/sip/FacebookMainFragment$2;)V

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 241
    iget-object v2, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$2;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-static {v2}, Lcom/pccw/mobile/sip/FacebookMainFragment;->access$300(Lcom/pccw/mobile/sip/FacebookMainFragment;)V

    .line 251
    :goto_0
    return-void

    .line 244
    :cond_0
    iget-object v2, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$2;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$2;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-static {v4}, Lcom/pccw/mobile/sip/FacebookMainFragment;->access$400(Lcom/pccw/mobile/sip/FacebookMainFragment;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "?fsid="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$2;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-static {v4}, Lcom/pccw/mobile/sip/FacebookMainFragment;->access$500(Lcom/pccw/mobile/sip/FacebookMainFragment;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/pccw/mobile/sip/FacebookMainFragment;->access$402(Lcom/pccw/mobile/sip/FacebookMainFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 245
    new-instance v1, Lcom/facebook/share/widget/ShareDialog;

    iget-object v2, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$2;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-direct {v1, v2}, Lcom/facebook/share/widget/ShareDialog;-><init>(Landroid/support/v4/app/Fragment;)V

    .line 246
    .local v1, "shareDialog":Lcom/facebook/share/widget/ShareDialog;
    iget-object v2, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$2;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-static {v2}, Lcom/pccw/mobile/sip/FacebookMainFragment;->access$600(Lcom/pccw/mobile/sip/FacebookMainFragment;)Lcom/facebook/CallbackManager;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$2;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-static {v3}, Lcom/pccw/mobile/sip/FacebookMainFragment;->access$700(Lcom/pccw/mobile/sip/FacebookMainFragment;)Lcom/facebook/FacebookCallback;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/facebook/share/widget/ShareDialog;->registerCallback(Lcom/facebook/CallbackManager;Lcom/facebook/FacebookCallback;)V

    .line 247
    new-instance v2, Lcom/facebook/share/model/ShareLinkContent$Builder;

    invoke-direct {v2}, Lcom/facebook/share/model/ShareLinkContent$Builder;-><init>()V

    iget-object v3, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$2;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    .line 248
    invoke-static {v3}, Lcom/pccw/mobile/sip/FacebookMainFragment;->access$400(Lcom/pccw/mobile/sip/FacebookMainFragment;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/facebook/share/model/ShareLinkContent$Builder;->setContentUrl(Landroid/net/Uri;)Lcom/facebook/share/model/ShareContent$Builder;

    move-result-object v2

    check-cast v2, Lcom/facebook/share/model/ShareLinkContent$Builder;

    .line 249
    invoke-virtual {v2}, Lcom/facebook/share/model/ShareLinkContent$Builder;->build()Lcom/facebook/share/model/ShareLinkContent;

    move-result-object v0

    .line 250
    .local v0, "shareContent":Lcom/facebook/share/model/ShareContent;
    invoke-virtual {v1, v0}, Lcom/facebook/share/widget/ShareDialog;->show(Ljava/lang/Object;)V

    goto :goto_0
.end method
