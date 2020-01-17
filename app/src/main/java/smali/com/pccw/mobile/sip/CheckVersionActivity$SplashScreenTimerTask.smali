.class Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;
.super Landroid/os/AsyncTask;
.source "CheckVersionActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/CheckVersionActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SplashScreenTimerTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;


# direct methods
.method private constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V
    .locals 0

    .prologue
    .line 1157
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity;Lcom/pccw/mobile/sip/CheckVersionActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;
    .param p2, "x1"    # Lcom/pccw/mobile/sip/CheckVersionActivity$1;

    .prologue
    .line 1157
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1157
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 8
    .param p1, "v"    # [Ljava/lang/Void;

    .prologue
    const-wide/16 v6, 0x3e8

    .line 1160
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-object v4, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v4}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$900(Lcom/pccw/mobile/sip/CheckVersionActivity;)J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 1161
    .local v0, "waitTime":J
    :goto_0
    cmp-long v2, v0, v6

    if-gez v2, :cond_0

    .line 1163
    sub-long v2, v6, v0

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1166
    :goto_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-object v4, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v4}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$900(Lcom/pccw/mobile/sip/CheckVersionActivity;)J

    move-result-wide v4

    sub-long v0, v2, v4

    goto :goto_0

    .line 1168
    :cond_0
    const/4 v2, 0x0

    return-object v2

    .line 1164
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1157
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 1
    .param p1, "v"    # Ljava/lang/Void;

    .prologue
    .line 1173
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1174
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$1000(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    .line 1175
    :cond_0
    return-void
.end method
