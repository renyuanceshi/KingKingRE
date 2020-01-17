.class Lorg/linphone/LinphoneService$9;
.super Ljava/lang/Object;
.source "LinphoneService.java"

# interfaces
.implements Landroid/bluetooth/BluetoothProfile$ServiceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneService;->startBluetooth()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/LinphoneService;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneService;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/LinphoneService;

    .prologue
    .line 1744
    iput-object p1, p0, Lorg/linphone/LinphoneService$9;->this$0:Lorg/linphone/LinphoneService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(ILandroid/bluetooth/BluetoothProfile;)V
    .locals 7
    .param p1, "profile"    # I
    .param p2, "proxy"    # Landroid/bluetooth/BluetoothProfile;

    .prologue
    const/4 v4, 0x1

    .line 1748
    if-ne p1, v4, :cond_2

    .line 1749
    iget-object v3, p0, Lorg/linphone/LinphoneService$9;->this$0:Lorg/linphone/LinphoneService;

    check-cast p2, Landroid/bluetooth/BluetoothHeadset;

    .end local p2    # "proxy":Landroid/bluetooth/BluetoothProfile;
    invoke-static {v3, p2}, Lorg/linphone/LinphoneService;->access$402(Lorg/linphone/LinphoneService;Landroid/bluetooth/BluetoothHeadset;)Landroid/bluetooth/BluetoothHeadset;

    .line 1750
    iget-object v3, p0, Lorg/linphone/LinphoneService$9;->this$0:Lorg/linphone/LinphoneService;

    invoke-static {v3}, Lorg/linphone/LinphoneService;->access$400(Lorg/linphone/LinphoneService;)Landroid/bluetooth/BluetoothHeadset;

    move-result-object v3

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothHeadset;->getConnectedDevices()Ljava/util/List;

    move-result-object v1

    .line 1751
    .local v1, "devices":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    const/4 v2, 0x0

    .line 1752
    .local v2, "mBluetoothHeadsetConnected":Z
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 1753
    .local v0, "dev":Landroid/bluetooth/BluetoothDevice;
    iget-object v3, p0, Lorg/linphone/LinphoneService$9;->this$0:Lorg/linphone/LinphoneService;

    invoke-static {v3}, Lorg/linphone/LinphoneService;->access$400(Lorg/linphone/LinphoneService;)Landroid/bluetooth/BluetoothHeadset;

    move-result-object v3

    .line 1754
    invoke-virtual {v3, v0}, Landroid/bluetooth/BluetoothHeadset;->getConnectionState(Landroid/bluetooth/BluetoothDevice;)I

    move-result v3

    const/4 v6, 0x2

    if-ne v3, v6, :cond_0

    move v3, v4

    :goto_1
    or-int/2addr v2, v3

    .line 1755
    goto :goto_0

    .line 1754
    :cond_0
    const/4 v3, 0x0

    goto :goto_1

    .line 1759
    .end local v0    # "dev":Landroid/bluetooth/BluetoothDevice;
    :cond_1
    if-eqz v2, :cond_2

    .line 1763
    iget-object v3, p0, Lorg/linphone/LinphoneService$9;->this$0:Lorg/linphone/LinphoneService;

    iput-boolean v4, v3, Lorg/linphone/LinphoneService;->isBluetoothScoConnected:Z

    .line 1767
    .end local v1    # "devices":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    .end local v2    # "mBluetoothHeadsetConnected":Z
    :cond_2
    return-void
.end method

.method public onServiceDisconnected(I)V
    .locals 2
    .param p1, "profile"    # I

    .prologue
    .line 1772
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 1773
    iget-object v0, p0, Lorg/linphone/LinphoneService$9;->this$0:Lorg/linphone/LinphoneService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/linphone/LinphoneService;->access$402(Lorg/linphone/LinphoneService;Landroid/bluetooth/BluetoothHeadset;)Landroid/bluetooth/BluetoothHeadset;

    .line 1777
    iget-object v0, p0, Lorg/linphone/LinphoneService$9;->this$0:Lorg/linphone/LinphoneService;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lorg/linphone/LinphoneService;->isBluetoothScoConnected:Z

    .line 1780
    iget-object v0, p0, Lorg/linphone/LinphoneService$9;->this$0:Lorg/linphone/LinphoneService;

    invoke-static {v0}, Lorg/linphone/LinphoneService;->access$000(Lorg/linphone/LinphoneService;)Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->isIncall()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1781
    iget-object v0, p0, Lorg/linphone/LinphoneService$9;->this$0:Lorg/linphone/LinphoneService;

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->routeAudioToReceiver()V

    .line 1784
    :cond_0
    return-void
.end method
