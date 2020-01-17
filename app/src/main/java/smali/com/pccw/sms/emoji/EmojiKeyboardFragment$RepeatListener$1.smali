.class Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener$1;
.super Ljava/lang/Object;
.source "EmojiKeyboardFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;


# direct methods
.method constructor <init>(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    .prologue
    .line 233
    iput-object p1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener$1;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 236
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener$1;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    invoke-static {v0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->access$100(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    .line 242
    :goto_0
    return-void

    .line 239
    :cond_0
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener$1;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    invoke-static {v0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->access$200(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener$1;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    invoke-static {v1}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->access$100(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 240
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener$1;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    invoke-static {v0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->access$200(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener$1;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    invoke-static {v1}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->access$100(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)Landroid/view/View;

    move-result-object v1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener$1;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    invoke-static {v4}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->access$300(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)I

    move-result v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    invoke-virtual {v0, p0, v1, v2, v3}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    .line 241
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener$1;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    invoke-static {v0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->access$400(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener$1;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    invoke-static {v1}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->access$100(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)Landroid/view/View;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    goto :goto_0
.end method
