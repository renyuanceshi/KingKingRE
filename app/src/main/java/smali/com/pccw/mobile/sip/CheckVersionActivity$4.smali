.class Lcom/pccw/mobile/sip/CheckVersionActivity$4;
.super Ljava/lang/Object;
.source "CheckVersionActivity.java"

# interfaces
.implements Lcom/pccw/sms/service/listener/IGetMsisdnByImsiListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CheckVersionActivity;->getDnFromServerAndStroeToPreference()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;

    .prologue
    .line 1084
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$4;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallFail()V
    .locals 2

    .prologue
    .line 1100
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$4;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    new-instance v1, Lcom/pccw/mobile/sip/CheckVersionActivity$4$2;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$4$2;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity$4;)V

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1108
    return-void
.end method

.method public onCallSuccess(Ljava/lang/String;)V
    .locals 2
    .param p1, "msisdn"    # Ljava/lang/String;

    .prologue
    .line 1088
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$4;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    new-instance v1, Lcom/pccw/mobile/sip/CheckVersionActivity$4$1;

    invoke-direct {v1, p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$4$1;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity$4;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1096
    return-void
.end method
