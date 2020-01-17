.class public Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;
.super Lcom/pccw/mobile/sip/BaseActivity;
.source "ConfirmRegistrationActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final CODE_COMFIRM_REGISTRATION_INACTIVE_PREPAID_CARD:I

.field private final CODE_COMFIRM_REGISTRATION_PASSWORD_DEVICEID_AUTH_FAIL:I

.field private final CODE_COMFIRM_REGISTRATION_PREPAID_ACTIVATION_FAIL:I

.field private final CODE_COMNFIRM_REGISTRATION_API_RETURNED_ERROR:I

.field private final CODE_EMPTY_PASSWORD:I

.field private final CODE_NETWORK_ERROR:I

.field private final CODE_SUCCESS:I

.field private activateFirstTime:Ljava/lang/String;

.field private activationDialog:Landroid/app/AlertDialog;

.field confirmRegistrationResponse:Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;

.field imRegResponse:Lcom/pccw/mobile/server/response/IMRegistrationResponse;

.field private inputMsisdn:Ljava/lang/String;

.field private loadingDialog:Landroid/app/AlertDialog;

.field private mCancel:Landroid/widget/Button;

.field private mPassword:Landroid/widget/EditText;

.field private mRemindGetPWTV:Landroid/widget/TextView;

.field private mSubmit:Landroid/widget/Button;

.field private mTextView:Landroid/widget/TextView;

.field private msisdn:Ljava/lang/String;

.field private numType:I

.field private password:Ljava/lang/String;

.field private resultCode:I

.field private resultMsg:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x3

    const/4 v1, 0x0

    .line 24
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActivity;-><init>()V

    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->CODE_SUCCESS:I

    .line 27
    const/4 v0, 0x1

    iput v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->CODE_COMFIRM_REGISTRATION_PASSWORD_DEVICEID_AUTH_FAIL:I

    .line 28
    iput v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->CODE_COMFIRM_REGISTRATION_INACTIVE_PREPAID_CARD:I

    .line 29
    const/4 v0, 0x4

    iput v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->CODE_COMFIRM_REGISTRATION_PREPAID_ACTIVATION_FAIL:I

    .line 31
    const/4 v0, -0x2

    iput v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->CODE_EMPTY_PASSWORD:I

    .line 32
    const/4 v0, -0x3

    iput v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->CODE_NETWORK_ERROR:I

    .line 33
    const/16 v0, -0x63

    iput v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->CODE_COMNFIRM_REGISTRATION_API_RETURNED_ERROR:I

    .line 35
    iput-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 36
    iput-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->msisdn:Ljava/lang/String;

    .line 37
    iput-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->password:Ljava/lang/String;

    .line 40
    iput-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->activateFirstTime:Ljava/lang/String;

    .line 53
    iput-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    .line 55
    iput-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->activationDialog:Landroid/app/AlertDialog;

    .line 57
    iput v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->numType:I

    .line 59
    iput-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->imRegResponse:Lcom/pccw/mobile/server/response/IMRegistrationResponse;

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->dealWithResponseFailed()V

    return-void
.end method

.method static synthetic access$100(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->dealWithResponseSuccessfully()V

    return-void
.end method

.method static synthetic access$200(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->gotoNextActivity()V

    return-void
.end method

.method static synthetic access$300(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mPassword:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$400(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mSubmit:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$500(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mCancel:Landroid/widget/Button;

    return-object v0
.end method

.method private afterApiRequest()V
    .locals 5

    .prologue
    .line 261
    iget-object v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 262
    iget-object v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->dismiss()V

    .line 265
    :cond_0
    iget v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultCode:I

    if-nez v2, :cond_2

    .line 272
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->savePrepaidClientAccountInfo()V

    .line 274
    iget v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->numType:I

    invoke-static {p0, v2}, Lcom/pccw/mobile/sip/ClientStateManager;->setPostpaidPrepaidMode(Landroid/content/Context;I)Z

    .line 277
    iget-object v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->activateFirstTime:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->activateFirstTime:Ljava/lang/String;

    const-string/jumbo v3, "True"

    .line 279
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 285
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 288
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0700b1

    .line 289
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 287
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    .line 291
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 293
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x104000a

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$2;

    invoke-direct {v4, p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$2;-><init>(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)V

    .line 292
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 300
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->activationDialog:Landroid/app/AlertDialog;

    .line 301
    iget-object v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->activationDialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 333
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    :goto_0
    return-void

    .line 305
    :cond_1
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->gotoNextActivity()V

    goto :goto_0

    .line 312
    :cond_2
    iget-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 313
    .local v1, "errMsg":Ljava/lang/String;
    new-instance v2, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$3;

    invoke-direct {v2, p0, v1}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$3;-><init>(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method private dealWithResponseFailed()V
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->confirmRegistrationResponse:Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;

    if-nez v0, :cond_0

    .line 208
    const/4 v0, -0x3

    iput v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultCode:I

    .line 209
    const v0, 0x7f0701b5

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 212
    :cond_0
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->afterApiRequest()V

    .line 213
    return-void
.end method

.method private dealWithResponseSuccessfully()V
    .locals 2

    .prologue
    .line 216
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->confirmRegistrationResponse:Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;->resultcode:Ljava/lang/String;

    const-string/jumbo v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 220
    const/4 v0, 0x1

    iput v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultCode:I

    .line 221
    const v0, 0x7f0700ad

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 223
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->confirmRegistrationResponse:Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;->resultcode:Ljava/lang/String;

    const-string/jumbo v1, "3"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 227
    const/4 v0, 0x3

    iput v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultCode:I

    .line 228
    const v0, 0x7f0700ae

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 232
    :cond_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->confirmRegistrationResponse:Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;->resultcode:Ljava/lang/String;

    const-string/jumbo v1, "4"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 236
    const/4 v0, 0x4

    iput v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultCode:I

    .line 237
    const v0, 0x7f0700af

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 240
    :cond_2
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->confirmRegistrationResponse:Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;->resultcode:Ljava/lang/String;

    const-string/jumbo v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 244
    const/16 v0, -0x63

    iput v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultCode:I

    .line 245
    const v0, 0x7f0700b0

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 257
    :cond_3
    :goto_0
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->afterApiRequest()V

    .line 258
    return-void

    .line 250
    :cond_4
    const/4 v0, 0x0

    iput v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultCode:I

    .line 252
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->confirmRegistrationResponse:Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;->activateFirstTime:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 253
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->confirmRegistrationResponse:Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;

    iget-object v0, v0, Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;->activateFirstTime:Ljava/lang/String;

    iput-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->activateFirstTime:Ljava/lang/String;

    goto :goto_0
.end method

.method private gotoNextActivity()V
    .locals 3

    .prologue
    .line 355
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 356
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 359
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->startActivity(Landroid/content/Intent;)V

    .line 360
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    .line 361
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->finish()V

    .line 363
    :cond_1
    return-void
.end method

.method private prepaidRegistrationSubmit()V
    .locals 5

    .prologue
    .line 161
    iget-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->inputMsisdn:Ljava/lang/String;

    iput-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->msisdn:Ljava/lang/String;

    .line 162
    iget-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->password:Ljava/lang/String;

    .line 163
    iget-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->msisdn:Ljava/lang/String;

    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->msisdn:Ljava/lang/String;

    .line 170
    iget-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->password:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->password:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 171
    :cond_0
    const/4 v1, -0x2

    iput v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultCode:I

    .line 172
    const v1, 0x7f0700ac

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->resultMsg:Ljava/lang/String;

    .line 181
    :cond_1
    new-instance v0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$1;

    invoke-direct {v0, p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$1;-><init>(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)V

    .line 201
    .local v0, "confirmRegistrationResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    new-instance v1, Lcom/pccw/mobile/server/ConfirmRegistrationApi;

    iget-object v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->msisdn:Ljava/lang/String;

    iget-object v3, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->password:Ljava/lang/String;

    invoke-direct {v1, v0, p0, v2, v3}, Lcom/pccw/mobile/server/ConfirmRegistrationApi;-><init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, ""

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/server/ConfirmRegistrationApi;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 204
    return-void
.end method

.method private savePrepaidClientAccountInfo()V
    .locals 2

    .prologue
    .line 337
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->setRegisteredPrepaid(Landroid/content/Context;)Z

    .line 339
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->msisdn:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/pccw/mobile/sip/ClientStateManager;->setRegisteredNumber(Landroid/content/Context;Ljava/lang/String;)Z

    .line 340
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->password:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/pccw/mobile/sip/ClientStateManager;->setRegisteredPrepaidNumberPassword(Landroid/content/Context;Ljava/lang/String;)Z

    .line 347
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/mobile/sip/ClientStateManager;->isGoingToResetPrepaidAccount(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 349
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/ClientStateManager;->setIsGoingToResetPrepaidAccount(Landroid/content/Context;Z)Z

    .line 351
    :cond_0
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 125
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 158
    :goto_0
    return-void

    .line 127
    :pswitch_0
    const-string/jumbo v1, "testing"

    const-string/jumbo v2, "Submit btn clicked"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    const-string/jumbo v1, "input_method"

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    iget-object v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mPassword:Landroid/widget/EditText;

    .line 130
    invoke-virtual {v2}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v1, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 131
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 132
    .local v0, "loadingDialogBuilder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f07006a

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 133
    const v1, 0x7f020436

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 134
    const v1, 0x7f07016c

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 136
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    .line 137
    iget-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 138
    iget-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 141
    iget-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 142
    iget-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mSubmit:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 143
    iget-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mCancel:Landroid/widget/Button;

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 144
    iget-object v1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 147
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->prepaidRegistrationSubmit()V

    goto :goto_0

    .line 151
    .end local v0    # "loadingDialogBuilder":Landroid/app/AlertDialog$Builder;
    :pswitch_1
    const-string/jumbo v1, "testing"

    const-string/jumbo v2, "Back btn clicked, go back to registration activity"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->startActivity(Landroid/content/Intent;)V

    .line 155
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->finish()V

    goto :goto_0

    .line 125
    :pswitch_data_0
    .packed-switch 0x7f0e0112
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 63
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 66
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 68
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v3, "msisdn"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->inputMsisdn:Ljava/lang/String;

    .line 69
    const-string/jumbo v3, "isFreeTrial"

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 70
    .local v1, "isFreeTrial":Z
    const-string/jumbo v3, "numberType"

    const/4 v5, 0x3

    invoke-virtual {v0, v3, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->numType:I

    .line 72
    if-eqz v1, :cond_0

    const v3, 0x7f0700b2

    invoke-virtual {p0, v3}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v5, "MSISDN_VALUE"

    iget-object v6, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->inputMsisdn:Ljava/lang/String;

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 75
    .local v2, "notice":Ljava/lang/String;
    :goto_0
    const v3, 0x7f04003b

    invoke-virtual {p0, v3}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->setContentView(I)V

    .line 77
    const v3, 0x7f0e010f

    invoke-virtual {p0, v3}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mTextView:Landroid/widget/TextView;

    .line 78
    iget-object v3, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    const v3, 0x7f0e0114

    invoke-virtual {p0, v3}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mRemindGetPWTV:Landroid/widget/TextView;

    .line 81
    iget-object v5, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mRemindGetPWTV:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    const/16 v3, 0x8

    :goto_1
    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 83
    const v3, 0x7f0e0110

    invoke-virtual {p0, v3}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mPassword:Landroid/widget/EditText;

    .line 84
    const v3, 0x7f0e0112

    invoke-virtual {p0, v3}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mSubmit:Landroid/widget/Button;

    .line 85
    iget-object v3, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mSubmit:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    const v3, 0x7f0e0113

    invoke-virtual {p0, v3}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mCancel:Landroid/widget/Button;

    .line 87
    iget-object v3, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mCancel:Landroid/widget/Button;

    invoke-virtual {v3, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    return-void

    .line 72
    .end local v2    # "notice":Ljava/lang/String;
    :cond_0
    const v3, 0x7f0700b4

    .line 73
    invoke-virtual {p0, v3}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .restart local v2    # "notice":Ljava/lang/String;
    :cond_1
    move v3, v4

    .line 81
    goto :goto_1
.end method

.method public onPause()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 103
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onPause()V

    .line 104
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->activationDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->activationDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 112
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->activationDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 114
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mPassword:Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 115
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 117
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mPassword:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 118
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mSubmit:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 119
    iget-object v0, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->mCancel:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 121
    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 92
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onResume()V

    .line 96
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->gotoNextActivity()V

    .line 99
    :cond_0
    return-void
.end method
