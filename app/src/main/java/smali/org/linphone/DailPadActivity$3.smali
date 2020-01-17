.class Lorg/linphone/DailPadActivity$3;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
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
    .line 241
    iput-object p1, p0, Lorg/linphone/DailPadActivity$3;->this$0:Lorg/linphone/DailPadActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 244
    iget-object v1, p0, Lorg/linphone/DailPadActivity$3;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v1}, Lorg/linphone/DailPadActivity;->access$300(Lorg/linphone/DailPadActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    .line 246
    .local v0, "inType":I
    iget-object v1, p0, Lorg/linphone/DailPadActivity$3;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v1}, Lorg/linphone/DailPadActivity;->access$300(Lorg/linphone/DailPadActivity;)Landroid/widget/EditText;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 248
    iget-object v1, p0, Lorg/linphone/DailPadActivity$3;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v1}, Lorg/linphone/DailPadActivity;->access$300(Lorg/linphone/DailPadActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/widget/EditText;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 249
    iget-object v1, p0, Lorg/linphone/DailPadActivity$3;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v1}, Lorg/linphone/DailPadActivity;->access$300(Lorg/linphone/DailPadActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 250
    const/4 v1, 0x1

    return v1
.end method
