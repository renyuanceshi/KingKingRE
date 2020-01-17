.class Lcom/pccw/sms/emoji/EmojiKeyboardFragment$1;
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

.field final synthetic val$pager:Landroid/support/v4/view/ViewPager;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/pccw/sms/emoji/EmojiKeyboardFragment;ILandroid/support/v4/view/ViewPager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/emoji/EmojiKeyboardFragment;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$1;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment;

    iput p2, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$1;->val$position:I

    iput-object p3, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$1;->val$pager:Landroid/support/v4/view/ViewPager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$1;->this$0:Lcom/pccw/sms/emoji/EmojiKeyboardFragment;

    iget v1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$1;->val$position:I

    invoke-virtual {v0, v1}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->onPageSelected(I)V

    .line 78
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$1;->val$pager:Landroid/support/v4/view/ViewPager;

    iget v1, p0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment$1;->val$position:I

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 79
    return-void
.end method
