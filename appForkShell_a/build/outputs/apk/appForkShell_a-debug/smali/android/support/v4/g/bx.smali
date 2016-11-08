.class public final Landroid/support/v4/g/bx;
.super Ljava/lang/Object;


# static fields
.field static final a:Landroid/support/v4/g/cc;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    new-instance v0, Landroid/support/v4/g/cb;

    invoke-direct {v0}, Landroid/support/v4/g/cb;-><init>()V

    sput-object v0, Landroid/support/v4/g/bx;->a:Landroid/support/v4/g/cc;

    :goto_0
    return-void

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_1

    new-instance v0, Landroid/support/v4/g/ca;

    invoke-direct {v0}, Landroid/support/v4/g/ca;-><init>()V

    sput-object v0, Landroid/support/v4/g/bx;->a:Landroid/support/v4/g/cc;

    goto :goto_0

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x8

    if-lt v0, v1, :cond_2

    new-instance v0, Landroid/support/v4/g/bz;

    invoke-direct {v0}, Landroid/support/v4/g/bz;-><init>()V

    sput-object v0, Landroid/support/v4/g/bx;->a:Landroid/support/v4/g/cc;

    goto :goto_0

    :cond_2
    new-instance v0, Landroid/support/v4/g/by;

    invoke-direct {v0}, Landroid/support/v4/g/by;-><init>()V

    sput-object v0, Landroid/support/v4/g/bx;->a:Landroid/support/v4/g/cc;

    goto :goto_0
.end method

.method public static a(Landroid/view/ViewConfiguration;)Z
    .locals 1

    sget-object v0, Landroid/support/v4/g/bx;->a:Landroid/support/v4/g/cc;

    invoke-interface {v0, p0}, Landroid/support/v4/g/cc;->a(Landroid/view/ViewConfiguration;)Z

    move-result v0

    return v0
.end method
