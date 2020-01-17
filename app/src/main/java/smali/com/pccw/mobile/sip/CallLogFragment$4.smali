.class Lcom/pccw/mobile/sip/CallLogFragment$4;
.super Ljava/lang/Object;
.source "CallLogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CallLogFragment;->popupChatSelection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/CallLogFragment;

.field final synthetic val$chatType:Ljava/lang/String;

.field final synthetic val$contactGroupId:Ljava/lang/String;

.field final synthetic val$crChatid:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/CallLogFragment;

    .prologue
    .line 1732
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogFragment$4;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    iput-object p2, p0, Lcom/pccw/mobile/sip/CallLogFragment$4;->val$chatType:Ljava/lang/String;

    iput-object p3, p0, Lcom/pccw/mobile/sip/CallLogFragment$4;->val$crChatid:Ljava/lang/String;

    iput-object p4, p0, Lcom/pccw/mobile/sip/CallLogFragment$4;->val$contactGroupId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 7
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/high16 v6, 0x14000000

    .line 1736
    iget-object v4, p0, Lcom/pccw/mobile/sip/CallLogFragment$4;->val$chatType:Ljava/lang/String;

    const-string/jumbo v5, "individual"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1738
    sget v4, Lcom/pccw/sms/bean/SMSConstants;->CALL_LOG_DELETE_CHAT:I

    if-ne p2, v4, :cond_0

    .line 1739
    const-string/jumbo v4, "KKIM"

    const-string/jumbo v5, "Individual Delete Chat - Delete MessageStore"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1740
    new-instance v3, Lcom/pccw/sms/service/MessageItemService;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/pccw/sms/service/MessageItemService;-><init>(Landroid/content/Context;)V

    .line 1741
    .local v3, "messageItemService":Lcom/pccw/sms/service/MessageItemService;
    iget-object v4, p0, Lcom/pccw/mobile/sip/CallLogFragment$4;->val$crChatid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/pccw/sms/service/MessageItemService;->deleteChatByChatId(Ljava/lang/String;)I

    .line 1742
    const-string/jumbo v4, "KKIM"

    const-string/jumbo v5, "Individual Delete Chat - Delete ChatList"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1743
    new-instance v0, Lcom/pccw/sms/service/ChatRecordService;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/pccw/sms/service/ChatRecordService;-><init>(Landroid/content/Context;)V

    .line 1744
    .local v0, "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    iget-object v4, p0, Lcom/pccw/mobile/sip/CallLogFragment$4;->val$crChatid:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lcom/pccw/sms/service/ChatRecordService;->deleteChatByChatId(Ljava/lang/String;)V

    .line 1745
    new-instance v2, Landroid/content/Intent;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v4

    const-class v5, Lorg/linphone/LinphoneActivity;

    invoke-direct {v2, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1746
    .local v2, "intent":Landroid/content/Intent;
    invoke-virtual {v2, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1747
    iget-object v4, p0, Lcom/pccw/mobile/sip/CallLogFragment$4;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-virtual {v4, v2}, Lcom/pccw/mobile/sip/CallLogFragment;->startActivity(Landroid/content/Intent;)V

    .line 1762
    .end local v0    # "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v3    # "messageItemService":Lcom/pccw/sms/service/MessageItemService;
    :cond_0
    :goto_0
    return-void

    .line 1751
    :cond_1
    sget v4, Lcom/pccw/sms/bean/SMSConstants;->CALL_LOG_DELETE_CHAT:I

    if-ne p2, v4, :cond_0

    .line 1752
    const-string/jumbo v4, "KKIM"

    const-string/jumbo v5, "Group Delete Chat"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1754
    new-instance v1, Lcom/pccw/sms/service/ClearGroupService;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/pccw/sms/service/ClearGroupService;-><init>(Landroid/content/Context;)V

    .line 1755
    .local v1, "clearGroupService":Lcom/pccw/sms/service/ClearGroupService;
    iget-object v4, p0, Lcom/pccw/mobile/sip/CallLogFragment$4;->val$contactGroupId:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lcom/pccw/sms/service/ClearGroupService;->clearGroupInfo(Ljava/lang/String;)V

    .line 1756
    new-instance v2, Landroid/content/Intent;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v4

    const-class v5, Lorg/linphone/LinphoneActivity;

    invoke-direct {v2, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1757
    .restart local v2    # "intent":Landroid/content/Intent;
    invoke-virtual {v2, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1758
    iget-object v4, p0, Lcom/pccw/mobile/sip/CallLogFragment$4;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-virtual {v4, v2}, Lcom/pccw/mobile/sip/CallLogFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
