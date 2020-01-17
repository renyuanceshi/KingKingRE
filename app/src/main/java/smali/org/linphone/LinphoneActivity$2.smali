.class Lorg/linphone/LinphoneActivity$2;
.super Ljava/lang/Object;
.source "LinphoneActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneActivity;->showOverseaHotlineWebViewDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/LinphoneActivity;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/LinphoneActivity;

    .prologue
    .line 976
    iput-object p1, p0, Lorg/linphone/LinphoneActivity$2;->this$0:Lorg/linphone/LinphoneActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 979
    return-void
.end method
