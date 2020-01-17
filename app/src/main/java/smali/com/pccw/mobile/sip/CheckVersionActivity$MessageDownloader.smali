.class Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;
.super Landroid/os/AsyncTask;
.source "CheckVersionActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/CheckVersionActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MessageDownloader"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;


# direct methods
.method private constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V
    .locals 0

    .prologue
    .line 892
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity;Lcom/pccw/mobile/sip/CheckVersionActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;
    .param p2, "x1"    # Lcom/pccw/mobile/sip/CheckVersionActivity$1;

    .prologue
    .line 892
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 7
    .param p1, "s"    # [Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 895
    array-length v3, p1

    const/4 v4, 0x3

    if-ge v3, v4, :cond_0

    .line 896
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 905
    :goto_0
    return-object v3

    .line 897
    :cond_0
    aget-object v1, p1, v5

    .line 898
    .local v1, "url":Ljava/lang/String;
    aget-object v2, p1, v6

    .line 899
    .local v2, "version":Ljava/lang/String;
    const/4 v3, 0x2

    aget-object v0, p1, v3

    .line 901
    .local v0, "messageListType":Ljava/lang/String;
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    iget-object v3, v3, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    invoke-virtual {v3, v1, v2, v0}, Lcom/pccw/mobile/sip/ServerMessageController;->loadNewVersion(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 902
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0

    .line 905
    :cond_1
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 892
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->doInBackground([Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 4
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 910
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_1

    .line 911
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_2

    .line 912
    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 915
    .local v1, "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f020436

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 916
    const v2, 0x7f07006a

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 917
    const v2, 0x7f07006b

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 918
    iget-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    const v3, 0x7f07015b

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader$1;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader$1;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 926
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 927
    .local v0, "errorDialog":Landroid/app/AlertDialog;
    new-instance v2, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader$2;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader$2;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;)V

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 938
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 944
    .end local v0    # "errorDialog":Landroid/app/AlertDialog;
    .end local v1    # "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    :cond_1
    :goto_0
    return-void

    .line 941
    :cond_2
    iget-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$500(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 892
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
