.class Lorg/linphone/DailPadActivity$5;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity;->runFacebookShareChecking()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/DailPadActivity;

.field final synthetic val$mFacebookShareActivity:Lcom/pccw/mobile/sip/FacebookShareActivity;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity;Lcom/pccw/mobile/sip/FacebookShareActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 338
    iput-object p1, p0, Lorg/linphone/DailPadActivity$5;->this$0:Lorg/linphone/DailPadActivity;

    iput-object p2, p0, Lorg/linphone/DailPadActivity$5;->val$mFacebookShareActivity:Lcom/pccw/mobile/sip/FacebookShareActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "d"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 341
    iget-object v0, p0, Lorg/linphone/DailPadActivity$5;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$500(Lorg/linphone/DailPadActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 342
    iget-object v0, p0, Lorg/linphone/DailPadActivity$5;->val$mFacebookShareActivity:Lcom/pccw/mobile/sip/FacebookShareActivity;

    iget-object v1, p0, Lorg/linphone/DailPadActivity$5;->this$0:Lorg/linphone/DailPadActivity;

    .line 343
    invoke-static {v1}, Lorg/linphone/DailPadActivity;->access$600(Lorg/linphone/DailPadActivity;)Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->promptShareToFacebookDialog(Landroid/support/v4/app/FragmentManager;)V

    .line 347
    :goto_0
    return-void

    .line 345
    :cond_0
    iget-object v0, p0, Lorg/linphone/DailPadActivity$5;->this$0:Lorg/linphone/DailPadActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/linphone/DailPadActivity;->access$700(Lorg/linphone/DailPadActivity;I)V

    goto :goto_0
.end method
