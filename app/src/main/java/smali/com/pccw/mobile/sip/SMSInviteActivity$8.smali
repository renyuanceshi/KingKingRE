.class Lcom/pccw/mobile/sip/SMSInviteActivity$8;
.super Ljava/lang/Object;
.source "SMSInviteActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/SMSInviteActivity;->showSMSInviteResultDialog(Z)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/SMSInviteActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/SMSInviteActivity;

    .prologue
    .line 485
    iput-object p1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$8;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 488
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$8;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$602(Lcom/pccw/mobile/sip/SMSInviteActivity;Z)Z

    .line 489
    return-void
.end method
