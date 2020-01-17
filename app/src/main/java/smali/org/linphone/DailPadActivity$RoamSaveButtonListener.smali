.class Lorg/linphone/DailPadActivity$RoamSaveButtonListener;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/DailPadActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RoamSaveButtonListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/DailPadActivity;


# direct methods
.method private constructor <init>(Lorg/linphone/DailPadActivity;)V
    .locals 0

    .prologue
    .line 1113
    iput-object p1, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/linphone/DailPadActivity;Lorg/linphone/DailPadActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/linphone/DailPadActivity;
    .param p2, "x1"    # Lorg/linphone/DailPadActivity$1;

    .prologue
    .line 1113
    invoke-direct {p0, p1}, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;-><init>(Lorg/linphone/DailPadActivity;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 1174
    monitor-enter p0

    monitor-exit p0

    return-void
.end method

.method public declared-synchronized onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1117
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lorg/linphone/DailPadActivity;->access$1100(Lorg/linphone/DailPadActivity;Z)V

    .line 1119
    check-cast p1, Landroid/widget/CheckBox;

    .end local p1    # "v":Landroid/view/View;
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1120
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    invoke-virtual {v2}, Lorg/linphone/DailPadActivity;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string/jumbo v3, "wifi"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    .line 1121
    .local v1, "wifiManager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    .line 1122
    .local v0, "wifiEnabled":Z
    if-nez v0, :cond_0

    .line 1123
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    .line 1124
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v2}, Lorg/linphone/DailPadActivity;->access$1200(Lorg/linphone/DailPadActivity;)Landroid/widget/TextView;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1125
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v2}, Lorg/linphone/DailPadActivity;->access$1200(Lorg/linphone/DailPadActivity;)Landroid/widget/TextView;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v4, v4, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    const v5, 0x7f0700b7

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1126
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;

    invoke-direct {v4, p0}, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;-><init>(Lorg/linphone/DailPadActivity$RoamSaveButtonListener;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-static {v2, v3}, Lorg/linphone/DailPadActivity;->access$1302(Lorg/linphone/DailPadActivity;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 1156
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v2}, Lorg/linphone/DailPadActivity;->access$1300(Lorg/linphone/DailPadActivity;)Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1170
    .end local v0    # "wifiEnabled":Z
    .end local v1    # "wifiManager":Landroid/net/wifi/WifiManager;
    :goto_0
    monitor-exit p0

    return-void

    .line 1158
    .restart local v0    # "wifiEnabled":Z
    .restart local v1    # "wifiManager":Landroid/net/wifi/WifiManager;
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    invoke-virtual {v2}, Lorg/linphone/DailPadActivity;->contTurnOnRS()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1117
    .end local v0    # "wifiEnabled":Z
    .end local v1    # "wifiManager":Landroid/net/wifi/WifiManager;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 1162
    :cond_1
    :try_start_2
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v2}, Lorg/linphone/DailPadActivity;->access$1200(Lorg/linphone/DailPadActivity;)Landroid/widget/TextView;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1163
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v2}, Lorg/linphone/DailPadActivity;->access$1500(Lorg/linphone/DailPadActivity;)Landroid/widget/LinearLayout;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1166
    iget-object v2, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v2, v2, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lorg/linphone/DailPadActivity;->on(Landroid/content/Context;Z)V

    .line 1168
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    iget-object v3, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v3, v3, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method
