.class Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$3;
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
    .line 898
    iput-object p1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$3;->this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    iput-object p2, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$3;->val$content:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 901
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$3;->this$1:Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;

    iget-object v0, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$3;->val$content:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$600(Lcom/pccw/mobile/sip/ContactDetailsActivity;Ljava/lang/String;)V

    .line 902
    return-void
.end method
