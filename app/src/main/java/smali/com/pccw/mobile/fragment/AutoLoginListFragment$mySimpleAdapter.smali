.class Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;
.super Landroid/widget/SimpleAdapter;
.source "AutoLoginListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/fragment/AutoLoginListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "mySimpleAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;
    }
.end annotation


# instance fields
.field context:Landroid/content/Context;

.field private data:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<+",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;>;"
        }
    .end annotation
.end field

.field from:[Ljava/lang/String;

.field resource:I

.field final synthetic this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

.field to:[I


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V
    .locals 6
    .param p2, "context"    # Landroid/content/Context;
    .param p4, "resource"    # I
    .param p5, "from"    # [Ljava/lang/String;
    .param p6, "to"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<+",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;>;I[",
            "Ljava/lang/String;",
            "[I)V"
        }
    .end annotation

    .prologue
    .line 289
    .local p3, "data":Ljava/util/List;, "Ljava/util/List<+Ljava/util/Map<Ljava/lang/String;*>;>;"
    iput-object p1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move v3, p4

    move-object v4, p5

    move-object v5, p6

    .line 290
    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 291
    iput p4, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->resource:I

    .line 292
    iput-object p3, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->data:Ljava/util/List;

    .line 293
    iput-object p5, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->from:[Ljava/lang/String;

    .line 294
    iput-object p6, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->to:[I

    .line 295
    iput-object p2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->context:Landroid/content/Context;

    .line 296
    return-void
.end method

.method static synthetic access$400(Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    .prologue
    .line 240
    iget-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->data:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v6, 0x0

    .line 250
    move-object v2, p2

    .line 251
    .local v2, "row":Landroid/view/View;
    const/4 v0, 0x0

    .line 253
    .local v0, "holder":Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;
    if-nez v2, :cond_0

    .line 254
    iget-object v3, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->context:Landroid/content/Context;

    check-cast v3, Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 255
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget v3, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->resource:I

    invoke-virtual {v1, v3, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 256
    new-instance v0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;

    .end local v0    # "holder":Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;
    const/4 v3, 0x0

    invoke-direct {v0, p0, v3}, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;-><init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;Lcom/pccw/mobile/fragment/AutoLoginListFragment$1;)V

    .line 257
    .restart local v0    # "holder":Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;
    const v3, 0x7f0e00cb

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, v0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;->removeSSIDButton:Landroid/widget/ImageButton;

    .line 258
    const v3, 0x7f0e00ca

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;->recordedSSID:Landroid/widget/TextView;

    .line 259
    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 263
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :goto_0
    iget-object v4, v0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;->recordedSSID:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->data:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    iget-object v5, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;->from:[Ljava/lang/String;

    aget-object v5, v5, v6

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 264
    iget-object v3, v0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;->removeSSIDButton:Landroid/widget/ImageButton;

    new-instance v4, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$1;

    invoke-direct {v4, p0, p1}, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$1;-><init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;I)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 284
    return-object v2

    .line 261
    :cond_0
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "holder":Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;
    check-cast v0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;

    .restart local v0    # "holder":Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;
    goto :goto_0
.end method
