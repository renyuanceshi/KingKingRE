.class Lcom/pccw/sms/NewSMSActivity$5;
.super Ljava/lang/Object;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 275
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$5;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 279
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$5;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v1, v1, Lcom/pccw/sms/NewSMSActivity;->addEt:Lcom/pccw/sms/emoji/EmojiEditText;

    invoke-virtual {v1}, Lcom/pccw/sms/emoji/EmojiEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 280
    .local v0, "text":Ljava/lang/String;
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$5;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v1, v0}, Lcom/pccw/sms/NewSMSActivity;->addRecipientTextView(Ljava/lang/String;)V

    .line 281
    return-void
.end method
