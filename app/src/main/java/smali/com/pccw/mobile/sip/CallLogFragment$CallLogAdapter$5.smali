.class Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;
.super Ljava/lang/Object;
.source "CallLogFragment.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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

.field final synthetic val$chatid:Ljava/lang/String;

.field final synthetic val$chatnumber:Ljava/lang/String;

.field final synthetic val$contactName:Ljava/lang/String;

.field final synthetic val$entryType:Ljava/lang/String;

.field final synthetic val$number:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    .prologue
    .line 1488
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->this$1:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    iput-object p2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$number:Ljava/lang/String;

    iput-object p3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$chatnumber:Ljava/lang/String;

    iput-object p4, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$chatid:Ljava/lang/String;

    iput-object p5, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$contactName:Ljava/lang/String;

    iput-object p6, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$entryType:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1492
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$number:Ljava/lang/String;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/pccw/mobile/sip/CallLogFragment;->isNumberWithinContact(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    .line 1493
    .local v0, "isContactExist":Z
    const-string/jumbo v1, "KKIM"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "View OnLongClick: number="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$chatnumber:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " chatid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$chatid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " nickname="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$contactName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " chatType="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$entryType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " isContactExist="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1494
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$entryType:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 1495
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->this$1:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$entryType:Ljava/lang/String;

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$chatnumber:Ljava/lang/String;

    iget-object v4, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;->val$chatid:Ljava/lang/String;

    invoke-static {v1, v2, v3, v4, v0}, Lcom/pccw/mobile/sip/CallLogFragment;->access$1400(Lcom/pccw/mobile/sip/CallLogFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1497
    :cond_0
    const/4 v1, 0x1

    return v1
.end method
