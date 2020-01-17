.class Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;
.super Landroid/widget/BaseAdapter;
.source "ContactDetailsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/ContactDetailsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContactDetailsListViewAdapter"
.end annotation


# instance fields
.field private layoutID:I

.field private list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mInflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/ContactDetailsActivity;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;
    .param p4, "layoutID"    # I
    .param p5, "flag"    # [Ljava/lang/String;
    .param p6, "ItemIDs"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;I[",
            "Ljava/lang/String;",
            "[I)V"
        }
    .end annotation

    .prologue
    .line 769
    .local p3, "list":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    iput-object p1, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 770
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 771
    iput-object p3, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->list:Ljava/util/List;

    .line 772
    iput p4, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->layoutID:I

    .line 773
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 777
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "arg0"    # I

    .prologue
    .line 782
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "arg0"    # I

    .prologue
    .line 787
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 16
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 792
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->mInflater:Landroid/view/LayoutInflater;

    move-object/from16 v0, p0

    iget v14, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->layoutID:I

    const/4 v15, 0x0

    invoke-virtual {v13, v14, v15}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 793
    const v13, 0x7f0e011c

    .line 794
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 795
    .local v4, "contentView":Landroid/widget/TextView;
    const v13, 0x7f0e011b

    .line 796
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 797
    .local v3, "contentTypeView":Landroid/widget/TextView;
    const v13, 0x7f0e0121

    .line 798
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 799
    .local v9, "imStatus":Landroid/widget/TextView;
    const v13, 0x7f0e0122

    .line 800
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 801
    .local v8, "imLastOnline":Landroid/widget/TextView;
    const/16 v13, 0x8

    invoke-virtual {v8, v13}, Landroid/widget/TextView;->setVisibility(I)V

    .line 802
    const v13, 0x7f0e011f

    .line 803
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 804
    .local v1, "callBtn":Landroid/widget/ImageView;
    const v13, 0x7f0e011e

    .line 805
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/ImageView;

    .line 806
    .local v11, "smsBtn":Landroid/widget/ImageView;
    const v13, 0x7f0e011d

    .line 807
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 808
    .local v5, "emailBtn":Landroid/widget/ImageView;
    const v13, 0x7f0e0117

    .line 809
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    .line 811
    .local v6, "iMBtn":Landroid/widget/ImageView;
    const v13, 0x7f0e0120

    .line 812
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/LinearLayout;

    .line 814
    .local v7, "iMLayout":Landroid/widget/LinearLayout;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-static {v13}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$200(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;

    move-result-object v13

    move/from16 v0, p1

    invoke-interface {v13, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Map;

    const-string/jumbo v14, "title"

    invoke-interface {v13, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 815
    .local v10, "label":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-static {v13}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$200(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;

    move-result-object v13

    move/from16 v0, p1

    invoke-interface {v13, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Map;

    const-string/jumbo v14, "contant"

    invoke-interface {v13, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 817
    .local v2, "content":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-static {v13}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$200(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;

    move-result-object v13

    move/from16 v0, p1

    invoke-interface {v13, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Map;

    const-string/jumbo v14, "type"

    invoke-interface {v13, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 819
    .local v12, "type":Ljava/lang/String;
    const-string/jumbo v13, "phone"

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 820
    invoke-static {v2}, Lcom/pccw/sms/util/SMSNumberUtil;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 821
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-static {v13}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$100(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    move/from16 v0, p1

    if-gt v13, v0, :cond_0

    .line 822
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-static {v13}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->access$100(Lcom/pccw/mobile/sip/ContactDetailsActivity;)Ljava/util/List;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 824
    :cond_0
    const/4 v13, 0x0

    invoke-virtual {v1, v13}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 826
    new-instance v13, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v2}, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$1;-><init>(Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;Ljava/lang/String;)V

    invoke-virtual {v11, v13}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 844
    invoke-static {v2}, Lcom/pccw/sms/util/SMSNumberUtil;->isValidRecipient(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 845
    const/4 v13, 0x0

    invoke-virtual {v11, v13}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 846
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;->this$0:Lcom/pccw/mobile/sip/ContactDetailsActivity;

    invoke-virtual {v13}, Lcom/pccw/mobile/sip/ContactDetailsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    const v14, 0x7f020081

    invoke-virtual {v13, v14}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v13

    invoke-virtual {v11, v13}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 878
    :cond_1
    :goto_0
    const-string/jumbo v13, "email"

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 879
    const/4 v13, 0x0

    invoke-virtual {v5, v13}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 880
    new-instance v13, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$2;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v2}, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$2;-><init>(Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;Ljava/lang/String;)V

    invoke-virtual {v5, v13}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 894
    :cond_2
    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 895
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 897
    const v13, 0x7f0204f5

    invoke-virtual {v1, v13}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 898
    new-instance v13, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$3;

    move-object/from16 v0, p0

    invoke-direct {v13, v0, v2}, Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter$3;-><init>(Lcom/pccw/mobile/sip/ContactDetailsActivity$ContactDetailsListViewAdapter;Ljava/lang/String;)V

    invoke-virtual {v1, v13}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 905
    return-object p2

    .line 848
    :cond_3
    const/16 v13, 0x8

    invoke-virtual {v11, v13}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method
