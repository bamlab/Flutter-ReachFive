# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2024-12-26

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`flutter_reach_five` - `v0.7.2`](#flutter_reach_five---v072)
 - [`flutter_reach_five_android` - `v0.5.1`](#flutter_reach_five_android---v051)
 - [`flutter_reach_five_ios` - `v0.4.2`](#flutter_reach_five_ios---v042)
 - [`flutter_reach_five_platform_interface` - `v0.4.2`](#flutter_reach_five_platform_interface---v042)
 - [`reach_five_identity_repo` - `v0.5.1`](#reach_five_identity_repo---v051)

---

#### `flutter_reach_five` - `v0.7.2`

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

#### `flutter_reach_five_android` - `v0.5.1`

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

#### `flutter_reach_five_ios` - `v0.4.2`

 - **REFACTOR**(platform interface): rename error exception classes.
 - **REFACTOR**(ios flutterreachfiveplugin): remove redundant return.
 - **REFACTOR**(ios converters): remove redondant return.
 - **REFACTOR**(ios converters): extract addressTypeFromInterface.
 - **REFACTOR**(ios): use ReachFiveKeyInterface.
 - **REFACTOR**(pigeon): add ReachFiveKeyInterface.
 - **FIX**(ios converters): use liteOnly variable.
 - **FIX**(changelog): use correct versions.
 - **FIX**(profilesignuprequest): make email optional.
 - **FEAT**(ios): handle unauthorize refresh token exception.
 - **FEAT**(package): add a proper error for unauthorized refresh token.
 - **FEAT**: add error handling for updateSamePassword error in iOS.
 - **FEAT**: add UpdateSamePassword exception to interface.
 - **FEAT**(ios): add refreshAccessToken method.
 - **FEAT**(ios): add signup method.
 - **FEAT**(ios): initialize reachFive.
 - **DOCS**(all_packages): link differents documentations.
 - **DOCS**(every packages): complete readme files.

#### `flutter_reach_five_platform_interface` - `v0.4.2`

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

#### `reach_five_identity_repo` - `v0.5.1`

 - **REFACTOR**(reach_five_repo): rename in reach_five_identity_repo.
 - **FIX**: correct version for identity repo.
 - **FEAT**: add custom local for send email endpoint.

