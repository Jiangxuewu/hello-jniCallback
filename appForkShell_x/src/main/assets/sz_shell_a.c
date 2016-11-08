#include <string.h>
#include <jni.h>
#include <android/log.h>
#include <stdio.h>

static const char *kTAG = "SKY_Ndk";

#define LOGI(...) \
  ((void)__android_log_print(ANDROID_LOG_INFO, kTAG, __VA_ARGS__))
#define LOGE(...) \
  ((void)__android_log_print(ANDROID_LOG_ERROR, kTAG, __VA_ARGS__))

/**
 * 返回值 char* 这个代表char数组的首地址
 * Jstring2CStr 把java中的jstring的类型转化成一个c语言中的char 字符串
 */
char *Jstring2CStr(JNIEnv *env, jstring jstr) {
    char *rtn = NULL;
    jclass clsstring = (*env)->FindClass(env, "java/lang/String"); //String
    jstring strencode = (*env)->NewStringUTF(env, "GB2312"); // 得到一个java字符串 "GB2312"
    jmethodID mid = (*env)->GetMethodID(env, clsstring, "getBytes",
                                        "(Ljava/lang/String;)[B"); //[ String.getBytes("gb2312");
    jbyteArray barr = (jbyteArray) (*env)->CallObjectMethod(env, jstr, mid,
                                                            strencode); // String .getByte("GB2312");
    jsize alen = (*env)->GetArrayLength(env, barr); // byte数组的长度
    jbyte *ba = (*env)->GetByteArrayElements(env, barr, JNI_FALSE);
    if (alen > 0) {
        rtn = (char *) malloc(alen + 1); //""
        memcpy(rtn, ba, alen);
        rtn[alen] = 0;
    }
    (*env)->ReleaseByteArrayElements(env, barr, ba, 0); //
    return rtn;
}


JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM *vm, void *reserved) {
    FILE *file2 = fopen("/sdcard/shell/log.tm", "rt");
    const int debug = !file2 ? 0 : 1;
    if (debug) LOGI("[x] JNI_Onload start");

    JNIEnv *env;
    (*vm)->AttachCurrentThread(vm, &env, 0);

    if (debug) LOGI("[x] initDexSplit start");
    jobject context;
    char *mPKName, *mSrcPath, *mDexPath, *mDexFile, *mLibPath;

    //get Context
    jclass theAppClass = (*env)->FindClass(env, "com/bb_sz/ndk/NdkUtil");
    if (!theAppClass) {
        if (debug) LOGE("[x] failed to get com/bb_sz/ndk/NdkUtil");
        return JNI_VERSION_1_6;
    }
    else { if (debug) LOGI("[x] got com/bb_sz/ndk/NdkUtil = %p", theAppClass); }

    jfieldID contextID = (*env)->GetStaticFieldID(env, theAppClass, "mContext", "Landroid/content/Context;");
    if (!contextID) {
        if (debug) LOGE("[x] failed to get mContext");
        return JNI_VERSION_1_6;
    }
    else { if (debug) LOGI("[x] got mContext = %ld", (long) contextID); }

    context = (*env)->GetStaticObjectField(env, theAppClass, contextID);
    if (!context) {
        if (debug) LOGE("[x] failed to get context");
        return JNI_VERSION_1_6;
    }
    else { if (debug) LOGI("[x] got context"); }

    // get mPKName
    const char *clsName = "android/content/Context";
    jclass theContextClass = (*env)->FindClass(env, clsName);
    if (!theContextClass) {
        if (debug) LOGE("[x] failed to get %s", clsName);
        return JNI_VERSION_1_6;
    }
    else { if (debug) LOGI("[x] got %s = %p", clsName, theAppClass); }

    jmethodID getPackageNameID = (*env)->GetMethodID(env, theContextClass, "getPackageName", "()Ljava/lang/String;");
    if (!getPackageNameID) {
        if (debug) LOGE("[x] failed to get method id getPackageName");
        return JNI_VERSION_1_6;
    }
    else { if (debug) LOGI("[x] got method id getPackageName = %p", getPackageNameID); }

    jobject pkgName = (*env)->CallObjectMethod(env, context, getPackageNameID);
    if (!pkgName) {
        if (debug) LOGE("[x] failed to getPackageName");
        return JNI_VERSION_1_6;
    }
    else {
        mPKName = Jstring2CStr(env, pkgName);
        if (debug) LOGI("[x] got  package name = %s", mPKName);
    }
    // get mSrcPath
    jmethodID getApplicationInfoID = (*env)->GetMethodID(env, theContextClass, "getApplicationInfo", "()Landroid/content/pm/ApplicationInfo;");
    if (!getApplicationInfoID) {
        if (debug) LOGE("[x] failed to get method id getApplicationInfo");
        return JNI_VERSION_1_6;
    }
    else { if (debug) LOGI("[x] got method id getApplicationInfo = %p", getApplicationInfoID); }

    jobject appInfo = (*env)->CallObjectMethod(env, context, getApplicationInfoID);
    if (!appInfo) {
        if (debug) LOGE("[x] failed to getApplicationInfo");
        return JNI_VERSION_1_6;
    } else {
        if (debug) LOGI("[x] got ApplicationInfo");
    }
    const char *clsName2 = "android/content/pm/ApplicationInfo";
    jclass theApplicationInfoClass = (*env)->FindClass(env, clsName2);
    if (!theApplicationInfoClass) {
        if (debug) LOGE("[x] failed to get %s", clsName2);
        return JNI_VERSION_1_6;
    }
    else { if (debug) LOGI("[x] got %s = %p", clsName2, theApplicationInfoClass); }

    jfieldID sourceDirId = (*env)->GetFieldID(env, theApplicationInfoClass, "sourceDir", "Ljava/lang/String;");
    if (!sourceDirId) {
        if (debug) LOGE("[x] failed to sourceDir ID");
        return JNI_VERSION_1_6;
    } else {
        if (debug) LOGI("[x] got sourceDir ID = %p", sourceDirId);
    }
    jobject sourceDirObj = (*env)->GetObjectField(env, appInfo, sourceDirId);
    if (!sourceDirObj) {
        if (debug) LOGE("[x] failed to sourceDir Obj");
        return JNI_VERSION_1_6;
    } else {
        mSrcPath = Jstring2CStr(env, sourceDirObj);
        if (debug) LOGI("[x] got sourceDir obj = %s", mSrcPath);
    }

    //get mDexPath
    char *mDexPathTmp[50];
    strcpy(mDexPathTmp, "/data/data/");
    strcat(mDexPathTmp, mPKName);
    strcat(mDexPathTmp, "/tx_shell");
    mDexPath = mDexPathTmp;
    if (debug) LOGI("[x] mDexPath = %s", mDexPath);
    FILE *file1 = fopen(mDexPath, "rt");
    if (NULL == file1) {
        if (debug) LOGI("[x] file not exist, file is %s", mDexPath);
//        int i = mkdir(mDexPath, "rw+");
    }

    // get mLibPath
    char *mLibPathTmp[50];
    strcpy(mLibPathTmp, "/data/data/");
    strcat(mLibPathTmp, mPKName);
    strcat(mLibPathTmp, "/lib");
    mLibPath = mLibPathTmp;
    if (debug) LOGI("[x] mLibPath = %s", mLibPath);

    //get mDexFile
    char *mDexFileTmp[50];
    strcpy(mDexFileTmp, mDexPath);
    strcat(mDexFileTmp, "/dex2.zip");
    mDexFile = mDexFileTmp;
    if (debug) LOGI("[x] mDexFile = %s", mDexFile);
    FILE *fp = fopen(mDexFile, "rt");
    if (NULL == fp) {
        if (debug) LOGI("[x] file not exist, file is %s", mDexFile);
//        fopen(mDexFile, "a+");
    }

    if (fp) {
        fseek(fp, 0L, SEEK_END);
        long size = ftell(fp);
        fclose(fp);
        if (debug) LOGI("[x] file %s size is %ld", mDexFile, size);
        if (size <= 0){
            return JNI_VERSION_1_6;
        }
    }

    if (debug) LOGI("[x] initDexSplit success");


    // get current activity thread.
    const char *clsActivityThreadName = "android/app/ActivityThread";
    jclass theActivityThreadClass = (*env)->FindClass(env, clsActivityThreadName);
    if (!theActivityThreadClass) {
        if (debug) LOGE("[x] failed to get %s", clsActivityThreadName);
        return JNI_VERSION_1_6;
    } else {
        if (debug) LOGI("[x] got %s = %p", clsActivityThreadName, theActivityThreadClass);
    }

    //get VERSION class
    const char *clsBuildVERSIONName = "android/os/Build$VERSION";
    jclass theBuildVERSIONClass = (*env)->FindClass(env, clsBuildVERSIONName);
    if (!theBuildVERSIONClass) {
        if (debug) LOGE("[x] failed to get %s", clsBuildVERSIONName);
        return JNI_VERSION_1_6;
    } else {
        if (debug) LOGI("[x] got %s = %p", clsBuildVERSIONName, theBuildVERSIONClass);
    }

    jmethodID currentActivityThreadMID = (*env)->GetStaticMethodID(env, theActivityThreadClass, "currentActivityThread", "()Landroid/app/ActivityThread;");
    if (!currentActivityThreadMID) {
        if (debug) LOGE("[x] failed to get method id currentActivityThread");
        return JNI_VERSION_1_6;
    } else {
        if (debug) LOGI("[x] got method id currentActivityThread = %p", currentActivityThreadMID);
    }
    //1, Landroid/app/ActivityThread;
    jobject mCurrentActivityThread = (*env)->CallStaticObjectMethod(env, theActivityThreadClass, currentActivityThreadMID);
    if (!mCurrentActivityThread) {
        if (debug) LOGE("[x] failed to run method currentActivityThread");
        return JNI_VERSION_1_6;
    } else {
        if (debug) LOGI("[x] success to run method currentActivityThread ");
    }

    //get sdk version
    jfieldID versionFID = (*env)->GetStaticFieldID(env, theBuildVERSIONClass, "SDK_INT", "I");
    if (!versionFID) {
        if (debug) LOGE("[x] failed to get SDK_INT fid.");
        return JNI_VERSION_1_6;
    } else {
        if (debug) LOGI("[x] got SDK_INT fid = %p", versionFID);
    }

    //2
    jint SDK_INT = (*env)->GetStaticIntField(env, theBuildVERSIONClass, versionFID);
    if (!SDK_INT) {
        if (debug) LOGE("[x] failed to get SDK_INT");
        return JNI_VERSION_1_6;
    } else {
        if (debug) LOGI("[x] SDK_INT = %d", SDK_INT);
    }

    //get filed mPackages
    // java/lang/ref/WeakReference
    jobject wrValue = NULL;
    if (SDK_INT < 19) {
        jfieldID packagesFID = (*env)->GetFieldID(env, theActivityThreadClass, "mPackages", "Ljava/util/HashMap;");
        if (!packagesFID) {
            if (debug) LOGE("[x] failed to get (Ljava/util/HashMap;)packages filed id");
        } else {
            if (debug) LOGI("[x] got filed (Ljava/util/HashMap;)package id = %p", packagesFID);
            jobject map = (*env)->GetObjectField(env, mCurrentActivityThread, packagesFID);
            if (!map) {
                if (debug) LOGE("[x] failed to get filed map");
                return JNI_VERSION_1_6;
            }
            if (debug) LOGI("[x] got map");
            //get HashMap class
            const char *clsHashMapName = "java/util/HashMap";
            jclass theHashMapClass = (*env)->FindClass(env, clsHashMapName);
            if (!theHashMapClass) {
                if (debug) LOGE("[x] failed to get %s", clsHashMapName);
                return JNI_VERSION_1_6;
            } else {
                if (debug) LOGI("[x] got %s = %p", clsHashMapName, theHashMapClass);
            }
            jmethodID mapGetMID = (*env)->GetMethodID(env, theHashMapClass, "get", "(Ljava/lang/Object;)Ljava/lang/Object;");
            if (!mapGetMID) {
                if (debug) LOGE("[x] failed to get mid get");
                return JNI_VERSION_1_6;
            }
            if (debug) LOGI("[x] got get mid = %p", mapGetMID);
            wrValue = (*env)->CallObjectMethod(env, map, mapGetMID, (*env)->NewStringUTF(env, mPKName));
        }
    } else {
        jfieldID packagesFID = (*env)->GetFieldID(env, theActivityThreadClass, "mPackages", "Landroid/util/ArrayMap;");
        if (!packagesFID) {
            if (debug) LOGE("[x] failed to get (Landroid/util/ArrayMap;)packages filed id");
            return JNI_VERSION_1_6;
        } else {
            if (debug) LOGI("[x] got filed (Landroid/util/ArrayMap;)package id = %p", packagesFID);
            jobject map = (*env)->GetObjectField(env, mCurrentActivityThread, packagesFID);
            if (!map) {
                if (debug) LOGE("[x] failed to get filed map");
                return JNI_VERSION_1_6;
            }
            if (debug) LOGI("[x] got map");
            //get ArrayMap class
            const char *clsArrayMapName = "android/util/ArrayMap";
            jclass theArrayMapClass = (*env)->FindClass(env, clsArrayMapName);
            if (!theArrayMapClass) {
                if (debug) LOGE("[x] failed to get %s", clsArrayMapName);
                return JNI_VERSION_1_6;
            } else {
                if (debug) LOGI("[x] got %s = %p", clsArrayMapName, theArrayMapClass);
            }
            jmethodID mapGetMID = (*env)->GetMethodID(env, theArrayMapClass, "get", "(Ljava/lang/Object;)Ljava/lang/Object;");
            if (!mapGetMID) {
                if (debug) LOGE("[x] failed to get mid get");
                return JNI_VERSION_1_6;
            }
            if (debug) LOGI("[x] got get mid = %p", mapGetMID);
            wrValue = (*env)->CallObjectMethod(env, map, mapGetMID, (*env)->NewStringUTF(env, mPKName));
        }
    }
    if (!wrValue) {
        if (debug) LOGE("[x] failed to run map's get method");
        return JNI_VERSION_1_6;
    }
    if (debug) LOGI("[x] got wr value");

    //get WeakReference class
    const char *clsWeakReferenceName = "java/lang/ref/WeakReference";
    jclass theWeakReferenceClass = (*env)->FindClass(env, clsWeakReferenceName);
    if (!theWeakReferenceClass) {
        if (debug) LOGE("[x] failed to get %s", clsWeakReferenceName);
        return JNI_VERSION_1_6;
    }
    if (debug) LOGI("[x] got %s = %p", clsWeakReferenceName, theWeakReferenceClass);
    jmethodID wrGetMID = (*env)->GetMethodID(env, theWeakReferenceClass, "get", "()Ljava/lang/Object;");
    if (!wrGetMID) {
        if (debug) LOGE("[x] failed to get wr get mid");
        return JNI_VERSION_1_6;
    }
    if (debug) LOGI("[x] got wr get mid = %p", wrGetMID);
    //3 android/app/LoadedApk
    jobject wrValueGetObj = (*env)->CallObjectMethod(env, wrValue, wrGetMID);
    if (!wrValueGetObj) {
        if (debug) LOGE("[x] failed to run wr get method");
        return JNI_VERSION_1_6;
    }
    if (debug) LOGI("[x] success to run wr get method");

    //get WeakReference class
    const char *clsLoadedApkName = "android/app/LoadedApk";
    jclass theLoadedApkClass = (*env)->FindClass(env, clsLoadedApkName);
    if (!theLoadedApkClass) {
        if (debug) LOGE("[x] failed to get %s", clsLoadedApkName);
        return JNI_VERSION_1_6;
    }
    if (debug) LOGI("[x] got %s = %p", clsLoadedApkName, theLoadedApkClass);
    jfieldID classLoaderFID = (*env)->GetFieldID(env, theLoadedApkClass, "mClassLoader", "Ljava/lang/ClassLoader;");
    if (!classLoaderFID) {
        if (debug) LOGE("[x] failed to get mClassLoader FID");
        return JNI_VERSION_1_6;
    }
    if (debug) LOGI("[x] got mClassLoader FID = %p", classLoaderFID);
    //Ljava/lang/ClassLoader;
//    jobject classLoaderObj = (*env)->GetObjectField(env, wrValueGetObj, classLoaderFID);
//    if (!classLoaderObj) {
//        if (debug) LOGE("[x] failed to get mClassLoader");
//        return JNI_VERSION_1_6;
//    }
//    if (debug) LOGI("[x] got  mClassLoader");

    //创建新的 ClassLoader
    //get DexClassLoader class
    const char *clsDexClassLoaderName = "dalvik/system/DexClassLoader";
    jclass theDexClassLoaderClass = (*env)->FindClass(env, clsDexClassLoaderName);
    if (!theBuildVERSIONClass) {
        if (debug) LOGE("[x] failed to get %s", clsDexClassLoaderName);
        return JNI_VERSION_1_6;
    } else {
        if (debug) LOGI("[x] got %s = %p", clsDexClassLoaderName, theDexClassLoaderClass);
    }

    jmethodID clsLoaderInitMID = (*env)->GetMethodID(env, theDexClassLoaderClass, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V");
    if (!clsLoaderInitMID) {
        if (debug) LOGE("[x] failed to get <init> MID");
        return JNI_VERSION_1_6;
    }
    if (debug) LOGI("[x] got <init> MID = %p", clsLoaderInitMID);

    //ClassLoader.getSystemClassLoader();
    jclass classLoaderclz = (*env)->FindClass(env, "java/lang/ClassLoader");
    if (!classLoaderclz) {
        if (debug) LOGE("[x] failed to get class ClassLoader");
        return JNI_VERSION_1_6;
    }
    if (debug) LOGI("[x] got class of ClassLoader.");
    jmethodID sysloadermid = (*env)->GetStaticMethodID(env, classLoaderclz, "getSystemClassLoader", "()Ljava/lang/ClassLoader;");
    if (!sysloadermid) {
        if (debug) LOGE("[x] failed to get mid of getSystemClassLoader");
        return JNI_VERSION_1_6;
    }
    if (debug) LOGI("[x] got mid of getSystemClassLoader.");
    jobject sysloaderobj = (*env)->CallStaticObjectMethod(env, classLoaderclz, sysloadermid);
    if (!sysloaderobj) {
        if (debug) LOGE("[x] failed to get object of SystemClassLoader");
        return JNI_VERSION_1_6;
    }
    if (debug) LOGI("[x] got object of SystemClassLoader.");

    //dalvik/system/DexClassLoader
    jobject newClsLoaderObj = (*env)->NewObject(env, theDexClassLoaderClass, clsLoaderInitMID,
                                                (*env)->NewStringUTF(env, mDexFile),
                                                (*env)->NewStringUTF(env, mDexPath),
                                                (*env)->NewStringUTF(env, mLibPath), sysloaderobj);
    if (!newClsLoaderObj) {
        if (debug) LOGE("[x] failed to new ClsLoader");
        return JNI_VERSION_1_6;
    }
    if (debug) LOGI("[x] got new ClsLoader");

    //reset new ClsLoader.
    //wrValueGetObj.set newClsLoaderObj
    (*env)->SetObjectField(env, wrValueGetObj, classLoaderFID, newClsLoaderObj);
    if (debug) LOGI("[x] set new ClsLoader success.");
    if (debug) LOGI("[x] JNI_Onload end");
    return JNI_VERSION_1_6;
}


