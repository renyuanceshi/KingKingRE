.class public Lorg/linphone/component/ToggleImageButton;
.super Landroid/widget/ImageButton;
.source "ToggleImageButton.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/component/ToggleImageButton$OnCheckedChangeListener;
    }
.end annotation


# static fields
.field private static final namespace:Ljava/lang/String;


# instance fields
.field private checked:Z

.field private onCheckedChangeListener:Lorg/linphone/component/ToggleImageButton$OnCheckedChangeListener;

.field private stateChecked:Landroid/graphics/drawable/Drawable;

.field private stateUnChecked:Landroid/graphics/drawable/Drawable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x0

    sput-object v0, Lorg/linphone/component/ToggleImageButton;->namespace:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, -0x1

    .line 45
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 46
    invoke-virtual {p0}, Lorg/linphone/component/ToggleImageButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget-object v1, Lorg/linphone/component/ToggleImageButton;->namespace:Ljava/lang/String;

    const-string/jumbo v2, "checked"

    .line 47
    invoke-interface {p2, v1, v2, v3}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 46
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/component/ToggleImageButton;->stateChecked:Landroid/graphics/drawable/Drawable;

    .line 48
    invoke-virtual {p0}, Lorg/linphone/component/ToggleImageButton;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget-object v1, Lorg/linphone/component/ToggleImageButton;->namespace:Ljava/lang/String;

    const-string/jumbo v2, "unchecked"

    .line 49
    invoke-interface {p2, v1, v2, v3}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/component/ToggleImageButton;->stateUnChecked:Landroid/graphics/drawable/Drawable;

    .line 50
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/linphone/component/ToggleImageButton;->setBackgroundColor(I)V

    .line 52
    invoke-virtual {p0, p0}, Lorg/linphone/component/ToggleImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    invoke-direct {p0}, Lorg/linphone/component/ToggleImageButton;->handleCheckChanged()V

    .line 54
    return-void
.end method

.method private handleCheckChanged()V
    .locals 2

    .prologue
    .line 66
    iget-boolean v0, p0, Lorg/linphone/component/ToggleImageButton;->checked:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/linphone/component/ToggleImageButton;->stateChecked:Landroid/graphics/drawable/Drawable;

    :goto_0
    invoke-virtual {p0, v0}, Lorg/linphone/component/ToggleImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 67
    invoke-virtual {p0}, Lorg/linphone/component/ToggleImageButton;->requestLayout()V

    .line 68
    invoke-virtual {p0}, Lorg/linphone/component/ToggleImageButton;->invalidate()V

    .line 69
    iget-object v0, p0, Lorg/linphone/component/ToggleImageButton;->onCheckedChangeListener:Lorg/linphone/component/ToggleImageButton$OnCheckedChangeListener;

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lorg/linphone/component/ToggleImageButton;->onCheckedChangeListener:Lorg/linphone/component/ToggleImageButton$OnCheckedChangeListener;

    iget-boolean v1, p0, Lorg/linphone/component/ToggleImageButton;->checked:Z

    invoke-interface {v0, p0, v1}, Lorg/linphone/component/ToggleImageButton$OnCheckedChangeListener;->onCheckedChanged(Lorg/linphone/component/ToggleImageButton;Z)V

    .line 71
    :cond_0
    return-void

    .line 66
    :cond_1
    iget-object v0, p0, Lorg/linphone/component/ToggleImageButton;->stateUnChecked:Landroid/graphics/drawable/Drawable;

    goto :goto_0
.end method


# virtual methods
.method public isChecked()Z
    .locals 1

    .prologue
    .line 62
    iget-boolean v0, p0, Lorg/linphone/component/ToggleImageButton;->checked:Z

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 82
    iget-boolean v0, p0, Lorg/linphone/component/ToggleImageButton;->checked:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/linphone/component/ToggleImageButton;->checked:Z

    .line 83
    invoke-direct {p0}, Lorg/linphone/component/ToggleImageButton;->handleCheckChanged()V

    .line 84
    return-void

    .line 82
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setChecked(Z)V
    .locals 0
    .param p1, "checked"    # Z

    .prologue
    .line 57
    iput-boolean p1, p0, Lorg/linphone/component/ToggleImageButton;->checked:Z

    .line 58
    invoke-direct {p0}, Lorg/linphone/component/ToggleImageButton;->handleCheckChanged()V

    .line 59
    return-void
.end method

.method public setOnCheckedChangeListener(Lorg/linphone/component/ToggleImageButton$OnCheckedChangeListener;)V
    .locals 0
    .param p1, "listener"    # Lorg/linphone/component/ToggleImageButton$OnCheckedChangeListener;

    .prologue
    .line 74
    iput-object p1, p0, Lorg/linphone/component/ToggleImageButton;->onCheckedChangeListener:Lorg/linphone/component/ToggleImageButton$OnCheckedChangeListener;

    .line 75
    return-void
.end method
