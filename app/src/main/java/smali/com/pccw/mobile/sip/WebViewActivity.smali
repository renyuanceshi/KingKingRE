.class public Lcom/pccw/mobile/sip/WebViewActivity;
.super Lcom/pccw/mobile/sip/BaseActivity;
.source "WebViewActivity.java"


# static fields
.field private static final EMPTY_URL:Ljava/lang/String; = "about:blank"

.field public static final TYPE:Ljava/lang/String; = "Type"

.field public static final TYPE_FAQ:I = 0x1

.field public static final TYPE_NONE:I = -0x1

.field public static final TYPE_USER_GUIDE:I


# instance fields
.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 22
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 23
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/WebViewActivity;->requestWindowFeature(I)Z

    .line 25
    const-string/jumbo v1, "about:blank"

    .line 26
    .local v1, "url":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/WebViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 28
    .local v0, "intent":Landroid/content/Intent;
    const v2, 0x7f040081

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/WebViewActivity;->setContentView(I)V

    .line 30
    const-string/jumbo v2, "Type"

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 39
    :goto_0
    const v2, 0x7f0e0205

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/WebViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/webkit/WebView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/WebViewActivity;->mWebView:Landroid/webkit/WebView;

    .line 47
    iget-object v2, p0, Lcom/pccw/mobile/sip/WebViewActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v2, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 48
    return-void

    .line 32
    :pswitch_0
    const v2, 0x7f07022c

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/WebViewActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 33
    goto :goto_0

    .line 35
    :pswitch_1
    const v2, 0x7f070135

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/WebViewActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 30
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
