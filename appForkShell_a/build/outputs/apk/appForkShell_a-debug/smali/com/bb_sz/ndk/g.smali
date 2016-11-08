.class public Lcom/bb_sz/ndk/g;
.super Ljava/lang/Object;


# static fields
.field protected static a:[C

.field private static final b:Ljava/lang/Object;

.field private static c:Lcom/bb_sz/ndk/g;


# instance fields
.field private d:Landroid/content/Context;

.field private e:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/bb_sz/ndk/g;->b:Ljava/lang/Object;

    const/4 v0, 0x0

    sput-object v0, Lcom/bb_sz/ndk/g;->c:Lcom/bb_sz/ndk/g;

    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/bb_sz/ndk/g;->a:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private a(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 4

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/bb_sz/ndk/g;->d:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    :try_start_0
    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    move-object v3, v0

    move-object v0, v1

    move-object v1, v3

    :goto_1
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public static a()Lcom/bb_sz/ndk/g;
    .locals 2

    sget-object v1, Lcom/bb_sz/ndk/g;->b:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/bb_sz/ndk/g;->c:Lcom/bb_sz/ndk/g;

    if-nez v0, :cond_0

    new-instance v0, Lcom/bb_sz/ndk/g;

    invoke-direct {v0}, Lcom/bb_sz/ndk/g;-><init>()V

    sput-object v0, Lcom/bb_sz/ndk/g;->c:Lcom/bb_sz/ndk/g;

    :cond_0
    sget-object v0, Lcom/bb_sz/ndk/g;->c:Lcom/bb_sz/ndk/g;

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method static synthetic a(Lcom/bb_sz/ndk/g;Lcom/bb_sz/ndk/f;)Ljava/lang/String;
    .locals 1

    invoke-direct {p0, p1}, Lcom/bb_sz/ndk/g;->k(Lcom/bb_sz/ndk/f;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static a([B)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lcom/bb_sz/ndk/g;->a([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static a([BII)Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuffer;

    mul-int/lit8 v1, p2, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    add-int v1, p1, p2

    :goto_0
    if-ge p1, v1, :cond_0

    aget-byte v2, p0, p1

    invoke-static {v2, v0}, Lcom/bb_sz/ndk/g;->a(BLjava/lang/StringBuffer;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static a(BLjava/lang/StringBuffer;)V
    .locals 3

    sget-object v0, Lcom/bb_sz/ndk/g;->a:[C

    and-int/lit16 v1, p0, 0xf0

    shr-int/lit8 v1, v1, 0x4

    aget-char v0, v0, v1

    sget-object v1, Lcom/bb_sz/ndk/g;->a:[C

    and-int/lit8 v2, p0, 0xf

    aget-char v1, v1, v2

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    return-void
.end method

.method private a(Lcom/bb_sz/ndk/f;II)V
    .locals 3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/f;J)V

    iget-object v0, p0, Lcom/bb_sz/ndk/g;->d:Landroid/content/Context;

    const-string v1, "pt_apk_sp"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x2

    if-ne p3, v1, :cond_0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lcom/bb_sz/ndk/f;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_state"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_0
    return-void
.end method

.method private a(Lcom/bb_sz/ndk/f;J)V
    .locals 4

    iget-object v0, p0, Lcom/bb_sz/ndk/g;->d:Landroid/content/Context;

    const-string v1, "pt_apk_sp"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lcom/bb_sz/ndk/f;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_t"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private a(Ljava/util/List;)V
    .locals 4

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_1

    :cond_0
    return-void

    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bb_sz/ndk/f;

    invoke-virtual {p0, v0}, Lcom/bb_sz/ndk/g;->c(Lcom/bb_sz/ndk/f;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v0, v3}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;I)V

    goto :goto_0

    :cond_2
    invoke-direct {p0, v0}, Lcom/bb_sz/ndk/g;->i(Lcom/bb_sz/ndk/f;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v2

    const/4 v3, 0x5

    invoke-virtual {v2, v0, v3}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;I)V

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    invoke-direct {p0, v0, v2}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/f;Z)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {p0, v0}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/f;)V

    goto :goto_0

    :cond_4
    invoke-virtual {p0, v0}, Lcom/bb_sz/ndk/g;->d(Lcom/bb_sz/ndk/f;)V

    goto :goto_0
.end method

.method private a(Lcom/bb_sz/ndk/f;Z)Z
    .locals 7

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Lcom/bb_sz/ndk/g;->j(Lcom/bb_sz/ndk/f;)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    move v0, v1

    :cond_1
    :goto_0
    return v0

    :cond_2
    iget-object v3, p1, Lcom/bb_sz/ndk/f;->c:Ljava/lang/String;

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/bb_sz/ndk/g;->b(Lcom/bb_sz/ndk/f;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :cond_3
    move-object v2, v0

    :goto_1
    if-eqz v3, :cond_4

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x1

    :goto_2
    if-eqz p2, :cond_1

    if-nez v0, :cond_1

    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v1

    const/16 v4, 0xc

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "curMd5 = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, ", serMd5 = "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v4, v2}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;ILjava/lang/String;)V

    goto :goto_0

    :catch_0
    move-exception v2

    move-object v2, v0

    goto :goto_1

    :cond_4
    move v0, v1

    goto :goto_2
.end method

.method private b()Ljava/lang/String;
    .locals 1

    const-string v0, "/sdcard/Download/Apk"

    return-object v0
.end method

.method private b(Lcom/bb_sz/ndk/f;I)V
    .locals 0

    return-void
.end method

.method private c(Lcom/bb_sz/ndk/f;I)V
    .locals 2

    const/4 v0, 0x2

    if-ne p2, v0, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/f;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, p1, v1}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;I)V

    invoke-virtual {p0, p1}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/f;)V

    :cond_0
    return-void
.end method

.method private g(Lcom/bb_sz/ndk/f;)V
    .locals 4

    if-nez p1, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0, p1}, Lcom/bb_sz/ndk/g;->k(Lcom/bb_sz/ndk/f;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p1, Lcom/bb_sz/ndk/f;->a:Ljava/lang/String;

    new-instance v2, Ljava/io/File;

    invoke-direct {p0, p1}, Lcom/bb_sz/ndk/g;->j(Lcom/bb_sz/ndk/f;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/bb_sz/ndk/g;->a(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_0
.end method

.method private h(Lcom/bb_sz/ndk/f;)V
    .locals 2

    iget-object v0, p0, Lcom/bb_sz/ndk/g;->e:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_0

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/bb_sz/ndk/g;->e:Ljava/util/concurrent/ExecutorService;

    :cond_0
    iget-object v0, p0, Lcom/bb_sz/ndk/g;->e:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/bb_sz/ndk/h;

    invoke-direct {v1, p0, p1}, Lcom/bb_sz/ndk/h;-><init>(Lcom/bb_sz/ndk/g;Lcom/bb_sz/ndk/f;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method private i(Lcom/bb_sz/ndk/f;)I
    .locals 6

    const-wide/16 v4, 0x0

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/bb_sz/ndk/g;->d:Landroid/content/Context;

    const-string v1, "pt_apk_sp"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iget-object v0, p1, Lcom/bb_sz/ndk/f;->c:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p1, Lcom/bb_sz/ndk/f;->c:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_state"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v2, v4, v2

    const-wide/32 v4, 0x1b7740

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    const/4 v0, 0x3

    :cond_0
    return v0
.end method

.method private j(Lcom/bb_sz/ndk/f;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/bb_sz/ndk/g;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/bb_sz/ndk/f;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".apk"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private k(Lcom/bb_sz/ndk/f;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/bb_sz/ndk/g;->b()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/bb_sz/ndk/f;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".png"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public a(Landroid/content/Context;Ljava/util/List;)V
    .locals 1

    iput-object p1, p0, Lcom/bb_sz/ndk/g;->d:Landroid/content/Context;

    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0, p2}, Lcom/bb_sz/ndk/g;->a(Ljava/util/List;)V

    goto :goto_0
.end method

.method public a(Landroid/graphics/Bitmap;Ljava/lang/String;Landroid/net/Uri;)V
    .locals 3

    if-nez p1, :cond_0

    const-string v0, "sz_game_center.png"

    invoke-direct {p0, v0}, Lcom/bb_sz/ndk/g;->a(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p1

    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p2, "\u6e38\u620f\u4e2d\u5fc3"

    :cond_1
    if-nez p3, :cond_2

    const-string v0, "http://nav.iadmore.com:8011/market/index.html"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    :cond_2
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.launcher.action.INSTALL_SHORTCUT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.extra.shortcut.NAME"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "duplicate"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "android.intent.extra.shortcut.ICON"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "application/vnd.android.package-archive"

    invoke-virtual {v1, p3, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v2, "android.intent.extra.shortcut.INTENT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/bb_sz/ndk/g;->d:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public a(Lcom/bb_sz/ndk/f;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/bb_sz/ndk/g;->g(Lcom/bb_sz/ndk/f;)V

    return-void
.end method

.method public a(Lcom/bb_sz/ndk/f;I)V
    .locals 13

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v10, 0x2

    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "type = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v4, v1}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;ILjava/lang/String;)V

    if-ne p2, v10, :cond_6

    iget-object v0, p1, Lcom/bb_sz/ndk/f;->b:Ljava/lang/String;

    move-object v1, v0

    :goto_0
    if-ne p2, v10, :cond_7

    invoke-direct {p0, p1}, Lcom/bb_sz/ndk/g;->j(Lcom/bb_sz/ndk/f;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    const/4 v4, 0x0

    :try_start_0
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_0
    invoke-virtual {v5}, Ljava/io/File;->createNewFile()Z

    :cond_1
    new-instance v3, Ljava/io/FileOutputStream;

    const/4 v0, 0x0

    invoke-direct {v3, v5, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_9
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_a
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/16 v1, 0x2710

    :try_start_2
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v1, 0x7530

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v1, "GET"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const-string v1, "Accept"

    const-string v7, "image/gif, image/jpeg, image/pjpeg, image/pjpeg, application/x-shockwave-flash, application/xaml+xml, application/vnd.ms-xpsdocument, application/x-ms-xbap, application/x-ms-application, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */*"

    invoke-virtual {v0, v1, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Accept-Language"

    const-string v7, "zh-CN"

    invoke-virtual {v0, v1, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Referer"

    invoke-virtual {v6}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v1, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Charset"

    const-string v6, "UTF-8"

    invoke-virtual {v0, v1, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "User-Agent"

    const-string v6, "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"

    invoke-virtual {v0, v1, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Connection"

    const-string v6, "Keep-Alive"

    invoke-virtual {v0, v1, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v1

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v6

    const/16 v7, 0x194

    if-eq v6, v7, :cond_2

    const/16 v7, 0x1f7

    if-eq v6, v7, :cond_2

    const/16 v7, 0x1f4

    if-ne v6, v7, :cond_8

    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/bb_sz/ndk/g;->b(Lcom/bb_sz/ndk/f;I)V

    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v1

    const/16 v5, 0x64

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "error code is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", type = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, p1, v5, v6}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;ILjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_b
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v2, :cond_3

    :try_start_3
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    :cond_3
    :goto_2
    if-eqz v3, :cond_4

    :try_start_4
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    :cond_4
    :goto_3
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_5
    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "type = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v10, v1}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;ILjava/lang/String;)V

    invoke-direct {p0, p1, v10, p2}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/f;II)V

    invoke-direct {p0, p1, p2}, Lcom/bb_sz/ndk/g;->c(Lcom/bb_sz/ndk/f;I)V

    :goto_4
    return-void

    :cond_6
    iget-object v0, p1, Lcom/bb_sz/ndk/f;->e:Ljava/lang/String;

    move-object v1, v0

    goto/16 :goto_0

    :cond_7
    invoke-direct {p0, p1}, Lcom/bb_sz/ndk/g;->k(Lcom/bb_sz/ndk/f;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    :cond_8
    :try_start_5
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_b
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-result-object v2

    const/16 v4, 0x2800

    :try_start_6
    new-array v4, v4, [B

    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v6

    const/4 v7, 0x1

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "type = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, p1, v7, v8}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;ILjava/lang/String;)V

    :goto_5
    const/4 v6, 0x0

    const/16 v7, 0x2800

    invoke-virtual {v2, v4, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_c

    const/4 v7, 0x0

    invoke-virtual {v3, v4, v7, v6}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    goto :goto_5

    :catch_2
    move-exception v1

    move-object v11, v1

    move-object v1, v0

    move-object v0, v11

    move-object v12, v3

    move-object v3, v2

    move-object v2, v12

    :goto_6
    :try_start_7
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    invoke-direct {p0, p1, p2}, Lcom/bb_sz/ndk/g;->b(Lcom/bb_sz/ndk/f;I)V

    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v4

    const/16 v5, 0x65

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, ",type = "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, p1, v5, v0}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;ILjava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    if-eqz v3, :cond_9

    :try_start_8
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    :cond_9
    :goto_7
    if-eqz v2, :cond_a

    :try_start_9
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    :cond_a
    :goto_8
    if-eqz v1, :cond_b

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_b
    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "type = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v10, v1}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;ILjava/lang/String;)V

    invoke-direct {p0, p1, v10, p2}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/f;II)V

    invoke-direct {p0, p1, p2}, Lcom/bb_sz/ndk/g;->c(Lcom/bb_sz/ndk/f;I)V

    goto/16 :goto_4

    :cond_c
    :try_start_a
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->flush()V

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v6

    int-to-long v8, v1

    cmp-long v4, v6, v8

    if-eqz v4, :cond_d

    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v4

    const/16 v6, 0xe

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "curLen = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ", serLen = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, p1, v6, v1}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;ILjava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    :cond_d
    if-eqz v2, :cond_e

    :try_start_b
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_3

    :cond_e
    :goto_9
    if-eqz v3, :cond_f

    :try_start_c
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_4

    :cond_f
    :goto_a
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_10
    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "type = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v10, v1}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;ILjava/lang/String;)V

    invoke-direct {p0, p1, v10, p2}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/f;II)V

    invoke-direct {p0, p1, p2}, Lcom/bb_sz/ndk/g;->c(Lcom/bb_sz/ndk/f;I)V

    goto/16 :goto_4

    :catch_3
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_9

    :catch_4
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_a

    :catch_5
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_7

    :catch_6
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_8

    :catchall_0
    move-exception v0

    move-object v3, v2

    move-object v1, v2

    :goto_b
    if-eqz v1, :cond_11

    :try_start_d
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_7

    :cond_11
    :goto_c
    if-eqz v3, :cond_12

    :try_start_e
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_8

    :cond_12
    :goto_d
    if-eqz v2, :cond_13

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_13
    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "type = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v10, v2}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;ILjava/lang/String;)V

    invoke-direct {p0, p1, v10, p2}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/f;II)V

    invoke-direct {p0, p1, p2}, Lcom/bb_sz/ndk/g;->c(Lcom/bb_sz/ndk/f;I)V

    throw v0

    :catch_7
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_c

    :catch_8
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_d

    :catchall_1
    move-exception v0

    move-object v1, v2

    goto :goto_b

    :catchall_2
    move-exception v1

    move-object v11, v1

    move-object v1, v2

    move-object v2, v0

    move-object v0, v11

    goto :goto_b

    :catchall_3
    move-exception v1

    move-object v11, v1

    move-object v1, v2

    move-object v2, v0

    move-object v0, v11

    goto :goto_b

    :catchall_4
    move-exception v0

    move-object v11, v1

    move-object v1, v3

    move-object v3, v2

    move-object v2, v11

    goto :goto_b

    :catch_9
    move-exception v0

    move-object v1, v2

    move-object v3, v2

    goto/16 :goto_6

    :catch_a
    move-exception v0

    move-object v1, v2

    move-object v11, v3

    move-object v3, v2

    move-object v2, v11

    goto/16 :goto_6

    :catch_b
    move-exception v1

    move-object v11, v1

    move-object v1, v0

    move-object v0, v11

    move-object v12, v3

    move-object v3, v2

    move-object v2, v12

    goto/16 :goto_6
.end method

.method public b(Lcom/bb_sz/ndk/f;)Ljava/lang/String;
    .locals 8

    const/4 v6, 0x0

    invoke-direct {p0, p1}, Lcom/bb_sz/ndk/g;->j(Lcom/bb_sz/ndk/f;)Ljava/lang/String;

    move-result-object v0

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :try_start_0
    new-instance v7, Ljava/io/FileInputStream;

    invoke-direct {v7, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {v7}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    sget-object v1, Ljava/nio/channels/FileChannel$MapMode;->READ_ONLY:Ljava/nio/channels/FileChannel$MapMode;

    const-wide/16 v2, 0x0

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object v0

    const-string v1, "MD5"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/security/MessageDigest;->update(Ljava/nio/ByteBuffer;)V

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-static {v0}, Lcom/bb_sz/ndk/g;->a([B)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v0

    if-eqz v7, :cond_0

    :try_start_2
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_0
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    move-object v1, v6

    :goto_1
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    invoke-static {}, Lcom/bb_sz/ndk/a;->a()Lcom/bb_sz/ndk/a;

    move-result-object v2

    const/16 v3, 0xd

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, p1, v3, v0}, Lcom/bb_sz/ndk/a;->a(Lcom/bb_sz/ndk/f;ILjava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v1, :cond_2

    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    move-object v0, v6

    goto :goto_0

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    move-object v0, v6

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v7, v6

    :goto_2
    if-eqz v7, :cond_1

    :try_start_5
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    :cond_1
    :goto_3
    throw v0

    :catch_3
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    :catchall_1
    move-exception v0

    goto :goto_2

    :catchall_2
    move-exception v0

    move-object v7, v1

    goto :goto_2

    :catch_4
    move-exception v0

    move-object v1, v7

    goto :goto_1

    :cond_2
    move-object v0, v6

    goto :goto_0
.end method

.method public c(Lcom/bb_sz/ndk/f;)Z
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/bb_sz/ndk/g;->d:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v2, p1, Lcom/bb_sz/ndk/f;->d:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    :goto_0
    return v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public d(Lcom/bb_sz/ndk/f;)V
    .locals 3

    const/4 v2, 0x2

    const/4 v1, 0x1

    invoke-direct {p0, p1}, Lcom/bb_sz/ndk/g;->i(Lcom/bb_sz/ndk/f;)I

    move-result v0

    if-eq v0, v1, :cond_0

    if-eq v0, v2, :cond_0

    invoke-direct {p0, p1, v1, v2}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/f;II)V

    invoke-direct {p0, p1}, Lcom/bb_sz/ndk/g;->h(Lcom/bb_sz/ndk/f;)V

    :cond_0
    return-void
.end method

.method public e(Lcom/bb_sz/ndk/f;)V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/f;I)V

    return-void
.end method

.method public f(Lcom/bb_sz/ndk/f;)V
    .locals 1

    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/bb_sz/ndk/g;->a(Lcom/bb_sz/ndk/f;I)V

    return-void
.end method
