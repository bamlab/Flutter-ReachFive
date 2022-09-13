# Flutter-ReachFive

---

# Android

---

Prerequisites:

---

- In your `android/app/build.gradle`, update your `minSdkVersion` in your default config :

```gradle
defaultConfig {
        // others configs
        minSdkVersion 21
    }
```

- In your `android/app/src/main/AndroidManifest.xml`, add these lines :

```xml
<manifest>
    <!-- others lines... -->
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.USE_CREDENTIALS" />
</manifest>
```

---

# iOS

---

Prerequisites:

---

- In your `ios/Podfile`, update your ios sdk version :

```rb
platform :ios, '13.0'
```

---
