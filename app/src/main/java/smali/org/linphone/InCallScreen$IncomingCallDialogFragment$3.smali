.class Lorg/linphone/InCallScreen$IncomingCallDialogFragment$3;
.super Ljava/lang/Object;
.source "InCallScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/InCallScreen$IncomingCallDialogFragment;


# direct methods
.method constructor <init>(Lorg/linphone/InCallScreen$IncomingCallDialogFragment;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/InCallScreen$IncomingCallDialogFragment;

    .prologue
    .line 1982
    iput-object p1, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment$3;->this$0:Lorg/linphone/InCallScreen$IncomingCallDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1985
    iget-object v0, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment$3;->this$0:Lorg/linphone/InCallScreen$IncomingCallDialogFragment;

    invoke-virtual {v0}, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lorg/linphone/InCallScreen;

    invoke-virtual {v0}, Lorg/linphone/InCallScreen;->reject()V

    .line 1986
    iget-object v0, p0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment$3;->this$0:Lorg/linphone/InCallScreen$IncomingCallDialogFragment;

    invoke-virtual {v0}, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 1987
    return-void
.end method
