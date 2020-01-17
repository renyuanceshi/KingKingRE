.class Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$1;
.super Ljava/lang/Object;
.source "AutoLoginListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;I)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    .prologue
    .line 264
    iput-object p1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    iput p2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x0

    .line 268
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    invoke-static {v2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->access$400(Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;)Ljava/util/List;

    move-result-object v2

    iget v3, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$1;->val$position:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    iget-object v3, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    iget-object v3, v3, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->from:[Ljava/lang/String;

    aget-object v3, v3, v5

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 269
    .local v1, "rmSSID":Ljava/lang/String;
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    iget-object v2, v2, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->context:Landroid/content/Context;

    invoke-static {v2, v1}, Lcom/pccw/pref/SSIDList;->removeSSID(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    .line 270
    .local v0, "result":I
    packed-switch v0, :pswitch_data_0

    .line 276
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    iget-object v2, v2, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-static {v2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->access$200(Lcom/pccw/mobile/fragment/AutoLoginListFragment;)V

    .line 277
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    iget-object v2, v2, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    iget-object v3, v3, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    const v4, 0x7f070067

    .line 279
    invoke-virtual {v3, v4}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 277
    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 280
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 282
    :pswitch_0
    return-void

    .line 270
    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_0
    .end packed-switch
.end method
