.class public Lcom/pccw/dialog/KKDialogBuilder;
.super Ljava/lang/Object;
.source "KKDialogBuilder.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createDialog(Lcom/pccw/dialog/EnumKKDialogType;)Lcom/pccw/dialog/KKDialog;
    .locals 3
    .param p1, "dialogType"    # Lcom/pccw/dialog/EnumKKDialogType;

    .prologue
    .line 9
    sget-object v1, Lcom/pccw/dialog/KKDialogBuilder$1;->$SwitchMap$com$pccw$dialog$EnumKKDialogType:[I

    invoke-virtual {p1}, Lcom/pccw/dialog/EnumKKDialogType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 20
    const/4 v0, 0x0

    .line 23
    .local v0, "dialog":Lcom/pccw/dialog/KKDialog;
    :goto_0
    return-object v0

    .line 11
    .end local v0    # "dialog":Lcom/pccw/dialog/KKDialog;
    :pswitch_0
    new-instance v0, Lcom/pccw/dialog/AlertKKisOffDialog;

    invoke-direct {v0}, Lcom/pccw/dialog/AlertKKisOffDialog;-><init>()V

    .line 12
    .restart local v0    # "dialog":Lcom/pccw/dialog/KKDialog;
    goto :goto_0

    .line 14
    .end local v0    # "dialog":Lcom/pccw/dialog/KKDialog;
    :pswitch_1
    new-instance v0, Lcom/pccw/dialog/AlertNoWifiDialog;

    invoke-direct {v0}, Lcom/pccw/dialog/AlertNoWifiDialog;-><init>()V

    .line 15
    .restart local v0    # "dialog":Lcom/pccw/dialog/KKDialog;
    goto :goto_0

    .line 17
    .end local v0    # "dialog":Lcom/pccw/dialog/KKDialog;
    :pswitch_2
    new-instance v0, Lcom/pccw/dialog/AlertSMSConsumeDialog;

    invoke-direct {v0}, Lcom/pccw/dialog/AlertSMSConsumeDialog;-><init>()V

    .line 18
    .restart local v0    # "dialog":Lcom/pccw/dialog/KKDialog;
    goto :goto_0

    .line 9
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
