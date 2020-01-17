.class Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;
.super Landroid/os/Handler;
.source "CallLogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/CallLogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ContactCheckingHandler"
.end annotation


# instance fields
.field private final mTarget:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/pccw/mobile/sip/CallLogFragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment;)V
    .locals 1
    .param p1, "target"    # Lcom/pccw/mobile/sip/CallLogFragment;

    .prologue
    .line 716
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 717
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;->mTarget:Ljava/lang/ref/WeakReference;

    .line 718
    return-void
.end method

.method synthetic constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment;Lcom/pccw/mobile/sip/CallLogFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment;
    .param p2, "x1"    # Lcom/pccw/mobile/sip/CallLogFragment$1;

    .prologue
    .line 713
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;-><init>(Lcom/pccw/mobile/sip/CallLogFragment;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 12
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 722
    iget-object v8, p0, Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;->mTarget:Ljava/lang/ref/WeakReference;

    invoke-virtual {v8}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/pccw/mobile/sip/CallLogFragment;

    .line 723
    .local v3, "target":Lcom/pccw/mobile/sip/CallLogFragment;
    if-eqz v3, :cond_0

    .line 724
    iget v8, p1, Landroid/os/Message;->what:I

    packed-switch v8, :pswitch_data_0

    .line 758
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 726
    :pswitch_1
    invoke-static {v3}, Lcom/pccw/mobile/sip/CallLogFragment;->access$600(Lcom/pccw/mobile/sip/CallLogFragment;)V

    goto :goto_0

    .line 733
    :pswitch_2
    iget-object v6, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v6, Ljava/util/ArrayList;

    .line 734
    .local v6, "thumbList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_1
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;

    .line 735
    .local v5, "thumb":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;
    const/4 v2, -0x1

    .line 736
    .local v2, "position":I
    iget v2, v5, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;->position:I

    .line 737
    iget-object v0, v5, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;->imageView:Landroid/widget/ImageView;

    .line 738
    .local v0, "imageView":Landroid/widget/ImageView;
    invoke-virtual {v0}, Landroid/widget/ImageView;->getTag()Ljava/lang/Object;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, v5, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;->number:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 739
    iget-object v9, v5, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;->imagePath:Ljava/lang/String;

    invoke-static {v3, v0, v9}, Lcom/pccw/mobile/sip/CallLogFragment;->access$700(Lcom/pccw/mobile/sip/CallLogFragment;Landroid/widget/ImageView;Ljava/lang/String;)V

    goto :goto_1

    .line 745
    .end local v0    # "imageView":Landroid/widget/ImageView;
    .end local v2    # "position":I
    .end local v5    # "thumb":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;
    .end local v6    # "thumbList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;>;"
    :pswitch_3
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayList;

    .line 746
    .local v4, "textViewList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_2
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;

    .line 747
    .local v1, "itemTextView":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;
    const/4 v2, -0x1

    .line 748
    .restart local v2    # "position":I
    iget v2, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;->position:I

    .line 749
    iget-object v7, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;->textView:Lcom/pccw/android/common/widget/TypefacedTextView;

    .line 750
    .local v7, "typefacedTextView":Lcom/pccw/android/common/widget/TypefacedTextView;
    invoke-virtual {v7}, Lcom/pccw/android/common/widget/TypefacedTextView;->getTag()Ljava/lang/Object;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;->number:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 751
    const/4 v9, 0x0

    invoke-virtual {v7, v9}, Lcom/pccw/android/common/widget/TypefacedTextView;->setVisibility(I)V

    .line 752
    iget-object v9, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;->text:Ljava/lang/String;

    invoke-static {v9}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lcom/pccw/android/common/widget/TypefacedTextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 724
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
