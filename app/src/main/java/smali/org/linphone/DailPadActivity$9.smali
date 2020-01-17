.class Lorg/linphone/DailPadActivity$9;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity;->contTurnOnRS()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/DailPadActivity;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 1195
    iput-object p1, p0, Lorg/linphone/DailPadActivity$9;->this$0:Lorg/linphone/DailPadActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 1197
    iget-object v0, p0, Lorg/linphone/DailPadActivity$9;->this$0:Lorg/linphone/DailPadActivity;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.settings.WIFI_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/linphone/DailPadActivity;->startActivity(Landroid/content/Intent;)V

    .line 1199
    return-void
.end method
