.class Lcom/pccw/mobile/sip/FacebookMainFragment$1;
.super Ljava/lang/Object;
.source "FacebookMainFragment.java"

# interfaces
.implements Lcom/facebook/FacebookCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/FacebookMainFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/FacebookCallback",
        "<",
        "Lcom/facebook/share/Sharer$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/FacebookMainFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/FacebookMainFragment;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$1;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 2

    .prologue
    .line 84
    const-string/jumbo v0, "cancel"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/orhanobut/logger/Logger;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 85
    iget-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$1;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-static {v0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->access$000(Lcom/pccw/mobile/sip/FacebookMainFragment;)V

    .line 86
    return-void
.end method

.method public onError(Lcom/facebook/FacebookException;)V
    .locals 3
    .param p1, "error"    # Lcom/facebook/FacebookException;

    .prologue
    .line 90
    const-string/jumbo v0, "error"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/orhanobut/logger/Logger;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 91
    iget-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$1;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-static {v0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->access$000(Lcom/pccw/mobile/sip/FacebookMainFragment;)V

    .line 92
    return-void
.end method

.method public onSuccess(Lcom/facebook/share/Sharer$Result;)V
    .locals 2
    .param p1, "result"    # Lcom/facebook/share/Sharer$Result;

    .prologue
    .line 78
    invoke-virtual {p1}, Lcom/facebook/share/Sharer$Result;->getPostId()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/orhanobut/logger/Logger;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 79
    iget-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$1;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-static {v0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->access$000(Lcom/pccw/mobile/sip/FacebookMainFragment;)V

    .line 80
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 75
    check-cast p1, Lcom/facebook/share/Sharer$Result;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/FacebookMainFragment$1;->onSuccess(Lcom/facebook/share/Sharer$Result;)V

    return-void
.end method
