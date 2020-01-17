.class public Lorg/linphone/CallScreen;
.super Lcom/pccw/mobile/sip/BaseFragmentActivity;
.source "CallScreen.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# static fields
.field public static final ANSWER_MENU_ITEM:I = 0x9

.field public static final BLUETOOTH_MENU_ITEM:I = 0xa

.field public static final FIRST_MENU_ID:I = 0x1

.field public static final HANG_UP_MENU_ITEM:I = 0x2

.field public static final HOLD_MENU_ITEM:I = 0x3

.field public static final MUTE_MENU_ITEM:I = 0x4

.field public static final SPEAKER_MENU_ITEM:I = 0x7

.field public static final TRANSFER_MENU_ITEM:I = 0x8

.field public static final VIDEO_MENU_ITEM:I = 0x6

.field private static transferText:Landroid/widget/EditText;


# instance fields
.field enabled:Z

.field enabletime:J

.field intent:Landroid/content/Intent;

.field mContext:Landroid/content/Context;

.field mHandler:Landroid/os/Handler;

.field mKeyguardLock:Landroid/app/KeyguardManager$KeyguardLock;

.field mKeyguardManager:Landroid/app/KeyguardManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseFragmentActivity;-><init>()V

    .line 212
    iput-object p0, p0, Lorg/linphone/CallScreen;->mContext:Landroid/content/Context;

    .line 285
    new-instance v0, Lorg/linphone/CallScreen$1;

    invoke-direct {v0, p0}, Lorg/linphone/CallScreen$1;-><init>(Lorg/linphone/CallScreen;)V

    iput-object v0, p0, Lorg/linphone/CallScreen;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method private transfer()V
    .locals 0

    .prologue
    .line 127
    return-void
.end method


# virtual methods
.method disableKeyguard()V
    .locals 2

    .prologue
    .line 186
    iget-object v0, p0, Lorg/linphone/CallScreen;->mKeyguardManager:Landroid/app/KeyguardManager;

    if-nez v0, :cond_0

    .line 187
    const-string/jumbo v0, "keyguard"

    invoke-virtual {p0, v0}, Lorg/linphone/CallScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    iput-object v0, p0, Lorg/linphone/CallScreen;->mKeyguardManager:Landroid/app/KeyguardManager;

    .line 188
    iget-object v0, p0, Lorg/linphone/CallScreen;->mKeyguardManager:Landroid/app/KeyguardManager;

    const-string/jumbo v1, "RoamSave"

    invoke-virtual {v0, v1}, Landroid/app/KeyguardManager;->newKeyguardLock(Ljava/lang/String;)Landroid/app/KeyguardManager$KeyguardLock;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/CallScreen;->mKeyguardLock:Landroid/app/KeyguardManager$KeyguardLock;

    .line 189
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/linphone/CallScreen;->enabled:Z

    .line 191
    :cond_0
    iget-boolean v0, p0, Lorg/linphone/CallScreen;->enabled:Z

    if-eqz v0, :cond_1

    .line 192
    iget-object v0, p0, Lorg/linphone/CallScreen;->mKeyguardLock:Landroid/app/KeyguardManager$KeyguardLock;

    invoke-virtual {v0}, Landroid/app/KeyguardManager$KeyguardLock;->disableKeyguard()V

    .line 193
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/CallScreen;->enabled:Z

    .line 194
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/linphone/CallScreen;->enabletime:J

    .line 196
    :cond_1
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 113
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 217
    invoke-virtual {p0}, Lorg/linphone/CallScreen;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x400000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 218
    invoke-virtual {p0}, Lorg/linphone/CallScreen;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x80000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 219
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseFragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 220
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 78
    const/4 v0, 0x0

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 131
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseFragmentActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    .line 132
    .local v1, "result":Z
    const/4 v0, 0x0

    .line 177
    .local v0, "intent":Landroid/content/Intent;
    return v1
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 297
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseFragmentActivity;->onPause()V

    .line 299
    const/16 v0, 0xd

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkStrictlyBelow(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 300
    invoke-virtual {p0}, Lorg/linphone/CallScreen;->reenableKeyguard()V

    .line 301
    :cond_0
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 83
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseFragmentActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    .line 107
    .local v0, "result":Z
    return v0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 224
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseFragmentActivity;->onResume()V

    .line 225
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x5

    if-lt v0, v1, :cond_0

    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x7

    if-gt v0, v1, :cond_0

    .line 226
    invoke-virtual {p0}, Lorg/linphone/CallScreen;->disableKeyguard()V

    .line 283
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 305
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseFragmentActivity;->onStart()V

    .line 307
    const/16 v0, 0xd

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkStrictlyBelow(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 308
    invoke-virtual {p0}, Lorg/linphone/CallScreen;->disableKeyguard()V

    .line 309
    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 313
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseFragmentActivity;->onStop()V

    .line 315
    const/16 v0, 0xd

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkStrictlyBelow(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 316
    invoke-virtual {p0}, Lorg/linphone/CallScreen;->reenableKeyguard()V

    .line 317
    :cond_0
    return-void
.end method

.method reenableKeyguard()V
    .locals 2

    .prologue
    .line 199
    iget-boolean v0, p0, Lorg/linphone/CallScreen;->enabled:Z

    if-nez v0, :cond_1

    .line 201
    :try_start_0
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x5

    if-ge v0, v1, :cond_0

    .line 202
    const-wide/16 v0, 0x3e8

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 205
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/linphone/CallScreen;->mKeyguardLock:Landroid/app/KeyguardManager$KeyguardLock;

    invoke-virtual {v0}, Landroid/app/KeyguardManager$KeyguardLock;->reenableKeyguard()V

    .line 206
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/linphone/CallScreen;->enabled:Z

    .line 208
    :cond_1
    return-void

    .line 203
    :catch_0
    move-exception v0

    goto :goto_0
.end method
