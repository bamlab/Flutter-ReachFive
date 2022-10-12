import '../flutter_reach_five_platform_interface.dart';

/// List of differents error codes that will be thrown from
/// the native part
final errorCodesInterface = ErrorCodesInterface(
  emailAlreadyInUseCode: 'email_already_in_use_code',
  invalidEmailOrPasswordCode: 'invalid_email_or_password_code',
  invalidVerificationCode: 'invalid_verification_code',
);

/// Error thrown when trying to signup with an already in use email
class EmailAlreadyInUseException implements Exception {}

/// Error thrown when trying to login with an incorrect email or password
class InvalidEmailOrPasswordException implements Exception {}

/// Error thrown when trying to update your password
/// with the wrong verification code
class InvalidVerificationCodeException implements Exception {}
