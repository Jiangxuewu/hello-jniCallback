#include <jni.h>

jbyteArray httpReq(JNIEnv *env, const char *content, const char *host, const int port);
jint downFile(JNIEnv *env, const char *url, const char *fileName, const char * path);

JNIEXPORT jbyteArray JNICALL
Java_com_bb_1sz_ndk_http_Http_socket(JNIEnv *env, jobject instance, jstring content_, jstring host_, jint port) {
    const char *content = (*env)->GetStringUTFChars(env, content_, 0);
    const char *host = (*env)->GetStringUTFChars(env, host_, 0);

    jbyteArray bytes = httpReq(env, content, host, port);

    (*env)->ReleaseStringUTFChars(env, content_, content);
    (*env)->ReleaseStringUTFChars(env, host_, host);

    return bytes;
}

JNIEXPORT jint JNICALL
Java_com_bb_1sz_ndk_http_Http_download(JNIEnv *env, jclass type, jstring url_, jstring fileName_, jstring localPath_) {
    const char *url = (*env)->GetStringUTFChars(env, url_, 0);
    const char *fileName = (*env)->GetStringUTFChars(env, fileName_, 0);
    const char *localPath = (*env)->GetStringUTFChars(env, localPath_, 0);

    // TODO

    (*env)->ReleaseStringUTFChars(env, url_, url);
    (*env)->ReleaseStringUTFChars(env, fileName_, fileName);
    (*env)->ReleaseStringUTFChars(env, localPath_, localPath);
    return 0;
}
