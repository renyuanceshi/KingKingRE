.class Lorg/linphone/DailPadActivity$13;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity;->showDialog(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/DailPadActivity;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 1755
    iput-object p1, p0, Lorg/linphone/DailPadActivity$13;->this$0:Lorg/linphone/DailPadActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 1758
    iget-object v0, p0, Lorg/linphone/DailPadActivity$13;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$900(Lorg/linphone/DailPadActivity;)Landroid/os/CountDownTimer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 1759
    iget-object v0, p0, Lorg/linphone/DailPadActivity$13;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v1, p0, Lorg/linphone/DailPadActivity$13;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v1}, Lorg/linphone/DailPadActivity;->access$2100(Lorg/linphone/DailPadActivity;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lorg/linphone/DailPadActivity;->access$1000(Lorg/linphone/DailPadActivity;Ljava/lang/String;Z)V

    .line 1760
    return-void
.end method
