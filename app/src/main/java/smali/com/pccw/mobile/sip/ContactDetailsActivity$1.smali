.class Lcom/pccw/mobile/sip/ContactDetailsActivity$1;
.super Ljava/lang/Object;
.source "ContactDetailsActivity.java"

# interfaces
.implements Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/ContactDetailsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/ContactDetailsActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/ContactDetailsActivity;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$1;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckFail()V
    .locals 0

    .prologue
    .line 140
    return-void
.end method

.method public onCheckSuccess(Ljava/util/List;)V
    .locals 12
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
    const/4 v11, 0x0

    .line 98
    if-eqz p1, :cond_5

    .line 99
    iget-object v8, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$1;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-static {v8}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$000(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 100
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v8, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$1;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-static {v8}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$100(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v0, v8, :cond_5

    .line 101
    iget-object v8, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$1;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-static {v8}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$100(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    .line 102
    .local v7, "view":Landroid/view/View;
    const v8, 0x7f0e011e

    .line 103
    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 104
    .local v4, "smsBtn":Landroid/widget/ImageView;
    invoke-virtual {v7}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 105
    .local v3, "phoneNum":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    iget-object v8, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$1;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-static {v8}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$000(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v1, v8, :cond_0

    .line 107
    iget-object v8, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$1;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-static {v8}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$000(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/pccw/mobile/sip/SMSType;

    .line 108
    .local v5, "smsType":Lcom/pccw/mobile/sip/SMSType;
    iget-object v2, v5, Lcom/pccw/mobile/sip/SMSType;->msisdn:Ljava/lang/String;

    .line 109
    .local v2, "number":Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 110
    iget-object v6, v5, Lcom/pccw/mobile/sip/SMSType;->type:Ljava/lang/String;

    .line 111
    .local v6, "t":Ljava/lang/String;
    const-string/jumbo v8, "KKSMS"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "ICheckSMSTypeServiceListener type="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    const-string/jumbo v8, "intra"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 113
    invoke-virtual {v4, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 114
    iget-object v8, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$1;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-virtual {v8}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f020085

    .line 115
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 114
    invoke-virtual {v4, v8}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 100
    .end local v2    # "number":Ljava/lang/String;
    .end local v5    # "smsType":Lcom/pccw/mobile/sip/SMSType;
    .end local v6    # "t":Ljava/lang/String;
    :cond_0
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 116
    .restart local v2    # "number":Ljava/lang/String;
    .restart local v5    # "smsType":Lcom/pccw/mobile/sip/SMSType;
    .restart local v6    # "t":Ljava/lang/String;
    :cond_1
    const-string/jumbo v8, "intl"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 117
    invoke-virtual {v4, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 118
    iget-object v8, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$1;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-virtual {v8}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f020084

    .line 119
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 118
    invoke-virtual {v4, v8}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2

    .line 120
    :cond_2
    const-string/jumbo v8, "inter"

    invoke-virtual {v6, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 121
    invoke-virtual {v4, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 122
    iget-object v8, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$1;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-virtual {v8}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f020082

    .line 123
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 122
    invoke-virtual {v4, v8}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2

    .line 125
    :cond_3
    const/16 v8, 0x8

    invoke-virtual {v4, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2

    .line 105
    .end local v6    # "t":Ljava/lang/String;
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_1

    .line 133
    .end local v0    # "i":I
    .end local v1    # "j":I
    .end local v2    # "number":Ljava/lang/String;
    .end local v3    # "phoneNum":Ljava/lang/String;
    .end local v4    # "smsBtn":Landroid/widget/ImageView;
    .end local v5    # "smsType":Lcom/pccw/mobile/sip/SMSType;
    .end local v7    # "view":Landroid/view/View;
    :cond_5
    return-void
.end method
