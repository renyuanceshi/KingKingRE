.class Lorg/linphone/InCallScreen$5;
.super Ljava/lang/Object;
.source "InCallScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen;->popupAudioRoutingWindow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/InCallScreen;

.field final synthetic val$popupWindow:Landroid/widget/PopupWindow;


# direct methods
.method constructor <init>(Lorg/linphone/InCallScreen;Landroid/widget/PopupWindow;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 535
    iput-object p1, p0, Lorg/linphone/InCallScreen$5;->this$0:Lorg/linphone/InCallScreen;

    iput-object p2, p0, Lorg/linphone/InCallScreen$5;->val$popupWindow:Landroid/widget/PopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 538
    iget-object v0, p0, Lorg/linphone/InCallScreen$5;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$600(Lorg/linphone/InCallScreen;)V

    .line 540
    iget-object v0, p0, Lorg/linphone/InCallScreen$5;->val$popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 541
    return-void
.end method
