.class public Lcom/pccw/mobile/sip/util/Contact;
.super Ljava/lang/Object;
.source "Contact.java"


# instance fields
.field public displayName:Ljava/lang/String;

.field public label:Ljava/lang/String;

.field public photo:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V
    .locals 0
    .param p1, "displayName"    # Ljava/lang/String;
    .param p2, "photo"    # Landroid/graphics/drawable/Drawable;
    .param p3, "label"    # Ljava/lang/String;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/pccw/mobile/sip/util/Contact;->displayName:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lcom/pccw/mobile/sip/util/Contact;->photo:Landroid/graphics/drawable/Drawable;

    .line 14
    iput-object p3, p0, Lcom/pccw/mobile/sip/util/Contact;->label:Ljava/lang/String;

    .line 15
    return-void
.end method
