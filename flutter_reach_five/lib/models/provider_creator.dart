/// The list of the providers creators you want to use in your app
enum ProviderCreator {
  /// Google native provider
  /// To use it, you need to configure it in your app for [Android](https://developer.reachfive.com/sdk-android/8.0.1/index.html#configure-google-native-provider) and [iOS](https://developer.reachfive.com/sdk-ios/index.html#google-native-provider)
  /// It does not work with multi-instance of reachFive, you must use google webview provider instead
  google,

  /// Facebook native provider
  /// To use it, you need to configure it in your app for [Android](https://developer.reachfive.com/sdk-android/8.0.1/index.html#facebook-native-provider) and [iOS](https://developer.reachfive.com/sdk-ios/index.html#facebook-native-provider)
  /// It does not work with multi-instance of reachFive, you must use google webview provider instead
  facebook,

  /// Webview provider
  /// It allows you to use in a webview every provider you have defined in your reachFive console
  /// If you want multi-instance of reachFive, it will allow you to use the google and facebook webviews providers
  webview
}
