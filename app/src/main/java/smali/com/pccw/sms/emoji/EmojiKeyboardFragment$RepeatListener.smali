.class public Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;
.super Ljava/lang/Object;
.source "EmojiKeyboardFragment.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/emoji/EmojiKeyboardFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RepeatListener"
.end annotation


# instance fields
.field private final clickListener:Landroid/view/View$OnClickListener;

.field private downView:Landroid/view/View;

.field private handler:Landroid/os/Handler;

.field private handlerRunnable:Ljava/lang/Runnable;

.field private initialInterval:I

.field private final normalInterval:I


# direct methods
.method public constructor <init>(IILandroid/view/View$OnClickListener;)V
    .locals 2
    .param p1, "initialInterval"    # I
    .param p2, "normalInterval"    # I
    .param p3, "clickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 254
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->handler:Landroid/os/Handler;

    .line 233
    new-instance v0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener$1;

    invoke-direct {v0, p0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener$1;-><init>(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)V

    iput-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->handlerRunnable:Ljava/lang/Runnable;

    .line 255
    if-nez p3, :cond_0

    .line 256
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "null runnable"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 257
    :cond_0
    if-ltz p1, :cond_1

    if-gez p2, :cond_2

    .line 258
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "negative interval"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 260
    :cond_2
    iput p1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->initialInterval:I

    .line 261
    iput p2, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->normalInterval:I

    .line 262
    iput-object p3, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->clickListener:Landroid/view/View$OnClickListener;

    .line 263
    return-void
.end method

.method static synthetic access$100(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    .prologue
    .line 225
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->downView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    .prologue
    .line 225
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$300(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)I
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    .prologue
    .line 225
    iget v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->normalInterval:I

    return v0
.end method

.method static synthetic access$400(Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;)Landroid/view/View$OnClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;

    .prologue
    .line 225
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->clickListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x1

    .line 266
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 280
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 268
    :pswitch_1
    iput-object p1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->downView:Landroid/view/View;

    .line 269
    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->handlerRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 270
    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->handlerRunnable:Ljava/lang/Runnable;

    iget-object v3, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->downView:Landroid/view/View;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget v6, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->initialInterval:I

    int-to-long v6, v6

    add-long/2addr v4, v6

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    .line 271
    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->clickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v1, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    goto :goto_0

    .line 276
    :pswitch_2
    iget-object v1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->downView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 277
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$RepeatListener;->downView:Landroid/view/View;

    goto :goto_0

    .line 266
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method
