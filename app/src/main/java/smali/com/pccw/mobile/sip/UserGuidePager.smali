.class public Lcom/pccw/mobile/sip/UserGuidePager;
.super Lcom/pccw/mobile/sip/BaseFragmentActivity;
.source "UserGuidePager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;,
        Lcom/pccw/mobile/sip/UserGuidePager$MyPagerAdapter;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "UserGuide"


# instance fields
.field dot1:Landroid/widget/ImageView;

.field dot2:Landroid/widget/ImageView;

.field dot3:Landroid/widget/ImageView;

.field dot4:Landroid/widget/ImageView;

.field dot5:Landroid/widget/ImageView;

.field mMyPagerAdapter:Lcom/pccw/mobile/sip/UserGuidePager$MyPagerAdapter;

.field mViewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseFragmentActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v2, 0x400

    const/4 v1, 0x1

    .line 55
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseFragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 57
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/UserGuidePager;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setFlags(II)V

    .line 59
    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/UserGuidePager;->requestWindowFeature(I)Z

    .line 61
    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/UserGuidePager;->setRequestedOrientation(I)V

    .line 62
    const v0, 0x7f04007f

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/UserGuidePager;->setContentView(I)V

    .line 64
    const v0, 0x7f0e01f0

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/UserGuidePager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager;->dot1:Landroid/widget/ImageView;

    .line 65
    const v0, 0x7f0e01f1

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/UserGuidePager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager;->dot2:Landroid/widget/ImageView;

    .line 66
    const v0, 0x7f0e01f2

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/UserGuidePager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager;->dot3:Landroid/widget/ImageView;

    .line 67
    const v0, 0x7f0e01f3

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/UserGuidePager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager;->dot4:Landroid/widget/ImageView;

    .line 68
    const v0, 0x7f0e01f4

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/UserGuidePager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager;->dot5:Landroid/widget/ImageView;

    .line 70
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager;->dot1:Landroid/widget/ImageView;

    const v1, 0x7f0200d1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 75
    new-instance v0, Lcom/pccw/mobile/sip/UserGuidePager$MyPagerAdapter;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/UserGuidePager;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/UserGuidePager$MyPagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager;->mMyPagerAdapter:Lcom/pccw/mobile/sip/UserGuidePager$MyPagerAdapter;

    .line 83
    const v0, 0x7f0e01ef

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/UserGuidePager;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    iput-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 84
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/pccw/mobile/sip/UserGuidePager;->mMyPagerAdapter:Lcom/pccw/mobile/sip/UserGuidePager$MyPagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 85
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager;->mViewPager:Landroid/support/v4/view/ViewPager;

    new-instance v1, Lcom/pccw/mobile/sip/UserGuidePager$1;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/sip/UserGuidePager$1;-><init>(Lcom/pccw/mobile/sip/UserGuidePager;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 130
    return-void
.end method
