.class Lcom/pccw/sms/GroupInfoActivity$4;
.super Ljava/lang/Object;
.source "GroupInfoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/GroupInfoActivity;->onCreateNoNetworkDialog(Landroid/content/Context;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/GroupInfoActivity;


# direct methods
.method constructor <init>(Lcom/pccw/sms/GroupInfoActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/GroupInfoActivity;

    .prologue
    .line 254
    iput-object p1, p0, Lcom/pccw/sms/GroupInfoActivity$4;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 256
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 257
    return-void
.end method
