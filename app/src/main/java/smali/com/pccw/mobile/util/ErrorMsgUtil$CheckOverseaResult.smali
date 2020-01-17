.class public final enum Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;
.super Ljava/lang/Enum;
.source "ErrorMsgUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/util/ErrorMsgUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CheckOverseaResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

.field public static final enum FAIL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

.field public static final enum LOCAL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

.field public static final enum OVERSEA:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 20
    new-instance v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    const-string/jumbo v1, "LOCAL"

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->LOCAL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    .line 21
    new-instance v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    const-string/jumbo v1, "OVERSEA"

    invoke-direct {v0, v1, v3}, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->OVERSEA:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    .line 22
    new-instance v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    const-string/jumbo v1, "FAIL"

    invoke-direct {v0, v1, v4}, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->FAIL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    .line 19
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    sget-object v1, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->LOCAL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    aput-object v1, v0, v2

    sget-object v1, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->OVERSEA:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    aput-object v1, v0, v3

    sget-object v1, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->FAIL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    aput-object v1, v0, v4

    sput-object v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->$VALUES:[Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

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
    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 19
    const-class v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    return-object v0
.end method

.method public static values()[Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->$VALUES:[Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    invoke-virtual {v0}, [Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    return-object v0
.end method
