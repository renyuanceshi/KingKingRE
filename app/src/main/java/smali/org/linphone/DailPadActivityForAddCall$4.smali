.class Lorg/linphone/DailPadActivityForAddCall$4;
.super Ljava/lang/Object;
.source "DailPadActivityForAddCall.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivityForAddCall;->performCall()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/DailPadActivityForAddCall;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivityForAddCall;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/DailPadActivityForAddCall;

    .prologue
    .line 516
    iput-object p1, p0, Lorg/linphone/DailPadActivityForAddCall$4;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 519
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 520
    return-void
.end method
