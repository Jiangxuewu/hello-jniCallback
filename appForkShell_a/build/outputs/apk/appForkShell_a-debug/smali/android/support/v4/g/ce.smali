.class public final Landroid/support/v4/g/ce;
.super Ljava/lang/Object;


# static fields
.field static final a:Landroid/support/v4/g/cg;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    new-instance v0, Landroid/support/v4/g/ci;

    invoke-direct {v0}, Landroid/support/v4/g/ci;-><init>()V

    sput-object v0, Landroid/support/v4/g/ce;->a:Landroid/support/v4/g/cg;

    :goto_0
    return-void

    :cond_0
    const/16 v1, 0x13

    if-lt v0, v1, :cond_1

    new-instance v0, Landroid/support/v4/g/ch;

    invoke-direct {v0}, Landroid/support/v4/g/ch;-><init>()V

    sput-object v0, Landroid/support/v4/g/ce;->a:Landroid/support/v4/g/cg;

    goto :goto_0

    :cond_1
    const/16 v1, 0xe

    if-lt v0, v1, :cond_2

    new-instance v0, Landroid/support/v4/g/cf;

    invoke-direct {v0}, Landroid/support/v4/g/cf;-><init>()V

    sput-object v0, Landroid/support/v4/g/ce;->a:Landroid/support/v4/g/cg;

    goto :goto_0

    :cond_2
    new-instance v0, Landroid/support/v4/g/cj;

    invoke-direct {v0}, Landroid/support/v4/g/cj;-><init>()V

    sput-object v0, Landroid/support/v4/g/ce;->a:Landroid/support/v4/g/cg;

    goto :goto_0
.end method

.method public static a(Landroid/view/ViewParent;Landroid/view/View;)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/ce;->a:Landroid/support/v4/g/cg;

    invoke-interface {v0, p0, p1}, Landroid/support/v4/g/cg;->a(Landroid/view/ViewParent;Landroid/view/View;)V

    return-void
.end method

.method public static a(Landroid/view/ViewParent;Landroid/view/View;IIII)V
    .locals 7

    sget-object v0, Landroid/support/v4/g/ce;->a:Landroid/support/v4/g/cg;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-interface/range {v0 .. v6}, Landroid/support/v4/g/cg;->a(Landroid/view/ViewParent;Landroid/view/View;IIII)V

    return-void
.end method

.method public static a(Landroid/view/ViewParent;Landroid/view/View;II[I)V
    .locals 6

    sget-object v0, Landroid/support/v4/g/ce;->a:Landroid/support/v4/g/cg;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    invoke-interface/range {v0 .. v5}, Landroid/support/v4/g/cg;->a(Landroid/view/ViewParent;Landroid/view/View;II[I)V

    return-void
.end method

.method public static a(Landroid/view/ViewParent;Landroid/view/View;FF)Z
    .locals 1

    sget-object v0, Landroid/support/v4/g/ce;->a:Landroid/support/v4/g/cg;

    invoke-interface {v0, p0, p1, p2, p3}, Landroid/support/v4/g/cg;->a(Landroid/view/ViewParent;Landroid/view/View;FF)Z

    move-result v0

    return v0
.end method

.method public static a(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z
    .locals 6

    sget-object v0, Landroid/support/v4/g/ce;->a:Landroid/support/v4/g/cg;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-interface/range {v0 .. v5}, Landroid/support/v4/g/cg;->a(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z

    move-result v0

    return v0
.end method

.method public static a(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)Z
    .locals 1

    sget-object v0, Landroid/support/v4/g/ce;->a:Landroid/support/v4/g/cg;

    invoke-interface {v0, p0, p1, p2, p3}, Landroid/support/v4/g/cg;->a(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public static b(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)V
    .locals 1

    sget-object v0, Landroid/support/v4/g/ce;->a:Landroid/support/v4/g/cg;

    invoke-interface {v0, p0, p1, p2, p3}, Landroid/support/v4/g/cg;->b(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;I)V

    return-void
.end method
