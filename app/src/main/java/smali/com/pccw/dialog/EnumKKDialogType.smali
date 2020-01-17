.class public final enum Lcom/pccw/dialog/EnumKKDialogType;
.super Ljava/lang/Enum;
.source "EnumKKDialogType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/pccw/dialog/EnumKKDialogType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/pccw/dialog/EnumKKDialogType;

.field public static final enum AlertKKisOffDialog:Lcom/pccw/dialog/EnumKKDialogType;

.field public static final enum AlertNoWifiDialog:Lcom/pccw/dialog/EnumKKDialogType;

.field public static final enum AlertSMSConsumeDialog:Lcom/pccw/dialog/EnumKKDialogType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 4
    new-instance v0, Lcom/pccw/dialog/EnumKKDialogType;

    const-string/jumbo v1, "AlertKKisOffDialog"

    invoke-direct {v0, v1, v2}, Lcom/pccw/dialog/EnumKKDialogType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/dialog/EnumKKDialogType;->AlertKKisOffDialog:Lcom/pccw/dialog/EnumKKDialogType;

    new-instance v0, Lcom/pccw/dialog/EnumKKDialogType;

    const-string/jumbo v1, "AlertSMSConsumeDialog"

    invoke-direct {v0, v1, v3}, Lcom/pccw/dialog/EnumKKDialogType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/dialog/EnumKKDialogType;->AlertSMSConsumeDialog:Lcom/pccw/dialog/EnumKKDialogType;

    new-instance v0, Lcom/pccw/dialog/EnumKKDialogType;

    const-string/jumbo v1, "AlertNoWifiDialog"

    invoke-direct {v0, v1, v4}, Lcom/pccw/dialog/EnumKKDialogType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/dialog/EnumKKDialogType;->AlertNoWifiDialog:Lcom/pccw/dialog/EnumKKDialogType;

    .line 3
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/pccw/dialog/EnumKKDialogType;

    sget-object v1, Lcom/pccw/dialog/EnumKKDialogType;->AlertKKisOffDialog:Lcom/pccw/dialog/EnumKKDialogType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/pccw/dialog/EnumKKDialogType;->AlertSMSConsumeDialog:Lcom/pccw/dialog/EnumKKDialogType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/pccw/dialog/EnumKKDialogType;->AlertNoWifiDialog:Lcom/pccw/dialog/EnumKKDialogType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/pccw/dialog/EnumKKDialogType;->$VALUES:[Lcom/pccw/dialog/EnumKKDialogType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/pccw/dialog/EnumKKDialogType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 3
    const-class v0, Lcom/pccw/dialog/EnumKKDialogType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/pccw/dialog/EnumKKDialogType;

    return-object v0
.end method

.method public static values()[Lcom/pccw/dialog/EnumKKDialogType;
    .locals 1

    .prologue
    .line 3
    sget-object v0, Lcom/pccw/dialog/EnumKKDialogType;->$VALUES:[Lcom/pccw/dialog/EnumKKDialogType;

    invoke-virtual {v0}, [Lcom/pccw/dialog/EnumKKDialogType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/pccw/dialog/EnumKKDialogType;

    return-object v0
.end method
