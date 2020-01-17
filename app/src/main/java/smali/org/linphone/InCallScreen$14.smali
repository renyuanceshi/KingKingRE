.class Lorg/linphone/InCallScreen$14;
.super Ljava/lang/Object;
.source "InCallScreen.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/InCallScreen;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lorg/linphone/InCallScreen;I)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 1699
    iput-object p1, p0, Lorg/linphone/InCallScreen$14;->this$0:Lorg/linphone/InCallScreen;

    iput p2, p0, Lorg/linphone/InCallScreen$14;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 1701
    iget-object v0, p0, Lorg/linphone/InCallScreen$14;->this$0:Lorg/linphone/InCallScreen;

    iget v1, p0, Lorg/linphone/InCallScreen$14;->val$id:I

    invoke-virtual {v0, v1}, Lorg/linphone/InCallScreen;->removeDialog(I)V

    .line 1702
    iget-object v0, p0, Lorg/linphone/InCallScreen$14;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$700(Lorg/linphone/InCallScreen;)Landroid/os/CountDownTimer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 1703
    iget-object v0, p0, Lorg/linphone/InCallScreen$14;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$1300(Lorg/linphone/InCallScreen;)V

    .line 1704
    iget-object v0, p0, Lorg/linphone/InCallScreen$14;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$800(Lorg/linphone/InCallScreen;)Landroid/widget/ToggleButton;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setClickable(Z)V

    .line 1705
    return-void
.end method
