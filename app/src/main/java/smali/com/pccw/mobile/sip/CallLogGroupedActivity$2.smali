.class Lcom/pccw/mobile/sip/CallLogGroupedActivity$2;
.super Ljava/lang/Object;
.source "CallLogGroupedActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CallLogGroupedActivity;->makeVoiceCall(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/CallLogGroupedActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CallLogGroupedActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/CallLogGroupedActivity;

    .prologue
    .line 231
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$2;->this$0:Lcom/pccw/mobile/sip/CallLogGroupedActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 234
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 235
    return-void
.end method
