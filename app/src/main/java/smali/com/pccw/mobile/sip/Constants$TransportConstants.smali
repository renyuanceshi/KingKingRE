.class public Lcom/pccw/mobile/sip/Constants$TransportConstants;
.super Ljava/lang/Object;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TransportConstants"
.end annotation


# static fields
.field public static final TCP_SOCK:B = 0x1t

.field public static final UDP_SOCK:B = 0x2t

.field public static final UND_SOCK:B


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/Constants;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/Constants;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/Constants;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/pccw/mobile/sip/Constants$TransportConstants;->this$0:Lcom/pccw/mobile/sip/Constants;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
