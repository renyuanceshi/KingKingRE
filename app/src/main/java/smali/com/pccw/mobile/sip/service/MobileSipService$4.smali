.class Lcom/pccw/mobile/sip/service/MobileSipService$4;
.super Ljava/lang/Thread;
.source "MobileSipService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/service/MobileSipService;->activateCallForward(ZLandroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

.field final synthetic val$isActivating:Z

.field final synthetic val$mContext:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/service/MobileSipService;ZLandroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/service/MobileSipService;

    .prologue
    .line 1404
    iput-object p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iput-boolean p2, p0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$isActivating:Z

    iput-object p3, p0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 20

    .prologue
    .line 1407
    const/4 v9, 0x0

    .line 1408
    .local v9, "retryCount":I
    const/4 v8, 0x1

    .line 1412
    .local v8, "retry":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$isActivating:Z

    move/from16 v16, v0

    if-eqz v16, :cond_4

    const/16 v16, 0x2

    :goto_0
    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I

    .line 1414
    :cond_0
    :goto_1
    if-eqz v8, :cond_1c

    const/16 v16, 0x2

    move/from16 v0, v16

    if-ge v9, v0, :cond_1c

    .line 1415
    const/4 v8, 0x0

    .line 1416
    const/4 v5, 0x0

    .line 1418
    .local v5, "hlContent":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v2, ""

    .line 1419
    .local v2, "encryptedImsi":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_5

    .line 1421
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$400()Ljava/lang/String;

    move-result-object v2

    .line 1426
    :goto_2
    invoke-static {v2}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_1

    .line 1427
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_1

    .line 1428
    const-string/jumbo v17, "https://sip.pccwmobile.com/voip02/callforward.do"

    const/16 v16, 0xa

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v16, 0x0

    const-string/jumbo v19, "imsi"

    aput-object v19, v18, v16

    const/16 v16, 0x1

    aput-object v2, v18, v16

    const/16 v16, 0x2

    const-string/jumbo v19, "action"

    aput-object v19, v18, v16

    const/16 v19, 0x3

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$isActivating:Z

    move/from16 v16, v0

    if-eqz v16, :cond_6

    const-string/jumbo v16, "activate"

    :goto_3
    aput-object v16, v18, v19

    const/16 v16, 0x4

    const-string/jumbo v19, "lang"

    aput-object v19, v18, v16

    const/16 v16, 0x5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v19, v0

    .line 1430
    invoke-static/range {v19 .. v19}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$500(Lcom/pccw/mobile/sip/service/MobileSipService;)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v18, v16

    const/16 v16, 0x6

    const-string/jumbo v19, "session_id"

    aput-object v19, v18, v16

    const/16 v16, 0x7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->sessionId:Ljava/lang/String;

    move-object/from16 v19, v0

    aput-object v19, v18, v16

    const/16 v16, 0x8

    const-string/jumbo v19, "encrypted"

    aput-object v19, v18, v16

    const/16 v16, 0x9

    const-string/jumbo v19, "1"

    aput-object v19, v18, v16

    .line 1428
    invoke-static/range {v17 .. v18}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    .line 1449
    .end local v2    # "encryptedImsi":Ljava/lang/String;
    :cond_1
    :goto_4
    if-nez v8, :cond_3

    .line 1450
    invoke-static {v5}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_1b

    .line 1454
    :try_start_1
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v12

    .line 1455
    .local v12, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v12}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v11

    .line 1456
    .local v11, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v11}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v15

    .line 1457
    .local v15, "xr":Lorg/xml/sax/XMLReader;
    new-instance v14, Lcom/pccw/mobile/sip/service/CallForwardXmlHandler;

    invoke-direct {v14}, Lcom/pccw/mobile/sip/service/CallForwardXmlHandler;-><init>()V

    .line 1458
    .local v14, "xmlHandler":Lcom/pccw/mobile/sip/service/CallForwardXmlHandler;
    invoke-interface {v15, v14}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 1459
    new-instance v16, Lorg/xml/sax/InputSource;

    new-instance v17, Ljava/io/StringReader;

    move-object/from16 v0, v17

    invoke-direct {v0, v5}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct/range {v16 .. v17}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface/range {v15 .. v16}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 1460
    invoke-virtual {v14}, Lcom/pccw/mobile/sip/service/CallForwardXmlHandler;->response()Lcom/pccw/mobile/sip/service/CallForwardResponse;

    move-result-object v7

    .line 1462
    .local v7, "resp":Lcom/pccw/mobile/sip/service/CallForwardResponse;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-static {v0, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$602(Lcom/pccw/mobile/sip/service/MobileSipService;Lcom/pccw/mobile/sip/service/CallForwardResponse;)Lcom/pccw/mobile/sip/service/CallForwardResponse;

    .line 1464
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$isActivating:Z

    move/from16 v16, v0

    if-eqz v16, :cond_11

    .line 1465
    if-eqz v7, :cond_f

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v16, v0

    if-eqz v16, :cond_f

    .line 1466
    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string/jumbo v17, "0"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_8

    .line 1472
    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->fw_status:Ljava/lang/String;

    move-object/from16 v16, v0

    if-eqz v16, :cond_7

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->fw_status:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string/jumbo v17, "A"

    .line 1473
    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_7

    .line 1477
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I

    .line 1566
    :cond_2
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$300(Lcom/pccw/mobile/sip/service/MobileSipService;)I

    move-result v16

    const/16 v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_10

    .line 1567
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 1679
    .end local v7    # "resp":Lcom/pccw/mobile/sip/service/CallForwardResponse;
    .end local v11    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v12    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v14    # "xmlHandler":Lcom/pccw/mobile/sip/service/CallForwardXmlHandler;
    .end local v15    # "xr":Lorg/xml/sax/XMLReader;
    :cond_3
    :goto_6
    if-eqz v8, :cond_0

    const/16 v16, 0x2

    move/from16 v0, v16

    if-ge v9, v0, :cond_0

    .line 1681
    const-wide/16 v16, 0xc8

    :try_start_2
    invoke-static/range {v16 .. v17}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_1

    .line 1682
    :catch_0
    move-exception v16

    goto/16 :goto_1

    .line 1412
    .end local v5    # "hlContent":Ljava/lang/String;
    :cond_4
    const/16 v16, 0x3

    goto/16 :goto_0

    .line 1424
    .restart local v2    # "encryptedImsi":Ljava/lang/String;
    .restart local v5    # "hlContent":Ljava/lang/String;
    :cond_5
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->fetchEncryptedIMSI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_2

    .line 1428
    :cond_6
    const-string/jumbo v16, "deactivate"
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_3

    .line 1433
    .end local v2    # "encryptedImsi":Ljava/lang/String;
    :catch_1
    move-exception v4

    .line 1434
    .local v4, "ex":Ljava/lang/Exception;
    add-int/lit8 v9, v9, 0x1

    .line 1435
    const/4 v8, 0x1

    goto/16 :goto_4

    .line 1486
    .end local v4    # "ex":Ljava/lang/Exception;
    .restart local v7    # "resp":Lcom/pccw/mobile/sip/service/CallForwardResponse;
    .restart local v11    # "sp":Ljavax/xml/parsers/SAXParser;
    .restart local v12    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .restart local v14    # "xmlHandler":Lcom/pccw/mobile/sip/service/CallForwardXmlHandler;
    .restart local v15    # "xr":Lorg/xml/sax/XMLReader;
    :cond_7
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    const/16 v17, -0x1

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_5

    .line 1666
    .end local v7    # "resp":Lcom/pccw/mobile/sip/service/CallForwardResponse;
    .end local v11    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v12    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v14    # "xmlHandler":Lcom/pccw/mobile/sip/service/CallForwardXmlHandler;
    .end local v15    # "xr":Lorg/xml/sax/XMLReader;
    :catch_2
    move-exception v10

    .line 1667
    .local v10, "se":Ljava/lang/Exception;
    const/4 v8, 0x1

    .line 1668
    add-int/lit8 v9, v9, 0x1

    .line 1669
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_6

    .line 1490
    .end local v10    # "se":Ljava/lang/Exception;
    .restart local v7    # "resp":Lcom/pccw/mobile/sip/service/CallForwardResponse;
    .restart local v11    # "sp":Ljavax/xml/parsers/SAXParser;
    .restart local v12    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .restart local v14    # "xmlHandler":Lcom/pccw/mobile/sip/service/CallForwardXmlHandler;
    .restart local v15    # "xr":Lorg/xml/sax/XMLReader;
    :cond_8
    :try_start_5
    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string/jumbo v17, "2"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_b

    .line 1496
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    const/16 v17, 0x4

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I

    .line 1497
    const/4 v13, 0x0

    .line 1498
    .local v13, "warningMessage":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v16, v0

    const-string/jumbo v17, "callforward"

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v18, v0

    .line 1499
    invoke-virtual/range {v16 .. v18}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 1502
    if-nez v13, :cond_9

    .line 1503
    iget-object v13, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->message:Ljava/lang/String;

    .line 1504
    :cond_9
    if-eqz v13, :cond_2

    .line 1505
    const-string/jumbo v17, "-fw_number-"

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->fw_number:Ljava/lang/String;

    move-object/from16 v16, v0

    if-eqz v16, :cond_a

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->fw_number:Ljava/lang/String;

    move-object/from16 v16, v0

    :goto_7
    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v13, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    goto/16 :goto_5

    :cond_a
    const-string/jumbo v16, "Unknown"

    goto :goto_7

    .line 1520
    .end local v13    # "warningMessage":Ljava/lang/String;
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    const/16 v17, -0x1

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I

    .line 1521
    const/4 v3, 0x0

    .line 1522
    .local v3, "errorMessage":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v16, v0

    if-eqz v16, :cond_c

    .line 1523
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->isPrepaid(Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_e

    .line 1524
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v16, v0

    const-string/jumbo v17, "callforward_prepaid"

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v18, v0

    .line 1525
    invoke-virtual/range {v16 .. v18}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1547
    :cond_c
    :goto_8
    if-nez v3, :cond_d

    .line 1548
    iget-object v3, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->message:Ljava/lang/String;

    .line 1549
    :cond_d
    if-eqz v3, :cond_2

    .line 1550
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v16, v0

    const-string/jumbo v17, "callforward"

    const/16 v18, 0x2

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v16 .. v18}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1551
    .local v6, "msg":Ljava/lang/String;
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_2

    .line 1552
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v0, v1, v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$700(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_5

    .line 1529
    .end local v6    # "msg":Ljava/lang/String;
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v16, v0

    const-string/jumbo v17, "callforward"

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v18, v0

    .line 1530
    invoke-virtual/range {v16 .. v18}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1534
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-static {v3, v0}, Lcom/pccw/mobile/util/ErrorMsgUtil;->shouldShowOverseaXmlErrorMsg(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_c

    .line 1539
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v16, v0

    const-string/jumbo v17, "callforward_oversea"

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v18, v0

    .line 1540
    invoke-virtual/range {v16 .. v18}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_8

    .line 1562
    .end local v3    # "errorMessage":Ljava/lang/String;
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    const/16 v17, -0x1

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I

    goto/16 :goto_5

    .line 1570
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$802(Lcom/pccw/mobile/sip/service/MobileSipService;Z)Z

    .line 1571
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$900(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V

    goto/16 :goto_6

    .line 1574
    :cond_11
    if-eqz v7, :cond_1a

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v16, v0

    if-eqz v16, :cond_1a

    .line 1575
    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string/jumbo v17, "0"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_13

    .line 1581
    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->fw_status:Ljava/lang/String;

    move-object/from16 v16, v0

    if-eqz v16, :cond_12

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->fw_status:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string/jumbo v17, "I"

    .line 1582
    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_12

    .line 1586
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I

    goto/16 :goto_6

    .line 1593
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I

    goto/16 :goto_6

    .line 1597
    :cond_13
    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string/jumbo v17, "4"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_14

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string/jumbo v17, "5"

    .line 1598
    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_15

    .line 1605
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I

    goto/16 :goto_6

    .line 1613
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I

    .line 1614
    const/4 v3, 0x0

    .line 1615
    .restart local v3    # "errorMessage":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v16, v0

    if-eqz v16, :cond_16

    .line 1616
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Lcom/pccw/mobile/sip/ClientStateManager;->isPrepaid(Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_19

    .line 1617
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v16, v0

    const-string/jumbo v17, "callforward_prepaid"

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v18, v0

    .line 1618
    invoke-virtual/range {v16 .. v18}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1640
    :cond_16
    :goto_9
    if-nez v3, :cond_17

    .line 1641
    iget-object v3, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->message:Ljava/lang/String;

    .line 1642
    :cond_17
    if-eqz v3, :cond_3

    .line 1643
    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v16, v0

    const-string/jumbo v17, "8"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_18

    .line 1644
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v16

    move-object/from16 v0, v16

    iget v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    move/from16 v16, v0

    if-nez v16, :cond_3

    .line 1650
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v16, v0

    const-string/jumbo v17, "callforward"

    const/16 v18, 0x2

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v16 .. v18}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1651
    .restart local v6    # "msg":Ljava/lang/String;
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_3

    .line 1652
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v0, v1, v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$700(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_6

    .line 1622
    .end local v6    # "msg":Ljava/lang/String;
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v16, v0

    const-string/jumbo v17, "callforward"

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v18, v0

    .line 1623
    invoke-virtual/range {v16 .. v18}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1627
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-static {v3, v0}, Lcom/pccw/mobile/util/ErrorMsgUtil;->shouldShowOverseaXmlErrorMsg(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v16

    if-eqz v16, :cond_16

    .line 1632
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v16, v0

    const-string/jumbo v17, "callforward_oversea"

    iget-object v0, v7, Lcom/pccw/mobile/sip/service/CallForwardResponse;->resultCode:Ljava/lang/String;

    move-object/from16 v18, v0

    .line 1633
    invoke-virtual/range {v16 .. v18}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_9

    .line 1661
    .end local v3    # "errorMessage":Ljava/lang/String;
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    const/16 v17, 0x1

    invoke-static/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto/16 :goto_6

    .line 1672
    .end local v7    # "resp":Lcom/pccw/mobile/sip/service/CallForwardResponse;
    .end local v11    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v12    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v14    # "xmlHandler":Lcom/pccw/mobile/sip/service/CallForwardXmlHandler;
    .end local v15    # "xr":Lorg/xml/sax/XMLReader;
    :cond_1b
    const/4 v8, 0x1

    .line 1673
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_6

    .line 1686
    .end local v5    # "hlContent":Ljava/lang/String;
    :cond_1c
    if-eqz v8, :cond_1d

    .line 1688
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$isActivating:Z

    move/from16 v16, v0

    if-eqz v16, :cond_1e

    const/16 v16, -0x1

    :goto_a
    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I

    .line 1690
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$isActivating:Z

    move/from16 v16, v0

    if-eqz v16, :cond_1d

    .line 1691
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    move/from16 v16, v0

    if-eqz v16, :cond_1f

    .line 1692
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->startReLogin(Landroid/content/Context;)V

    .line 1700
    :cond_1d
    :goto_b
    return-void

    .line 1688
    :cond_1e
    const/16 v16, 0x1

    goto :goto_a

    .line 1693
    :cond_1f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    move/from16 v16, v0

    if-eqz v16, :cond_20

    .line 1694
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->startAutoLogin(Landroid/content/Context;)V

    goto :goto_b

    .line 1696
    :cond_20
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;->val$mContext:Landroid/content/Context;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto :goto_b
.end method
