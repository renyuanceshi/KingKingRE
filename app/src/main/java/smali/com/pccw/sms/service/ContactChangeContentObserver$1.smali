.class Lcom/pccw/sms/service/ContactChangeContentObserver$1;
.super Ljava/lang/Object;
.source "ContactChangeContentObserver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/service/ContactChangeContentObserver;->onChange(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/service/ContactChangeContentObserver;


# direct methods
.method constructor <init>(Lcom/pccw/sms/service/ContactChangeContentObserver;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/service/ContactChangeContentObserver;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/pccw/sms/service/ContactChangeContentObserver$1;->this$0:Lcom/pccw/sms/service/ContactChangeContentObserver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 58
    new-instance v0, Lcom/pccw/sms/service/ContactChangeContentObserver$CompareContactCursorDifference;

    iget-object v3, p0, Lcom/pccw/sms/service/ContactChangeContentObserver$1;->this$0:Lcom/pccw/sms/service/ContactChangeContentObserver;

    iget-object v3, v3, Lcom/pccw/sms/service/ContactChangeContentObserver;->context:Landroid/content/Context;

    invoke-direct {v0, v3}, Lcom/pccw/sms/service/ContactChangeContentObserver$CompareContactCursorDifference;-><init>(Landroid/content/Context;)V

    .line 59
    .local v0, "cCursor":Lcom/pccw/sms/service/ContactChangeContentObserver$CompareContactCursorDifference;
    iget-object v3, p0, Lcom/pccw/sms/service/ContactChangeContentObserver$1;->this$0:Lcom/pccw/sms/service/ContactChangeContentObserver;

    iget-object v3, v3, Lcom/pccw/sms/service/ContactChangeContentObserver;->context:Landroid/content/Context;

    invoke-static {v3}, Lcom/pccw/sms/service/ContactChangeContentObserver;->getLastContactHashCode(Landroid/content/Context;)I

    move-result v2

    .line 60
    .local v2, "lastHashCode":I
    invoke-virtual {v0}, Lcom/pccw/sms/service/ContactChangeContentObserver$CompareContactCursorDifference;->getHashCode()I

    move-result v1

    .line 63
    .local v1, "hashCode":I
    if-ne v1, v2, :cond_0

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    .line 69
    :cond_0
    sget v3, Lcom/pccw/sms/service/ContactChangeContentObserver;->queueCount:I

    add-int/lit8 v3, v3, 0x1

    sput v3, Lcom/pccw/sms/service/ContactChangeContentObserver;->queueCount:I

    .line 70
    sget v3, Lcom/pccw/sms/service/ContactChangeContentObserver;->queueCount:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 71
    iget-object v3, p0, Lcom/pccw/sms/service/ContactChangeContentObserver$1;->this$0:Lcom/pccw/sms/service/ContactChangeContentObserver;

    invoke-virtual {v3, v1}, Lcom/pccw/sms/service/ContactChangeContentObserver;->startSyncIMUserThread(I)V

    .line 76
    :cond_1
    return-void
.end method
