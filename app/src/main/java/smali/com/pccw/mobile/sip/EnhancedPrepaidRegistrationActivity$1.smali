.class Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$1;
.super Ljava/lang/Object;
.source "EnhancedPrepaidRegistrationActivity.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$1;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x0

    .line 100
    if-nez p2, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/16 v2, 0x42

    if-ne v0, v2, :cond_0

    .line 101
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$1;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    const-string/jumbo v2, "input_method"

    invoke-virtual {v0, v2}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iget-object v2, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$1;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    .line 102
    invoke-static {v2}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->access$000(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getApplicationWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 103
    const/4 v0, 0x1

    .line 105
    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method
