# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView withScheduler JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#facebook
-keepclassmembers class * implements java.io.Serializable {
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

-keep class com.facebook.FacebookSdk {
   boolean isInitialized();
}

-keep class com.facebook.appevents.AppEventsLogger {
   com.facebook.appevents.AppEventsLogger newLogger(android.content.Context);
   void logSdkEvent(java.lang.String, java.lang.Double, android.os.Bundle);
}

-keepnames class com.facebook.FacebookActivity
-keepnames class com.facebook.CustomTabActivity

-keep class com.facebook.login.Login

#Camera kit
-dontwarn com.google.android.gms.**

#avi loading
-keep class com.wang.avi.** { *; }
-keep class com.wang.avi.indicators.** { *; }
-keep class com.stripe.android.** { *; }

# Ignore EventBus
-keepattributes *Annotation*
-keepclassmembers class * {
    @org.greenrobot.eventbus.Subscribe <methods>;
}

# Ignore Appsflyer
-dontwarn com.android.installreferrer
-dontwarn com.appsflyer.*

-optimizations !code/simplification/arithmetic,!code/simplification/cast,!field/*,!class/merging/*
-optimizationpasses 5
-allowaccessmodification
-dontpreverify
-dontobfuscate
-forceprocessing

# The remainder of this file is identical to the non-optimized version
# of the Proguard configuration file (except that the other file has
# flags to turn off optimization).
-dontusemixedcaseclassnames
-dontskipnonpubliclibraryclasses
-verbose
-keepattributes *Annotation*
-keep public class com.google.vending.licensing.ILicensingService
-keep public class com.android.vending.licensing.ILicensingService

# Annotations
-dontwarn javax.annotation.**
-dontwarn javax.inject.**
-dontwarn sun.misc.Unsafe

# For native methods, see http://proguard.sourceforge.net/manual/examples.html#native
-keepclasseswithmembernames class * {
    native <methods>;
}

# keep setters in Views so that animations can still work.
# see http://proguard.sourceforge.net/manual/examples.html#beans
-keepclassmembers public class * extends android.view.View {
   void set*(***);
   *** get*();
}

# We want to keep methods in Activity that could be used in the XML attribute onClick
-keepclassmembers class * extends android.app.Activity {
   public void *(android.view.View);
}

# For enumeration classes, see http://proguard.sourceforge.net/manual/examples.html#enumerations
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-keepclassmembers class * implements android.os.Parcelable {
  public static final android.os.Parcelable$Creator CREATOR;
}
-keepclassmembers class **.R$* {
    public static <fields>;
}

# The support library contains references to newer platform versions.
# Don't warn about those in case this app is linking against an older
# platform version.  We know about them, and they are safe.
-dontwarn android.support.**

# Databinding
-dontwarn android.databinding.**
-keep class android.databinding.** { *; }

# appCompatV7
-keep public class android.support.v7.widget.** { *; }
-keep public class android.support.v7.internal.widget.** { *; }
-keep public class android.support.v7.internal.view.menu.** { *; }

-keep public class * extends android.support.v4.view.ActionProvider {
    public <init>(android.content.Context);
}

# RecyclerView
-keep class android.support.v7.widget.RecyclerView
-keep public class * extends android.support.v7.widget.RecyclerView$LayoutManager {
    public <init>(...);
}

# --------------------------------------------------------------------
# Square OkHttp
# --------------------------------------------------------------------
# https://github.com/levelup/Android-HttpClient/blob/master/HttpClient-OkHttp/proguard-project.txt
-keepnames class com.levelup.http.okhttp.** { *; }
-keepnames interface com.levelup.http.okhttp.** { *; }
-keepnames class com.squareup.okhttp.** { *; }
-keepnames interface com.squareup.okhttp.** { *; }

-dontwarn java.nio.file.**
-dontwarn com.squareup.okhttp.internal.http.*
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement

# --------------------------------------------------------------------
# Square Retrofit (uses GSON)
# --------------------------------------------------------------------
# https://github.com/square/retrofit/issues/372
-keepattributes Signature
-keepattributes *Annotation*

-dontwarn rx.**
-keep class com.google.gson.** { *; }
-keep class com.google.inject.* { *; }
-keep class org.apache.http.* { *; }
-keep class org.apache.james.mime4j.* { *; }
-keep class javax.inject.* { *; }
-keep class retrofit.* { *; }
-keep class sun.misc.Unsafe { *; }

-keep class retrofit.** { *; }
-keepclasseswithmembers class * {
    @retrofit.http.* <methods>;
}

-dontwarn retrofit.appengine.**

# Retrofit 2.X
## https://square.github.io/retrofit/ ##
-dontwarn retrofit2.**
-keep class retrofit2.** { *; }
-keepattributes Signature
-keepattributes Exceptions

-keepclasseswithmembers class * {
    @retrofit2.http.* <methods>;
}

# GSON
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.stream.** { *; }

# RxJava
-keep class rx.schedulers.Schedulers {
    public static <methods>;
}
-keep class rx.schedulers.ImmediateScheduler {
    public <methods>;
}
-keep class rx.schedulers.TestScheduler {
    public <methods>;
}
-keep class rx.schedulers.Schedulers {
    public static ** test();
}
-keepclassmembers class rx.internal.util.unsafe.*ArrayQueue*Field* {
    long producerIndex;
    long consumerIndex;
}
-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueProducerNodeRef {
    long producerNode;
    long consumerNode;
}

# Glide
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}

# Log
-assumenosideeffects class android.util.Log {
    public static *** v(...);
    public static *** d(...);
    public static *** i(...);
    public static *** w(...);
    public static *** e(...);
}

# Dagger ProGuard rules.
# https://github.com/square/dagger
-dontwarn com.google.errorprone.annotations.*
-dontwarn dagger.internal.codegen.**
-keepclassmembers,allowobfuscation class * {
    @javax.inject.* *;
    @dagger.* *;
    <init>();
}

-keep class dagger.* { *; }
-keep class javax.inject.* { *; }
-keep class * extends dagger.internal.Binding
-keep class * extends dagger.internal.ModuleAdapter
-keep class * extends dagger.internal.StaticInjection

# AndroidAnnotations
-dontwarn org.androidannotations.api.rest.**

-dontwarn com.squareup.okhttp.**

# Android support design
-dontwarn android.support.design.**
-keep class android.support.design.** { *; }
-keep interface android.support.design.** { *; }
-keep public class android.support.design.R$* { *; }

-keepclassmembers class ** {
@org.greenrobot.eventbus.Subscribe <methods>;
}

-keep enum org.greenrobot.eventbus.ThreadMode { *; }

# Only required if you use AsyncExecutor
-keepclassmembers class * extends     org.greenrobot.eventbus.util.ThrowableFailureEvent {
<init>(java.lang.Throwable);
}

# Crashlytics
-keep class com.crashlytics.** { *; }
-keep class com.crashlytics.android.**
-keepattributes SourceFile, LineNumberTable, *Annotation*


# Google GMS
-keep class * extends java.util.ListResourceBundle {
    protected Object[][] getContents();
}

-keep public class com.google.android.gms.common.internal.safeparcel.SafeParcelable {
    public static final *** NULL;
}

-keepnames @com.google.android.gms.common.annotation.KeepName class *
-keepclassmembernames class * {
    @com.google.android.gms.common.annotation.KeepName *;
}

# OkHttp
-keepattributes Signature
-keepattributes *Annotation*
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

# Cheers project
-dontwarn com.cheers.style.**


