.class Lde/timroes/axmlrpc/XMLRPCClient$CancelException;
.super Ljava/lang/RuntimeException;
.source "XMLRPCClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/timroes/axmlrpc/XMLRPCClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CancelException"
.end annotation


# instance fields
.field final synthetic this$0:Lde/timroes/axmlrpc/XMLRPCClient;


# direct methods
.method private constructor <init>(Lde/timroes/axmlrpc/XMLRPCClient;)V
    .locals 0

    .prologue
    .line 654
    iput-object p1, p0, Lde/timroes/axmlrpc/XMLRPCClient$CancelException;->this$0:Lde/timroes/axmlrpc/XMLRPCClient;

    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lde/timroes/axmlrpc/XMLRPCClient;Lde/timroes/axmlrpc/XMLRPCClient$1;)V
    .locals 0
    .param p1, "x0"    # Lde/timroes/axmlrpc/XMLRPCClient;
    .param p2, "x1"    # Lde/timroes/axmlrpc/XMLRPCClient$1;

    .prologue
    .line 654
    invoke-direct {p0, p1}, Lde/timroes/axmlrpc/XMLRPCClient$CancelException;-><init>(Lde/timroes/axmlrpc/XMLRPCClient;)V

    return-void
.end method
