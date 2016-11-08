.class public final Landroid/support/v4/g/bb;
.super Ljava/lang/Object;


# static fields
.field static final a:Landroid/support/v4/g/bo;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    new-instance v0, Landroid/support/v4/g/bn;

    invoke-direct {v0}, Landroid/support/v4/g/bn;-><init>()V

    sput-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    :goto_0
    return-void

    :cond_0
    const/16 v1, 0x15

    if-lt v0, v1, :cond_1

    new-instance v0, Landroid/support/v4/g/bm;

    invoke-direct {v0}, Landroid/support/v4/g/bm;-><init>()V

    sput-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    goto :goto_0

    :cond_1
    const/16 v1, 0x13

    if-lt v0, v1, :cond_2

    new-instance v0, Landroid/support/v4/g/bl;

    invoke-direct {v0}, Landroid/support/v4/g/bl;-><init>()V

    sput-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    goto :goto_0

    :cond_2
    const/16 v1, 0x11

    if-lt v0, v1, :cond_3

    new-instance v0, Landroid/support/v4/g/bj;

    invoke-direct {v0}, Landroid/support/v4/g/bj;-><init>()V

    sput-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    goto :goto_0

    :cond_3
    const/16 v1, 0x10

    if-lt v0, v1, :cond_4

    new-instance v0, Landroid/support/v4/g/bi;

    invoke-direct {v0}, Landroid/support/v4/g/bi;-><init>()V

    sput-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    goto :goto_0

    :cond_4
    const/16 v1, 0xf

    if-lt v0, v1, :cond_5

    new-instance v0, Landroid/support/v4/g/bg;

    invoke-direct {v0}, Landroid/support/v4/g/bg;-><init>()V

    sput-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    goto :goto_0

    :cond_5
    const/16 v1, 0xe

    if-lt v0, v1, :cond_6

    new-instance v0, Landroid/support/v4/g/bh;

    invoke-direct {v0}, Landroid/support/v4/g/bh;-><init>()V

    sput-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    goto :goto_0

    :cond_6
    const/16 v1, 0xb

    if-lt v0, v1, :cond_7

    new-instance v0, Landroid/support/v4/g/bf;

    invoke-direct {v0}, Landroid/support/v4/g/bf;-><init>()V

    sput-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    goto :goto_0

    :cond_7
    const/16 v1, 0x9

    if-lt v0, v1, :cond_8

    new-instance v0, Landroid/support/v4/g/be;

    invoke-direct {v0}, Landroid/support/v4/g/be;-><init>()V

    sput-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    goto :goto_0

    :cond_8
    const/4 v1, 0x7

    if-lt v0, v1, :cond_9

    new-instance v0, Landroid/support/v4/g/bd;

    invoke-direct {v0}, Landroid/support/v4/g/bd;-><init>()V

    sput-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    goto :goto_0

    :cond_9
    new-instance v0, Landroid/support/v4/g/bc;

    invoke-direct {v0}, Landroid/support/v4/g/bc;-><init>()V

    sput-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    goto :goto_0
.end method

.method public static a(III)I
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0, p1, p2}, Landroid/support/v4/g/bo;->a(III)I

    move-result v0

    return v0
.end method

.method public static a(Landroid/view/View;)I
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->a(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public static a(Landroid/view/View;F)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/g/bo;->a(Landroid/view/View;F)V

    return-void
.end method

.method public static a(Landroid/view/View;ILandroid/graphics/Paint;)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0, p1, p2}, Landroid/support/v4/g/bo;->a(Landroid/view/View;ILandroid/graphics/Paint;)V

    return-void
.end method

.method public static a(Landroid/view/View;Landroid/content/res/ColorStateList;)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/g/bo;->a(Landroid/view/View;Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public static a(Landroid/view/View;Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/g/bo;->a(Landroid/view/View;Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public static a(Landroid/view/View;Landroid/support/v4/g/a;)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/g/bo;->a(Landroid/view/View;Landroid/support/v4/g/a;)V

    return-void
.end method

.method public static a(Landroid/view/View;Ljava/lang/Runnable;)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/g/bo;->a(Landroid/view/View;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static a(Landroid/view/View;Ljava/lang/Runnable;J)V
    .locals 2

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0, p1, p2, p3}, Landroid/support/v4/g/bo;->a(Landroid/view/View;Ljava/lang/Runnable;J)V

    return-void
.end method

.method public static a(Landroid/view/View;Z)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/g/bo;->a(Landroid/view/View;Z)V

    return-void
.end method

.method public static b(Landroid/view/View;)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->b(Landroid/view/View;)V

    return-void
.end method

.method public static c(Landroid/view/View;)I
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->c(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public static d(Landroid/view/View;)I
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->d(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public static e(Landroid/view/View;)I
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->e(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public static f(Landroid/view/View;)F
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->f(Landroid/view/View;)F

    move-result v0

    return v0
.end method

.method public static g(Landroid/view/View;)I
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->g(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public static h(Landroid/view/View;)Landroid/support/v4/g/cl;
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->h(Landroid/view/View;)Landroid/support/v4/g/cl;

    move-result-object v0

    return-object v0
.end method

.method public static i(Landroid/view/View;)I
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->i(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method public static j(Landroid/view/View;)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->j(Landroid/view/View;)V

    return-void
.end method

.method public static k(Landroid/view/View;)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->k(Landroid/view/View;)V

    return-void
.end method

.method public static l(Landroid/view/View;)Landroid/content/res/ColorStateList;
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->l(Landroid/view/View;)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public static m(Landroid/view/View;)Landroid/graphics/PorterDuff$Mode;
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->m(Landroid/view/View;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    return-object v0
.end method

.method public static n(Landroid/view/View;)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->n(Landroid/view/View;)V

    return-void
.end method

.method public static o(Landroid/view/View;)Z
    .locals 1

    sget-object v0, Landroid/support/v4/g/bb;->a:Landroid/support/v4/g/bo;

    invoke-interface {v0, p0}, Landroid/support/v4/g/bo;->o(Landroid/view/View;)Z

    move-result v0

    return v0
.end method
