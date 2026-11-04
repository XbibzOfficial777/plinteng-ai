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
