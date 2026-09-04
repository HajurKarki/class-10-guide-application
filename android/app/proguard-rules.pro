# WorkManager
-keep class androidx.work.** { *; }
-keep class * extends androidx.work.Worker
-keep class * extends androidx.work.InputMerger
-keep class * extends androidx.startup.Initializer
-keep class androidx.startup.InitializationProvider { *; }

# Flutter local notifications (if you use this plugin)
-keep class com.dexterous.** { *; }

# Firebase messaging (if you use this plugin)
-keep class com.google.firebase.messaging.** { *; }

# General AndroidX startup safety
-keep class androidx.startup.** { *; }