.class Lorg/linphone/DailPadActivity$10;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity;->contTurnOnRS()V
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
    .line 1187
    iput-object p1, p0, Lorg/linphone/DailPadActivity$10;->this$0:Lorg/linphone/DailPadActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 1189
    iget-object v0, p0, Lorg/linphone/DailPadActivity$10;->this$0:Lorg/linphone/DailPadActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/linphone/DailPadActivity;->access$1100(Lorg/linphone/DailPadActivity;Z)V

    .line 1190
    iget-object v0, p0, Lorg/linphone/DailPadActivity$10;->this$0:Lorg/linphone/DailPadActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/linphone/DailPadActivity;->access$1600(Lorg/linphone/DailPadActivity;Z)V

    .line 1191
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 1192
    return-void
.end method
