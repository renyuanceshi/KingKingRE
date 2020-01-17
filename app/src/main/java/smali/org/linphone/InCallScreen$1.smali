.class Lorg/linphone/InCallScreen$1;
.super Landroid/os/Handler;
.source "InCallScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/InCallScreen;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/InCallScreen;


# direct methods
.method constructor <init>(Lorg/linphone/InCallScreen;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 278
    iput-object p1, p0, Lorg/linphone/InCallScreen$1;->this$0:Lorg/linphone/InCallScreen;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 280
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 329
    :goto_0
    :pswitch_0
    return-void

    .line 282
    :pswitch_1
    iget-object v1, p0, Lorg/linphone/InCallScreen$1;->this$0:Lorg/linphone/InCallScreen;

    invoke-virtual {v1}, Lorg/linphone/InCallScreen;->finish()V

    goto :goto_0

    .line 297
    :pswitch_2
    iget-object v1, p0, Lorg/linphone/InCallScreen$1;->this$0:Lorg/linphone/InCallScreen;

    invoke-virtual {v1}, Lorg/linphone/InCallScreen;->moveBack()V

    goto :goto_0

    .line 322
    :pswitch_3
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .line 323
    .local v0, "score":F
    iget-object v1, p0, Lorg/linphone/InCallScreen$1;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v1, v0}, Lorg/linphone/InCallScreen;->access$000(Lorg/linphone/InCallScreen;F)V

    goto :goto_0

    .line 326
    .end local v0    # "score":F
    :pswitch_4
    iget-object v1, p0, Lorg/linphone/InCallScreen$1;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v1}, Lorg/linphone/InCallScreen;->access$100(Lorg/linphone/InCallScreen;)V

    goto :goto_0

    .line 280
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
