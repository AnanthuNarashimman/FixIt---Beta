plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
    // Do NOT apply google-services plugin here — use apply() at bottom
}

android {
    namespace = "com.example.flutter_app"
    compileSdk = 35 // 🔼 Important: Use 35 for newer Firebase/Flutter plugins
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.flutter_app"
        minSdk = 23
        targetSdk = 35 // 🔼 Match compileSdk
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // ✅ Firebase BoM (Bill of Materials)
    implementation(platform("com.google.firebase:firebase-bom:33.12.0"))

    // ✅ Firebase Analytics + Auth
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-auth")
}

// ✅ Apply Google Services plugin at the bottom in Kotlin DSL
apply(plugin = "com.google.gms.google-services")
