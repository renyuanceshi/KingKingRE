.class Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/linphone/DailPadActivity$RoamSaveButtonListener;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity$RoamSaveButtonListener;)V
    .locals 0
    .param p1, "this$1"    # Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

    .prologue
    .line 1126
    iput-object p1, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;->this$1:Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 1128
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;->this$1:Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

    iget-object v2, v2, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lorg/linphone/DailPadActivity;->access$1402(Lorg/linphone/DailPadActivity;Z)Z

    .line 1129
    const/4 v0, 0x0

    .line 1131
    .local v0, "count":I
    :goto_0
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;->this$1:Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

    iget-object v2, v2, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v2}, Lorg/linphone/DailPadActivity;->access$1400(Lorg/linphone/DailPadActivity;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1134
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    iget-object v3, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;->this$1:Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

    iget-object v3, v3, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v3, v3, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    const/16 v2, 0xa

    if-lt v0, v2, :cond_1

    .line 1139
    :cond_0
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;->this$1:Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

    iget-object v2, v2, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v2, v2, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    new-instance v3, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1$1;

    invoke-direct {v3, p0}, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1$1;-><init>(Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1144
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;->this$1:Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

    iget-object v2, v2, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lorg/linphone/DailPadActivity;->access$1402(Lorg/linphone/DailPadActivity;Z)Z

    .line 1147
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 1149
    const-wide/16 v2, 0x3e8

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1150
    :catch_0
    move-exception v1

    .line 1151
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 1154
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_2
    return-void
.end method
