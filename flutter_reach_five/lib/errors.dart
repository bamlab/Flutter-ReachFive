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
