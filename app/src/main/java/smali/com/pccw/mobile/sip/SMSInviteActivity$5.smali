.class Lcom/pccw/mobile/sip/SMSInviteActivity$5;
.super Ljava/lang/Object;
.source "SMSInviteActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/SMSInviteActivity;->showNoWifiDialog()V
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
    .line 430
    iput-object p1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$5;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 432
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 433
    return-void
.end method
