.class Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter$1;
.super Ljava/lang/Object;
.source "AddCallContactDetailsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;->bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;

.field final synthetic val$phoneNum:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;

    .prologue
    .line 305
    iput-object p1, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter$1;->this$1:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;

    iput-object p2, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter$1;->val$phoneNum:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 309
    const-string/jumbo v2, "tel"

    iget-object v3, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter$1;->val$phoneNum:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 310
    .local v1, "numberUri":Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter$1;->this$1:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;

    iget-object v2, v2, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;

    const-class v3, Lcom/pccw/mobile/sip/AddCallActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 311
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "com.pccw.mobile.sip.service.intent.dial"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 312
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 314
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter$1;->this$1:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;

    iget-object v2, v2, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity$PhoneListCursorAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;

    invoke-virtual {v2, v0}, Lcom/pccw/mobile/sip/AddCallContactDetailsActivity;->startActivity(Landroid/content/Intent;)V

    .line 315
    return-void
.end method
