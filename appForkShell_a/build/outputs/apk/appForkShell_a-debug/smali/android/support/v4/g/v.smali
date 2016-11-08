.class public final Landroid/support/v4/g/v;
.super Ljava/lang/Object;


# static fields
.field static final a:Landroid/support/v4/g/w;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    new-instance v0, Landroid/support/v4/g/y;

    invoke-direct {v0}, Landroid/support/v4/g/y;-><init>()V

    sput-object v0, Landroid/support/v4/g/v;->a:Landroid/support/v4/g/w;

    :goto_0
    return-void

    :cond_0
    new-instance v0, Landroid/support/v4/g/x;

    invoke-direct {v0}, Landroid/support/v4/g/x;-><init>()V

    sput-object v0, Landroid/support/v4/g/v;->a:Landroid/support/v4/g/w;

    goto :goto_0
.end method

.method public static a(Landroid/view/ViewGroup$MarginLayoutParams;)I
    .locals 1

    sget-object v0, Landroid/support/v4/g/v;->a:Landroid/support/v4/g/w;

    invoke-interface {v0, p0}, Landroid/support/v4/g/w;->a(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v0

    return v0
.end method

.method public static b(Landroid/view/ViewGroup$MarginLayoutParams;)I
    .locals 1

    sget-object v0, Landroid/support/v4/g/v;->a:Landroid/support/v4/g/w;

    invoke-interface {v0, p0}, Landroid/support/v4/g/w;->b(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v0

    return v0
.end method
