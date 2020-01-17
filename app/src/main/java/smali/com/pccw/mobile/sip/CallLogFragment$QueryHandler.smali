.class final Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;
.super Landroid/content/AsyncQueryHandler;
.source "CallLogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/CallLogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "QueryHandler"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler$CatchingWorkerHandler;
    }
.end annotation


# instance fields
.field private final mFragment:Ljava/lang/ref/WeakReference;
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
.method public constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment;)V
    .locals 1
    .param p1, "fragment"    # Lcom/pccw/mobile/sip/CallLogFragment;

    .prologue
    .line 338
    invoke-virtual {p1}, Lcom/pccw/mobile/sip/CallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    .line 339
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;->mFragment:Ljava/lang/ref/WeakReference;

    .line 340
    return-void
.end method


# virtual methods
.method protected createHandler(Landroid/os/Looper;)Landroid/os/Handler;
    .locals 1
    .param p1, "looper"    # Landroid/os/Looper;

    .prologue
    .line 334
    new-instance v0, Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler$CatchingWorkerHandler;

    invoke-direct {v0, p0, p1}, Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler$CatchingWorkerHandler;-><init>(Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;Landroid/os/Looper;)V

    return-object v0
.end method

.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 9
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v8, 0x0

    .line 344
    iget-object v5, p0, Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;->mFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/pccw/mobile/sip/CallLogFragment;

    .line 345
    .local v3, "fragment":Lcom/pccw/mobile/sip/CallLogFragment;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/pccw/mobile/sip/CallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 346
    invoke-virtual {v3}, Lcom/pccw/mobile/sip/CallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->isFinishing()Z

    move-result v5

    if-nez v5, :cond_0

    .line 347
    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$000()Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    move-result-object v1

    .line 348
    .local v1, "callsAdapter":Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "cookie":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 394
    .end local v1    # "callsAdapter":Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;
    :goto_0
    return-void

    .line 350
    .restart local v1    # "callsAdapter":Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;
    :pswitch_0
    const-string/jumbo v5, "PCCW_MOBILE_SIP"

    const-string/jumbo v6, "onQueryComplete(). QUERY_TYPE_CALLLOG"

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    invoke-static {v1, v8}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->access$100(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Z)V

    .line 372
    invoke-virtual {v1, p3}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_0

    .line 377
    :pswitch_1
    new-instance v4, Lcom/pccw/mobile/service/CombineHistoryService;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/pccw/mobile/service/CombineHistoryService;-><init>(Landroid/content/Context;)V

    .line 378
    .local v4, "mCombineHistoryService":Lcom/pccw/mobile/service/CombineHistoryService;
    invoke-virtual {v4}, Lcom/pccw/mobile/service/CombineHistoryService;->getChatRecordCursor()Landroid/database/Cursor;

    move-result-object v2

    .line 379
    .local v2, "chatRecordCur":Landroid/database/Cursor;
    invoke-static {v1, v8}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->access$100(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Z)V

    .line 380
    invoke-virtual {v1, v2}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_0

    .line 385
    .end local v2    # "chatRecordCur":Landroid/database/Cursor;
    .end local v4    # "mCombineHistoryService":Lcom/pccw/mobile/service/CombineHistoryService;
    :pswitch_2
    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$300()Landroid/database/Cursor;

    move-result-object v0

    .line 386
    .local v0, "allHistoryCursor":Landroid/database/Cursor;
    const-string/jumbo v5, "KKIM"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Mix cursor count="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p3}, Landroid/database/Cursor;->getCount()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    invoke-static {v1, v8}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->access$100(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Z)V

    .line 388
    invoke-virtual {v1, v0}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_0

    .line 392
    .end local v0    # "allHistoryCursor":Landroid/database/Cursor;
    .end local v1    # "callsAdapter":Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;
    .restart local p2    # "cookie":Ljava/lang/Object;
    :cond_0
    invoke-interface {p3}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 348
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
