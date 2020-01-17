.class public Lcom/pccw/sms/emoji/EmojiLinearLayout;
.super Landroid/widget/LinearLayout;
.source "EmojiLinearLayout.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/sms/emoji/EmojiLinearLayout$onSizeChangedListener;
    }
.end annotation


# instance fields
.field private mChangedListener:Lcom/pccw/sms/emoji/EmojiLinearLayout$onSizeChangedListener;

.field private mShowKeyboard:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/sms/emoji/EmojiLinearLayout;->mShowKeyboard:Z

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/sms/emoji/EmojiLinearLayout;->mShowKeyboard:Z

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 19
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/sms/emoji/EmojiLinearLayout;->mShowKeyboard:Z

    .line 21
    return-void
.end method


# virtual methods
.method protected onSizeChanged(IIII)V
    .locals 4
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/16 v3, 0xc8

    .line 36
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;->onSizeChanged(IIII)V

    .line 37
    const-string/jumbo v0, "onsize"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "h="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pccwmobile/common/utilities/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    const-string/jumbo v0, "onsize"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "oldh="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pccwmobile/common/utilities/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiLinearLayout;->mChangedListener:Lcom/pccw/sms/emoji/EmojiLinearLayout$onSizeChangedListener;

    if-eqz v0, :cond_1

    if-eqz p3, :cond_1

    if-eqz p4, :cond_1

    .line 40
    if-lt p2, p4, :cond_0

    sub-int v0, p4, p2

    if-gt v0, v3, :cond_0

    sub-int v0, p2, p4

    if-ge v0, v3, :cond_2

    .line 41
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/sms/emoji/EmojiLinearLayout;->mShowKeyboard:Z

    .line 45
    :goto_0
    iget-object v0, p0, Lcom/pccw/sms/emoji/EmojiLinearLayout;->mChangedListener:Lcom/pccw/sms/emoji/EmojiLinearLayout$onSizeChangedListener;

    iget-boolean v1, p0, Lcom/pccw/sms/emoji/EmojiLinearLayout;->mShowKeyboard:Z

    invoke-interface {v0, v1}, Lcom/pccw/sms/emoji/EmojiLinearLayout$onSizeChangedListener;->onChanged(Z)V

    .line 47
    :cond_1
    return-void

    .line 43
    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/sms/emoji/EmojiLinearLayout;->mShowKeyboard:Z

    goto :goto_0
.end method

.method public setOnSizeChangedListener(Lcom/pccw/sms/emoji/EmojiLinearLayout$onSizeChangedListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/pccw/sms/emoji/EmojiLinearLayout$onSizeChangedListener;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/pccw/sms/emoji/EmojiLinearLayout;->mChangedListener:Lcom/pccw/sms/emoji/EmojiLinearLayout$onSizeChangedListener;

    .line 51
    return-void
.end method
