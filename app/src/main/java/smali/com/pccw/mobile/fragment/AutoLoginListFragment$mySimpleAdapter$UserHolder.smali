.class Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;
.super Ljava/lang/Object;
.source "AutoLoginListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UserHolder"
.end annotation


# instance fields
.field recordedSSID:Landroid/widget/TextView;

.field removeSSIDButton:Landroid/widget/ImageButton;

.field final synthetic this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;


# direct methods
.method private constructor <init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;)V
    .locals 0

    .prologue
    .line 298
    iput-object p1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;->this$1:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;Lcom/pccw/mobile/fragment/AutoLoginListFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;
    .param p2, "x1"    # Lcom/pccw/mobile/fragment/AutoLoginListFragment$1;

    .prologue
    .line 298
    invoke-direct {p0, p1}, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter$UserHolder;-><init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;)V

    return-void
.end method
