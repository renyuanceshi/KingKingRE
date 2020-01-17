.class Lcom/pccw/mobile/sip/CheckVersionActivity$1$1;
.super Ljava/lang/Object;
.source "CheckVersionActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CheckVersionActivity$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$1;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/CheckVersionActivity$1;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$1$1;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$1$1;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$1;

    iget-object v0, v0, Lcom/pccw/mobile/sip/CheckVersionActivity$1;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$100(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    .line 133
    return-void
.end method
