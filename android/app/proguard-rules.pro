# Flutter 엔진 관련 코드 보존
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.app.** { *; }

# MainActivity 보존 (네 앱의 진입점)
-keep class com.yunseo.remindmeApp.MainActivity { *; }

# 모든 FlutterActivity 확장 클래스 보존
-keep class * extends io.flutter.embedding.android.FlutterActivity { *; }