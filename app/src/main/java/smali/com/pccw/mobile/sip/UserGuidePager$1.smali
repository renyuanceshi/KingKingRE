.class Lcom/pccw/mobile/sip/UserGuidePager$1;
.super Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;
.source "UserGuidePager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/UserGuidePager;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/UserGuidePager;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/UserGuidePager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/UserGuidePager;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/pccw/mobile/sip/UserGuidePager$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager;

    invoke-direct {p0}, Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 3
    .param p1, "position"    # I

    .prologue
    const v2, 0x7f0200d1

    const v1, 0x7f0200d0

    .line 95
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager;

    iget-object v0, v0, Lcom/pccw/mobile/sip/UserGuidePager;->dot1:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 96
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager;

    iget-object v0, v0, Lcom/pccw/mobile/sip/UserGuidePager;->dot2:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 97
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager;

    iget-object v0, v0, Lcom/pccw/mobile/sip/UserGuidePager;->dot3:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 98
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager;

    iget-object v0, v0, Lcom/pccw/mobile/sip/UserGuidePager;->dot4:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 99
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager;

    iget-object v0, v0, Lcom/pccw/mobile/sip/UserGuidePager;->dot5:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 101
    add-int/lit8 p1, p1, 0x1

    .line 102
    packed-switch p1, :pswitch_data_0

    .line 118
    :goto_0
    return-void

    .line 104
    :pswitch_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager;

    iget-object v0, v0, Lcom/pccw/mobile/sip/UserGuidePager;->dot1:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 107
    :pswitch_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager;

    iget-object v0, v0, Lcom/pccw/mobile/sip/UserGuidePager;->dot2:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 110
    :pswitch_2
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager;

    iget-object v0, v0, Lcom/pccw/mobile/sip/UserGuidePager;->dot3:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 113
    :pswitch_3
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager;

    iget-object v0, v0, Lcom/pccw/mobile/sip/UserGuidePager;->dot4:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 116
    :pswitch_4
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager;

    iget-object v0, v0, Lcom/pccw/mobile/sip/UserGuidePager;->dot5:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 102
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
