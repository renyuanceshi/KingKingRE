.class Lcom/pccw/sms/emoji/EmojiKeyboardFragment$2;
.super Ljava/lang/Object;
.source "EmojiKeyboardFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment;


# direct methods
.method constructor <init>(Lcom/pccw/sms/emoji/EmojiKeyboardFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/emoji/EmojiKeyboardFragment;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$2;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$2;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment;

    invoke-static {v0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->access$000(Lcom/pccw/sms/emoji/EmojiKeyboardFragment;)Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$2;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment;

    invoke-static {v0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->access$000(Lcom/pccw/sms/emoji/EmojiKeyboardFragment;)Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;->onEmojiconBackspaceClicked(Landroid/view/View;)V

    .line 90
    :cond_0
    return-void
.end method
