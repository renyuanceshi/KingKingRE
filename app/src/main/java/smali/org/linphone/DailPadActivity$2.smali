.class Lorg/linphone/DailPadActivity$2;
.super Landroid/os/Handler;
.source "DailPadActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/DailPadActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/DailPadActivity;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/DailPadActivity;
    .param p2, "x0"    # Landroid/os/Looper;

    .prologue
    .line 185
    iput-object p1, p0, Lorg/linphone/DailPadActivity$2;->this$0:Lorg/linphone/DailPadActivity;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 189
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 196
    :goto_0
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 197
    return-void

    .line 193
    :pswitch_0
    iget-object v0, p0, Lorg/linphone/DailPadActivity$2;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/linphone/DailPadActivity;->access$200(Lorg/linphone/DailPadActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 189
    nop

    :pswitch_data_0
    .packed-switch 0x3e8
        :pswitch_0
    .end packed-switch
.end method
