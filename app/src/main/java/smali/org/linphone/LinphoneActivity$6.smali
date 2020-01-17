.class Lorg/linphone/LinphoneActivity$6;
.super Ljava/lang/Object;
.source "LinphoneActivity.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/LinphoneActivity;
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
    .line 1049
    iput-object p1, p0, Lorg/linphone/LinphoneActivity$6;->this$0:Lorg/linphone/LinphoneActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "arg0"    # Landroid/content/ComponentName;
    .param p2, "arg1"    # Landroid/os/IBinder;

    .prologue
    .line 1054
    iget-object v0, p0, Lorg/linphone/LinphoneActivity$6;->this$0:Lorg/linphone/LinphoneActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/linphone/LinphoneActivity;->access$302(Lorg/linphone/LinphoneActivity;Z)Z

    .line 1055
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "arg0"    # Landroid/content/ComponentName;

    .prologue
    .line 1060
    iget-object v0, p0, Lorg/linphone/LinphoneActivity$6;->this$0:Lorg/linphone/LinphoneActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/linphone/LinphoneActivity;->access$302(Lorg/linphone/LinphoneActivity;Z)Z

    .line 1061
    return-void
.end method
