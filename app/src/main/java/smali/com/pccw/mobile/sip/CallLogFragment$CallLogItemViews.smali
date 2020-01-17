.class final Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;
.super Ljava/lang/Object;
.source "CallLogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/CallLogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CallLogItemViews"
.end annotation


# instance fields
.field calltypeimageView:Landroid/widget/ImageView;

.field dateView:Landroid/widget/TextView;

.field labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

.field line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

.field numberView:Landroid/widget/TextView;

.field photoView:Landroid/widget/ImageView;

.field unreadMsgLayout:Landroid/view/View;

.field unreadMsgNum:Landroid/widget/TextView;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment$1;

    .prologue
    .line 227
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;-><init>()V

    return-void
.end method
