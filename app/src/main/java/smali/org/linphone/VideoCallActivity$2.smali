.class Lorg/linphone/VideoCallActivity$2;
.super Landroid/view/OrientationEventListener;
.source "VideoCallActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/VideoCallActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/VideoCallActivity;


# direct methods
.method constructor <init>(Lorg/linphone/VideoCallActivity;Landroid/content/Context;I)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/VideoCallActivity;
    .param p2, "x0"    # Landroid/content/Context;
    .param p3, "x1"    # I

    .prologue
    .line 338
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$2;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-direct {p0, p2, p3}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 5
    .param p1, "arg0"    # I

    .prologue
    const/16 v4, 0x5a

    const/16 v3, 0xb

    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 348
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$2;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0}, Lorg/linphone/VideoCallActivity;->access$200(Lorg/linphone/VideoCallActivity;)I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 395
    :cond_0
    :goto_0
    return-void

    .line 367
    :cond_1
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$2;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0}, Lorg/linphone/VideoCallActivity;->access$300(Lorg/linphone/VideoCallActivity;)I

    move-result v0

    if-ne v0, v2, :cond_4

    const/16 v0, 0x104

    if-lt p1, v0, :cond_2

    const/16 v0, 0x118

    if-le p1, v0, :cond_3

    :cond_2
    const/16 v0, 0x50

    if-lt p1, v0, :cond_4

    if-gt p1, v4, :cond_4

    .line 369
    :cond_3
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$2;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0, v1}, Lorg/linphone/VideoCallActivity;->access$302(Lorg/linphone/VideoCallActivity;I)I

    .line 370
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$2;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity;->changeIconOrientation()V

    .line 378
    invoke-static {v3}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 379
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$2;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0}, Lorg/linphone/VideoCallActivity;->access$400(Lorg/linphone/VideoCallActivity;)Lcom/pccw/camera/ui/RotateDialogController;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/pccw/camera/ui/RotateDialogController;->setOrientation(I)V

    goto :goto_0

    .line 380
    :cond_4
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$2;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0}, Lorg/linphone/VideoCallActivity;->access$300(Lorg/linphone/VideoCallActivity;)I

    move-result v0

    if-ne v0, v1, :cond_0

    const/16 v0, 0x15e

    if-ge p1, v0, :cond_5

    const/16 v0, 0xa

    if-gt p1, v0, :cond_0

    .line 381
    :cond_5
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$2;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0, v2}, Lorg/linphone/VideoCallActivity;->access$302(Lorg/linphone/VideoCallActivity;I)I

    .line 382
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$2;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity;->changeIconOrientation()V

    .line 391
    invoke-static {v3}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 392
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$2;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0}, Lorg/linphone/VideoCallActivity;->access$400(Lorg/linphone/VideoCallActivity;)Lcom/pccw/camera/ui/RotateDialogController;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/pccw/camera/ui/RotateDialogController;->setOrientation(I)V

    goto :goto_0
.end method
