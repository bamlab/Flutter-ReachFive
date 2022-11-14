/// {@template flutter_reach_five.errors.email_already_in_use}
/// Error thrown when trying to signup with an already in use email
/// {@endtemplate}
class EmailAlreadyInUseException implements Exception {}

/// {@template flutter_reach_five.errors.invalid_email_or_password}
/// Error thrown when trying to login with an incorrect email or password
/// {@endtemplate}
class InvalidEmailOrPasswordException implements Exception {}

/// {@template flutter_reach_five.errors.invalid_verification_code}
/// Error thrown when trying to update your password
/// with the wrong verification code
/// {@endtemplate}
class InvalidVerificationCodeException implements Exception {}

/// {@template flutter_reach_five.errors.invalid_grant_code}
/// Error thrown when trying to do an operation with an
/// invalid access token
/// It matches a 401 http error code
/// {@endtemplate}
class InvalidGrantCodeException implements Exception {}

/// {@template flutter_reach_five.errors.user_cancelled_or_closed_the_web_flow}
/// Error thrown when an user cancelled or close the web flow
///
/// Often thrown if the user close the webview when logging in with a provider
/// {@endtemplate}
class UserCancelledOrClosedTheWebFlowCodeException implements Exception {}

/// {@template flutter_reach_five.errors.social_account_email_already_in_use}
/// Error thrown when an user tried to login with a social provider
/// But its email is already in use by another mean of connection
/// {@endtemplate}
class SocialAccountEmailAlreadyInUseException implements Exception {}
