.class Lcom/pccw/sms/emoji/EmojiAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "EmojiAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/emoji/EmojiAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field icon:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/pccw/sms/emoji/EmojiAdapter;


# direct methods
.method constructor <init>(Lcom/pccw/sms/emoji/EmojiAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/emoji/EmojiAdapter;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/pccw/sms/emoji/EmojiAdapter$ViewHolder;->this$0:Lcom/pccw/sms/emoji/EmojiAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
