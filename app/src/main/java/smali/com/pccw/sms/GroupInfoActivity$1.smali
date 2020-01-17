.class Lcom/pccw/sms/GroupInfoActivity$1;
.super Ljava/lang/Object;
.source "GroupInfoActivity.java"

# interfaces
.implements Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/GroupInfoActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/GroupInfoActivity;


# direct methods
.method constructor <init>(Lcom/pccw/sms/GroupInfoActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/GroupInfoActivity;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/pccw/sms/GroupInfoActivity$1;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckFail()V
    .locals 0

    .prologue
    .line 120
    return-void
.end method

.method public onCheckSuccess(Ljava/util/List;)V
    .locals 9
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
    .line 88
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    if-eqz p1, :cond_5

    .line 89
    iget-object v7, p0, Lcom/pccw/sms/GroupInfoActivity$1;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-static {v7}, Lcom/pccw/sms/GroupInfoActivity;->access$000(Lcom/pccw/sms/GroupInfoActivity;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 90
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v7, p0, Lcom/pccw/sms/GroupInfoActivity$1;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-static {v7}, Lcom/pccw/sms/GroupInfoActivity;->access$100(Lcom/pccw/sms/GroupInfoActivity;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ge v0, v7, :cond_5

    .line 91
    iget-object v7, p0, Lcom/pccw/sms/GroupInfoActivity$1;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-static {v7}, Lcom/pccw/sms/GroupInfoActivity;->access$100(Lcom/pccw/sms/GroupInfoActivity;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 92
    .local v5, "typeView":Landroid/widget/ImageView;
    invoke-virtual {v5}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 93
    .local v6, "viewNumber":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    iget-object v7, p0, Lcom/pccw/sms/GroupInfoActivity$1;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-static {v7}, Lcom/pccw/sms/GroupInfoActivity;->access$000(Lcom/pccw/sms/GroupInfoActivity;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ge v1, v7, :cond_0

    .line 94
    iget-object v7, p0, Lcom/pccw/sms/GroupInfoActivity$1;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-static {v7}, Lcom/pccw/sms/GroupInfoActivity;->access$000(Lcom/pccw/sms/GroupInfoActivity;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/pccw/mobile/sip/SMSType;

    .line 95
    .local v3, "smstype":Lcom/pccw/mobile/sip/SMSType;
    iget-object v2, v3, Lcom/pccw/mobile/sip/SMSType;->msisdn:Ljava/lang/String;

    .line 96
    .local v2, "smsNumber":Ljava/lang/String;
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 97
    iget-object v4, v3, Lcom/pccw/mobile/sip/SMSType;->type:Ljava/lang/String;

    .line 98
    .local v4, "t":Ljava/lang/String;
    const-string/jumbo v7, "intra"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 99
    iget-object v7, p0, Lcom/pccw/sms/GroupInfoActivity$1;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-virtual {v7}, Lcom/pccw/sms/GroupInfoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020085

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 107
    :goto_2
    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 90
    .end local v2    # "smsNumber":Ljava/lang/String;
    .end local v3    # "smstype":Lcom/pccw/mobile/sip/SMSType;
    .end local v4    # "t":Ljava/lang/String;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 100
    .restart local v2    # "smsNumber":Ljava/lang/String;
    .restart local v3    # "smstype":Lcom/pccw/mobile/sip/SMSType;
    .restart local v4    # "t":Ljava/lang/String;
    :cond_1
    const-string/jumbo v7, "intl"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 101
    iget-object v7, p0, Lcom/pccw/sms/GroupInfoActivity$1;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-virtual {v7}, Lcom/pccw/sms/GroupInfoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020084

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2

    .line 102
    :cond_2
    const-string/jumbo v7, "inter"

    invoke-virtual {v4, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 103
    iget-object v7, p0, Lcom/pccw/sms/GroupInfoActivity$1;->this$0:Lcom/pccw/sms/GroupInfoActivity;

    invoke-virtual {v7}, Lcom/pccw/sms/GroupInfoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020082

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2

    .line 105
    :cond_3
    const/4 v7, 0x4

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2

    .line 93
    .end local v4    # "t":Ljava/lang/String;
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 113
    .end local v0    # "i":I
    .end local v1    # "j":I
    .end local v2    # "smsNumber":Ljava/lang/String;
    .end local v3    # "smstype":Lcom/pccw/mobile/sip/SMSType;
    .end local v5    # "typeView":Landroid/widget/ImageView;
    .end local v6    # "viewNumber":Ljava/lang/String;
    :cond_5
    return-void
.end method
