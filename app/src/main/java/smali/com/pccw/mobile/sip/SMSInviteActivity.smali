.class public Lcom/pccw/mobile/sip/SMSInviteActivity;
.super Landroid/support/v4/app/DialogFragment;
.source "SMSInviteActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;
    }
.end annotation


# static fields
.field private static final LOCATE_EN_US:Ljava/lang/String; = "en_US"

.field private static final LOCATE_ZH_TW:Ljava/lang/String; = "zh_TW"

.field private static final TAG:Ljava/lang/String; = "SMSInvite"

.field private static noWiFiDialog:Landroid/app/AlertDialog;

.field private static smsInviteResultDialog:Landroid/app/AlertDialog;


# instance fields
.field private Locate:Ljava/lang/String;

.field private containView:Landroid/view/View;

.field private displayMessage:Ljava/lang/String;

.field private isSendingSMS:Z

.field private isShowingSMSConfirmDialog:Z

.field private list:Landroid/widget/ExpandableListView;

.field private mChildCursors:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation
.end field

.field private mGroupCursor:Landroid/database/Cursor;

.field private mcontactAdapter:Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 49
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 55
    iput-object v2, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->mGroupCursor:Landroid/database/Cursor;

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->mChildCursors:Ljava/util/ArrayList;

    .line 59
    iput-object v2, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->displayMessage:Ljava/lang/String;

    .line 63
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->isShowingSMSConfirmDialog:Z

    .line 64
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->isSendingSMS:Z

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/sip/SMSInviteActivity;Ljava/lang/String;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/SMSInviteActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/SMSInviteActivity;->isNativeMobileNumber(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/pccw/mobile/sip/SMSInviteActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/SMSInviteActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/SMSInviteActivity;->editNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/mobile/sip/SMSInviteActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/SMSInviteActivity;

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->isShowingSMSConfirmDialog:Z

    return v0
.end method

.method static synthetic access$202(Lcom/pccw/mobile/sip/SMSInviteActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/SMSInviteActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->isShowingSMSConfirmDialog:Z

    return p1
.end method

.method static synthetic access$300(Lcom/pccw/mobile/sip/SMSInviteActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/SMSInviteActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/SMSInviteActivity;->showSMSConfirmDialog(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/pccw/mobile/sip/SMSInviteActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/SMSInviteActivity;

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->showNotNativeNumberDialog()V

    return-void
.end method

.method static synthetic access$500(Lcom/pccw/mobile/sip/SMSInviteActivity;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/SMSInviteActivity;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->mChildCursors:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$600(Lcom/pccw/mobile/sip/SMSInviteActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/SMSInviteActivity;

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->isSendingSMS:Z

    return v0
.end method

.method static synthetic access$602(Lcom/pccw/mobile/sip/SMSInviteActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/SMSInviteActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->isSendingSMS:Z

    return p1
.end method

.method static synthetic access$700()Landroid/app/AlertDialog;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/SMSInviteActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$800(Lcom/pccw/mobile/sip/SMSInviteActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/SMSInviteActivity;

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->showNoWifiDialog()V

    return-void
.end method

.method static synthetic access$900()Landroid/app/AlertDialog;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/SMSInviteActivity;->smsInviteResultDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$902(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .param p0, "x0"    # Landroid/app/AlertDialog;

    .prologue
    .line 49
    sput-object p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->smsInviteResultDialog:Landroid/app/AlertDialog;

    return-object p0
.end method

.method private editNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x4

    .line 251
    const-string/jumbo v0, "-"

    const-string/jumbo v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 252
    const-string/jumbo v0, " "

    const-string/jumbo v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 253
    const-string/jumbo v0, "1964"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 254
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 264
    .end local p1    # "number":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .line 255
    .restart local p1    # "number":Ljava/lang/String;
    :cond_1
    const-string/jumbo v0, "19156"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 256
    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 257
    :cond_2
    const-string/jumbo v0, "133"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 258
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 259
    :cond_3
    const-string/jumbo v0, "1357"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 260
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 261
    :cond_4
    const-string/jumbo v0, "+852"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 262
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private isNativeMobileNumber(Ljava/lang/String;)Z
    .locals 3
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x4

    .line 230
    const-string/jumbo v0, "-"

    const-string/jumbo v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 231
    const-string/jumbo v0, " "

    const-string/jumbo v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 232
    const-string/jumbo v0, "1964"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 233
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 244
    :cond_0
    :goto_0
    invoke-static {p1}, Lcom/pccw/mobile/util/MobileNumberUtil;->isHKMobileNumberStart(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 245
    const/4 v0, 0x1

    .line 247
    :goto_1
    return v0

    .line 234
    :cond_1
    const-string/jumbo v0, "19156"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 235
    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 236
    :cond_2
    const-string/jumbo v0, "133"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 237
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 238
    :cond_3
    const-string/jumbo v0, "1357"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 239
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 240
    :cond_4
    const-string/jumbo v0, "+852"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 241
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 247
    :cond_5
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public static newInstance(I)Lcom/pccw/mobile/sip/SMSInviteActivity;
    .locals 3
    .param p0, "title"    # I

    .prologue
    .line 67
    new-instance v1, Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-direct {v1}, Lcom/pccw/mobile/sip/SMSInviteActivity;-><init>()V

    .line 68
    .local v1, "frag":Lcom/pccw/mobile/sip/SMSInviteActivity;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 69
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "title"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 70
    invoke-virtual {v1, v0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->setArguments(Landroid/os/Bundle;)V

    .line 71
    return-object v1
.end method

.method private readXml()Z
    .locals 9

    .prologue
    .line 401
    const/4 v3, 0x0

    .line 402
    .local v3, "url":Ljava/net/URL;
    :try_start_0
    iget-object v7, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->Locate:Ljava/lang/String;

    const-string/jumbo v8, "zh_TW"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 403
    new-instance v4, Ljava/net/URL;

    const-string/jumbo v7, "https://sip.pccwmobile.com/voip02/sharing/smsSharingCh.xml"

    invoke-direct {v4, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .end local v3    # "url":Ljava/net/URL;
    .local v4, "url":Ljava/net/URL;
    move-object v3, v4

    .line 407
    .end local v4    # "url":Ljava/net/URL;
    .restart local v3    # "url":Ljava/net/URL;
    :goto_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v2

    .line 408
    .local v2, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v1

    .line 409
    .local v1, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v6

    .line 410
    .local v6, "xr":Lorg/xml/sax/XMLReader;
    new-instance v5, Lcom/pccw/mobile/sip/SMSInviteXmlHandler;

    invoke-direct {v5}, Lcom/pccw/mobile/sip/SMSInviteXmlHandler;-><init>()V

    .line 411
    .local v5, "xmlHandler":Lcom/pccw/mobile/sip/SMSInviteXmlHandler;
    invoke-interface {v6, v5}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 412
    new-instance v7, Lorg/xml/sax/InputSource;

    invoke-virtual {v3}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v6, v7}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 413
    invoke-virtual {v5}, Lcom/pccw/mobile/sip/SMSInviteXmlHandler;->response()Lcom/pccw/mobile/sip/SMSInviteXmlResponse;

    move-result-object v0

    .line 415
    .local v0, "resp":Lcom/pccw/mobile/sip/SMSInviteXmlResponse;
    iget-object v7, v0, Lcom/pccw/mobile/sip/SMSInviteXmlResponse;->message:Ljava/lang/String;

    iput-object v7, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->displayMessage:Ljava/lang/String;

    .line 416
    const/4 v7, 0x1

    .line 422
    .end local v0    # "resp":Lcom/pccw/mobile/sip/SMSInviteXmlResponse;
    .end local v1    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v2    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v5    # "xmlHandler":Lcom/pccw/mobile/sip/SMSInviteXmlHandler;
    .end local v6    # "xr":Lorg/xml/sax/XMLReader;
    :goto_1
    return v7

    .line 405
    :cond_0
    new-instance v4, Ljava/net/URL;

    const-string/jumbo v7, "https://sip.pccwmobile.com/voip02/sharing/smsSharingEn.xml"

    invoke-direct {v4, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3    # "url":Ljava/net/URL;
    .restart local v4    # "url":Ljava/net/URL;
    move-object v3, v4

    .end local v4    # "url":Ljava/net/URL;
    .restart local v3    # "url":Ljava/net/URL;
    goto :goto_0

    .line 417
    :catch_0
    move-exception v7

    .line 422
    const/4 v7, 0x0

    goto :goto_1
.end method

.method private showNoWifiDialog()V
    .locals 4

    .prologue
    .line 426
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 427
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f07006b

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    .line 428
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 429
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const/high16 v3, 0x1040000

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/SMSInviteActivity$5;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/SMSInviteActivity$5;-><init>(Lcom/pccw/mobile/sip/SMSInviteActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f07015b

    .line 435
    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/SMSInviteActivity$4;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/SMSInviteActivity$4;-><init>(Lcom/pccw/mobile/sip/SMSInviteActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 442
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    sput-object v1, Lcom/pccw/mobile/sip/SMSInviteActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    .line 443
    sget-object v1, Lcom/pccw/mobile/sip/SMSInviteActivity;->noWiFiDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 444
    return-void
.end method

.method private showNotNativeNumberDialog()V
    .locals 4

    .prologue
    .line 447
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 448
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const v3, 0x7f07011a

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 449
    const v2, 0x7f070214

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 450
    const v2, 0x7f070210

    new-instance v3, Lcom/pccw/mobile/sip/SMSInviteActivity$6;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/SMSInviteActivity$6;-><init>(Lcom/pccw/mobile/sip/SMSInviteActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 456
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 457
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 458
    return-void
.end method

.method private showSMSConfirmDialog(Ljava/lang/String;)V
    .locals 4
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 268
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->isShowingSMSConfirmDialog:Z

    .line 269
    invoke-direct {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->readXml()Z

    move-result v2

    if-nez v2, :cond_0

    .line 270
    invoke-direct {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->showXmlErrorDialog()V

    .line 271
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->isShowingSMSConfirmDialog:Z

    .line 314
    :goto_0
    return-void

    .line 275
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 276
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f07006a

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 277
    const v2, 0x7f020436

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 278
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const v3, 0x7f07020f

    invoke-virtual {p0, v3}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "?\n\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->displayMessage:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\n\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f070211

    .line 279
    invoke-virtual {p0, v3}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 278
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 280
    const v2, 0x7f070210

    new-instance v3, Lcom/pccw/mobile/sip/SMSInviteActivity$2;

    invoke-direct {v3, p0, p1}, Lcom/pccw/mobile/sip/SMSInviteActivity$2;-><init>(Lcom/pccw/mobile/sip/SMSInviteActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 304
    const v2, 0x7f07020e

    new-instance v3, Lcom/pccw/mobile/sip/SMSInviteActivity$3;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/SMSInviteActivity$3;-><init>(Lcom/pccw/mobile/sip/SMSInviteActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 312
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 313
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method private showXmlErrorDialog()V
    .locals 4

    .prologue
    .line 461
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 462
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f07011a

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 463
    const v2, 0x7f0701f8

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 464
    const v2, 0x7f070210

    new-instance v3, Lcom/pccw/mobile/sip/SMSInviteActivity$7;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/SMSInviteActivity$7;-><init>(Lcom/pccw/mobile/sip/SMSInviteActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 470
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 471
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 472
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 76
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 78
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 11
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x1

    const/4 v9, 0x0

    .line 132
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v10

    .line 133
    .local v10, "inflater":Landroid/view/LayoutInflater;
    const v0, 0x7f040078

    const/4 v1, 0x0

    invoke-virtual {v10, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->containView:Landroid/view/View;

    .line 134
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->containView:Landroid/view/View;

    const v1, 0x7f0e01df

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ExpandableListView;

    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->list:Landroid/widget/ExpandableListView;

    .line 136
    new-instance v0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->mGroupCursor:Landroid/database/Cursor;

    const v4, 0x7f040079

    new-array v5, v6, [Ljava/lang/String;

    const-string/jumbo v1, "display_name"

    aput-object v1, v5, v9

    new-array v6, v6, [I

    const v1, 0x7f0e00d7

    aput v1, v6, v9

    const v7, 0x7f04007a

    new-array v8, v9, [Ljava/lang/String;

    new-array v9, v9, [I

    move-object v1, p0

    invoke-direct/range {v0 .. v9}, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;-><init>(Lcom/pccw/mobile/sip/SMSInviteActivity;Landroid/content/Context;Landroid/database/Cursor;I[Ljava/lang/String;[II[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->mcontactAdapter:Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    .line 142
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->list:Landroid/widget/ExpandableListView;

    iget-object v1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->mcontactAdapter:Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ExpandableListView;->setAdapter(Landroid/widget/ExpandableListAdapter;)V

    .line 144
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f070217

    .line 145
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f070216

    new-instance v2, Lcom/pccw/mobile/sip/SMSInviteActivity$1;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/SMSInviteActivity$1;-><init>(Lcom/pccw/mobile/sip/SMSInviteActivity;)V

    .line 146
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->containView:Landroid/view/View;

    .line 151
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 144
    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 127
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroy()V

    .line 128
    return-void
.end method

.method public onResume()V
    .locals 13

    .prologue
    const/4 v9, 0x1

    const/4 v12, 0x0

    .line 85
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v0

    .line 86
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    sget-object v3, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 87
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v0

    .line 88
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    sget-object v3, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 89
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v0

    .line 90
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    sget-object v3, Ljava/util/Locale;->PRC:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 91
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v0

    .line 92
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    sget-object v3, Ljava/util/Locale;->SIMPLIFIED_CHINESE:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 93
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v0

    .line 94
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    sget-object v3, Ljava/util/Locale;->TAIWAN:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 95
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v0

    .line 96
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    sget-object v3, Ljava/util/Locale;->TRADITIONAL_CHINESE:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 97
    :cond_0
    const-string/jumbo v0, "zh_TW"

    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->Locate:Ljava/lang/String;

    .line 102
    :goto_0
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const-string/jumbo v0, "_id"

    aput-object v0, v2, v12

    const-string/jumbo v0, "display_name"

    aput-object v0, v2, v9

    .line 106
    .local v2, "groupProjection":[Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->mGroupCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_1

    .line 107
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->mGroupCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 108
    :cond_1
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const-string/jumbo v3, "has_phone_number = 1"

    const/4 v4, 0x0

    const-string/jumbo v5, "display_name"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->mGroupCursor:Landroid/database/Cursor;

    .line 113
    new-instance v3, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    iget-object v6, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->mGroupCursor:Landroid/database/Cursor;

    const v7, 0x7f040079

    new-array v8, v9, [Ljava/lang/String;

    const-string/jumbo v0, "display_name"

    aput-object v0, v8, v12

    new-array v9, v9, [I

    const v0, 0x7f0e00d7

    aput v0, v9, v12

    const v10, 0x7f04007a

    new-array v11, v12, [Ljava/lang/String;

    new-array v12, v12, [I

    move-object v4, p0

    invoke-direct/range {v3 .. v12}, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;-><init>(Lcom/pccw/mobile/sip/SMSInviteActivity;Landroid/content/Context;Landroid/database/Cursor;I[Ljava/lang/String;[II[Ljava/lang/String;[I)V

    iput-object v3, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->mcontactAdapter:Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    .line 120
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->list:Landroid/widget/ExpandableListView;

    iget-object v1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->mcontactAdapter:Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ExpandableListView;->setAdapter(Landroid/widget/ExpandableListAdapter;)V

    .line 122
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onResume()V

    .line 123
    return-void

    .line 99
    .end local v2    # "groupProjection":[Ljava/lang/String;
    :cond_2
    const-string/jumbo v0, "en_US"

    iput-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity;->Locate:Ljava/lang/String;

    goto :goto_0
.end method

.method public sendSMS(Ljava/lang/String;)Z
    .locals 16
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 318
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 319
    .local v2, "httpclient":Lorg/apache/http/client/HttpClient;
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string/jumbo v13, "https://sip.pccwmobile.com/voip02/sendSharingSms.do"

    invoke-direct {v3, v13}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 322
    .local v3, "httppost":Lorg/apache/http/client/methods/HttpPost;
    :try_start_0
    const-string/jumbo v4, ""

    .line 324
    .local v4, "imsidn":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v13

    invoke-static {v13}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 325
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v13

    invoke-static {v13}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 330
    :goto_0
    new-instance v5, Ljava/util/ArrayList;

    const/4 v13, 0x3

    invoke-direct {v5, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 331
    .local v5, "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v13, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v14, "sender"

    invoke-direct {v13, v14, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    new-instance v13, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v14, "receiver"

    move-object/from16 v0, p1

    invoke-direct {v13, v14, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 342
    new-instance v13, Lorg/apache/http/message/BasicNameValuePair;

    const-string/jumbo v14, "lang"

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/pccw/mobile/sip/SMSInviteActivity;->Locate:Ljava/lang/String;

    invoke-direct {v13, v14, v15}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 355
    new-instance v13, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    invoke-direct {v13, v5}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V

    invoke-virtual {v3, v13}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 358
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    .line 360
    .local v7, "response":Lorg/apache/http/HttpResponse;
    const/4 v8, 0x0

    .line 361
    .local v8, "resultCode":Ljava/lang/String;
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;
    :try_end_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    move-result-object v10

    .line 364
    .local v10, "spf":Ljavax/xml/parsers/SAXParserFactory;
    :try_start_1
    invoke-virtual {v10}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v9

    .line 365
    .local v9, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v9}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v12

    .line 366
    .local v12, "xr":Lorg/xml/sax/XMLReader;
    new-instance v11, Lcom/pccw/mobile/sip/SMSInviteXmlHandler;

    invoke-direct {v11}, Lcom/pccw/mobile/sip/SMSInviteXmlHandler;-><init>()V

    .line 367
    .local v11, "xmlHandler":Lcom/pccw/mobile/sip/SMSInviteXmlHandler;
    invoke-interface {v12, v11}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 368
    new-instance v13, Lorg/xml/sax/InputSource;

    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v14

    invoke-interface {v14}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v14

    invoke-direct {v13, v14}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v12, v13}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 369
    invoke-virtual {v11}, Lcom/pccw/mobile/sip/SMSInviteXmlHandler;->response()Lcom/pccw/mobile/sip/SMSInviteXmlResponse;

    move-result-object v6

    .line 370
    .local v6, "resp":Lcom/pccw/mobile/sip/SMSInviteXmlResponse;
    iget-object v8, v6, Lcom/pccw/mobile/sip/SMSInviteXmlResponse;->resultcode:Ljava/lang/String;
    :try_end_1
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 381
    .end local v6    # "resp":Lcom/pccw/mobile/sip/SMSInviteXmlResponse;
    .end local v9    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v11    # "xmlHandler":Lcom/pccw/mobile/sip/SMSInviteXmlHandler;
    .end local v12    # "xr":Lorg/xml/sax/XMLReader;
    :goto_1
    if-eqz v8, :cond_1

    :try_start_2
    const-string/jumbo v13, "0"

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 383
    const/4 v13, 0x1

    .line 395
    .end local v4    # "imsidn":Ljava/lang/String;
    .end local v5    # "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v7    # "response":Lorg/apache/http/HttpResponse;
    .end local v8    # "resultCode":Ljava/lang/String;
    .end local v10    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    :goto_2
    return v13

    .line 327
    .restart local v4    # "imsidn":Ljava/lang/String;
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v13

    invoke-static {v13}, Lcom/pccw/mobile/sip/ClientStateManager;->obtainImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 371
    .restart local v5    # "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v7    # "response":Lorg/apache/http/HttpResponse;
    .restart local v8    # "resultCode":Ljava/lang/String;
    .restart local v10    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    :catch_0
    move-exception v1

    .line 373
    .local v1, "e":Ljavax/xml/parsers/ParserConfigurationException;
    invoke-virtual {v1}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V
    :try_end_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_1

    .line 386
    .end local v1    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    .end local v4    # "imsidn":Ljava/lang/String;
    .end local v5    # "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v7    # "response":Lorg/apache/http/HttpResponse;
    .end local v8    # "resultCode":Ljava/lang/String;
    .end local v10    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    :catch_1
    move-exception v1

    .line 388
    .local v1, "e":Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v1}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    .line 395
    .end local v1    # "e":Lorg/apache/http/client/ClientProtocolException;
    :cond_1
    :goto_3
    const/4 v13, 0x0

    goto :goto_2

    .line 374
    .restart local v4    # "imsidn":Ljava/lang/String;
    .restart local v5    # "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v7    # "response":Lorg/apache/http/HttpResponse;
    .restart local v8    # "resultCode":Ljava/lang/String;
    .restart local v10    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    :catch_2
    move-exception v1

    .line 376
    .local v1, "e":Lorg/xml/sax/SAXException;
    :try_start_3
    invoke-virtual {v1}, Lorg/xml/sax/SAXException;->printStackTrace()V
    :try_end_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_1

    .line 389
    .end local v1    # "e":Lorg/xml/sax/SAXException;
    .end local v4    # "imsidn":Ljava/lang/String;
    .end local v5    # "nameValuePairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v7    # "response":Lorg/apache/http/HttpResponse;
    .end local v8    # "resultCode":Ljava/lang/String;
    .end local v10    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    :catch_3
    move-exception v1

    .line 391
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method

.method protected showSMSInviteResultDialog(Z)Landroid/app/Dialog;
    .locals 3
    .param p1, "result"    # Z

    .prologue
    .line 475
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 476
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    if-eqz p1, :cond_0

    .line 477
    const v1, 0x7f020436

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 478
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f07006a

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 479
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f070213

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 484
    :goto_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f070210

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pccw/mobile/sip/SMSInviteActivity$8;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/SMSInviteActivity$8;-><init>(Lcom/pccw/mobile/sip/SMSInviteActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 491
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    return-object v1

    .line 481
    :cond_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f07011a

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 482
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f070212

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    goto :goto_0
.end method
