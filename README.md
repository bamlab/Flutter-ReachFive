# Flutter-ReachFive

---

## Android

Prerequisites:

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

## iOS

Prerequisites:

- In your `ios/Podfile`, update your ios sdk version :

```rb
platform :ios, '13.0'
```

---

## About ReachFive

This sdk is the flutter interface implementation of the [android](https://github.com/ReachFive/identity-android-sdk) and [ios](https://github.com/ReachFive/identity-ios-sdk) sdks of ReachFive

If you want more informations about ReachFive, here is their [website](https://www.reachfive.com/)

---

## 👉 About Bam

We are a 100 people company developing and designing multiplatform applications with [React Native](https://www.bam.tech/expertise/react-native) and [Flutter](https://www.bam.tech/expertise/flutter) using the Lean & Agile methodology. To get more information on the solutions that would suit your needs, feel free to get in touch by [email](mailto://contact@bam.tech) or through [contact form](https://www.bam.tech/contact)!

We will always answer you with pleasure 😁
