.class Lorg/linphone/InCallScreen$2;
.super Ljava/lang/Object;
.source "InCallScreen.java"

# interfaces
.implements Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen;->initInCallScreen()V
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
    .line 412
    iput-object p1, p0, Lorg/linphone/InCallScreen$2;->this$0:Lorg/linphone/InCallScreen;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGrabbedStateChange(Landroid/view/View;I)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;
    .param p2, "grabbedState"    # I

    .prologue
    .line 417
    return-void
.end method

.method public onTrigger(Landroid/view/View;I)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "whichHandle"    # I

    .prologue
    const/16 v2, 0x8

    .line 421
    packed-switch p2, :pswitch_data_0

    .line 456
    :goto_0
    return-void

    .line 432
    :pswitch_0
    iget-object v0, p0, Lorg/linphone/InCallScreen$2;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$200(Lorg/linphone/InCallScreen;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 433
    iget-object v0, p0, Lorg/linphone/InCallScreen$2;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$300(Lorg/linphone/InCallScreen;)Lcom/pccw/android/common/widget/SlidingTab;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/pccw/android/common/widget/SlidingTab;->setVisibility(I)V

    .line 434
    iget-object v0, p0, Lorg/linphone/InCallScreen$2;->this$0:Lorg/linphone/InCallScreen;

    invoke-virtual {v0}, Lorg/linphone/InCallScreen;->answer()V

    goto :goto_0

    .line 439
    :pswitch_1
    iget-object v0, p0, Lorg/linphone/InCallScreen$2;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$300(Lorg/linphone/InCallScreen;)Lcom/pccw/android/common/widget/SlidingTab;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/pccw/android/common/widget/SlidingTab;->setVisibility(I)V

    .line 441
    iget-object v0, p0, Lorg/linphone/InCallScreen$2;->this$0:Lorg/linphone/InCallScreen;

    invoke-virtual {v0}, Lorg/linphone/InCallScreen;->reject()V

    goto :goto_0

    .line 447
    :pswitch_2
    iget-object v0, p0, Lorg/linphone/InCallScreen$2;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$300(Lorg/linphone/InCallScreen;)Lcom/pccw/android/common/widget/SlidingTab;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/pccw/android/common/widget/SlidingTab;->setVisibility(I)V

    .line 448
    iget-object v0, p0, Lorg/linphone/InCallScreen$2;->this$0:Lorg/linphone/InCallScreen;

    invoke-virtual {v0}, Lorg/linphone/InCallScreen;->answerWithVideo()V

    goto :goto_0

    .line 421
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
