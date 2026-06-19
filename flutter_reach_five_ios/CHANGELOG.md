# 2.0.2

- **FEAT**: Handle `tooManyAttempts` error (rate limiter)
- **FIX**: Convert errors thrown by `requestPasswordReset` through `parseError`

# 2.0.1

- **FEAT**: Handle `AccountBlockedAfterMultipleLoginAttempts` error (HTTP 403)

# 2.0.0

- **BREAKING**: Update Flutter to >=3.41.0
- **FEAT**: Add Swift Package Manager support

# 1.0.0

- **BREAKING**: Update Flutter to >=3.38.0
- **BREAKING**: Replace IdentitySdkCore by Reach5 v10.0 in iOS plugin
- **BREAKING**: Replace IdentitySdkFacebook by Reach5Facebook v8.0 in iOS plugin
- **BREAKING**: Replace IdentitySdkGoogle by Reach5Google v8.0 in iOS plugin
- **REFACTOR**(ios): remove all objective-c code
- **FEAT**(ios): support UISceneDelegate
- **REFACTOR**(pigeon): update pigeon and remove nullable generic types

## 0.0.1

* TODO: Describe initial release.
