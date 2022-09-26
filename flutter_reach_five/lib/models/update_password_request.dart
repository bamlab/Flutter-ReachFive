import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_token.dart';

part 'update_password_request.freezed.dart';

@freezed

/// Update password request
class UpdatePasswordRequest with _$UpdatePasswordRequest {
  /// Update password request model using an access token and the old password
  const factory UpdatePasswordRequest.withAccessToken({
    required AuthToken authToken,
    required String oldPassword,
    required String newPassword,
  }) = UpdatePasswordRequestWithAccessToken;

  /// Update password request model using a fresh access token (less than 5 minutes old)
  const factory UpdatePasswordRequest.withFreshAccessToken({
    required AuthToken freshAuthToken,
    required String newPassword,
  }) = UpdatePasswordRequestWithFreshAccessToken;

  /// Update password request model using an email and a verificationCode
  const factory UpdatePasswordRequest.withEmail({
    required String email,
    required String verificationCode,
    required String newPassword,
  }) = UpdatePasswordRequestWithEmail;

  /// Update password request model using a phoneNumber and a verificationCode
  const factory UpdatePasswordRequest.withPhoneNumber({
    required String phoneNumber,
    required String verificationCode,
    required String newPassword,
  }) = UpdatePasswordRequestWithPhoneNumber;
}
