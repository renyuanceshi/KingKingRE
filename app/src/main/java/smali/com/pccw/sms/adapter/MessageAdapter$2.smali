.class Lcom/pccw/sms/adapter/MessageAdapter$2;
.super Ljava/lang/Object;
.source "MessageAdapter.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/adapter/MessageAdapter;->popupMessageSelection(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/adapter/MessageAdapter;

.field final synthetic val$msgId:I


# direct methods
.method constructor <init>(Lcom/pccw/sms/adapter/MessageAdapter;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/adapter/MessageAdapter;

    .prologue
    .line 526
    iput-object p1, p0, Lcom/pccw/sms/adapter/MessageAdapter$2;->this$0:Lcom/pccw/sms/adapter/MessageAdapter;

    iput p2, p0, Lcom/pccw/sms/adapter/MessageAdapter$2;->val$msgId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 530
    packed-switch p2, :pswitch_data_0

    .line 540
    :goto_0
    return-void

    .line 532
    :pswitch_0
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter$2;->this$0:Lcom/pccw/sms/adapter/MessageAdapter;

    iget v1, p0, Lcom/pccw/sms/adapter/MessageAdapter$2;->val$msgId:I

    invoke-static {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->access$200(Lcom/pccw/sms/adapter/MessageAdapter;I)V

    goto :goto_0

    .line 536
    :pswitch_1
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter$2;->this$0:Lcom/pccw/sms/adapter/MessageAdapter;

    iget v1, p0, Lcom/pccw/sms/adapter/MessageAdapter$2;->val$msgId:I

    invoke-static {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->access$300(Lcom/pccw/sms/adapter/MessageAdapter;I)V

    goto :goto_0

    .line 530
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
