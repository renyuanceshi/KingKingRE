.class public Lcom/pccw/mobile/sip/FacebookMainFragment;
.super Landroid/support/v4/app/Fragment;
.source "FacebookMainFragment.java"


# static fields
.field private static final M_FACEBOOK_URL:Landroid/net/Uri;

.field private static final PENDING_PUBLISH_KEY:Ljava/lang/String; = "pendingPublishReauthorization"

.field private static final PERMISSIONS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "FacebookShare"

.field private static noWiFiDialog:Landroid/app/AlertDialog;

.field private static theFacebookMainFragment:Lcom/pccw/mobile/sip/FacebookMainFragment;


# instance fields
.field private callbackManager:Lcom/facebook/CallbackManager;

.field cancelLocation:Landroid/widget/Button;

.field private facebookCallback:Lcom/facebook/FacebookCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/FacebookCallback",
            "<",
            "Lcom/facebook/share/Sharer$Result;",
            ">;"
        }
    .end annotation
.end field

.field path:Ljava/lang/String;

.field private pendingAuthorization:Z

.field private pendingPublishReauthorization:Z

.field placeText:Landroid/widget/TextView;

.field previewImage:Landroid/widget/ImageView;

.field progressDialog:Landroid/app/ProgressDialog;

.field private retryCount:I

.field private shareCaption:Ljava/lang/String;

.field shareDialog:Landroid/app/Dialog;

.field private shareImage:Ljava/lang/String;

.field private shareLink:Ljava/lang/String;

.field private shareName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 54
    const-string/jumbo v0, "http://m.facebook.com"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/pccw/mobile/sip/FacebookMainFragment;->M_FACEBOOK_URL:Landroid/net/Uri;

    .line 62
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "publish_actions"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/pccw/mobile/sip/FacebookMainFragment;->PERMISSIONS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 48
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 50
    invoke-static {}, Lcom/facebook/CallbackManager$Factory;->create()Lcom/facebook/CallbackManager;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->callbackManager:Lcom/facebook/CallbackManager;

    .line 57
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareName:Ljava/lang/String;

    .line 58
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareLink:Ljava/lang/String;

    .line 59
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareCaption:Ljava/lang/String;

    .line 61
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareImage:Ljava/lang/String;

    .line 64
    iput-boolean v2, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->pendingPublishReauthorization:Z

    .line 65
    iput-boolean v2, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->pendingAuthorization:Z

    .line 66
    iput v2, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->retryCount:I

    .line 67
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->path:Ljava/lang/String;

    .line 68
    iput-object v1, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareDialog:Landroid/app/Dialog;

    .line 70
    iput-object v1, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->cancelLocation:Landroid/widget/Button;

    .line 71
    iput-object v1, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->placeText:Landroid/widget/TextView;

    .line 72
    iput-object v1, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->previewImage:Landroid/widget/ImageView;

    .line 75
    new-instance v0, Lcom/pccw/mobile/sip/FacebookMainFragment$1;

    invoke-direct {v0, p0}, Lcom/pccw/mobile/sip/FacebookMainFragment$1;-><init>(Lcom/pccw/mobile/sip/FacebookMainFragment;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->facebookCallback:Lcom/facebook/FacebookCallback;

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/sip/FacebookMainFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/FacebookMainFragment;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->dismissProgressDialog()V

    return-void
.end method

.method static synthetic access$100(Lcom/pccw/mobile/sip/FacebookMainFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/FacebookMainFragment;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->readXml()Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/pccw/mobile/sip/FacebookMainFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/FacebookMainFragment;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->showXmlErrorDialog()V

    return-void
.end method

.method static synthetic access$300(Lcom/pccw/mobile/sip/FacebookMainFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/FacebookMainFragment;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->closeFragment()V

    return-void
.end method

.method static synthetic access$400(Lcom/pccw/mobile/sip/FacebookMainFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/FacebookMainFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareLink:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$402(Lcom/pccw/mobile/sip/FacebookMainFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/FacebookMainFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareLink:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(Lcom/pccw/mobile/sip/FacebookMainFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/FacebookMainFragment;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getEncryptedPhoneNumber()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/pccw/mobile/sip/FacebookMainFragment;)Lcom/facebook/CallbackManager;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/FacebookMainFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->callbackManager:Lcom/facebook/CallbackManager;

    return-object v0
.end method

.method static synthetic access$700(Lcom/pccw/mobile/sip/FacebookMainFragment;)Lcom/facebook/FacebookCallback;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/FacebookMainFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->facebookCallback:Lcom/facebook/FacebookCallback;

    return-object v0
.end method

.method private checkWifiAndShowNoWifiDialog()Z
    .locals 2

    .prologue
    .line 730
    sget-object v0, Lcom/pccw/mobile/sip/FacebookMainFragment;->noWiFiDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/pccw/mobile/sip/FacebookMainFragment;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 731
    sget-object v0, Lcom/pccw/mobile/sip/FacebookMainFragment;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->cancel()V

    .line 733
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 734
    sget-object v0, Lcom/pccw/mobile/sip/FacebookMainFragment;->noWiFiDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    .line 735
    sget-object v0, Lcom/pccw/mobile/sip/FacebookMainFragment;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 740
    :goto_0
    const/4 v0, 0x0

    .line 742
    :goto_1
    return v0

    .line 737
    :cond_1
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->onCreateNoWiFiDialog()Landroid/app/Dialog;

    move-result-object v0

    check-cast v0, Landroid/app/AlertDialog;

    sput-object v0, Lcom/pccw/mobile/sip/FacebookMainFragment;->noWiFiDialog:Landroid/app/AlertDialog;

    .line 738
    sget-object v0, Lcom/pccw/mobile/sip/FacebookMainFragment;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 742
    :cond_2
    const/4 v0, 0x1

    goto :goto_1
.end method

.method private closeFragment()V
    .locals 2

    .prologue
    .line 528
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    sget-object v1, Lcom/pccw/mobile/sip/FacebookMainFragment;->theFacebookMainFragment:Lcom/pccw/mobile/sip/FacebookMainFragment;

    .line 529
    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 530
    return-void
.end method

.method private dismissProgressDialog()V
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->progressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 99
    :cond_0
    return-void
.end method

.method private getEncryptedPhoneNumber()Ljava/lang/String;
    .locals 3

    .prologue
    .line 607
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 609
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 622
    .local v1, "imsidn":Ljava/lang/String;
    :goto_0
    invoke-static {v1}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByFacebookShareKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 629
    .local v0, "encryptedNum":Ljava/lang/String;
    return-object v0

    .line 617
    .end local v0    # "encryptedNum":Ljava/lang/String;
    .end local v1    # "imsidn":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->obtainImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "imsidn":Ljava/lang/String;
    goto :goto_0
.end method

.method public static getFacebookMainFragment()Lcom/pccw/mobile/sip/FacebookMainFragment;
    .locals 1

    .prologue
    .line 144
    sget-object v0, Lcom/pccw/mobile/sip/FacebookMainFragment;->theFacebookMainFragment:Lcom/pccw/mobile/sip/FacebookMainFragment;

    if-nez v0, :cond_0

    .line 145
    const/4 v0, 0x0

    .line 147
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/pccw/mobile/sip/FacebookMainFragment;->theFacebookMainFragment:Lcom/pccw/mobile/sip/FacebookMainFragment;

    goto :goto_0
.end method

.method private handleAnnounce()V
    .locals 0

    .prologue
    .line 388
    return-void
.end method

.method private isSubsetOf(Ljava/util/Collection;Ljava/util/Collection;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 434
    .local p1, "subset":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .local p2, "superset":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 437
    .local v0, "string":Ljava/lang/String;
    invoke-interface {p2, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 440
    const/4 v1, 0x0

    .line 443
    .end local v0    # "string":Ljava/lang/String;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static newInstance(I)Lcom/pccw/mobile/sip/FacebookMainFragment;
    .locals 1
    .param p0, "title"    # I

    .prologue
    .line 152
    new-instance v0, Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/FacebookMainFragment;-><init>()V

    .line 153
    .local v0, "frag":Lcom/pccw/mobile/sip/FacebookMainFragment;
    return-object v0
.end method

.method private readLocalXml()V
    .locals 9

    .prologue
    .line 449
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/support/v4/app/FragmentActivity;->getFilesDir()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "/facebookshare.xml"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 452
    .local v0, "fis":Ljava/io/FileInputStream;
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v4

    .line 453
    .local v4, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v4}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v3

    .line 454
    .local v3, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v6

    .line 455
    .local v6, "xr":Lorg/xml/sax/XMLReader;
    new-instance v5, Lcom/pccw/mobile/sip/FacebookShareXmlHandler;

    invoke-direct {v5}, Lcom/pccw/mobile/sip/FacebookShareXmlHandler;-><init>()V

    .line 456
    .local v5, "xmlHandler":Lcom/pccw/mobile/sip/FacebookShareXmlHandler;
    invoke-interface {v6, v5}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 457
    new-instance v7, Lorg/xml/sax/InputSource;

    invoke-direct {v7, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v6, v7}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 458
    invoke-virtual {v5}, Lcom/pccw/mobile/sip/FacebookShareXmlHandler;->response()Lcom/pccw/mobile/sip/FacebookShareXmlResponse;

    move-result-object v1

    .line 460
    .local v1, "resp":Lcom/pccw/mobile/sip/FacebookShareXmlResponse;
    iget-object v7, v1, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->title:Ljava/lang/String;

    iput-object v7, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareName:Ljava/lang/String;

    .line 461
    iget-object v7, v1, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->url:Ljava/lang/String;

    iput-object v7, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareLink:Ljava/lang/String;

    .line 462
    iget-object v7, v1, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->caption:Ljava/lang/String;

    iput-object v7, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareCaption:Ljava/lang/String;

    .line 464
    iget-object v7, v1, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->imageurl:Ljava/lang/String;

    iput-object v7, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareImage:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 468
    .end local v0    # "fis":Ljava/io/FileInputStream;
    .end local v1    # "resp":Lcom/pccw/mobile/sip/FacebookShareXmlResponse;
    .end local v3    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v4    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v5    # "xmlHandler":Lcom/pccw/mobile/sip/FacebookShareXmlHandler;
    .end local v6    # "xr":Lorg/xml/sax/XMLReader;
    :goto_0
    return-void

    .line 465
    :catch_0
    move-exception v2

    .line 466
    .local v2, "se":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private readXml()Z
    .locals 10

    .prologue
    .line 473
    const/4 v3, 0x0

    .line 474
    .local v3, "url":Ljava/net/URL;
    :try_start_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v7

    .line 475
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 476
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v7

    .line 477
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 478
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v7

    .line 479
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->PRC:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 481
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    .line 482
    invoke-virtual {v7}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v7

    .line 483
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->SIMPLIFIED_CHINESE:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 485
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v7

    .line 486
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->TAIWAN:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 488
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v7

    .line 489
    invoke-virtual {v7}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v7

    .line 490
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v8

    sget-object v9, Ljava/util/Locale;->TRADITIONAL_CHINESE:Ljava/util/Locale;

    invoke-virtual {v8, v9}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 492
    :cond_0
    new-instance v4, Ljava/net/URL;

    const-string/jumbo v7, "https://sip.pccwmobile.com/voip02/sharing/fbPost_ch.xml"

    invoke-direct {v4, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .end local v3    # "url":Ljava/net/URL;
    .local v4, "url":Ljava/net/URL;
    move-object v3, v4

    .line 497
    .end local v4    # "url":Ljava/net/URL;
    .restart local v3    # "url":Ljava/net/URL;
    :goto_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v2

    .line 498
    .local v2, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v1

    .line 499
    .local v1, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v6

    .line 500
    .local v6, "xr":Lorg/xml/sax/XMLReader;
    new-instance v5, Lcom/pccw/mobile/sip/FacebookShareXmlHandler;

    invoke-direct {v5}, Lcom/pccw/mobile/sip/FacebookShareXmlHandler;-><init>()V

    .line 501
    .local v5, "xmlHandler":Lcom/pccw/mobile/sip/FacebookShareXmlHandler;
    invoke-interface {v6, v5}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 502
    new-instance v7, Lorg/xml/sax/InputSource;

    invoke-virtual {v3}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v6, v7}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 503
    invoke-virtual {v5}, Lcom/pccw/mobile/sip/FacebookShareXmlHandler;->response()Lcom/pccw/mobile/sip/FacebookShareXmlResponse;

    move-result-object v0

    .line 505
    .local v0, "resp":Lcom/pccw/mobile/sip/FacebookShareXmlResponse;
    iget-object v7, v0, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->title:Ljava/lang/String;

    iput-object v7, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareName:Ljava/lang/String;

    .line 506
    iget-object v7, v0, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->url:Ljava/lang/String;

    iput-object v7, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareLink:Ljava/lang/String;

    .line 507
    iget-object v7, v0, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->caption:Ljava/lang/String;

    iput-object v7, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareCaption:Ljava/lang/String;

    .line 509
    iget-object v7, v0, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->imageurl:Ljava/lang/String;

    iput-object v7, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->shareImage:Ljava/lang/String;

    .line 510
    const/4 v7, 0x1

    .line 517
    .end local v0    # "resp":Lcom/pccw/mobile/sip/FacebookShareXmlResponse;
    .end local v1    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v2    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v5    # "xmlHandler":Lcom/pccw/mobile/sip/FacebookShareXmlHandler;
    .end local v6    # "xr":Lorg/xml/sax/XMLReader;
    :goto_1
    return v7

    .line 494
    :cond_1
    new-instance v4, Ljava/net/URL;

    const-string/jumbo v7, "https://sip.pccwmobile.com/voip02/sharing/fbPost_en.xml"

    invoke-direct {v4, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3    # "url":Ljava/net/URL;
    .restart local v4    # "url":Ljava/net/URL;
    move-object v3, v4

    .end local v4    # "url":Ljava/net/URL;
    .restart local v3    # "url":Ljava/net/URL;
    goto :goto_0

    .line 511
    :catch_0
    move-exception v7

    .line 517
    const/4 v7, 0x0

    goto :goto_1
.end method

.method private showXmlErrorDialog()V
    .locals 4

    .prologue
    .line 767
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 768
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f070127

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 769
    const v2, 0x7f0701f7

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 770
    const v2, 0x7f070125

    new-instance v3, Lcom/pccw/mobile/sip/FacebookMainFragment$5;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/FacebookMainFragment$5;-><init>(Lcom/pccw/mobile/sip/FacebookMainFragment;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 776
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 777
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 778
    return-void
.end method

.method private startPickerActivity(Landroid/net/Uri;I)V
    .locals 0
    .param p1, "data"    # Landroid/net/Uri;
    .param p2, "requestCode"    # I

    .prologue
    .line 525
    return-void
.end method


# virtual methods
.method public isFacebookAppAvailable()Z
    .locals 7

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 172
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const-string/jumbo v5, "com.facebook.katana"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 177
    :goto_0
    return v2

    .line 175
    :catch_0
    move-exception v0

    .line 176
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string/jumbo v4, "Facebook App is not available"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v3

    invoke-static {v4, v2}, Lcom/orhanobut/logger/Logger;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    move v2, v3

    .line 177
    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 549
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 550
    iget-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->callbackManager:Lcom/facebook/CallbackManager;

    invoke-interface {v0, p1, p2, p3}, Lcom/facebook/CallbackManager;->onActivityResult(IILandroid/content/Intent;)Z

    .line 566
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 103
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 106
    sput-object p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->theFacebookMainFragment:Lcom/pccw/mobile/sip/FacebookMainFragment;

    .line 139
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->showShareDialog()V

    .line 141
    return-void
.end method

.method protected onCreateNoWiFiDialog()Landroid/app/Dialog;
    .locals 4

    .prologue
    .line 747
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 748
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f07006b

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 749
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 750
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const/high16 v3, 0x1040000

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/FacebookMainFragment$4;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/FacebookMainFragment$4;-><init>(Lcom/pccw/mobile/sip/FacebookMainFragment;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f07015b

    .line 756
    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/FacebookMainFragment$3;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/FacebookMainFragment$3;-><init>(Lcom/pccw/mobile/sip/FacebookMainFragment;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 763
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    return-object v1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 167
    const/4 v0, 0x0

    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 578
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 583
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 570
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onPause()V

    .line 574
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 534
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 545
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 587
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 590
    const-string/jumbo v0, "pendingPublishReauthorization"

    iget-boolean v1, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->pendingPublishReauthorization:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 592
    return-void
.end method

.method public showShareDialog()V
    .locals 4

    .prologue
    .line 223
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/FacebookMainFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0701e7

    .line 224
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    .line 223
    invoke-static {v0, v1, v2, v3}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookMainFragment;->progressDialog:Landroid/app/ProgressDialog;

    .line 231
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/pccw/mobile/sip/FacebookMainFragment$2;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/sip/FacebookMainFragment$2;-><init>(Lcom/pccw/mobile/sip/FacebookMainFragment;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 252
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 326
    return-void
.end method
