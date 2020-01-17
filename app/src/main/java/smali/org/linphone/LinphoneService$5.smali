.class Lorg/linphone/LinphoneService$5;
.super Ljava/lang/Object;
.source "LinphoneService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneService;->callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/LinphoneService;

.field final synthetic val$call:Lorg/linphone/core/LinphoneCall;

.field final synthetic val$lc:Lorg/linphone/core/LinphoneCore;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$state:Lorg/linphone/core/LinphoneCall$State;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/LinphoneService;

    .prologue
    .line 629
    iput-object p1, p0, Lorg/linphone/LinphoneService$5;->this$0:Lorg/linphone/LinphoneService;

    iput-object p2, p0, Lorg/linphone/LinphoneService$5;->val$state:Lorg/linphone/core/LinphoneCall$State;

    iput-object p3, p0, Lorg/linphone/LinphoneService$5;->val$message:Ljava/lang/String;

    iput-object p4, p0, Lorg/linphone/LinphoneService$5;->val$lc:Lorg/linphone/core/LinphoneCore;

    iput-object p5, p0, Lorg/linphone/LinphoneService$5;->val$call:Lorg/linphone/core/LinphoneCall;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 641
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->val$state:Lorg/linphone/core/LinphoneCall$State;

    sget-object v4, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    if-ne v3, v4, :cond_6

    .line 643
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->this$0:Lorg/linphone/LinphoneService;

    iget-object v4, p0, Lorg/linphone/LinphoneService$5;->val$lc:Lorg/linphone/core/LinphoneCore;

    invoke-static {v3, v4}, Lorg/linphone/LinphoneService;->access$100(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCore;)V

    .line 645
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    iget-object v4, p0, Lorg/linphone/LinphoneService$5;->val$call:Lorg/linphone/core/LinphoneCall;

    invoke-virtual {v3, v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v0

    .line 646
    .local v0, "number":Ljava/lang/String;
    invoke-static {}, Lorg/linphone/KingKingLinphoneUtil;->getInstance()Lorg/linphone/KingKingLinphoneUtil;

    move-result-object v3

    invoke-static {}, Lcom/pccw/mobile/sip/util/ContactsUtils;->getInstance()Lcom/pccw/mobile/sip/util/ContactsUtils;

    move-result-object v4

    iget-object v5, p0, Lorg/linphone/LinphoneService$5;->this$0:Lorg/linphone/LinphoneService;

    invoke-virtual {v4, v5, v0}, Lcom/pccw/mobile/sip/util/ContactsUtils;->queryByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Lcom/pccw/mobile/sip/util/Contact;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/linphone/KingKingLinphoneUtil;->setContact(Lcom/pccw/mobile/sip/util/Contact;)V

    .line 719
    .end local v0    # "number":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 720
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v3

    iget-object v4, p0, Lorg/linphone/LinphoneService$5;->val$lc:Lorg/linphone/core/LinphoneCore;

    iget-object v5, p0, Lorg/linphone/LinphoneService$5;->val$call:Lorg/linphone/core/LinphoneCall;

    iget-object v6, p0, Lorg/linphone/LinphoneService$5;->val$state:Lorg/linphone/core/LinphoneCall$State;

    iget-object v7, p0, Lorg/linphone/LinphoneService$5;->val$message:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6, v7}, Lorg/linphone/InCallScreen;->callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V

    .line 721
    :cond_1
    invoke-static {}, Lorg/linphone/DailPadActivity;->getDailPad()Lorg/linphone/DailPadActivity;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 722
    invoke-static {}, Lorg/linphone/DailPadActivity;->getDailPad()Lorg/linphone/DailPadActivity;

    move-result-object v3

    iget-object v4, p0, Lorg/linphone/LinphoneService$5;->val$lc:Lorg/linphone/core/LinphoneCore;

    iget-object v5, p0, Lorg/linphone/LinphoneService$5;->val$call:Lorg/linphone/core/LinphoneCall;

    iget-object v6, p0, Lorg/linphone/LinphoneService$5;->val$state:Lorg/linphone/core/LinphoneCall$State;

    iget-object v7, p0, Lorg/linphone/LinphoneService$5;->val$message:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6, v7}, Lorg/linphone/DailPadActivity;->callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V

    .line 723
    :cond_2
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 724
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v3

    iget-object v4, p0, Lorg/linphone/LinphoneService$5;->val$lc:Lorg/linphone/core/LinphoneCore;

    iget-object v5, p0, Lorg/linphone/LinphoneService$5;->val$call:Lorg/linphone/core/LinphoneCall;

    iget-object v6, p0, Lorg/linphone/LinphoneService$5;->val$state:Lorg/linphone/core/LinphoneCall$State;

    iget-object v7, p0, Lorg/linphone/LinphoneService$5;->val$message:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6, v7}, Lorg/linphone/VideoCallActivity;->callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V

    .line 725
    :cond_3
    invoke-static {}, Lcom/pccw/mobile/sip/AddCallActivity;->getActivity()Lcom/pccw/mobile/sip/AddCallActivity;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 726
    invoke-static {}, Lcom/pccw/mobile/sip/AddCallActivity;->getActivity()Lcom/pccw/mobile/sip/AddCallActivity;

    move-result-object v3

    iget-object v4, p0, Lorg/linphone/LinphoneService$5;->val$lc:Lorg/linphone/core/LinphoneCore;

    iget-object v5, p0, Lorg/linphone/LinphoneService$5;->val$call:Lorg/linphone/core/LinphoneCall;

    iget-object v6, p0, Lorg/linphone/LinphoneService$5;->val$state:Lorg/linphone/core/LinphoneCall$State;

    iget-object v7, p0, Lorg/linphone/LinphoneService$5;->val$message:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/pccw/mobile/sip/AddCallActivity;->callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V

    .line 727
    :cond_4
    invoke-static {}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->getActivity()Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 728
    invoke-static {}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->getActivity()Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;

    move-result-object v3

    iget-object v4, p0, Lorg/linphone/LinphoneService$5;->val$lc:Lorg/linphone/core/LinphoneCore;

    iget-object v5, p0, Lorg/linphone/LinphoneService$5;->val$call:Lorg/linphone/core/LinphoneCall;

    iget-object v6, p0, Lorg/linphone/LinphoneService$5;->val$state:Lorg/linphone/core/LinphoneCall$State;

    iget-object v7, p0, Lorg/linphone/LinphoneService$5;->val$message:Ljava/lang/String;

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V

    .line 734
    :cond_5
    return-void

    .line 650
    :cond_6
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->val$state:Lorg/linphone/core/LinphoneCall$State;

    sget-object v4, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    if-ne v3, v4, :cond_8

    .line 654
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->this$0:Lorg/linphone/LinphoneService;

    iget-object v4, p0, Lorg/linphone/LinphoneService$5;->val$lc:Lorg/linphone/core/LinphoneCore;

    invoke-static {v3, v4}, Lorg/linphone/LinphoneService;->access$100(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCore;)V

    .line 655
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    iget-object v4, p0, Lorg/linphone/LinphoneService$5;->val$call:Lorg/linphone/core/LinphoneCall;

    invoke-virtual {v3, v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v0

    .line 656
    .restart local v0    # "number":Ljava/lang/String;
    invoke-static {}, Lorg/linphone/KingKingLinphoneUtil;->getInstance()Lorg/linphone/KingKingLinphoneUtil;

    move-result-object v3

    invoke-static {}, Lcom/pccw/mobile/sip/util/ContactsUtils;->getInstance()Lcom/pccw/mobile/sip/util/ContactsUtils;

    move-result-object v4

    iget-object v5, p0, Lorg/linphone/LinphoneService$5;->this$0:Lorg/linphone/LinphoneService;

    invoke-virtual {v4, v5, v0}, Lcom/pccw/mobile/sip/util/ContactsUtils;->queryByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Lcom/pccw/mobile/sip/util/Contact;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/linphone/KingKingLinphoneUtil;->setContact(Lcom/pccw/mobile/sip/util/Contact;)V

    .line 659
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->val$call:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCall;->getRemoteParams()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v3

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v1

    .line 661
    .local v1, "recievedVideoCall":Z
    if-eqz v1, :cond_7

    .line 662
    sput-boolean v7, Lorg/linphone/LinphoneService;->ShowVideoSlidingTab:Z

    goto/16 :goto_0

    .line 666
    :cond_7
    sput-boolean v8, Lorg/linphone/LinphoneService;->ShowVideoSlidingTab:Z

    goto/16 :goto_0

    .line 668
    .end local v0    # "number":Ljava/lang/String;
    .end local v1    # "recievedVideoCall":Z
    :cond_8
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->val$state:Lorg/linphone/core/LinphoneCall$State;

    sget-object v4, Lorg/linphone/core/LinphoneCall$State;->Connected:Lorg/linphone/core/LinphoneCall$State;

    if-ne v3, v4, :cond_9

    .line 671
    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxyS()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 672
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->this$0:Lorg/linphone/LinphoneService;

    invoke-virtual {v3, v8}, Lorg/linphone/LinphoneService;->adjustSoftwareVolume(I)V

    goto/16 :goto_0

    .line 682
    :cond_9
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->val$state:Lorg/linphone/core/LinphoneCall$State;

    sget-object v4, Lorg/linphone/core/LinphoneCall$State;->Error:Lorg/linphone/core/LinphoneCall$State;

    if-ne v3, v4, :cond_b

    .line 683
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v3

    if-nez v3, :cond_a

    .line 684
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->this$0:Lorg/linphone/LinphoneService;

    iget-object v4, p0, Lorg/linphone/LinphoneService$5;->this$0:Lorg/linphone/LinphoneService;

    const v5, 0x7f070241

    .line 685
    invoke-virtual {v4, v5}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-array v5, v7, [Ljava/lang/Object;

    iget-object v6, p0, Lorg/linphone/LinphoneService$5;->val$message:Ljava/lang/String;

    aput-object v6, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 684
    invoke-static {v3, v4, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 687
    .local v2, "toast":Landroid/widget/Toast;
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 690
    .end local v2    # "toast":Landroid/widget/Toast;
    :cond_a
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->this$0:Lorg/linphone/LinphoneService;

    iget-object v4, p0, Lorg/linphone/LinphoneService$5;->val$call:Lorg/linphone/core/LinphoneCall;

    invoke-static {v3, v4}, Lorg/linphone/LinphoneService;->access$200(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCall;)V

    .line 691
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->val$lc:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v3

    if-ge v3, v7, :cond_0

    .line 692
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->this$0:Lorg/linphone/LinphoneService;

    invoke-static {v3}, Lorg/linphone/LinphoneService;->access$300(Lorg/linphone/LinphoneService;)V

    .line 693
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->resetCallNumber()V

    goto/16 :goto_0

    .line 697
    :cond_b
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->val$state:Lorg/linphone/core/LinphoneCall$State;

    sget-object v4, Lorg/linphone/core/LinphoneCall$State;->CallEnd:Lorg/linphone/core/LinphoneCall$State;

    if-ne v3, v4, :cond_c

    .line 699
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->this$0:Lorg/linphone/LinphoneService;

    iget-object v4, p0, Lorg/linphone/LinphoneService$5;->val$call:Lorg/linphone/core/LinphoneCall;

    invoke-static {v3, v4}, Lorg/linphone/LinphoneService;->access$200(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCall;)V

    .line 700
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->val$lc:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v3

    if-ge v3, v7, :cond_0

    .line 701
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->this$0:Lorg/linphone/LinphoneService;

    invoke-static {v3}, Lorg/linphone/LinphoneService;->access$300(Lorg/linphone/LinphoneService;)V

    .line 702
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    invoke-virtual {v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->resetCallNumber()V

    goto/16 :goto_0

    .line 707
    :cond_c
    iget-object v3, p0, Lorg/linphone/LinphoneService$5;->val$state:Lorg/linphone/core/LinphoneCall$State;

    sget-object v4, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    if-ne v3, v4, :cond_0

    goto/16 :goto_0
.end method
