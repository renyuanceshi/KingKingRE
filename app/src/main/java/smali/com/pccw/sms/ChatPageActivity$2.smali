.class Lcom/pccw/sms/ChatPageActivity$2;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/ChatPageActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/ChatPageActivity;


# direct methods
.method constructor <init>(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 226
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$2;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckFail()V
    .locals 2

    .prologue
    .line 259
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$2;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v0, v0, Lcom/pccw/sms/ChatPageActivity;->smsTypeImg:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 261
    return-void
.end method

.method public onCheckSuccess(Ljava/util/List;)V
    .locals 5
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
    const/16 v4, 0x8

    const/4 v3, 0x0

    .line 231
    if-eqz p1, :cond_3

    .line 232
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/mobile/sip/SMSType;

    .line 234
    .local v0, "smsType":Lcom/pccw/mobile/sip/SMSType;
    iget-object v1, v0, Lcom/pccw/mobile/sip/SMSType;->type:Ljava/lang/String;

    .line 235
    .local v1, "t":Ljava/lang/String;
    const-string/jumbo v2, "intra"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 236
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$2;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->smsTypeImg:Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 237
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$2;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->smsTypeImg:Landroid/widget/ImageView;

    const v3, 0x7f02050b

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 252
    .end local v0    # "smsType":Lcom/pccw/mobile/sip/SMSType;
    .end local v1    # "t":Ljava/lang/String;
    :goto_0
    return-void

    .line 238
    .restart local v0    # "smsType":Lcom/pccw/mobile/sip/SMSType;
    .restart local v1    # "t":Ljava/lang/String;
    :cond_0
    const-string/jumbo v2, "intl"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 239
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$2;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->smsTypeImg:Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 240
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$2;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->smsTypeImg:Landroid/widget/ImageView;

    const v3, 0x7f02050a

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 241
    :cond_1
    const-string/jumbo v2, "inter"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 242
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$2;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->smsTypeImg:Landroid/widget/ImageView;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 243
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$2;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->smsTypeImg:Landroid/widget/ImageView;

    const v3, 0x7f020509

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 246
    :cond_2
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$2;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->smsTypeImg:Landroid/widget/ImageView;

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 250
    .end local v0    # "smsType":Lcom/pccw/mobile/sip/SMSType;
    .end local v1    # "t":Ljava/lang/String;
    :cond_3
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$2;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->smsTypeImg:Landroid/widget/ImageView;

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method
