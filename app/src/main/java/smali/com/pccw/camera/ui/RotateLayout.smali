.class public Lcom/pccw/camera/ui/RotateLayout;
.super Landroid/view/ViewGroup;
.source "RotateLayout.java"

# interfaces
.implements Lcom/pccw/camera/ui/Rotatable;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "RotateLayout"


# instance fields
.field private mChild:Landroid/view/View;

.field private mOrientation:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    const v0, 0x106000d

    invoke-virtual {p0, v0}, Lcom/pccw/camera/ui/RotateLayout;->setBackgroundResource(I)V

    .line 25
    return-void
.end method


# virtual methods
.method protected onFinishInflate()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 29
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/pccw/camera/ui/RotateLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    .line 30
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 31
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 32
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 4
    .param p1, "change"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    const/4 v3, 0x0

    .line 36
    sub-int v1, p4, p2

    .line 37
    .local v1, "width":I
    sub-int v0, p5, p3

    .line 38
    .local v0, "height":I
    iget v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mOrientation:I

    sparse-switch v2, :sswitch_data_0

    .line 48
    :goto_0
    return-void

    .line 41
    :sswitch_0
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {v2, v3, v3, v1, v0}, Landroid/view/View;->layout(IIII)V

    goto :goto_0

    .line 45
    :sswitch_1
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {v2, v3, v3, v0, v1}, Landroid/view/View;->layout(IIII)V

    goto :goto_0

    .line 38
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x5a -> :sswitch_1
        0xb4 -> :sswitch_0
        0x10e -> :sswitch_1
    .end sparse-switch
.end method

.method protected onMeasure(II)V
    .locals 5
    .param p1, "widthSpec"    # I
    .param p2, "heightSpec"    # I

    .prologue
    const/4 v4, 0x0

    .line 52
    const/4 v1, 0x0

    .local v1, "w":I
    const/4 v0, 0x0

    .line 53
    .local v0, "h":I
    iget v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mOrientation:I

    sparse-switch v2, :sswitch_data_0

    .line 67
    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/pccw/camera/ui/RotateLayout;->setMeasuredDimension(II)V

    .line 69
    iget v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mOrientation:I

    sparse-switch v2, :sswitch_data_1

    .line 87
    :goto_1
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    iget v3, p0, Lcom/pccw/camera/ui/RotateLayout;->mOrientation:I

    neg-int v3, v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setRotation(F)V

    .line 88
    return-void

    .line 56
    :sswitch_0
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {p0, v2, p1, p2}, Lcom/pccw/camera/ui/RotateLayout;->measureChild(Landroid/view/View;II)V

    .line 57
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    .line 58
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    .line 59
    goto :goto_0

    .line 62
    :sswitch_1
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {p0, v2, p2, p1}, Lcom/pccw/camera/ui/RotateLayout;->measureChild(Landroid/view/View;II)V

    .line 63
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 64
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    goto :goto_0

    .line 71
    :sswitch_2
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 72
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_1

    .line 75
    :sswitch_3
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 76
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    int-to-float v3, v0

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_1

    .line 79
    :sswitch_4
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    int-to-float v3, v1

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 80
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    int-to-float v3, v0

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_1

    .line 83
    :sswitch_5
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    int-to-float v3, v1

    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 84
    iget-object v2, p0, Lcom/pccw/camera/ui/RotateLayout;->mChild:Landroid/view/View;

    invoke-virtual {v2, v4}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_1

    .line 53
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x5a -> :sswitch_1
        0xb4 -> :sswitch_0
        0x10e -> :sswitch_1
    .end sparse-switch

    .line 69
    :sswitch_data_1
    .sparse-switch
        0x0 -> :sswitch_2
        0x5a -> :sswitch_3
        0xb4 -> :sswitch_4
        0x10e -> :sswitch_5
    .end sparse-switch
.end method

.method public setOrientation(I)V
    .locals 1
    .param p1, "orientation"    # I

    .prologue
    .line 92
    rem-int/lit16 p1, p1, 0x168

    .line 93
    iget v0, p0, Lcom/pccw/camera/ui/RotateLayout;->mOrientation:I

    if-ne v0, p1, :cond_0

    .line 97
    :goto_0
    return-void

    .line 95
    :cond_0
    iput p1, p0, Lcom/pccw/camera/ui/RotateLayout;->mOrientation:I

    .line 96
    invoke-virtual {p0}, Lcom/pccw/camera/ui/RotateLayout;->requestLayout()V

    goto :goto_0
.end method
