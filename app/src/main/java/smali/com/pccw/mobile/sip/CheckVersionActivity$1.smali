.class Lcom/pccw/mobile/sip/CheckVersionActivity$1;
.super Ljava/lang/Object;
.source "CheckVersionActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CheckVersionActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$1;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 119
    iget-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$1;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$002(Lcom/pccw/mobile/sip/CheckVersionActivity;Z)Z

    .line 120
    const/4 v0, 0x0

    .line 122
    .local v0, "count":I
    :goto_0
    iget-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$1;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$000(Lcom/pccw/mobile/sip/CheckVersionActivity;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 125
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$1;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    const/16 v2, 0xa

    if-lt v0, v2, :cond_1

    .line 130
    :cond_0
    iget-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$1;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    new-instance v3, Lcom/pccw/mobile/sip/CheckVersionActivity$1$1;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$1$1;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity$1;)V

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 135
    iget-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$1;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$002(Lcom/pccw/mobile/sip/CheckVersionActivity;Z)Z

    .line 138
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 140
    const-wide/16 v2, 0x3e8

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 141
    :catch_0
    move-exception v1

    .line 142
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 145
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_2
    return-void
.end method
