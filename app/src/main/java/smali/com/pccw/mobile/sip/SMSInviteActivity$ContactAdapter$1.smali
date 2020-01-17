.class Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter$1;
.super Ljava/lang/Object;
.source "SMSInviteActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;->bindChildView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

.field final synthetic val$number:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    .prologue
    .line 186
    iput-object p1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter$1;->this$1:Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    iput-object p2, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter$1;->val$number:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 191
    iget-object v1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter$1;->this$1:Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    iget-object v2, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter$1;->val$number:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$000(Lcom/pccw/mobile/sip/SMSInviteActivity;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 192
    iget-object v1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter$1;->this$1:Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    iget-object v2, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter$1;->val$number:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$100(Lcom/pccw/mobile/sip/SMSInviteActivity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 193
    .local v0, "editedNumber":Ljava/lang/String;
    iget-object v1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter$1;->this$1:Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-static {v1}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$200(Lcom/pccw/mobile/sip/SMSInviteActivity;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 194
    iget-object v1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter$1;->this$1:Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-static {v1, v0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$300(Lcom/pccw/mobile/sip/SMSInviteActivity;Ljava/lang/String;)V

    .line 199
    .end local v0    # "editedNumber":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 196
    :cond_1
    iget-object v1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter$1;->this$1:Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-static {v1}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$400(Lcom/pccw/mobile/sip/SMSInviteActivity;)V

    goto :goto_0
.end method
