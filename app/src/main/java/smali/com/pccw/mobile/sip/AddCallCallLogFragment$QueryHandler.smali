.class final Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;
.super Landroid/content/AsyncQueryHandler;
.source "AddCallCallLogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/AddCallCallLogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "QueryHandler"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler$CatchingWorkerHandler;
    }
.end annotation


# instance fields
.field private final mFragment:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/pccw/mobile/sip/AddCallCallLogFragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/AddCallCallLogFragment;)V
    .locals 1
    .param p1, "fragment"    # Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    .prologue
    .line 211
    invoke-virtual {p1}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/content/AsyncQueryHandler;-><init>(Landroid/content/ContentResolver;)V

    .line 212
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;->mFragment:Ljava/lang/ref/WeakReference;

    .line 213
    return-void
.end method


# virtual methods
.method protected createHandler(Landroid/os/Looper;)Landroid/os/Handler;
    .locals 1
    .param p1, "looper"    # Landroid/os/Looper;

    .prologue
    .line 207
    new-instance v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler$CatchingWorkerHandler;

    invoke-direct {v0, p0, p1}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler$CatchingWorkerHandler;-><init>(Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;Landroid/os/Looper;)V

    return-object v0
.end method

.method protected onQueryComplete(ILjava/lang/Object;Landroid/database/Cursor;)V
    .locals 3
    .param p1, "token"    # I
    .param p2, "cookie"    # Ljava/lang/Object;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 217
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;->mFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    .line 218
    .local v1, "fragment":Lcom/pccw/mobile/sip/AddCallCallLogFragment;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 219
    invoke-virtual {v1}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_0

    .line 220
    iget-object v0, v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    .line 221
    .local v0, "callsAdapter":Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "cookie":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 230
    .end local v0    # "callsAdapter":Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;
    :goto_0
    return-void

    .line 223
    .restart local v0    # "callsAdapter":Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;
    :pswitch_0
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->setLoading(Z)V

    .line 224
    invoke-virtual {v0, p3}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_0

    .line 228
    .end local v0    # "callsAdapter":Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;
    .restart local p2    # "cookie":Ljava/lang/Object;
    :cond_0
    invoke-interface {p3}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 221
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
