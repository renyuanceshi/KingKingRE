.class Lcom/pccw/sms/adapter/MessageAdapter$4;
.super Landroid/widget/Filter;
.source "MessageAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/adapter/MessageAdapter;->getFilter()Landroid/widget/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/adapter/MessageAdapter;


# direct methods
.method constructor <init>(Lcom/pccw/sms/adapter/MessageAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/adapter/MessageAdapter;

    .prologue
    .line 598
    iput-object p1, p0, Lcom/pccw/sms/adapter/MessageAdapter$4;->this$0:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    return-void
.end method


# virtual methods
.method protected performFiltering(Ljava/lang/CharSequence;)Landroid/widget/Filter$FilterResults;
    .locals 7
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 603
    new-instance v3, Landroid/widget/Filter$FilterResults;

    invoke-direct {v3}, Landroid/widget/Filter$FilterResults;-><init>()V

    .line 606
    .local v3, "results":Landroid/widget/Filter$FilterResults;
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-nez v4, :cond_1

    .line 608
    :cond_0
    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter$4;->this$0:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-static {v4}, Lcom/pccw/sms/adapter/MessageAdapter;->access$500(Lcom/pccw/sms/adapter/MessageAdapter;)Ljava/util/List;

    move-result-object v4

    iput-object v4, v3, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    .line 609
    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter$4;->this$0:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-static {v4}, Lcom/pccw/sms/adapter/MessageAdapter;->access$500(Lcom/pccw/sms/adapter/MessageAdapter;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    iput v4, v3, Landroid/widget/Filter$FilterResults;->count:I

    .line 632
    :goto_0
    return-object v3

    .line 613
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 615
    .local v1, "filterResultsData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/MessageItem;>;"
    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter$4;->this$0:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-static {v4}, Lcom/pccw/sms/adapter/MessageAdapter;->access$500(Lcom/pccw/sms/adapter/MessageAdapter;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/bean/MessageItem;

    .line 620
    .local v0, "data":Lcom/pccw/sms/bean/MessageItem;
    invoke-virtual {v0}, Lcom/pccw/sms/bean/MessageItem;->getContent()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 622
    .local v2, "msg":Ljava/lang/String;
    invoke-virtual {v2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 624
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 628
    .end local v0    # "data":Lcom/pccw/sms/bean/MessageItem;
    .end local v2    # "msg":Ljava/lang/String;
    :cond_3
    iput-object v1, v3, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    .line 629
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    iput v4, v3, Landroid/widget/Filter$FilterResults;->count:I

    goto :goto_0
.end method

.method protected publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .locals 2
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "filterResults"    # Landroid/widget/Filter$FilterResults;

    .prologue
    .line 638
    iget-object v1, p0, Lcom/pccw/sms/adapter/MessageAdapter$4;->this$0:Lcom/pccw/sms/adapter/MessageAdapter;

    iget-object v0, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-static {v1, v0}, Lcom/pccw/sms/adapter/MessageAdapter;->access$602(Lcom/pccw/sms/adapter/MessageAdapter;Ljava/util/List;)Ljava/util/List;

    .line 639
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter$4;->this$0:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v0}, Lcom/pccw/sms/adapter/MessageAdapter;->notifyDataSetChanged()V

    .line 640
    return-void
.end method
