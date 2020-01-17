.class Lorg/linphone/InCallScreen$12;
.super Ljava/lang/Object;
.source "InCallScreen.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/InCallScreen;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lorg/linphone/InCallScreen;I)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 1678
    iput-object p1, p0, Lorg/linphone/InCallScreen$12;->this$0:Lorg/linphone/InCallScreen;

    iput p2, p0, Lorg/linphone/InCallScreen$12;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 1680
    iget-object v0, p0, Lorg/linphone/InCallScreen$12;->this$0:Lorg/linphone/InCallScreen;

    const/4 v1, 0x1

    iget v2, p0, Lorg/linphone/InCallScreen$12;->val$id:I

    invoke-static {v0, v1, v2}, Lorg/linphone/InCallScreen;->access$1200(Lorg/linphone/InCallScreen;ZI)V

    .line 1681
    return-void
.end method
