.class public Lcom/example/hello_jnicallback/MainActivity;
.super Landroid/app/Activity;


# instance fields
.field a:Landroid/widget/TextView;

.field b:Lcom/example/hello_jnicallback/b;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/example/hello_jnicallback/MainActivity;->a:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/example/hello_jnicallback/MainActivity;->a:Landroid/widget/TextView;

    const-string v1, "hello shell."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/example/hello_jnicallback/MainActivity;->a:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Lcom/example/hello_jnicallback/MainActivity;->setContentView(Landroid/view/View;)V

    new-instance v0, Lcom/example/hello_jnicallback/b;

    invoke-direct {v0}, Lcom/example/hello_jnicallback/b;-><init>()V

    iput-object v0, p0, Lcom/example/hello_jnicallback/MainActivity;->b:Lcom/example/hello_jnicallback/b;

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "android.permission.READ_PHONE_STATE"

    aput-object v2, v0, v1

    iget-object v1, p0, Lcom/example/hello_jnicallback/MainActivity;->b:Lcom/example/hello_jnicallback/b;

    new-instance v2, Lcom/example/hello_jnicallback/a;

    invoke-direct {v2, p0}, Lcom/example/hello_jnicallback/a;-><init>(Lcom/example/hello_jnicallback/MainActivity;)V

    invoke-virtual {v1, p0, v0, v2}, Lcom/example/hello_jnicallback/b;->a(Landroid/app/Activity;[Ljava/lang/String;Lcom/example/hello_jnicallback/c;)V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    iget-object v0, p0, Lcom/example/hello_jnicallback/MainActivity;->b:Lcom/example/hello_jnicallback/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/example/hello_jnicallback/MainActivity;->b:Lcom/example/hello_jnicallback/b;

    invoke-virtual {v0, p1, p2, p3}, Lcom/example/hello_jnicallback/b;->a(I[Ljava/lang/String;[I)V

    :cond_0
    return-void
.end method
