import '../flutter_reach_five_platform_interface.dart';

/// List of differents error codes that will be thrown from
/// the native part
final errorCodesInterface = ErrorCodesInterface(
  emailAlreadyInUseCode: 'email_already_in_use_code',
  invalidEmailOrPasswordCode: 'invalid_email_or_password_code',
  invalidVerificationCode: 'invalid_verification_code',
  updateSamePassword: 'update_same_password',
  invalidGrant: 'invalid_grant_code',
  userCancelledOrClosedTheWebFlow: 'user_cancelled_or_closed_the_web_flow',
  socialAccountEmailAlreadyInUse: 'social_account_email_already_in_use',
  unauthorizedRefreshToken: 'unauthorized_refresh_token',
);

/// {@macro flutter_reach_five.errors.email_already_in_use}
class EmailAlreadyInUseExceptionInterface implements Exception {}

/// {@macro flutter_reach_five.errors.invalid_email_or_password}
class InvalidEmailOrPasswordExceptionInterface implements Exception {}

/// {@macro flutter_reach_five.errors.invalid_verification_code}
class InvalidVerificationCodeExceptionInterface implements Exception {}

/// {@macro flutter_reach_five.errors.update_same_password}
class UpdateSamePasswordExceptionInterface implements Exception {}

/// {@macro flutter_reach_five.errors.invalid_grant_code}
class InvalidGrantCodeExceptionInterface implements Exception {}

/// {@macro flutter_reach_five.errors.user_cancelled_or_closed_the_web_flow}
class UserCancelledOrClosedTheWebFlowCodeExceptionInterface
    implements Exception {}

/// {@macro flutter_reach_five.errors.social_account_email_already_in_use}
class SocialAccountEmailAlreadyInUseExceptionInterface implements Exception {}

/// {@macro flutter_reach_five.errors.unauthorized_refresh_token}
class UnauthorizedRefreshTokenExceptionInterface implements Exception {}
