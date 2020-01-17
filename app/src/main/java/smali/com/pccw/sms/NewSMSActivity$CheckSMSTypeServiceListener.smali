.class Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;
.super Ljava/lang/Object;
.source "NewSMSActivity.java"

# interfaces
.implements Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/NewSMSActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CheckSMSTypeServiceListener"
.end annotation


# instance fields
.field private textView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/pccw/sms/NewSMSActivity;


# direct methods
.method public constructor <init>(Lcom/pccw/sms/NewSMSActivity;Landroid/widget/TextView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/NewSMSActivity;
    .param p2, "textView"    # Landroid/widget/TextView;

    .prologue
    .line 986
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 987
    iput-object p2, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->textView:Landroid/widget/TextView;

    .line 988
    return-void
.end method


# virtual methods
.method public onCheckFail()V
    .locals 0

    .prologue
    .line 1034
    return-void
.end method

.method public onCheckSuccess(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    const/4 v5, 0x0

    .line 992
    const/4 v0, 0x0

    .line 993
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz p1, :cond_4

    .line 994
    const/4 v3, 0x0

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/pccw/mobile/sip/SMSType;

    .line 996
    .local v1, "smsType":Lcom/pccw/mobile/sip/SMSType;
    iget-object v2, v1, Lcom/pccw/mobile/sip/SMSType;->type:Ljava/lang/String;

    .line 997
    .local v2, "t":Ljava/lang/String;
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v3}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0701b9

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 998
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "the number is intra"

    invoke-static {v3, v4}, Lcom/pccwmobile/common/utilities/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 999
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v3}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02050b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1010
    :goto_0
    if-eqz v0, :cond_0

    .line 1011
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->textView:Landroid/widget/TextView;

    invoke-virtual {v3, v5, v5, v0, v5}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 1027
    .end local v1    # "smsType":Lcom/pccw/mobile/sip/SMSType;
    .end local v2    # "t":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 1000
    .restart local v1    # "smsType":Lcom/pccw/mobile/sip/SMSType;
    .restart local v2    # "t":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v3}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0701b8

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1002
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "the number is inter"

    invoke-static {v3, v4}, Lcom/pccwmobile/common/utilities/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 1003
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v3}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020509

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    .line 1004
    :cond_2
    const-string/jumbo v3, "intl"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1005
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v3}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02050a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    .line 1007
    :cond_3
    const/4 v0, 0x0

    goto :goto_0

    .line 1017
    .end local v1    # "smsType":Lcom/pccw/mobile/sip/SMSType;
    .end local v2    # "t":Ljava/lang/String;
    :cond_4
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "getSMSType return error"

    invoke-static {v3, v4}, Lcom/pccwmobile/common/utilities/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1018
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "the user is not support"

    invoke-static {v3, v4}, Lcom/pccwmobile/common/utilities/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 1019
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->viewGroup:Lcom/pccw/sms/emoji/EmojiFlowLayout;

    iget-object v4, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->textView:Landroid/widget/TextView;

    invoke-virtual {v3, v4}, Lcom/pccw/sms/emoji/EmojiFlowLayout;->removeView(Landroid/view/View;)V

    .line 1020
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-static {v3}, Lcom/pccw/sms/NewSMSActivity;->access$100(Lcom/pccw/sms/NewSMSActivity;)Ljava/util/Map;

    move-result-object v3

    iget-object v4, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->textView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1021
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->viewGroup:Lcom/pccw/sms/emoji/EmojiFlowLayout;

    invoke-virtual {v3}, Lcom/pccw/sms/emoji/EmojiFlowLayout;->getChildCount()I

    move-result v3

    if-nez v3, :cond_5

    .line 1022
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->recipientScroll:Lcom/pccw/android/common/widget/AddRecipientsScrollView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Lcom/pccw/android/common/widget/AddRecipientsScrollView;->setVisibility(I)V

    .line 1024
    :cond_5
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;->this$0:Lcom/pccw/sms/NewSMSActivity;

    const/4 v4, 0x3

    invoke-static {v3, v4}, Lcom/pccw/sms/NewSMSActivity;->access$500(Lcom/pccw/sms/NewSMSActivity;I)V

    goto/16 :goto_1
.end method
