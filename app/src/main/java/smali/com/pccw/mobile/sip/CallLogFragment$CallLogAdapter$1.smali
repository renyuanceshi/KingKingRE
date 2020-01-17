.class Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;
.super Ljava/lang/Object;
.source "CallLogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

.field final synthetic val$contactName:Ljava/lang/String;

.field final synthetic val$crChatid:Ljava/lang/String;

.field final synthetic val$crEntrytype:Ljava/lang/String;

.field final synthetic val$number:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    .prologue
    .line 1356
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->this$1:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    iput-object p2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$crEntrytype:Ljava/lang/String;

    iput-object p3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$crChatid:Ljava/lang/String;

    iput-object p4, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$number:Ljava/lang/String;

    iput-object p5, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$contactName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1360
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$crEntrytype:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$crChatid:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 1361
    new-instance v0, Landroid/content/Intent;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1365
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "chatId"

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$crChatid:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1366
    const-string/jumbo v2, "chatType"

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$crEntrytype:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1367
    const-string/jumbo v2, "recipient"

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$number:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1368
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$crEntrytype:Ljava/lang/String;

    const-string/jumbo v3, "group"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1369
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$number:Ljava/lang/String;

    invoke-static {v2}, Lcom/pccw/sms/util/SMSFormatUtil;->convertSplittingStringToSortedArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 1370
    .local v1, "recipientsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v2, "title"

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->getMultipleSMSProfileTitle(Ljava/util/ArrayList;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1371
    const-string/jumbo v2, "photo"

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->getMultipleSMSProfilePic(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1376
    .end local v1    # "recipientsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->this$1:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    iget-object v2, v2, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-virtual {v2, v0}, Lcom/pccw/mobile/sip/CallLogFragment;->startActivity(Landroid/content/Intent;)V

    .line 1379
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_1
    return-void

    .line 1372
    .restart local v0    # "intent":Landroid/content/Intent;
    :cond_2
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$crEntrytype:Ljava/lang/String;

    const-string/jumbo v3, "individual"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1373
    const-string/jumbo v2, "title"

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$number:Ljava/lang/String;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->getSingleSMSProfileTitle(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1374
    const-string/jumbo v2, "photo"

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;->val$number:Ljava/lang/String;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->getSingleSMSProfilePic(Ljava/lang/String;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_0
.end method
