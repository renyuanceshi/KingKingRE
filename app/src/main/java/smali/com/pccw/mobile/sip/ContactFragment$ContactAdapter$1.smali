.class Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter$1;
.super Ljava/lang/Object;
.source "ContactFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

.field final synthetic val$contactId:Ljava/lang/String;

.field final synthetic val$contactName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

    .prologue
    .line 374
    iput-object p1, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter$1;->this$1:Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

    iput-object p2, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter$1;->val$contactId:Ljava/lang/String;

    iput-object p3, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter$1;->val$contactName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 378
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter$1;->this$1:Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ContactFragment;->access$100(Lcom/pccw/mobile/sip/ContactFragment;)Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 379
    .local v0, "mIntent":Landroid/content/Intent;
    const-string/jumbo v1, "contactId"

    iget-object v2, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter$1;->val$contactId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 380
    const-string/jumbo v1, "contactName"

    iget-object v2, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter$1;->val$contactName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 381
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter$1;->this$1:Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-virtual {v1, v0}, Lcom/pccw/mobile/sip/ContactFragment;->startActivity(Landroid/content/Intent;)V

    .line 382
    return-void
.end method
