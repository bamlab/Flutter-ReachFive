## 0.4.2

 - **REFACTOR**(platform interface): rename error exception classes.
 - **REFACTOR**(platform): use ReachFiveKeyInterface.
 - **REFACTOR**(pigeon): add ReachFiveKeyInterface.
 - **REFACTOR**(platform interface test): extract ReachFiveConfigInterface.
 - **FIX**(platform errors): use correct docs links.
 - **FIX**(platform interface): fix typo in readme.
 - **FIX**(errors): export new errors from reach five main package.
 - **FIX**(changelog): use correct versions.
 - **FIX**(pigeon): format after file generation.
 - **FIX**(profilesignuprequest): make email optional.
 - **FEAT**(package): add a proper error for unauthorized refresh token.
 - **FEAT**: add UpdateSamePassword exception to interface.
 - **FEAT**(platform_interface): add refreshAccessToken method.
 - **FEAT**(platform interface): add signup method.
 - **DOCS**(all_packages): link differents documentations.
 - **DOCS**(every packages): complete readme files.

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

- Keep up with other packages version (nothing changed for flutter_reach_five_platform_interface)
  - 🍏 Add support for basic Custom Fields on iOS. String definitely works (int, double and bool should work too, but are not in the example app)

# 0.1.5

- Add Custom Error when user try to social login but the email is already in use

# 0.1.4

- Add Custom Error when user cancel auth web flow

# 0.1.3

- Add UpdateProfile function

# 0.1.2

- Keep up to date with others packages release

# 0.1.1

- Add Error parsing

# 0.1.0

- Initial release.
