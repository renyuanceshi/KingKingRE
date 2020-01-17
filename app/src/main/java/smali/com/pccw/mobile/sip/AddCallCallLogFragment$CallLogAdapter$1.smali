.class Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$1;
.super Landroid/os/Handler;
.source "AddCallCallLogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    .prologue
    .line 442
    iput-object p1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$1;->this$1:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 445
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 453
    :goto_0
    return-void

    .line 447
    :pswitch_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$1;->this$1:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->notifyDataSetChanged()V

    goto :goto_0

    .line 450
    :pswitch_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$1;->this$1:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->startRequestProcessing()V

    goto :goto_0

    .line 445
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
