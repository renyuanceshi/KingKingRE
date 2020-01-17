.class Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;
.super Ljava/lang/Object;
.source "GL2JNIView.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$EGLConfigChooser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/mediastream/video/display/GL2JNIView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConfigChooser"
.end annotation


# static fields
.field private static EGL_OPENGL_ES2_BIT:I

.field private static s_configAttribs2:[I


# instance fields
.field protected mAlphaSize:I

.field protected mBlueSize:I

.field protected mDepthSize:I

.field protected mGreenSize:I

.field protected mRedSize:I

.field protected mStencilSize:I

.field private mValue:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x4

    .line 115
    sput v3, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->EGL_OPENGL_ES2_BIT:I

    .line 116
    const/16 v0, 0x9

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x3024

    aput v2, v0, v1

    const/4 v1, 0x1

    aput v3, v0, v1

    const/4 v1, 0x2

    const/16 v2, 0x3023

    aput v2, v0, v1

    const/4 v1, 0x3

    aput v3, v0, v1

    const/16 v1, 0x3022

    aput v1, v0, v3

    const/4 v1, 0x5

    aput v3, v0, v1

    const/4 v1, 0x6

    const/16 v2, 0x3040

    aput v2, v0, v1

    const/4 v1, 0x7

    sget v2, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->EGL_OPENGL_ES2_BIT:I

    aput v2, v0, v1

    const/16 v1, 0x8

    const/16 v2, 0x3038

    aput v2, v0, v1

    sput-object v0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->s_configAttribs2:[I

    return-void
.end method

.method public constructor <init>(IIIIII)V
    .locals 1
    .param p1, "r"    # I
    .param p2, "g"    # I
    .param p3, "b"    # I
    .param p4, "a"    # I
    .param p5, "depth"    # I
    .param p6, "stencil"    # I

    .prologue
    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 290
    const/4 v0, 0x1

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mValue:[I

    .line 103
    iput p1, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mRedSize:I

    .line 104
    iput p2, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mGreenSize:I

    .line 105
    iput p3, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mBlueSize:I

    .line 106
    iput p4, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mAlphaSize:I

    .line 107
    iput p5, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mDepthSize:I

    .line 108
    iput p6, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mStencilSize:I

    .line 109
    return-void
.end method

.method private findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 2
    .param p1, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p2, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;
    .param p3, "config"    # Ljavax/microedition/khronos/egl/EGLConfig;
    .param p4, "attribute"    # I
    .param p5, "defaultValue"    # I

    .prologue
    .line 182
    iget-object v0, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mValue:[I

    invoke-interface {p1, p2, p3, p4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 183
    iget-object v0, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mValue:[I

    const/4 v1, 0x0

    aget p5, v0, v1

    .line 185
    .end local p5    # "defaultValue":I
    :cond_0
    return p5
.end method

.method private printConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 12
    .param p1, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p2, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;
    .param p3, "config"    # Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    .line 200
    const/16 v6, 0x21

    new-array v1, v6, [I

    fill-array-data v1, :array_0

    .line 235
    .local v1, "attributes":[I
    const/16 v6, 0x21

    new-array v4, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string/jumbo v7, "EGL_BUFFER_SIZE"

    aput-object v7, v4, v6

    const/4 v6, 0x1

    const-string/jumbo v7, "EGL_ALPHA_SIZE"

    aput-object v7, v4, v6

    const/4 v6, 0x2

    const-string/jumbo v7, "EGL_BLUE_SIZE"

    aput-object v7, v4, v6

    const/4 v6, 0x3

    const-string/jumbo v7, "EGL_GREEN_SIZE"

    aput-object v7, v4, v6

    const/4 v6, 0x4

    const-string/jumbo v7, "EGL_RED_SIZE"

    aput-object v7, v4, v6

    const/4 v6, 0x5

    const-string/jumbo v7, "EGL_DEPTH_SIZE"

    aput-object v7, v4, v6

    const/4 v6, 0x6

    const-string/jumbo v7, "EGL_STENCIL_SIZE"

    aput-object v7, v4, v6

    const/4 v6, 0x7

    const-string/jumbo v7, "EGL_CONFIG_CAVEAT"

    aput-object v7, v4, v6

    const/16 v6, 0x8

    const-string/jumbo v7, "EGL_CONFIG_ID"

    aput-object v7, v4, v6

    const/16 v6, 0x9

    const-string/jumbo v7, "EGL_LEVEL"

    aput-object v7, v4, v6

    const/16 v6, 0xa

    const-string/jumbo v7, "EGL_MAX_PBUFFER_HEIGHT"

    aput-object v7, v4, v6

    const/16 v6, 0xb

    const-string/jumbo v7, "EGL_MAX_PBUFFER_PIXELS"

    aput-object v7, v4, v6

    const/16 v6, 0xc

    const-string/jumbo v7, "EGL_MAX_PBUFFER_WIDTH"

    aput-object v7, v4, v6

    const/16 v6, 0xd

    const-string/jumbo v7, "EGL_NATIVE_RENDERABLE"

    aput-object v7, v4, v6

    const/16 v6, 0xe

    const-string/jumbo v7, "EGL_NATIVE_VISUAL_ID"

    aput-object v7, v4, v6

    const/16 v6, 0xf

    const-string/jumbo v7, "EGL_NATIVE_VISUAL_TYPE"

    aput-object v7, v4, v6

    const/16 v6, 0x10

    const-string/jumbo v7, "EGL_PRESERVED_RESOURCES"

    aput-object v7, v4, v6

    const/16 v6, 0x11

    const-string/jumbo v7, "EGL_SAMPLES"

    aput-object v7, v4, v6

    const/16 v6, 0x12

    const-string/jumbo v7, "EGL_SAMPLE_BUFFERS"

    aput-object v7, v4, v6

    const/16 v6, 0x13

    const-string/jumbo v7, "EGL_SURFACE_TYPE"

    aput-object v7, v4, v6

    const/16 v6, 0x14

    const-string/jumbo v7, "EGL_TRANSPARENT_TYPE"

    aput-object v7, v4, v6

    const/16 v6, 0x15

    const-string/jumbo v7, "EGL_TRANSPARENT_RED_VALUE"

    aput-object v7, v4, v6

    const/16 v6, 0x16

    const-string/jumbo v7, "EGL_TRANSPARENT_GREEN_VALUE"

    aput-object v7, v4, v6

    const/16 v6, 0x17

    const-string/jumbo v7, "EGL_TRANSPARENT_BLUE_VALUE"

    aput-object v7, v4, v6

    const/16 v6, 0x18

    const-string/jumbo v7, "EGL_BIND_TO_TEXTURE_RGB"

    aput-object v7, v4, v6

    const/16 v6, 0x19

    const-string/jumbo v7, "EGL_BIND_TO_TEXTURE_RGBA"

    aput-object v7, v4, v6

    const/16 v6, 0x1a

    const-string/jumbo v7, "EGL_MIN_SWAP_INTERVAL"

    aput-object v7, v4, v6

    const/16 v6, 0x1b

    const-string/jumbo v7, "EGL_MAX_SWAP_INTERVAL"

    aput-object v7, v4, v6

    const/16 v6, 0x1c

    const-string/jumbo v7, "EGL_LUMINANCE_SIZE"

    aput-object v7, v4, v6

    const/16 v6, 0x1d

    const-string/jumbo v7, "EGL_ALPHA_MASK_SIZE"

    aput-object v7, v4, v6

    const/16 v6, 0x1e

    const-string/jumbo v7, "EGL_COLOR_BUFFER_TYPE"

    aput-object v7, v4, v6

    const/16 v6, 0x1f

    const-string/jumbo v7, "EGL_RENDERABLE_TYPE"

    aput-object v7, v4, v6

    const/16 v6, 0x20

    const-string/jumbo v7, "EGL_CONFORMANT"

    aput-object v7, v4, v6

    .line 270
    .local v4, "names":[Ljava/lang/String;
    const/4 v6, 0x1

    new-array v5, v6, [I

    .line 271
    .local v5, "value":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v6, v1

    if-ge v2, v6, :cond_2

    .line 272
    aget v0, v1, v2

    .line 273
    .local v0, "attribute":I
    aget-object v3, v4, v2

    .line 274
    .local v3, "name":Ljava/lang/String;
    invoke-interface {p1, p2, p3, v0, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 275
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string/jumbo v8, "  %s: %d\n"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v3, v9, v10

    const/4 v10, 0x1

    const/4 v11, 0x0

    aget v11, v5, v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v6}, Lorg/linphone/mediastream/Log;->w([Ljava/lang/Object;)V

    .line 271
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 278
    :cond_1
    :goto_1
    invoke-interface {p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v6

    const/16 v7, 0x3000

    if-eq v6, v7, :cond_0

    goto :goto_1

    .line 281
    .end local v0    # "attribute":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_2
    return-void

    .line 200
    :array_0
    .array-data 4
        0x3020
        0x3021
        0x3022
        0x3023
        0x3024
        0x3025
        0x3026
        0x3027
        0x3028
        0x3029
        0x302a
        0x302b
        0x302c
        0x302d
        0x302e
        0x302f
        0x3030
        0x3031
        0x3032
        0x3033
        0x3034
        0x3037
        0x3036
        0x3035
        0x3039
        0x303a
        0x303b
        0x303c
        0x303d
        0x303e
        0x303f
        0x3040
        0x3042
    .end array-data
.end method

.method private printConfigs(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 8
    .param p1, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p2, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;
    .param p3, "configs"    # [Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 190
    array-length v1, p3

    .line 191
    .local v1, "numConfigs":I
    new-array v2, v7, [Ljava/lang/Object;

    const-string/jumbo v3, "%d configurations"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v2}, Lorg/linphone/mediastream/Log;->w([Ljava/lang/Object;)V

    .line 192
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 193
    new-array v2, v7, [Ljava/lang/Object;

    const-string/jumbo v3, "Configuration %d:\n"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v2}, Lorg/linphone/mediastream/Log;->w([Ljava/lang/Object;)V

    .line 194
    aget-object v2, p3, v0

    invoke-direct {p0, p1, p2, v2}, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->printConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 192
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 196
    :cond_0
    return-void
.end method


# virtual methods
.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 6
    .param p1, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p2, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;

    .prologue
    const/4 v4, 0x0

    .line 129
    const/4 v0, 0x1

    new-array v5, v0, [I

    .line 130
    .local v5, "num_config":[I
    sget-object v2, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->s_configAttribs2:[I

    const/4 v3, 0x0

    move-object v0, p1

    move-object v1, p2

    invoke-interface/range {v0 .. v5}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 132
    aget v4, v5, v4

    .line 134
    .local v4, "numConfigs":I
    if-gtz v4, :cond_0

    .line 135
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "No configs match configSpec"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 140
    :cond_0
    new-array v3, v4, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 141
    .local v3, "configs":[Ljavax/microedition/khronos/egl/EGLConfig;
    sget-object v2, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->s_configAttribs2:[I

    move-object v0, p1

    move-object v1, p2

    invoke-interface/range {v0 .. v5}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 148
    invoke-virtual {p0, p1, p2, v3}, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v0

    return-object v0
.end method

.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 15
    .param p1, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p2, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;
    .param p3, "configs"    # [Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    .line 153
    move-object/from16 v0, p3

    array-length v14, v0

    const/4 v1, 0x0

    move v13, v1

    :goto_0
    if-ge v13, v14, :cond_2

    aget-object v4, p3, v13

    .line 154
    .local v4, "config":Ljavax/microedition/khronos/egl/EGLConfig;
    const/16 v5, 0x3025

    const/4 v6, 0x0

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct/range {v1 .. v6}, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v9

    .line 156
    .local v9, "d":I
    const/16 v5, 0x3026

    const/4 v6, 0x0

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct/range {v1 .. v6}, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v12

    .line 160
    .local v12, "s":I
    iget v1, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mDepthSize:I

    if-lt v9, v1, :cond_0

    iget v1, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mStencilSize:I

    if-ge v12, v1, :cond_1

    .line 153
    :cond_0
    add-int/lit8 v1, v13, 0x1

    move v13, v1

    goto :goto_0

    .line 164
    :cond_1
    const/16 v5, 0x3024

    const/4 v6, 0x0

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct/range {v1 .. v6}, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v11

    .line 166
    .local v11, "r":I
    const/16 v5, 0x3023

    const/4 v6, 0x0

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct/range {v1 .. v6}, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v10

    .line 168
    .local v10, "g":I
    const/16 v5, 0x3022

    const/4 v6, 0x0

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct/range {v1 .. v6}, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v8

    .line 170
    .local v8, "b":I
    const/16 v5, 0x3021

    const/4 v6, 0x0

    move-object v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct/range {v1 .. v6}, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v7

    .line 173
    .local v7, "a":I
    iget v1, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mRedSize:I

    if-ne v11, v1, :cond_0

    iget v1, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mGreenSize:I

    if-ne v10, v1, :cond_0

    iget v1, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mBlueSize:I

    if-ne v8, v1, :cond_0

    iget v1, p0, Lorg/linphone/mediastream/video/display/GL2JNIView$ConfigChooser;->mAlphaSize:I

    if-ne v7, v1, :cond_0

    .line 176
    .end local v4    # "config":Ljavax/microedition/khronos/egl/EGLConfig;
    .end local v7    # "a":I
    .end local v8    # "b":I
    .end local v9    # "d":I
    .end local v10    # "g":I
    .end local v11    # "r":I
    .end local v12    # "s":I
    :goto_1
    return-object v4

    :cond_2
    const/4 v4, 0x0

    goto :goto_1
.end method
