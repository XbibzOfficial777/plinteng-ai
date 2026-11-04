// Top-level build file. Plugin versions live in settings.gradle.kts.

rootProject.layout.buildDirectory.value(
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
)

subprojects {
    project.layout.buildDirectory.value(
        rootProject.layout.buildDirectory
            .dir(project.name)
            .get()
    )
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
