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
    FILE *file = fopen("/sdcard/shell/log.tm", "rt");
    const int debug = !file ? 0 : 1;
    if (debug)LOGI("[x] JNI_Onload start");

    JNIEnv *env;
    (*vm)->AttachCurrentThread(vm, &env, 0);

    if (debug)LOGI("[x] initDexSplit start");
    jobject context;
    char *mPKName;

    //get Context
    jclass theAppClass = (*env)->FindClass(env, "com/bb_sz/ndk/NdkUtil");
    if (!theAppClass) {
        if (debug)LOGE("[x] failed to get com/bb_sz/ndk/NdkUtil");
        return JNI_VERSION_1_6;
    }
    else { if (debug)LOGI("[x] got com/bb_sz/ndk/NdkUtil = %p", theAppClass); }

    jfieldID contextID = (*env)->GetStaticFieldID(env, theAppClass, "mContext", "Landroid/content/Context;");
    if (!contextID) {
        if (debug)LOGE("[x] failed to get mContext");
        return JNI_VERSION_1_6;
    }
    else { if (debug)LOGI("[x] got mContext = %ld", (long) contextID); }

    context = (*env)->GetStaticObjectField(env, theAppClass, contextID);
    if (!context) {
        if (debug)LOGE("[x] failed to get context");
        return JNI_VERSION_1_6;
    }
    else { if (debug)LOGI("[x] got context"); }

    // get mPKName
    const char *clsName = "android/content/Context";
    jclass theContextClass = (*env)->FindClass(env, clsName);
    if (!theContextClass) {
        if (debug)LOGE("[x] failed to get %s", clsName);
        return JNI_VERSION_1_6;
    }
    else { if (debug)LOGI("[x] got %s = %p", clsName, theContextClass); }

    // get mApplication name
    jfieldID mApplicationFID = (*env)->GetStaticFieldID(env, theAppClass, "mApplication", "Ljava/lang/String;");
    if (!mApplicationFID) {
        if (debug)LOGE("[x] failed to get mApplicationFID");
        return JNI_VERSION_1_6;
    }
    else { if (debug)LOGI("[x] got mApplication FID = %ld", (long) mApplicationFID); }

    // String
    char *mApplication = NULL;
    jobject mApplicationStr = (*env)->GetStaticObjectField(env, theAppClass, mApplicationFID);
    if (!mApplicationStr) {
        if (debug)LOGE("[x] failed to get mApplicationStr");
        return JNI_VERSION_1_6;
    }
    else {
        mApplication = Jstring2CStr(env, mApplicationStr);
        if (debug)LOGI("[x] got mApplicationStr = %s ", mApplication);
    }


    //1,调用静态方法(ActivityThread.currentActivityThread)，获取当前Activity线程
    // get class ActivityThread
    const char *clsActivityThreadName = "android/app/ActivityThread";
    jclass theActivityThreadClass = (*env)->FindClass(env, clsActivityThreadName);
    if (!theActivityThreadClass) {
        if (debug)LOGE("[x] failed to get %s", clsActivityThreadName);
        return JNI_VERSION_1_6;
    }
    else { if (debug)LOGI("[x] got %s = %p", clsActivityThreadName, theActivityThreadClass); }
    // get currentActivityThread mid
    jmethodID currentActivityThreadMID = (*env)->GetStaticMethodID(env, theActivityThreadClass, "currentActivityThread", "()Landroid/app/ActivityThread;");
    if (!currentActivityThreadMID) {
        if (debug)LOGE("[x] failed to get currentActivityThreadMID");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got currentActivityThreadMID = %p", currentActivityThreadMID);
    // get currentActivityThread obj
    jobject currentActivityThreadObj = (*env)->CallStaticObjectMethod(env, theActivityThreadClass, currentActivityThreadMID);
    if (!currentActivityThreadObj) {
        if (debug)LOGE("[x] failed to get currentActivityThreadObj.");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got currentActivityThreadObj");

    //2,获取当前Activity线程中的对象(mBoundApplication)
    jfieldID mBoundApplicationFID = (*env)->GetFieldID(env, theActivityThreadClass, "mBoundApplication", "Landroid/app/ActivityThread$AppBindData;");
    if (!mBoundApplicationFID) {
        if (debug)LOGE("[x] failed to get mBoundApplicationFID.");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got mBoundApplicationFID = %p", mBoundApplicationFID);
    jobject mBoundApplicationObj = (*env)->GetObjectField(env, currentActivityThreadObj, mBoundApplicationFID);
    if (!mBoundApplicationObj) {
        if (debug)LOGE("[x] failed to get mBoundApplicationObj.");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got mBoundApplicationObj = %p", mBoundApplicationObj);

    //3,获取第二步中得到的对象(mBoundApplication)中的对象(info LoadedApk)
    const char *mAppBindDataName = "android/app/ActivityThread$AppBindData";
    jclass mAppBindDataCls = (*env)->FindClass(env, mAppBindDataName);
    if (!mAppBindDataCls) {
        if (debug)LOGE("[x] failed to get class %s", mAppBindDataName);
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got class %s", mAppBindDataName);
    jfieldID infoFid = (*env)->GetFieldID(env, mAppBindDataCls, "info", "Landroid/app/LoadedApk;");
    if (!infoFid) {
        if (debug)LOGE("[x] failed to get infoFid");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got infoFid = %p", infoFid);
    //the object of android/app/LoadedApk
    jobject infoObj = (*env)->GetObjectField(env, mBoundApplicationObj, infoFid);
    if (!infoObj) {
        if (debug)LOGE("[x] failed to get infoObj");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got LoadedApk infoObj");

    //4,将第三步中获取的LoadedApk对象中的Application(mApplication)赋值为null
    const char *loadApkName = "android/app/LoadedApk";
    jclass theLoadedApkClass = (*env)->FindClass(env, loadApkName);
    if (!theLoadedApkClass) {
        if (debug)LOGE("[x] failed to get theLoadedApkClass");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got the LoadedApkClass");
    jfieldID mLoadApkApplicationFID = (*env)->GetFieldID(env, theLoadedApkClass, "mApplication", "Landroid/app/Application;");
    if (!mLoadApkApplicationFID) {
        if (debug)LOGE("[x] failed to get mLoadApkApplicationFID");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got mLoadApkApplicationFID");

    (*env)->SetObjectField(env, infoObj, mLoadApkApplicationFID, NULL);
    if (debug)LOGI("[x] set cur loadedApk application to null.");

    //5,获取当前Activity线程中的初始化Application对象(mInitialApplication)
    jfieldID mInitialApplicationFID = (*env)->GetFieldID(env, theActivityThreadClass, "mInitialApplication", "Landroid/app/Application;");
    if (!mInitialApplicationFID) {
        if (debug)LOGE("[x] failed to get mInitialApplicationFID");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got mInitialApplicationFID = %p", mInitialApplicationFID);
    //the object of Application
    jobject mInitialApplicationObj = (*env)->GetObjectField(env, currentActivityThreadObj, mInitialApplicationFID);
    if (!mInitialApplicationObj) {
        if (debug)LOGE("[x] failed to get mInitialApplicationObj");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got mInitialApplicationObj = %p", mInitialApplicationObj);
    //6,获取当前Activity线程中的Application集合对象(mAllApplications)
    jfieldID mAllApplicationsFID = (*env)->GetFieldID(env, theActivityThreadClass, "mAllApplications", "Ljava/util/ArrayList;");
    if (!mAllApplicationsFID) {
        if (debug)LOGE("[x] failed to get mAllApplicationsFID");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got mAllApplicationsFID = %p", mAllApplicationsFID);
    //the object of ArrayList
    jobject mAllApplicationsObj = (*env)->GetObjectField(env, currentActivityThreadObj, mAllApplicationsFID);
    if (!mAllApplicationsObj) {
        if (debug)LOGE("[x] failed to get mAllApplicationsObj");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] gotmAllApplicationsObj");
    //7,删除当前Activity线程中Application集合中的当前Activity线程中的初始化Application对象。
    const char *mArrayListName = "java/util/ArrayList";
    jclass mArrayListCls = (*env)->FindClass(env, mArrayListName);
    if (!mArrayListCls) {
        if (debug)LOGE("[x] failed to get mArrayListCls");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got mArrayListCls");
    jmethodID removeMID = (*env)->GetMethodID(env, mArrayListCls, "remove", "(Ljava/lang/Object;)Z");
    if (!removeMID) {
        if (debug)LOGE("[x] failed to get removeMID");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got removeMID = %p", removeMID);
    jboolean removeObj = (*env)->CallBooleanMethod(env, mAllApplicationsObj, removeMID, mInitialApplicationObj);
    if (!removeObj) {
        if (debug)LOGE("[x] failed to get removeObj");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got removeObj = %d", removeObj);

    //8,获取当前Activity线程中加载Apk的LoadedApk中的ApplicationInfo对象(mApplicationInfo),并且修改其Application对象的类名为新的Application类
    jfieldID infoApplicationInfoFID = (*env)->GetFieldID(env, theLoadedApkClass, "mApplicationInfo", "Landroid/content/pm/ApplicationInfo;");
    if (!infoApplicationInfoFID) {
        if (debug)LOGE("[x] failed to get infoApplicationInfoFID");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got infoApplicationInfoFID = %p ", infoApplicationInfoFID);
    // the object of ApplicationInfo
    jobject infoApplicationInfoObj = (*env)->GetObjectField(env, infoObj, infoApplicationInfoFID);
    if (!infoApplicationInfoObj) {
        if (debug)LOGE("[x] failed to get infoApplicationInfoObj");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got infoApplicationInfoObj = %p ", infoApplicationInfoObj);
    //9,获取当前Activity线程中AppBindData对象(mBoundApplication)中的ApplicationInfo对象(appInfo),并且修改其Application对象的类名为新的Application类
    jfieldID mBoundApplicationAppInfoFID = (*env)->GetFieldID(env, mAppBindDataCls, "appInfo", "Landroid/content/pm/ApplicationInfo;");
    if (!mBoundApplicationAppInfoFID) {
        if (debug)LOGE("[x] failed to get mBoundApplicationAppInfoFID");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got mBoundApplicationAppInfoFID = %p ", mBoundApplicationAppInfoFID);
    // the object of ApplicationInfo
    jobject mBoundApplicationAppInfoObj = (*env)->GetObjectField(env, mBoundApplicationObj, mBoundApplicationAppInfoFID);
    if (!mBoundApplicationAppInfoObj) {
        if (debug)LOGE("[x] failed to get mBoundApplicationAppInfoObj");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got mBoundApplicationAppInfoObj = %p ", mBoundApplicationAppInfoObj);
    const char *clsApplicationInfoName = "android/content/pm/ApplicationInfo";
    jclass theApplicationInfoCls = (*env)->FindClass(env, clsApplicationInfoName);
    if (!theApplicationInfoCls) {
        if (debug)LOGE("[x] failed to get theApplicationInfoCls");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got theApplicationInfoCls = %p ", theApplicationInfoCls);
    jfieldID classNameFID = (*env)->GetFieldID(env, theApplicationInfoCls, "className", "Ljava/lang/String;");
    if (!classNameFID) {
        if (debug)LOGE("[x] failed to get classNameFID");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got classNameFID = %p ", classNameFID);
    (*env)->SetObjectField(env, infoApplicationInfoObj, classNameFID, mApplicationStr);
    (*env)->SetObjectField(env, mBoundApplicationAppInfoObj, classNameFID, mApplicationStr);

    //10,调用makeApplication方法，获取当前Application
    jmethodID makeApplicationMID = (*env)->GetMethodID(env, theLoadedApkClass, "makeApplication", "(ZLandroid/app/Instrumentation;)Landroid/app/Application;");
    if (!makeApplicationMID) {
        if (debug)LOGE("[x] failed to get makeApplicationMID");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got makeApplicationMID = %p ", makeApplicationMID);
    // the object of Application, really Application.
    jobject makeApplicationObj = (*env)->CallObjectMethod(env, infoObj, makeApplicationMID, 0x0, NULL);
    if (!makeApplicationObj) {
        if (debug)LOGE("[x] failed to get makeApplicationObj");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got makeApplicationObj = %p ", makeApplicationObj);
    (*env)->SetObjectField(env, currentActivityThreadObj, mInitialApplicationFID, makeApplicationObj);

    const char *clsApplicationName = "android/app/Application";
    jclass theApplicationCls = (*env)->FindClass(env, clsApplicationName);
    if (!theApplicationCls) {
        if (debug)LOGE("[x] failed to get theApplicationCls");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got theApplicationCls = %p ", theApplicationCls);
    jmethodID onCreatedMID = (*env)->GetMethodID(env, theApplicationCls, "onCreate", "()V");
    if (!onCreatedMID) {
        if (debug)LOGE("[x] failed to get onCreatedMID");
        return JNI_VERSION_1_6;
    }
    if (debug)LOGI("[x] got onCreatedMID = %p ", onCreatedMID);
    (*env)->CallVoidMethod(env, makeApplicationObj, onCreatedMID);

    jmethodID runMID = (*env)->GetStaticMethodID(env, theAppClass, "run", "()V");
    //TODO

    if (debug)LOGI("[x] JNI_Onload end");
    return JNI_VERSION_1_6;
}


