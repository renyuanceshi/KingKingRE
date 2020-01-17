.class final Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;
.super Ljava/lang/Object;
.source "CallLogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/CallLogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CallLogItemTextview"
.end annotation


# instance fields
.field public number:Ljava/lang/String;

.field public position:I

.field public text:Ljava/lang/String;

.field public textView:Lcom/pccw/android/common/widget/TypefacedTextView;


# direct methods
.method public constructor <init>(Lcom/pccw/android/common/widget/TypefacedTextView;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "textView"    # Lcom/pccw/android/common/widget/TypefacedTextView;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "number"    # Ljava/lang/String;
    .param p4, "position"    # I

    .prologue
    .line 281
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 282
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;->textView:Lcom/pccw/android/common/widget/TypefacedTextView;

    .line 283
    iput-object p2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;->text:Ljava/lang/String;

    .line 284
    iput-object p3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;->number:Ljava/lang/String;

    .line 285
    iput p4, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;->position:I

    .line 286
    return-void
.end method
