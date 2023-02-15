pluginManagement {
    repositories {
        google()
        gradlePluginPortal()
        mavenCentral()
    }
}

rootProject.name = "MyFirstMultiplatformApp"
include(":androidApp")
include(":shared")