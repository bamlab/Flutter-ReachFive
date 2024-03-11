# Flutter-ReachFive

---

# Installation

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

- To use the sdk in release mode, add a file `android/app/proguard-rules.pro` with these lines :
  (Otherwise a `java.lang.NullPointerException` uncaught exception is thrown when initializing reachFive)

```pro
# We need to keep reachfive models from obfuscating otherwise there is
# serialization/deserialization errors when building your app in release mode
-keep class co.reachfive.identity.sdk.core.models.** {*;}
```

And in your `android/app/build.gradle`, add this line in your release buildTypes :

```gradle
buildTypes {
        // ...others buildTypes
        release {
            // ...others lines

            // Add this line
            proguardFiles(getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro")
        }
    }
```

---

## iOS

Prerequisites:

- In your `ios/Podfile`, update your ios sdk version :

```rb
platform :ios, '13.0'
```

- Because of an issue causing WebViewProvider session to be lost by the flutter app, you need to add this dependency override in your `ios/Podfile` :

```rb
target 'Runner' do
  use_frameworks!
  use_modular_headers!

  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
  
  # Add the next line in your Podfile to use webview providers
  pod 'IdentitySdkCore', :git => 'git@github.com:bamlab/identity-ios-sdk.git', :tag => '6.1.0.fork'
end
```

---

# Implementation login/signup with provider

---

## Android

### WebView Providers

Every providers defined in your reachFive console can be accessed through a webview in your app

To use webview providers, you need to make the following changes (according to this [doc](https://developer.reachfive.com/sdk-android/8.0.1/guides/web-based-flows.html))

You will need to add a callbackUrl, to your android and reachFive config
The url will have this form : {YOUR_SCHEME}://{YOUR_HOST}{YOUR_PATH_PREFIX}

This url must match the one given in your SdkConfig androidScheme
You must give this url in your SdkConfig androidScheme when initializing your reachFive instance

- You need to add this url in the list of authorized callback URL in your reachFive console client

- This url must match the `scheme` you give in the reachFive instance initialization

- In your `android/app/src/main/AndroidManifest.xml`, add these lines :

```xml
<manifest>
    <!-- others lines... -->
    <activity
            android:name="co.reachfive.identity.sdk.core.RedirectionActivity"
            android:screenOrientation="portrait"
            android:exported="true">
            <intent-filter android:autoVerify="true">
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data
                android:scheme="{YOUR_SCHEME}"
                android:host="{YOUR_HOST}"
                android:pathPrefix="{YOUR_PATH_PREFIX}" />
            </intent-filter>
        </activity>
</manifest>
```

### Google Native Provider

To configure the google native provider, you need to give the google provider creator in the ReachFiveManager initialization method and you need to follow these docs :

- [Android](https://developer.reachfive.com/sdk-android/8.0.1/index.html#configure-google-native-provider)

### Facebook Native Provider

To configure the facebook native provider, you need to give the facebook provider creator in the ReachFiveManager initialization method and you need to follow these docs :

- [Android](https://developer.reachfive.com/sdk-android/8.0.1/index.html#facebook-native-provider)

---

## iOS

### WebView Providers

Every providers defined in your reachFive console can be accessed through a webview in your app

To use webview providers, you need to make the following changes (according to this [doc](https://developer.reachfive.com/sdk-ios/index.html#sdk-webview))

You will need to add a callbackUrlScheme, to your ios config
The scheme will have this form : reachfive-{YOUR_CLIENTID}

You must give the iosScheme reachfive-{YOUR_CLIENTID}://callback in your SdkConfig iosScheme when initializing your reachFive instance

- You need to add this url in the list of authorized callback URL in your reachFive console client

- In your `ios/Runner/Info.plist`, add these lines :

```plist
<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>reachfive-{YOUR_CLIENTID}</string>
                <!-- Add your others reachfive client ids here if you wat multiple instances -->
				<!-- <string>reachfive-{YOUR_OTHER_CLIENT_ID}</string> -->
			</array>
		</dict>
	</array>
```

### Google Native Provider

To configure the google native provider, you need to give the google provider creator in the ReachFiveManager initialization method and you need to follow these docs :

- [iOS](https://developer.reachfive.com/sdk-ios/index.html#google-native-provider)

### Facebook Native Provider

To configure the facebook native provider, you need to give the facebook provider creator in the ReachFiveManager initialization method and you need to follow these docs :

- [iOS](https://developer.reachfive.com/sdk-ios/index.html#facebook-native-provider)

---

## About ReachFive

This sdk is the flutter interface implementation of the [android](https://github.com/ReachFive/identity-android-sdk) and [ios](https://github.com/ReachFive/identity-ios-sdk) sdks of ReachFive

If you want more informations about ReachFive, here is their [website](https://www.reachfive.com/)

---

## 👉 About Bam

We are a 100 people company developing and designing multiplatform applications with [React Native](https://www.bam.tech/expertise/react-native) and [Flutter](https://www.bam.tech/expertise/flutter) using the Lean & Agile methodology. To get more information on the solutions that would suit your needs, feel free to get in touch by [email](mailto://contact@bam.tech) or through [contact form](https://www.bam.tech/contact)!

We will always answer you with pleasure 😁
