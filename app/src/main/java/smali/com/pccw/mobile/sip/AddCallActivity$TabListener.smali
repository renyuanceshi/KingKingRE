.class public Lcom/pccw/mobile/sip/AddCallActivity$TabListener;
.super Ljava/lang/Object;
.source "AddCallActivity.java"

# interfaces
.implements Landroid/support/v7/app/ActionBar$TabListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/AddCallActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TabListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/support/v4/app/Fragment;",
        ">",
        "Ljava/lang/Object;",
        "Landroid/support/v7/app/ActionBar$TabListener;"
    }
.end annotation


# instance fields
.field private final mActivity:Landroid/app/Activity;

.field private final mClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field

.field private mFragment:Landroid/support/v4/app/Fragment;

.field private final mTag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Class;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 253
    .local p0, "this":Lcom/pccw/mobile/sip/AddCallActivity$TabListener;, "Lcom/pccw/mobile/sip/AddCallActivity$TabListener<TT;>;"
    .local p3, "clz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 254
    iput-object p1, p0, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->mActivity:Landroid/app/Activity;

    .line 255
    iput-object p2, p0, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->mTag:Ljava/lang/String;

    .line 256
    iput-object p3, p0, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->mClass:Ljava/lang/Class;

    .line 257
    return-void
.end method

.method private setIconSelected(Landroid/support/v7/app/ActionBar$Tab;Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "tab"    # Landroid/support/v7/app/ActionBar$Tab;
    .param p2, "selected"    # Ljava/lang/Boolean;

    .prologue
    .line 288
    .local p0, "this":Lcom/pccw/mobile/sip/AddCallActivity$TabListener;, "Lcom/pccw/mobile/sip/AddCallActivity$TabListener<TT;>;"
    invoke-virtual {p1}, Landroid/support/v7/app/ActionBar$Tab;->getTag()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 289
    invoke-virtual {p1}, Landroid/support/v7/app/ActionBar$Tab;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 291
    .local v0, "tag":Ljava/lang/String;
    const-string/jumbo v1, "DAILPAD"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 292
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f02045b

    :goto_0
    invoke-virtual {p1, v1}, Landroid/support/v7/app/ActionBar$Tab;->setIcon(I)Landroid/support/v7/app/ActionBar$Tab;

    .line 302
    .end local v0    # "tag":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 292
    .restart local v0    # "tag":Ljava/lang/String;
    :cond_1
    const v1, 0x7f02045a

    goto :goto_0

    .line 294
    :cond_2
    const-string/jumbo v1, "CONTACT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 295
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_3

    const v1, 0x7f020457

    :goto_2
    invoke-virtual {p1, v1}, Landroid/support/v7/app/ActionBar$Tab;->setIcon(I)Landroid/support/v7/app/ActionBar$Tab;

    goto :goto_1

    :cond_3
    const v1, 0x7f020456

    goto :goto_2

    .line 297
    :cond_4
    const-string/jumbo v1, "HISTORY"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 298
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_5

    const v1, 0x7f020459

    :goto_3
    invoke-virtual {p1, v1}, Landroid/support/v7/app/ActionBar$Tab;->setIcon(I)Landroid/support/v7/app/ActionBar$Tab;

    goto :goto_1

    :cond_5
    const v1, 0x7f020458

    goto :goto_3
.end method


# virtual methods
.method public onTabReselected(Landroid/support/v7/app/ActionBar$Tab;Landroid/support/v4/app/FragmentTransaction;)V
    .locals 0
    .param p1, "tab"    # Landroid/support/v7/app/ActionBar$Tab;
    .param p2, "ft"    # Landroid/support/v4/app/FragmentTransaction;

    .prologue
    .line 285
    .local p0, "this":Lcom/pccw/mobile/sip/AddCallActivity$TabListener;, "Lcom/pccw/mobile/sip/AddCallActivity$TabListener<TT;>;"
    return-void
.end method

.method public onTabSelected(Landroid/support/v7/app/ActionBar$Tab;Landroid/support/v4/app/FragmentTransaction;)V
    .locals 3
    .param p1, "tab"    # Landroid/support/v7/app/ActionBar$Tab;
    .param p2, "ft"    # Landroid/support/v4/app/FragmentTransaction;

    .prologue
    .line 262
    .local p0, "this":Lcom/pccw/mobile/sip/AddCallActivity$TabListener;, "Lcom/pccw/mobile/sip/AddCallActivity$TabListener<TT;>;"
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->setIconSelected(Landroid/support/v7/app/ActionBar$Tab;Ljava/lang/Boolean;)V

    .line 264
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->mFragment:Landroid/support/v4/app/Fragment;

    if-nez v0, :cond_0

    .line 266
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->mClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/support/v4/app/Fragment;->instantiate(Landroid/content/Context;Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->mFragment:Landroid/support/v4/app/Fragment;

    .line 268
    const v0, 0x1020002

    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->mFragment:Landroid/support/v4/app/Fragment;

    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->mTag:Ljava/lang/String;

    invoke-virtual {p2, v0, v1, v2}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 273
    :goto_0
    return-void

    .line 271
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->mFragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {p2, v0}, Landroid/support/v4/app/FragmentTransaction;->attach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    goto :goto_0
.end method

.method public onTabUnselected(Landroid/support/v7/app/ActionBar$Tab;Landroid/support/v4/app/FragmentTransaction;)V
    .locals 1
    .param p1, "tab"    # Landroid/support/v7/app/ActionBar$Tab;
    .param p2, "ft"    # Landroid/support/v4/app/FragmentTransaction;

    .prologue
    .line 276
    .local p0, "this":Lcom/pccw/mobile/sip/AddCallActivity$TabListener;, "Lcom/pccw/mobile/sip/AddCallActivity$TabListener<TT;>;"
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->setIconSelected(Landroid/support/v7/app/ActionBar$Tab;Ljava/lang/Boolean;)V

    .line 277
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->mFragment:Landroid/support/v4/app/Fragment;

    if-eqz v0, :cond_0

    .line 279
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallActivity$TabListener;->mFragment:Landroid/support/v4/app/Fragment;

    invoke-virtual {p2, v0}, Landroid/support/v4/app/FragmentTransaction;->detach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 281
    :cond_0
    return-void
.end method
