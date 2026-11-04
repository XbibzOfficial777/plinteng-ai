// Top-level build file. Plugin versions live in settings.gradle.kts.
// Redirects the Android build output to the Flutter standard ../build dir.
rootProject.layout.buildDirectory.value(
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
)
