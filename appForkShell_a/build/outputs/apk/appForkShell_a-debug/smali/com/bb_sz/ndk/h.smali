.class Lcom/bb_sz/ndk/h;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/bb_sz/ndk/f;

.field final synthetic b:Lcom/bb_sz/ndk/g;


# direct methods
.method constructor <init>(Lcom/bb_sz/ndk/g;Lcom/bb_sz/ndk/f;)V
    .locals 0

    iput-object p1, p0, Lcom/bb_sz/ndk/h;->b:Lcom/bb_sz/ndk/g;

    iput-object p2, p0, Lcom/bb_sz/ndk/h;->a:Lcom/bb_sz/ndk/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/bb_sz/ndk/h;->b:Lcom/bb_sz/ndk/g;

    iget-object v1, p0, Lcom/bb_sz/ndk/h;->a:Lcom/bb_sz/ndk/f;

    invoke-static {v0, v1}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/g;Lcom/bb_sz/ndk/f;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bb_sz/ndk/h;->b:Lcom/bb_sz/ndk/g;

    iget-object v1, p0, Lcom/bb_sz/ndk/h;->a:Lcom/bb_sz/ndk/f;

    invoke-virtual {v0, v1}, Lcom/bb_sz/ndk/g;->e(Lcom/bb_sz/ndk/f;)V

    :cond_0
    iget-object v0, p0, Lcom/bb_sz/ndk/h;->b:Lcom/bb_sz/ndk/g;

    iget-object v1, p0, Lcom/bb_sz/ndk/h;->a:Lcom/bb_sz/ndk/f;

    invoke-virtual {v0, v1}, Lcom/bb_sz/ndk/g;->f(Lcom/bb_sz/ndk/f;)V

    return-void
.end method
