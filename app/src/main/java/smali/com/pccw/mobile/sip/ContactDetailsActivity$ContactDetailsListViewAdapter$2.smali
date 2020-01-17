.class Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$2;
.super Ljava/lang/Object;
.source "ContactDetailsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

.field final synthetic val$content:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    .prologue
    .line 880
    iput-object p1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$2;->this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    iput-object p2, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$2;->val$content:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 884
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.SENDTO"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 885
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "mailto:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$2;->val$content:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 888
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$2;->this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-virtual {v1, v0}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->startActivity(Landroid/content/Intent;)V

    .line 890
    return-void
.end method
