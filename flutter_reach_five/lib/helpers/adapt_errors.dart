import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/errors.dart';

/// method used to adapt the error from the platform interface
Never adaptErrors({
  required Object error,
  required StackTrace stackTrace,
}) {
  if (error is EmailAlreadyInUseExceptionInterface) {
    throw EmailAlreadyInUseException();
  }
  if (error is InvalidEmailOrPasswordExceptionInterface) {
    throw InvalidEmailOrPasswordException();
  }
  if (error is InvalidVerificationCodeExceptionInterface) {
    throw InvalidVerificationCodeException();
  }
  if (error is UpdateSamePasswordExceptionInterface) {
    throw UpdateSamePasswordException();
  }
  if (error is InvalidGrantCodeExceptionInterface) {
    throw InvalidGrantCodeException();
  }
  if (error is UserCancelledOrClosedTheWebFlowCodeExceptionInterface) {
    throw UserCancelledOrClosedTheWebFlowCodeException();
  }
  if (error is SocialAccountEmailAlreadyInUseExceptionInterface) {
    throw SocialAccountEmailAlreadyInUseException();
  }
  if (error is UnauthorizedRefreshTokenExceptionInterface) {
    throw UnauthorizedRefreshTokenException();
  }
  Error.throwWithStackTrace(error, stackTrace);
}
