.class public Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;
.super Landroid/support/v4/app/Fragment;
.source "UserGuidePager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/UserGuidePager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DummySectionFragment"
.end annotation


# static fields
.field public static final ARG_SECTION_NUMBER:Ljava/lang/String; = "section_number"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 167
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getBitmapOptions()Landroid/graphics/BitmapFactory$Options;
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 222
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 223
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 224
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inInputShareable:Z

    .line 225
    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    .line 226
    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 227
    iput v2, v0, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    .line 228
    return-object v0
.end method

.method public getLocalBitmap(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .locals 2
    .param p1, "con"    # Landroid/content/Context;
    .param p2, "resourceId"    # I

    .prologue
    .line 215
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    .line 218
    .local v0, "inputStream":Ljava/io/InputStream;
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 174
    const v5, 0x7f04007e

    const/4 v6, 0x0

    invoke-virtual {p1, v5, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 175
    .local v2, "rootView":Landroid/view/View;
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 176
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v5, "section_number"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 178
    .local v3, "section":I
    const v5, 0x7f0e01ed

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    new-instance v6, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment$1;

    invoke-direct {v6, p0}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment$1;-><init>(Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 187
    const v5, 0x7f0e01ec

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 188
    .local v4, "userGuideImage":Landroid/widget/ImageView;
    const/4 v1, 0x0

    .line 189
    .local v1, "bm":Landroid/graphics/Bitmap;
    packed-switch v3, :pswitch_data_0

    .line 210
    :goto_0
    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 211
    return-object v2

    .line 192
    :pswitch_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f020523

    invoke-virtual {p0, v5, v6}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getLocalBitmap(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 193
    goto :goto_0

    .line 196
    :pswitch_1
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f020524

    invoke-virtual {p0, v5, v6}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getLocalBitmap(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 197
    goto :goto_0

    .line 200
    :pswitch_2
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f020525

    invoke-virtual {p0, v5, v6}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getLocalBitmap(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 201
    goto :goto_0

    .line 204
    :pswitch_3
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f020526

    invoke-virtual {p0, v5, v6}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getLocalBitmap(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 205
    goto :goto_0

    .line 208
    :pswitch_4
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f020527

    invoke-virtual {p0, v5, v6}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getLocalBitmap(Landroid/content/Context;I)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    .line 189
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
