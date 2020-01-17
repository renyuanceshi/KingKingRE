.class Lorg/linphone/VideoCallActivity$11;
.super Ljava/lang/Object;
.source "VideoCallActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/VideoCallActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/VideoCallActivity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lorg/linphone/VideoCallActivity;I)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 1194
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$11;->this$0:Lorg/linphone/VideoCallActivity;

    iput p2, p0, Lorg/linphone/VideoCallActivity$11;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 1196
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$11;->this$0:Lorg/linphone/VideoCallActivity;

    iget v1, p0, Lorg/linphone/VideoCallActivity$11;->val$id:I

    invoke-virtual {v0, v1}, Lorg/linphone/VideoCallActivity;->removeDialog(I)V

    .line 1197
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$11;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0}, Lorg/linphone/VideoCallActivity;->access$1200(Lorg/linphone/VideoCallActivity;)Landroid/os/CountDownTimer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 1198
    return-void
.end method
