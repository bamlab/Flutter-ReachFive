# 1.0.0

- **BREAKING**: Update Flutter to >=3.38.0
- **BREAKING**: Replace IdentitySdkCore by Reach5 v10.0 in iOS plugin
- **BREAKING**: Replace IdentitySdkFacebook by Reach5Facebook v8.0 in iOS plugin
- **BREAKING**: Replace IdentitySdkGoogle by Reach5Google v8.0 in iOS plugin
- **REFACTOR**(ios): remove all objective-c code
- **FEAT**(ios): support UISceneDelegate
- **REFACTOR**(pigeon): update pigeon and remove nullable generic types
- **REFACTOR**(android): remove all java code

## 0.8.0

> Note: This release has breaking changes.

 - **REFACTOR**(reach_five): use modern switch statement instead of map syntax.
 - **FEAT**(reach_five): deprecate RevokeTokenType "map" extension.
 - **BREAKING** **FEAT**(reach_five): update freezed to v3 and custom_lint to v0.8.

## 0.7.2

 - **REFACTOR**(reach_five): cleaner API.
 - **REFACTOR**(android): clean build file structure.
 - **FIX**(example): R8 after APG 8+.
 - **FIX**: fix iOS version for reach five sdk.
 - **FIX**: add missing brackets.
 - **FEAT**: add a custom locale to the send verification email method.
 - **FEAT**(public reachfive): sendEmailVerif cleaner API.
 - **FEAT**(reach5): expose sendEmailVerification.
 - **FEAT**(reach_five): add emailApi.
 - **FEAT**(package): parse the unauthorize refresh token exception.
 - **FEAT**(package): add a proper error for unauthorized refresh token.
 - **FEAT**: add UpdateSamePassword exception to interface.

# 0.7.1

- **Fix**: Update android dependencie.

# 0.7.0

- **BREAKING**: On android: add support for AGP 8.3.0. Breaks compatibility with AGP 7.2.2 and below.

# 0.6.0

- **FEAT**: In the API of sendEmailVerification, instead of taking `authorization: 'Bearer $accessToken'` as a parameter, it now takes `accessToken: accessToken` to formats the header internally.

# 0.5.0

- **FEAT**: Add a method to handle user email verification

# 0.4.1

- **FEAT**: Add a custom exception thrown when the refresh token is not valid anymore

# 0.4.0

- **BREAKING**: Update Android SDK version to 9.1.0 and iOS SDK version to 6.1.0

# 0.3.0

- **BREAKING**: Add Custom Error when user try to update password with the same password

# 0.2.1

- **FIX**: Secure intent redirection on Android
- **CHORE**: Update dev dependencies

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
