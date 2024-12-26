## 0.5.1

 - **REFACTOR**(android plugin): improve result type.
 - **REFACTOR**(platform interface): rename error exception classes.
 - **REFACTOR**(android converters): extract addressTypeFromInterface.
 - **REFACTOR**(android): use ReachFiveKeyInterface.
 - **REFACTOR**(pigeon): add ReachFiveKeyInterface.
 - **REFACTOR**(android): create and use getReachFiveInstance function.
 - **FIX**(android): plugin works with AGP 8.3.0.
 - **FIX**(android): use the correct result class after pigeon update.
 - **FIX**(android): bump android sdk version that secure intent redirect.
 - **FIX**(Android parseError): use code instead of message.
 - **FIX**(android plugin): load social providers after initialization.
 - **FIX**(android): remove very_good_analysis dev dep.
 - **FIX**(changelog): use correct versions.
 - **FIX**(profilesignuprequest): make email optional.
 - **FEAT**(android): handle unauthorize refresh token exception.
 - **FEAT**(package): add a proper error for unauthorized refresh token.
 - **FEAT**: add error handling for updateSamePassword error in android.
 - **FEAT**: add UpdateSamePassword exception to interface.
 - **FEAT**(android): add signup method.
 - **FEAT**(android): initialize reachFive.
 - **DOCS**(all_packages): link differents documentations.
 - **DOCS**(every packages): complete readme files.

# 0.5.0

- **BREAKING**: On android: add support for AGP 8.3.0. Breaks compatibility with AGP 7.2.2 and below.

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

- Keep up with other packages version (nothing changed for flutter_reach_five_android)
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
