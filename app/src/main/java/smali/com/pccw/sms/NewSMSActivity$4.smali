.class Lcom/pccw/sms/NewSMSActivity$4;
.super Ljava/lang/Object;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/NewSMSActivity;->setViewAction()V
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
    .line 252
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$4;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 257
    const/16 v3, 0x42

    if-ne p2, v3, :cond_0

    .line 258
    check-cast p1, Landroid/widget/TextView;

    .end local p1    # "v":Landroid/view/View;
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 259
    .local v0, "text":Ljava/lang/String;
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$4;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v2, v0}, Lcom/pccw/sms/NewSMSActivity;->addRecipientTextView(Ljava/lang/String;)V

    .line 269
    .end local v0    # "text":Ljava/lang/String;
    :goto_0
    return v1

    .line 261
    .restart local p1    # "v":Landroid/view/View;
    :cond_0
    const/4 v3, 0x4

    if-ne p2, v3, :cond_2

    .line 262
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$4;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->mContactAdapter:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    invoke-virtual {v3}, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->getCount()I

    move-result v3

    if-lez v3, :cond_1

    .line 263
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$4;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-static {v2}, Lcom/pccw/sms/NewSMSActivity;->access$000(Lcom/pccw/sms/NewSMSActivity;)V

    goto :goto_0

    :cond_1
    move v1, v2

    .line 266
    goto :goto_0

    :cond_2
    move v1, v2

    .line 269
    goto :goto_0
.end method
