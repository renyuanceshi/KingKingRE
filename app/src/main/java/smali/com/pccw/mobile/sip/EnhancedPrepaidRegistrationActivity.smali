.class public Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;
.super Lcom/pccw/mobile/sip/BaseActivity;
.source "EnhancedPrepaidRegistrationActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final MIN_PHONE_NUMBER_LENGTH:I = 0x8


# instance fields
.field private final CODE_2N_ESHOP:I

.field private final CODE_2N_FREE_TRIAL_AVAILABLE:I

.field private final CODE_2N_NOT_ALLOW:I

.field private final CODE_2N_PURCHASED_VIRTUAL_NUMBER:I

.field private final CODE_2N_VIRTUAL_NUMBER_SUCCESS:I

.field private final CODE_CSL_PREPAID_NOT_ALLOW:I

.field private final CODE_CSL_PREPAID_SUCCESS:I

.field private final CODE_EMPTY_PREPAID_NO:I

.field private final CODE_GETNUMBERTYPE_API_2N_MATCHING_ERROR:I

.field private final CODE_GETNUMBERTYPE_API_FAIL_TO_CALL:I

.field private final CODE_GETNUMBERTYPE_API_OTHER_ERROR:I

.field private final CODE_GETNUMBERTYPE_API_RETURNED_ERROR:I

.field private final CODE_HELLO_PREPAID_SUCCESS:I

.field private final CODE_INVALID_PREPAID_CARD_INACTIVE:I

.field private final CODE_INVALID_PREPAID_CARD_STATE:I

.field private final CODE_INVALID_VIRTUAL_NUMBER_INACTIVE:I

.field private final CODE_NETWORK_ERROR:I

.field private final CODE_NORMAL_PREPAID_SUCCESS:I

.field private final CODE_NO_WIFI:I

.field private final CODE_POSTPAID_SUCCESS:I

.field private final CODE_REAL_PREPAID_NOT_ALLOW:I

.field private final CODE_UNKNOWN_PREPAID_NOT_ALLOW:I

.field private checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

.field private getVirtualNumberUrl:Ljava/lang/String;

.field private isFreeTrialPromtionPeriod:Z

.field private loadingDialog:Landroid/app/AlertDialog;

.field private mCancel:Landroid/widget/Button;

.field private mPhone:Landroid/widget/EditText;

.field private mSubmit:Landroid/widget/Button;

.field public messageController:Lcom/pccw/mobile/sip/ServerMessageController;

.field private msisdn:Ljava/lang/String;

.field private resultCode:I

.field private resultMsg:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 29
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActivity;-><init>()V

    .line 31
    iput v2, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_NORMAL_PREPAID_SUCCESS:I

    .line 32
    const/4 v0, 0x1

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_HELLO_PREPAID_SUCCESS:I

    .line 33
    const/4 v0, 0x2

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_POSTPAID_SUCCESS:I

    .line 34
    iput v3, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_2N_VIRTUAL_NUMBER_SUCCESS:I

    .line 36
    iput v3, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_2N_FREE_TRIAL_AVAILABLE:I

    .line 37
    const/4 v0, 0x4

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_2N_ESHOP:I

    .line 38
    const/4 v0, 0x5

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_CSL_PREPAID_SUCCESS:I

    .line 40
    const/4 v0, -0x1

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_EMPTY_PREPAID_NO:I

    .line 41
    const/4 v0, -0x3

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_NETWORK_ERROR:I

    .line 42
    const/4 v0, -0x4

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_NO_WIFI:I

    .line 44
    const/4 v0, -0x5

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_INVALID_PREPAID_CARD_INACTIVE:I

    .line 45
    const/4 v0, -0x6

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_INVALID_PREPAID_CARD_STATE:I

    .line 46
    const/4 v0, -0x7

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_INVALID_VIRTUAL_NUMBER_INACTIVE:I

    .line 48
    const/4 v0, -0x8

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_2N_PURCHASED_VIRTUAL_NUMBER:I

    .line 50
    const/16 v0, -0xa

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_GETNUMBERTYPE_API_RETURNED_ERROR:I

    .line 51
    const/16 v0, -0xb

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_GETNUMBERTYPE_API_FAIL_TO_CALL:I

    .line 52
    const/16 v0, -0xc

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_GETNUMBERTYPE_API_2N_MATCHING_ERROR:I

    .line 53
    const/16 v0, -0xd

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_2N_NOT_ALLOW:I

    .line 54
    const/16 v0, -0xe

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_REAL_PREPAID_NOT_ALLOW:I

    .line 55
    const/16 v0, -0xf

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_CSL_PREPAID_NOT_ALLOW:I

    .line 56
    const/16 v0, -0x10

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_UNKNOWN_PREPAID_NOT_ALLOW:I

    .line 58
    const/16 v0, -0x63

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->CODE_GETNUMBERTYPE_API_OTHER_ERROR:I

    .line 61
    iput-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 62
    iput-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    .line 63
    iput-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    .line 65
    iput-boolean v2, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->isFreeTrialPromtionPeriod:Z

    .line 66
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getVirtualNumberUrl:Ljava/lang/String;

    .line 75
    iput-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    .line 76
    iput-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mPhone:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$100(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    return-object v0
.end method

.method static synthetic access$102(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;)Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;
    .param p1, "x1"    # Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    return-object p1
.end method

.method static synthetic access$200(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->dealWithResponseFailed()V

    return-void
.end method

.method static synthetic access$300(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->dealWithResponseSuccessfully()V

    return-void
.end method

.method static synthetic access$400(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mSubmit:Landroid/widget/Button;

    return-object v0
.end method

.method private afterApiRequest()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x1

    const/4 v4, 0x3

    const/4 v3, 0x0

    .line 419
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 420
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 423
    :cond_0
    iget v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    if-nez v1, :cond_2

    .line 428
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    invoke-direct {p0, v1, v3, v4}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->gotoConfirmRegistrationActivity(Ljava/lang/String;ZI)V

    .line 480
    :cond_1
    :goto_0
    return-void

    .line 429
    :cond_2
    iget v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    if-ne v1, v5, :cond_3

    .line 434
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    invoke-direct {p0, v1, v3, v6}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->gotoConfirmRegistrationActivity(Ljava/lang/String;ZI)V

    goto :goto_0

    .line 435
    :cond_3
    iget v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    const/4 v2, 0x5

    if-ne v1, v2, :cond_4

    .line 440
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    const/4 v2, 0x7

    invoke-direct {p0, v1, v3, v2}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->gotoConfirmRegistrationActivity(Ljava/lang/String;ZI)V

    goto :goto_0

    .line 441
    :cond_4
    iget v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    if-ne v1, v4, :cond_5

    .line 447
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    invoke-direct {p0, v1, v5, v4}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->gotoConfirmRegistrationActivity(Ljava/lang/String;ZI)V

    goto :goto_0

    .line 448
    :cond_5
    iget v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    if-eq v1, v6, :cond_1

    .line 460
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 461
    .local v0, "errMsg":Ljava/lang/String;
    const-string/jumbo v1, "chen"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "errMsg = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    new-instance v1, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$3;

    invoke-direct {v1, p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$3;-><init>(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private dealWithResponseFailed()V
    .locals 3

    .prologue
    .line 486
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    if-nez v1, :cond_0

    const-string/jumbo v0, "99"

    .line 487
    .local v0, "code":Ljava/lang/String;
    :goto_0
    const-string/jumbo v1, "get_number_info_error_"

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/pccw/mobile/util/ErrorMsgUtil;->getLocalErrorMsg(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 488
    const/16 v1, -0xa

    iput v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    .line 489
    invoke-direct {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->afterApiRequest()V

    .line 490
    return-void

    .line 486
    .end local v0    # "code":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v0, v1, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    goto :goto_0
.end method

.method private dealWithResponseSuccessfully()V
    .locals 3

    .prologue
    const/4 v2, 0x4

    .line 301
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    const-string/jumbo v1, "postpaid"

    .line 302
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 306
    const/4 v0, 0x2

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    .line 307
    const v0, 0x7f0701df

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 310
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    const-string/jumbo v1, "prepaid"

    .line 311
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 315
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->isFreeTrial:Ljava/lang/String;

    const-string/jumbo v1, "true"

    .line 316
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 319
    const/16 v0, -0xe

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    .line 320
    const v0, 0x7f070156

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 415
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->afterApiRequest()V

    .line 416
    return-void

    .line 321
    :cond_2
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->allowRS:Ljava/lang/String;

    const-string/jumbo v1, "true"

    .line 322
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 326
    const/4 v0, -0x6

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    .line 327
    const v0, 0x7f070150

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultMsg:Ljava/lang/String;

    goto :goto_0

    .line 328
    :cond_3
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->status:Ljava/lang/String;

    const-string/jumbo v1, "active"

    .line 329
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 350
    const/4 v0, -0x5

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    .line 351
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->status:Ljava/lang/String;

    const-string/jumbo v1, "idle"

    .line 352
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 356
    const v0, 0x7f070158

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultMsg:Ljava/lang/String;

    goto :goto_0

    .line 361
    :cond_4
    const v0, 0x7f070157

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultMsg:Ljava/lang/String;

    goto :goto_0

    .line 368
    :cond_5
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simClass:Ljava/lang/String;

    const-string/jumbo v1, "Hello"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 372
    const/4 v0, 0x1

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    .line 375
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    const-string/jumbo v1, "+852"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 376
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    goto :goto_0

    .line 377
    :cond_6
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simClass:Ljava/lang/String;

    const-string/jumbo v1, "Normal"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 381
    const/4 v0, 0x0

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    .line 384
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    const-string/jumbo v1, "+852"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 385
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    goto/16 :goto_0

    .line 386
    :cond_7
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simClass:Ljava/lang/String;

    const-string/jumbo v1, "csl"

    .line 387
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 391
    const/4 v0, 0x5

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    .line 393
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    const-string/jumbo v1, "+852"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 394
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    goto/16 :goto_0

    .line 396
    :cond_8
    const/16 v0, -0x10

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    .line 397
    const-string/jumbo v0, "get_number_info_unknown_prepaid"

    const-string/jumbo v1, ""

    .line 399
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 397
    invoke-static {v0, v1, v2}, Lcom/pccw/mobile/util/ErrorMsgUtil;->getLocalErrorMsg(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultMsg:Ljava/lang/String;

    goto/16 :goto_0

    .line 406
    :cond_9
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    const-string/jumbo v1, "2N"

    .line 407
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 411
    const/16 v0, -0xd

    iput v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    .line 412
    const v0, 0x7f0701dd

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultMsg:Ljava/lang/String;

    goto/16 :goto_0
.end method

.method private getLang()Ljava/lang/String;
    .locals 4

    .prologue
    .line 249
    const-string/jumbo v0, "en"

    .line 250
    .local v0, "lang":Ljava/lang/String;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    .line 251
    .local v1, "locale":Ljava/util/Locale;
    const-string/jumbo v2, "zh"

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 252
    const-string/jumbo v2, "HK"

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "TW"

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 253
    :cond_0
    const-string/jumbo v0, "zh_HK"

    .line 260
    :cond_1
    return-object v0
.end method

.method private getNumberType()V
    .locals 5

    .prologue
    .line 264
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mPhone:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    .line 265
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    .line 268
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->isValidInput(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 269
    :cond_0
    const/4 v1, -0x1

    iput v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultCode:I

    .line 270
    const v1, 0x7f0701de

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 275
    :cond_1
    new-instance v0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$2;

    invoke-direct {v0, p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$2;-><init>(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)V

    .line 296
    .local v0, "checkNumberTypeResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    new-instance v1, Lcom/pccw/mobile/server/CheckNumberTypeApi;

    const-string/jumbo v2, ""

    iget-object v3, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->msisdn:Ljava/lang/String;

    invoke-direct {v1, v0, p0, v2, v3}, Lcom/pccw/mobile/server/CheckNumberTypeApi;-><init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, ""

    aput-object v4, v2, v3

    .line 297
    invoke-virtual {v1, v2}, Lcom/pccw/mobile/server/CheckNumberTypeApi;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 298
    return-void
.end method

.method private gotoConfirmRegistrationActivity(Ljava/lang/String;ZI)V
    .locals 3
    .param p1, "msisdn"    # Ljava/lang/String;
    .param p2, "isFreeTrial"    # Z
    .param p3, "numType"    # I

    .prologue
    .line 192
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 193
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 196
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 197
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v1, "msisdn"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 198
    const-string/jumbo v1, "isFreeTrial"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 199
    const-string/jumbo v1, "numberType"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 201
    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->startActivity(Landroid/content/Intent;)V

    .line 203
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_1

    .line 204
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->finish()V

    .line 206
    :cond_1
    return-void
.end method

.method private isValidInput(Ljava/lang/String;)Z
    .locals 5
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 222
    const-string/jumbo v0, "^[0-9]*$"

    .line 224
    .local v0, "regexStr":Ljava/lang/String;
    const-string/jumbo v3, "+"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 225
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 228
    :cond_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 245
    :cond_1
    :goto_0
    return v1

    .line 235
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x8

    if-lt v3, v4, :cond_1

    move v1, v2

    .line 245
    goto :goto_0
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 210
    const-string/jumbo v0, ""

    const-string/jumbo v1, ""

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActivity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 141
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 167
    :cond_0
    :goto_0
    return-void

    .line 143
    :pswitch_0
    const-string/jumbo v1, "input_method"

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    iget-object v2, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mPhone:Landroid/widget/EditText;

    .line 144
    invoke-virtual {v2}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v1, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 145
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 146
    .local v0, "loadingDialogBuilder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f07006a

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 147
    const v1, 0x7f020436

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 148
    const v1, 0x7f07016c

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 150
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    .line 151
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 152
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 154
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mPhone:Landroid/widget/EditText;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 155
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mSubmit:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 156
    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 159
    invoke-direct {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getNumberType()V

    goto :goto_0

    .line 163
    .end local v0    # "loadingDialogBuilder":Landroid/app/AlertDialog$Builder;
    :pswitch_1
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 164
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->finish()V

    goto :goto_0

    .line 141
    nop

    :pswitch_data_0
    .packed-switch 0x7f0e013b
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 82
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 83
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->requestWindowFeature(I)Z

    .line 84
    const v0, 0x7f040048

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->setContentView(I)V

    .line 86
    const v0, 0x7f0e0139

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mPhone:Landroid/widget/EditText;

    .line 87
    const v0, 0x7f0e013b

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mSubmit:Landroid/widget/Button;

    .line 88
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mSubmit:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 89
    const v0, 0x7f0e013c

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mCancel:Landroid/widget/Button;

    .line 90
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mCancel:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 93
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mCancel:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 95
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    iput-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    .line 97
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mPhone:Landroid/widget/EditText;

    new-instance v1, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$1;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$1;-><init>(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 109
    return-void
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 128
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onPause()V

    .line 129
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 135
    :cond_0
    const-string/jumbo v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->mPhone:Landroid/widget/EditText;

    .line 136
    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 137
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 115
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onResume()V

    .line 116
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->canSkipCheckVersion(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 117
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->startActivity(Landroid/content/Intent;)V

    .line 118
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->finish()V

    .line 122
    :cond_0
    return-void
.end method
