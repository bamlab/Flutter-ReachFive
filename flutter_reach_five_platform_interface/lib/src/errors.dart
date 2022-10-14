import '../flutter_reach_five_platform_interface.dart';

/// List of differents error codes that will be thrown from
/// the native part
final errorCodesInterface = ErrorCodesInterface(
  emailAlreadyInUseCode: 'email_already_in_use_code',
  invalidEmailOrPasswordCode: 'invalid_email_or_password_code',
  invalidVerificationCode: 'invalid_verification_code',
);

/// {@macro flutter_reach_five.reachFiveManager.errors.email_already_in_use}
class EmailAlreadyInUseExceptionInterface implements Exception {}

/// {@macro flutter_reach_five.reachFiveManager.errors.invalid_email_or_password}
class InvalidEmailOrPasswordExceptionInterface implements Exception {}

/// {@macro flutter_reach_five.reachFiveManager.errors.invalid_verification_code}
class InvalidVerificationCodeExceptionInterface implements Exception {}
