.class Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;
.super Landroid/widget/SimpleCursorTreeAdapter;
.source "SMSInviteActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/SMSInviteActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContactAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/SMSInviteActivity;Landroid/content/Context;Landroid/database/Cursor;I[Ljava/lang/String;[II[Ljava/lang/String;[I)V
    .locals 9
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;
    .param p4, "groupLayout"    # I
    .param p5, "groupFrom"    # [Ljava/lang/String;
    .param p6, "groupTo"    # [I
    .param p7, "childLayout"    # I
    .param p8, "childFrom"    # [Ljava/lang/String;
    .param p9, "childTo"    # [I

    .prologue
    .line 157
    iput-object p1, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move v3, p4

    move-object v4, p5

    move-object v5, p6

    move/from16 v6, p7

    move-object/from16 v7, p8

    move-object/from16 v8, p9

    .line 158
    invoke-direct/range {v0 .. v8}, Landroid/widget/SimpleCursorTreeAdapter;-><init>(Landroid/content/Context;Landroid/database/Cursor;I[Ljava/lang/String;[II[Ljava/lang/String;[I)V

    .line 159
    return-void
.end method


# virtual methods
.method protected bindChildView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;Z)V
    .locals 9
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;
    .param p4, "isLastChild"    # Z

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x2

    .line 170
    const v6, 0x7f0e0100

    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 171
    .local v3, "numberTxt":Landroid/widget/TextView;
    const/4 v6, 0x1

    invoke-interface {p3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 173
    .local v2, "number":Ljava/lang/String;
    invoke-static {v2}, Landroid/telephony/PhoneNumberUtils;->convertKeypadLettersToDigits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/telephony/PhoneNumberUtils;->extractNetworkPortion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 172
    invoke-static {v6}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 174
    .local v0, "formattedNumber":Ljava/lang/String;
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    const v6, 0x7f0e00fe

    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 177
    .local v5, "typeTxt":Landroid/widget/TextView;
    invoke-interface {p3, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 178
    .local v1, "label":I
    if-nez v1, :cond_0

    invoke-interface {p3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 179
    invoke-interface {p3, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 186
    :goto_0
    new-instance v6, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter$1;

    invoke-direct {v6, p0, v2}, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter$1;-><init>(Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;Ljava/lang/String;)V

    invoke-virtual {p1, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 201
    return-void

    .line 181
    :cond_0
    invoke-interface {p3, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    invoke-static {v6}, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->getTypeLabelResource(I)I

    move-result v4

    .line 183
    .local v4, "typeLabelResource":I
    iget-object v6, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-virtual {v6, v4}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method protected bindGroupView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;Z)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;
    .param p4, "isExpanded"    # Z

    .prologue
    .line 164
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/SimpleCursorTreeAdapter;->bindGroupView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;Z)V

    .line 165
    return-void
.end method

.method protected getChildrenCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 8
    .param p1, "groupCursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 206
    const/4 v6, 0x0

    .line 208
    .local v6, "childCursor":Landroid/database/Cursor;
    const-string/jumbo v0, "_id"

    .line 209
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    .line 208
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 210
    .local v7, "contactId":Ljava/lang/String;
    const/4 v0, 0x4

    new-array v2, v0, [Ljava/lang/String;

    const-string/jumbo v0, "_id"

    aput-object v0, v2, v5

    const-string/jumbo v0, "data1"

    aput-object v0, v2, v4

    const/4 v0, 0x2

    const-string/jumbo v1, "data2"

    aput-object v1, v2, v0

    const/4 v0, 0x3

    const-string/jumbo v1, "data3"

    aput-object v1, v2, v0

    .line 214
    .local v2, "projection":[Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const-string/jumbo v3, "contact_id=?"

    new-array v4, v4, [Ljava/lang/String;

    aput-object v7, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 218
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 219
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$500(Lcom/pccw/mobile/sip/SMSInviteActivity;)Ljava/util/ArrayList;

    move-result-object v1

    monitor-enter v1

    .line 220
    :try_start_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$500(Lcom/pccw/mobile/sip/SMSInviteActivity;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz v6, :cond_0

    .line 221
    iget-object v0, p0, Lcom/pccw/mobile/sip/SMSInviteActivity$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/SMSInviteActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/SMSInviteActivity;->access$500(Lcom/pccw/mobile/sip/SMSInviteActivity;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 222
    :cond_0
    monitor-exit v1

    .line 224
    return-object v6

    .line 222
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
