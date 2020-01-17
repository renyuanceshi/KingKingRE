.class Lorg/linphone/LinphoneActivity$3;
.super Ljava/lang/Object;
.source "LinphoneActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneActivity;->showCallHotlineDialog(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/LinphoneActivity;

.field final synthetic val$tel:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/LinphoneActivity;

    .prologue
    .line 990
    iput-object p1, p0, Lorg/linphone/LinphoneActivity$3;->this$0:Lorg/linphone/LinphoneActivity;

    iput-object p2, p0, Lorg/linphone/LinphoneActivity$3;->val$tel:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 995
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.CALL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 996
    .local v0, "callIntent":Landroid/content/Intent;
    iget-object v1, p0, Lorg/linphone/LinphoneActivity$3;->val$tel:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 997
    iget-object v1, p0, Lorg/linphone/LinphoneActivity$3;->this$0:Lorg/linphone/LinphoneActivity;

    invoke-virtual {v1, v0}, Lorg/linphone/LinphoneActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1003
    .end local v0    # "callIntent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 998
    :catch_0
    move-exception v1

    goto :goto_0
.end method
