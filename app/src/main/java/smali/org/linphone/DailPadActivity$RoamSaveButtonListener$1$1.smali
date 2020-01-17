.class Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1$1;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;)V
    .locals 0
    .param p1, "this$2"    # Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;

    .prologue
    .line 1139
    iput-object p1, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1$1;->this$2:Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 1141
    iget-object v0, p0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1$1;->this$2:Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener$1;->this$1:Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;->this$0:Lorg/linphone/DailPadActivity;

    invoke-virtual {v0}, Lorg/linphone/DailPadActivity;->contTurnOnRS()V

    .line 1142
    return-void
.end method
