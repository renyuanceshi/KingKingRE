.class public Lcom/pccw/mobile/fragment/AutoLoginListFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "AutoLoginListFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AutoLogin"

.field private static instance:Lcom/pccw/mobile/fragment/AutoLoginListFragment;


# instance fields
.field private addSSIDBtn:Landroid/widget/ImageButton;

.field private addSSIDLayout:Landroid/widget/RelativeLayout;

.field private containView:Landroid/view/View;

.field private currentSSIDText:Landroid/widget/TextView;

.field forbidATLoginSSIDList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final ids:[I

.field private list:Landroid/widget/ListView;

.field private mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field final mapKey:[Ljava/lang/String;

.field private simpleAdapter:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 40
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 47
    new-array v0, v3, [Ljava/lang/String;

    const-string/jumbo v1, "PCCW1x"

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->forbidATLoginSSIDList:Ljava/util/List;

    .line 56
    new-instance v0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$1;

    invoke-direct {v0, p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment$1;-><init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment;)V

    iput-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 79
    new-array v0, v3, [Ljava/lang/String;

    const-string/jumbo v1, "ssid"

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->mapKey:[Ljava/lang/String;

    .line 82
    new-array v0, v3, [I

    const v1, 0x7f0e00ca

    aput v1, v0, v2

    iput-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->ids:[I

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/fragment/AutoLoginListFragment;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/fragment/AutoLoginListFragment;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->receivedBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$100(Lcom/pccw/mobile/fragment/AutoLoginListFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->currentSSIDText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/mobile/fragment/AutoLoginListFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->updateList()V

    return-void
.end method

.method private getData(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 5
    .param p1, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 219
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 220
    .local v0, "arrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v3, 0xa

    if-ge v1, v3, :cond_1

    .line 221
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 222
    .local v2, "tempHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p1, v1}, Lcom/pccw/pref/SSIDList;->getSSID(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 223
    const-string/jumbo v3, "ssid"

    invoke-static {p1, v1}, Lcom/pccw/pref/SSIDList;->getSSID(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 220
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 231
    .end local v2    # "tempHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    return-object v0
.end method

.method public static getInstance()Lcom/pccw/mobile/fragment/AutoLoginListFragment;
    .locals 1

    .prologue
    .line 95
    sget-object v0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->instance:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    if-eqz v0, :cond_0

    .line 96
    sget-object v0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->instance:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    .line 98
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isForbidAutoLoginSSID(Ljava/lang/String;)Z
    .locals 1
    .param p1, "ssid"    # Ljava/lang/String;

    .prologue
    .line 306
    iget-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->forbidATLoginSSIDList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static newInstance(I)Lcom/pccw/mobile/fragment/AutoLoginListFragment;
    .locals 3
    .param p0, "title"    # I

    .prologue
    .line 87
    new-instance v1, Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-direct {v1}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;-><init>()V

    .line 88
    .local v1, "frag":Lcom/pccw/mobile/fragment/AutoLoginListFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 89
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "title"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 90
    invoke-virtual {v1, v0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 91
    return-object v1
.end method

.method private receivedBroadcast(Landroid/content/Intent;)V
    .locals 4
    .param p1, "i"    # Landroid/content/Intent;

    .prologue
    .line 64
    const-string/jumbo v2, "networkInfo"

    .line 65
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/NetworkInfo;

    .line 67
    .local v1, "lNetworkInfo":Landroid/net/NetworkInfo;
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 68
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v2

    sget-object v3, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    invoke-virtual {v2, v3}, Landroid/net/NetworkInfo$State;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 69
    invoke-virtual {p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/pccw/mobile/util/SSIDUtil;->getCurrentSSID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "currentSSID":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->updateCurrentSSIDField(Ljava/lang/String;)V

    .line 77
    .end local v0    # "currentSSID":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 73
    :cond_1
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v2

    sget-object v3, Landroid/net/NetworkInfo$State;->DISCONNECTED:Landroid/net/NetworkInfo$State;

    invoke-virtual {v2, v3}, Landroid/net/NetworkInfo$State;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 74
    const-string/jumbo v2, ""

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->updateCurrentSSIDField(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private updateList()V
    .locals 7

    .prologue
    .line 235
    new-instance v0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    invoke-virtual {p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getData(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v3

    const v4, 0x7f04002c

    iget-object v5, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->mapKey:[Ljava/lang/String;

    iget-object v6, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->ids:[I

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;-><init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment;Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->simpleAdapter:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    .line 237
    iget-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->list:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->simpleAdapter:Lcom/pccw/mobile/fragment/AutoLoginListFragment$mySimpleAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 238
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 103
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 105
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 142
    sput-object p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->instance:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    .line 144
    invoke-virtual {p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    .line 145
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v1, 0x7f04002b

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->containView:Landroid/view/View;

    .line 146
    iget-object v1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->containView:Landroid/view/View;

    const v2, 0x7f0e00c9

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->list:Landroid/widget/ListView;

    .line 147
    iget-object v1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->containView:Landroid/view/View;

    const v2, 0x7f0e00c6

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->currentSSIDText:Landroid/widget/TextView;

    .line 148
    iget-object v1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->containView:Landroid/view/View;

    const v2, 0x7f0e00c7

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->addSSIDBtn:Landroid/widget/ImageButton;

    .line 149
    iget-object v1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->containView:Landroid/view/View;

    const v2, 0x7f0e00c4

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->addSSIDLayout:Landroid/widget/RelativeLayout;

    .line 151
    const-string/jumbo v1, ""

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->updateAddSSIDLayout(Ljava/lang/String;)V

    .line 154
    invoke-direct {p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->updateList()V

    .line 157
    iget-object v1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->addSSIDBtn:Landroid/widget/ImageButton;

    new-instance v2, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;-><init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 210
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f07006f

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f07007f

    new-instance v3, Lcom/pccw/mobile/fragment/AutoLoginListFragment$3;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment$3;-><init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment;)V

    .line 211
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->containView:Landroid/view/View;

    .line 215
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 210
    return-object v1
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 121
    invoke-virtual {p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 122
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onPause()V

    .line 123
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 112
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 113
    .local v0, "iff":Landroid/content/IntentFilter;
    const-string/jumbo v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 114
    invoke-virtual {p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/app/FragmentActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 116
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onResume()V

    .line 117
    return-void
.end method

.method public updateAddSSIDLayout(Ljava/lang/String;)V
    .locals 2
    .param p1, "ssid"    # Ljava/lang/String;

    .prologue
    .line 132
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    .line 133
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->isForbidAutoLoginSSID(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->addSSIDLayout:Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 138
    :goto_0
    return-void

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->addSSIDLayout:Landroid/widget/RelativeLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method public updateCurrentSSIDField(Ljava/lang/String;)V
    .locals 1
    .param p1, "ssid"    # Ljava/lang/String;

    .prologue
    .line 126
    iget-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->currentSSIDText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->updateAddSSIDLayout(Ljava/lang/String;)V

    .line 128
    return-void
.end method
