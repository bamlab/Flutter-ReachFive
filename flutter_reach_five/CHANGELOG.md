## 0.2.1

 - **REFACTOR**: add name prop.
 - **REFACTOR**: extract it in its own file.
 - **REFACTOR**: move them in models folder.
 - **REFACTOR**: remove buttons.
 - **REFACTOR**: make arg named.
 - **REFACTOR**: extract reachFive instance.
 - **REFACTOR**: methods view take a dataSet param.
 - **REFACTOR**: make initialize an instance method.
 - **REFACTOR**: rename in reach_five_identity_repo.
 - **REFACTOR**: add instance name in success messages.
 - **REFACTOR**: use json serialization.
 - **REFACTOR**: remove useless test.
 - **REFACTOR**: use ReachFiveKey instead of config.
 - **REFACTOR**: make method arg named.
 - **FIX**: re format files.
 - **FIX**: make email optional.
 - **FIX**: make consents and customFields nullable.
 - **FIX**: use forked IdentitySdkWebView pod.
 - **FIX**: force analyzer version in the example package.
 - **FIX**: use correct versions.
 - **FIX**: override dependencies.
 - **FIX**: override reach_five_repo path.
 - **FIX**: remove prints.
 - **FIX**: use reachFive instance for result.
 - **FIX**: export new errors from reach five main package.
 - **FEAT**: implement updatePassword method.
 - **FEAT**: implement requestPasswordReset method.
 - **FEAT**: implement loginWithProvider method.
 - **FEAT**: parse error.
 - **FEAT**: give config to platform logout method.
 - **FEAT**: implement update profile method.
 - **FEAT**: initialize reachFive.
 - **FEAT**: handle invalid grant exception.
 - **FEAT**: add logout method.
 - **FEAT**: add loginWithPassword method.
 - **FEAT**: add user cancelled error.
 - **FEAT**: adapt social account email already in use error.
 - **FEAT**: add providers to reachFive instance.
 - **FEAT**: add new features in the app.
 - **FEAT**: add refreshAccessToken method.
 - **FEAT**: add signup method to ReachFive instance and move file/imports.
 - **FEAT**: create every needed converters.
 - **FEAT**: create every needed models.
 - **FEAT**: initialize reachFive.
 - **FEAT**: add android and ios schemes to SdkConfig.
 - **DOCS**: link differents documentations.
 - **DOCS**: improve documentation.
 - **DOCS**: complete readme files.

# 0.2.0

 - **BREAKING**: Update dio dependency to 5.0.0

# 0.1.8

- **FIX** 🤖 Update Android SDK to 8.1.1 to fix Intent Redirection warning.

# 0.1.7

- Add support for retrieving Profile with getProfile

# 0.1.6

- 🍏 Add support for basic Custom Fields on iOS. String definitely works (int, double and bool should work too, but are not in the example app)

# 0.1.5

- Add Custom Error when user try to social login but the email is already in use

# 0.1.4

- Add Custom Error when user cancel auth web flow

# 0.1.3

- Add UpdateProfile function

# 0.1.2

- Fix crash on Android release mode

# 0.1.1

- Add Error parsing

# 0.1.0

- Initial release of this plugin.
