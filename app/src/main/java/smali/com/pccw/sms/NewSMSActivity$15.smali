.class Lcom/pccw/sms/NewSMSActivity$15;
.super Ljava/lang/Object;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/NewSMSActivity;->promptDialog(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/NewSMSActivity;


# direct methods
.method constructor <init>(Lcom/pccw/sms/NewSMSActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/NewSMSActivity;

    .prologue
    .line 639
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$15;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 641
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 642
    return-void
.end method
