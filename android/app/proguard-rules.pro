# Plinteng AI proguard rules
# Flutter engine and Rive runtime are kept by default rules.

# Keep Rive native runtime classes (JNI bindings)
-keep class com.rive.** { *; }

# Keep Dart FFI symbols
-keep class io.flutter.** { *; }
-keep class com.plinteng.ai.** { *; }

# Keep annotations used by code generation
-keepattributes *Annotation*
-keepattributes Signature

# Flutter engine references Play Core deferred-component classes that are
# not bundled (we don't use deferred components); nothing calls them at runtime.
-dontwarn com.google.android.play.core.**
