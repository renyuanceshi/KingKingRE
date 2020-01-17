.class Lorg/linphone/VideoCallActivity$10;
.super Ljava/lang/Object;
.source "VideoCallActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/VideoCallActivity;->popupAudioRoutingWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/VideoCallActivity;

.field final synthetic val$popupWindow:Landroid/widget/PopupWindow;


# direct methods
.method constructor <init>(Lorg/linphone/VideoCallActivity;Landroid/widget/PopupWindow;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 825
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$10;->this$0:Lorg/linphone/VideoCallActivity;

    iput-object p2, p0, Lorg/linphone/VideoCallActivity$10;->val$popupWindow:Landroid/widget/PopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 828
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$10;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity;->routeAudioToReceiver()V

    .line 829
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$10;->val$popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 830
    return-void
.end method
