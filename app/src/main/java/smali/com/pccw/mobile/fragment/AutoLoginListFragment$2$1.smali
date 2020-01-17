.class Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;
.super Ljava/lang/Object;
.source "AutoLoginListFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    .prologue
    .line 168
    iput-object p1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    const/4 v5, 0x0

    .line 170
    const-string/jumbo v1, ""

    .line 171
    .local v1, "ssid":Ljava/lang/String;
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    iget-object v2, v2, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-static {v2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->access$100(Lcom/pccw/mobile/fragment/AutoLoginListFragment;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 173
    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 174
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    iget-object v2, v2, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-virtual {v2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-string/jumbo v3, "No SSID"

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 175
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 200
    :goto_0
    return-void

    .line 178
    :cond_0
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    iget-object v2, v2, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-virtual {v2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/pccw/pref/SSIDList;->addSSID(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    .line 179
    .local v0, "result":I
    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 195
    :pswitch_1
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    iget-object v2, v2, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-virtual {v2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    iget-object v3, v3, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    const v4, 0x7f070066

    .line 196
    invoke-virtual {v3, v4}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 195
    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 197
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 181
    :pswitch_2
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    iget-object v2, v2, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    .line 182
    invoke-virtual {v2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    iget-object v3, v3, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    const v4, 0x7f070068

    .line 184
    invoke-virtual {v3, v4}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v1, v4, v5

    .line 183
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 181
    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 185
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 186
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    iget-object v2, v2, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-static {v2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->access$200(Lcom/pccw/mobile/fragment/AutoLoginListFragment;)V

    .line 187
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->changeToAutoLoginSession()V

    goto :goto_0

    .line 190
    :pswitch_3
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    iget-object v2, v2, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-virtual {v2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    iget-object v3, v3, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    const v4, 0x7f070065

    .line 191
    invoke-virtual {v3, v4}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 190
    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 192
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 179
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method
