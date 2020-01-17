.class Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;
.super Landroid/os/AsyncTask;
.source "TAndCActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/TAndCActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ServerTCAcceptRecorder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final T_AND_C_SERVER_RECORD_FAIL_RESPONSE_ERROR:I = 0x3

.field private static final T_AND_C_SERVER_RECORD_IMSI_ERROR:I = 0x1

.field private static final T_AND_C_SERVER_RECORD_IMSI_SECOND_OPERATOR_ERROR:I = 0x5

.field private static final T_AND_C_SERVER_RECORD_NOWIFI_ERROR:I = 0x2

.field private static final T_AND_C_SERVER_RECORD_OK:I = 0x0

.field private static final T_AND_C_SERVER_RECORD_OTHER_ERROR:I = 0x4


# instance fields
.field private activity:Landroid/app/Activity;

.field private appContext:Landroid/content/Context;

.field private errorDialog:Landroid/app/AlertDialog;

.field private resultCode:Ljava/lang/String;

.field final synthetic this$0:Lcom/pccw/mobile/sip/TAndCActivity;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/TAndCActivity;Landroid/app/Activity;)V
    .locals 1
    .param p2, "act"    # Landroid/app/Activity;

    .prologue
    const/4 v0, 0x0

    .line 639
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 632
    iput-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->resultCode:Ljava/lang/String;

    .line 637
    iput-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->errorDialog:Landroid/app/AlertDialog;

    .line 640
    iput-object p2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->activity:Landroid/app/Activity;

    .line 641
    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->appContext:Landroid/content/Context;

    .line 642
    return-void
.end method

.method static synthetic access$2500(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    .prologue
    .line 624
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$2602(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 624
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->resultCode:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 20
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 646
    const/4 v7, 0x0

    .line 647
    .local v7, "retryCount":I
    const/4 v6, 0x1

    .line 648
    .local v6, "needTry":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->getEncryptedPccwImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 649
    .local v4, "encryptedImsi":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    move-object/from16 v16, v0

    .line 650
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->getEncryptedDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 660
    .local v3, "encryptedDeviceID":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v16

    if-nez v16, :cond_1

    .line 661
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v16

    if-nez v16, :cond_1

    .line 662
    :cond_0
    new-instance v16, Ljava/lang/Integer;

    const/16 v17, 0x1

    invoke-direct/range {v16 .. v17}, Ljava/lang/Integer;-><init>(I)V

    .line 755
    :goto_0
    return-object v16

    .line 665
    :cond_1
    :goto_1
    const/16 v16, 0x2

    move/from16 v0, v16

    if-ge v7, v0, :cond_f

    if-eqz v6, :cond_f

    .line 666
    const/4 v6, 0x0

    .line 667
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_e

    .line 668
    const/4 v5, 0x0

    .line 669
    .local v5, "hlContent":Ljava/lang/String;
    new-instance v8, Ljava/text/SimpleDateFormat;

    const-string/jumbo v16, "yyyyMMddHHmm"

    sget-object v17, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v8, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 670
    .local v8, "sdf":Ljava/text/SimpleDateFormat;
    const-string/jumbo v16, "UTC"

    invoke-static/range {v16 .. v16}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 671
    new-instance v16, Ljava/util/Date;

    invoke-direct/range {v16 .. v16}, Ljava/util/Date;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v13

    .line 677
    .local v13, "timestamp":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v9, ""

    .line 678
    .local v9, "simType":Ljava/lang/String;
    const-string/jumbo v12, ""

    .line 679
    .local v12, "tNCVersion":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->isNormalPrepaid(Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_4

    .line 680
    const-string/jumbo v9, "HKT_NORMAL_PREPAID"

    .line 681
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1800()Ljava/lang/String;

    move-result-object v12

    .line 701
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_a

    .line 703
    const-string/jumbo v16, "https://sip.pccwmobile.com/voip02/acceptTandC.do"

    const/16 v17, 0x8

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    const-string/jumbo v19, "deviceID"

    aput-object v19, v17, v18

    const/16 v18, 0x1

    aput-object v3, v17, v18

    const/16 v18, 0x2

    const-string/jumbo v19, "version"

    aput-object v19, v17, v18

    const/16 v18, 0x3

    aput-object v12, v17, v18

    const/16 v18, 0x4

    const-string/jumbo v19, "timestamp"

    aput-object v19, v17, v18

    const/16 v18, 0x5

    aput-object v13, v17, v18

    const/16 v18, 0x6

    const-string/jumbo v19, "simType"

    aput-object v19, v17, v18

    const/16 v18, 0x7

    aput-object v9, v17, v18

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    .line 721
    .end local v9    # "simType":Ljava/lang/String;
    .end local v12    # "tNCVersion":Ljava/lang/String;
    :goto_3
    if-nez v6, :cond_3

    .line 722
    if-eqz v5, :cond_2

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v16

    if-nez v16, :cond_b

    .line 723
    :cond_2
    add-int/lit8 v7, v7, 0x1

    .line 724
    const/4 v6, 0x1

    .line 751
    :cond_3
    :goto_4
    const-wide/16 v16, 0x1f4

    :try_start_1
    invoke-static/range {v16 .. v17}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 752
    :catch_0
    move-exception v16

    goto/16 :goto_1

    .line 682
    .restart local v9    # "simType":Ljava/lang/String;
    .restart local v12    # "tNCVersion":Ljava/lang/String;
    :cond_4
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->isHelloPrepaid(Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_5

    .line 683
    const-string/jumbo v9, "HKT_HELLO_PREPAID"

    .line 684
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1800()Ljava/lang/String;

    move-result-object v12

    goto :goto_2

    .line 685
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_6

    .line 686
    const-string/jumbo v9, "CSL_PREPAID"

    .line 687
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1900()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_2

    .line 688
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSL1010Postpaid(Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_7

    .line 689
    const-string/jumbo v9, "CSL_1010_POSTPAID"

    .line 690
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$2000()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_2

    .line 691
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLOne2freePostpaid(Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_8

    .line 692
    const-string/jumbo v9, "CSL_O2F_POSTPAID"

    .line 693
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$2100()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_2

    .line 694
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPostpaid(Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_9

    .line 695
    const-string/jumbo v9, "HKT_POSTPAID"

    .line 696
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$2200()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_2

    .line 698
    :cond_9
    new-instance v16, Ljava/lang/Integer;

    const/16 v17, 0x4

    invoke-direct/range {v16 .. v17}, Ljava/lang/Integer;-><init>(I)V

    goto/16 :goto_0

    .line 714
    .end local v9    # "simType":Ljava/lang/String;
    .end local v12    # "tNCVersion":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 717
    .local v2, "e":Ljava/lang/Exception;
    add-int/lit8 v7, v7, 0x1

    .line 718
    const/4 v6, 0x1

    goto/16 :goto_3

    .line 707
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v9    # "simType":Ljava/lang/String;
    .restart local v12    # "tNCVersion":Ljava/lang/String;
    :cond_a
    const-string/jumbo v16, "https://sip.pccwmobile.com/voip02/acceptTandC.do"

    const/16 v17, 0xa

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    const-string/jumbo v19, "imsi"

    aput-object v19, v17, v18

    const/16 v18, 0x1

    aput-object v4, v17, v18

    const/16 v18, 0x2

    const-string/jumbo v19, "version"

    aput-object v19, v17, v18

    const/16 v18, 0x3

    aput-object v12, v17, v18

    const/16 v18, 0x4

    const-string/jumbo v19, "timestamp"

    aput-object v19, v17, v18

    const/16 v18, 0x5

    aput-object v13, v17, v18

    const/16 v18, 0x6

    const-string/jumbo v19, "encrypted"

    aput-object v19, v17, v18

    const/16 v18, 0x7

    const-string/jumbo v19, "1"

    aput-object v19, v17, v18

    const/16 v18, 0x8

    const-string/jumbo v19, "simType"

    aput-object v19, v17, v18

    const/16 v18, 0x9

    aput-object v9, v17, v18

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v5

    goto/16 :goto_3

    .line 727
    .end local v9    # "simType":Ljava/lang/String;
    .end local v12    # "tNCVersion":Ljava/lang/String;
    :cond_b
    :try_start_3
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v11

    .line 728
    .local v11, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v11}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v10

    .line 729
    .local v10, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v10}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v15

    .line 730
    .local v15, "xr":Lorg/xml/sax/XMLReader;
    new-instance v14, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;

    const/16 v16, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v14, v0, v1}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;-><init>(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;Lcom/pccw/mobile/sip/TAndCActivity$1;)V

    .line 731
    .local v14, "xmlHandler":Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;
    invoke-interface {v15, v14}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 732
    new-instance v16, Lorg/xml/sax/InputSource;

    new-instance v17, Ljava/io/StringReader;

    move-object/from16 v0, v17

    invoke-direct {v0, v5}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct/range {v16 .. v17}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface/range {v15 .. v16}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 738
    .end local v10    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v11    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v14    # "xmlHandler":Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$ServerTCResponseXmlHandler;
    .end local v15    # "xr":Lorg/xml/sax/XMLReader;
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->resultCode:Ljava/lang/String;

    move-object/from16 v16, v0

    if-nez v16, :cond_c

    .line 739
    add-int/lit8 v7, v7, 0x1

    .line 740
    const/4 v6, 0x1

    goto/16 :goto_4

    .line 733
    :catch_2
    move-exception v2

    .line 736
    .restart local v2    # "e":Ljava/lang/Exception;
    const/16 v16, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->resultCode:Ljava/lang/String;

    goto :goto_5

    .line 741
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->resultCode:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string/jumbo v17, "0"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_d

    .line 742
    new-instance v16, Ljava/lang/Integer;

    const/16 v17, 0x3

    invoke-direct/range {v16 .. v17}, Ljava/lang/Integer;-><init>(I)V

    goto/16 :goto_0

    .line 744
    :cond_d
    new-instance v16, Ljava/lang/Integer;

    const/16 v17, 0x0

    invoke-direct/range {v16 .. v17}, Ljava/lang/Integer;-><init>(I)V

    goto/16 :goto_0

    .line 748
    .end local v5    # "hlContent":Ljava/lang/String;
    .end local v8    # "sdf":Ljava/text/SimpleDateFormat;
    .end local v13    # "timestamp":Ljava/lang/String;
    :cond_e
    new-instance v16, Ljava/lang/Integer;

    const/16 v17, 0x2

    invoke-direct/range {v16 .. v17}, Ljava/lang/Integer;-><init>(I)V

    goto/16 :goto_0

    .line 755
    :cond_f
    new-instance v16, Ljava/lang/Integer;

    const/16 v17, 0x4

    invoke-direct/range {v16 .. v17}, Ljava/lang/Integer;-><init>(I)V

    goto/16 :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 624
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public errorDialogCleanUp()V
    .locals 1

    .prologue
    .line 853
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->errorDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->errorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 854
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->errorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 855
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->errorDialog:Landroid/app/AlertDialog;

    .line 857
    :cond_0
    return-void
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 6
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    const v3, 0x7f07021b

    const v4, 0x7f07015b

    const/4 v5, 0x1

    .line 760
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_5

    .line 761
    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_9

    .line 762
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->appContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPrepaid(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 763
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v2, v5}, Lcom/pccw/mobile/sip/ClientStateManager;->setPrepaidTcAccepted(Landroid/content/Context;Z)Z

    .line 772
    :goto_0
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$2200()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 773
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->appContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "T_AND_C_VERSION_POSTPAID_STRING"

    .line 774
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$2200()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 775
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1800()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 776
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->appContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "T_AND_C_VERSION_PREPAID_STRING"

    .line 777
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1800()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 778
    :cond_1
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$2100()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 779
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->appContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "T_AND_C_VERSION_ONE2FREE_POSTPAID_STRING"

    .line 780
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$2100()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 781
    :cond_2
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$2000()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 782
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->appContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "T_AND_C_VERSION_1010_POSTPAID_STRING"

    .line 783
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$2000()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 784
    :cond_3
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1900()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 785
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->appContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "T_AND_C_VERSION_CSL_PREPAID_STRING"

    .line 786
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1900()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 788
    :cond_4
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v2, v5}, Lcom/pccw/mobile/sip/TAndCActivity;->access$2400(Lcom/pccw/mobile/sip/TAndCActivity;Z)V

    .line 850
    :cond_5
    :goto_1
    return-void

    .line 764
    :cond_6
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->appContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPostpaid(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 765
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v2, v5}, Lcom/pccw/mobile/sip/ClientStateManager;->setCSLPostpaidTcAccepted(Landroid/content/Context;Z)Z

    goto/16 :goto_0

    .line 766
    :cond_7
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->appContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 767
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v2, v5}, Lcom/pccw/mobile/sip/ClientStateManager;->setCSLPrepaidTcAccepted(Landroid/content/Context;Z)Z

    goto/16 :goto_0

    .line 769
    :cond_8
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v2, v5}, Lcom/pccw/mobile/sip/ClientStateManager;->setPostpaidTcAccepted(Landroid/content/Context;Z)Z

    goto/16 :goto_0

    .line 790
    :cond_9
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    .line 791
    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 792
    .local v1, "errorMessage":Ljava/lang/String;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 795
    .local v0, "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    if-nez p1, :cond_b

    .line 796
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 797
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-virtual {v2, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$1;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$1;-><init>(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 833
    :cond_a
    :goto_2
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->appContext:Landroid/content/Context;

    const v3, 0x7f07006a

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 834
    const v2, 0x7f020436

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 835
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 837
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->errorDialog:Landroid/app/AlertDialog;

    .line 839
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->errorDialog:Landroid/app/AlertDialog;

    new-instance v3, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$4;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$4;-><init>(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;)V

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 847
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->errorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    goto :goto_1

    .line 804
    :cond_b
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v5, :cond_c

    .line 805
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    const v3, 0x7f0701c7

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 806
    :cond_c
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x5

    if-ne v2, v3, :cond_d

    .line 807
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    const v3, 0x7f07011c

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 808
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    const v3, 0x7f070075

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$2;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$2;-><init>(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 818
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    const/high16 v3, 0x1040000

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2

    .line 820
    :cond_d
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_e

    .line 821
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_e

    .line 822
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x4

    if-ne v2, v3, :cond_a

    .line 823
    :cond_e
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    const v3, 0x7f0700aa

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 824
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-virtual {v2, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$3;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder$3;-><init>(Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto/16 :goto_2
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 624
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method
