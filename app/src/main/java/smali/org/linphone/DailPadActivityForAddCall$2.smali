.class Lorg/linphone/DailPadActivityForAddCall$2;
.super Ljava/lang/Object;
.source "DailPadActivityForAddCall.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivityForAddCall;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
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
    .line 173
    iput-object p1, p0, Lorg/linphone/DailPadActivityForAddCall$2;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 176
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall$2;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    invoke-static {v1}, Lorg/linphone/DailPadActivityForAddCall;->access$200(Lorg/linphone/DailPadActivityForAddCall;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    .line 178
    .local v0, "inType":I
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall$2;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    invoke-static {v1}, Lorg/linphone/DailPadActivityForAddCall;->access$200(Lorg/linphone/DailPadActivityForAddCall;)Landroid/widget/EditText;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setInputType(I)V

    .line 180
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall$2;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    invoke-static {v1}, Lorg/linphone/DailPadActivityForAddCall;->access$200(Lorg/linphone/DailPadActivityForAddCall;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/widget/EditText;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 181
    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall$2;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    invoke-static {v1}, Lorg/linphone/DailPadActivityForAddCall;->access$200(Lorg/linphone/DailPadActivityForAddCall;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setInputType(I)V

    .line 182
    const/4 v1, 0x1

    return v1
.end method
