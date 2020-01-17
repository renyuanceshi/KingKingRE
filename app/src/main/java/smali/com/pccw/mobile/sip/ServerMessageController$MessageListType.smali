.class public final enum Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
.super Ljava/lang/Enum;
.source "ServerMessageController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/ServerMessageController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MessageListType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

.field public static final enum TYPE_CSL_1010:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

.field public static final enum TYPE_CSL_NWM:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

.field public static final enum TYPE_CSL_ONE2FREE:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

.field public static final enum TYPE_CSL_PREPAID:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

.field public static final enum TYPE_PCCW:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 63
    new-instance v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    const-string/jumbo v1, "TYPE_PCCW"

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_PCCW:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    new-instance v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    const-string/jumbo v1, "TYPE_CSL_ONE2FREE"

    invoke-direct {v0, v1, v3}, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_CSL_ONE2FREE:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    new-instance v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    const-string/jumbo v1, "TYPE_CSL_1010"

    invoke-direct {v0, v1, v4}, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_CSL_1010:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    new-instance v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    const-string/jumbo v1, "TYPE_CSL_NWM"

    invoke-direct {v0, v1, v5}, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_CSL_NWM:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    new-instance v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    const-string/jumbo v1, "TYPE_CSL_PREPAID"

    invoke-direct {v0, v1, v6}, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_CSL_PREPAID:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    .line 62
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    sget-object v1, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_PCCW:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_CSL_ONE2FREE:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_CSL_1010:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_CSL_NWM:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_CSL_PREPAID:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->$VALUES:[Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

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
    .line 62
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 62
    const-class v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    return-object v0
.end method

.method public static values()[Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    .locals 1

    .prologue
    .line 62
    sget-object v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->$VALUES:[Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    invoke-virtual {v0}, [Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    return-object v0
.end method
