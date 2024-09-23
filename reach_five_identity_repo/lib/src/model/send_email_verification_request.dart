//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'send_email_verification_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SendEmailVerificationRequest {
  /// Returns a new [SendEmailVerificationRequest] instance.
  SendEmailVerificationRequest({
    this.redirectUrl,
    this.returnToAfterEmailConfirmation,
  });

  /// The URL sent in the verification email to which the profile is redirected. This URL must be whitelisted in the `Allowed Callback URLs` field of your ReachFive client settings.
  @JsonKey(name: r'redirect_url', required: false, includeIfNull: false)
  final String? redirectUrl;

  /// Returned in the `redirect_url` as a query parameter, this parameter is used as the post-email confirmation URL. It must be a valid URL.
  @JsonKey(
      name: r'return_to_after_email_confirmation',
      required: false,
      includeIfNull: false)
  final String? returnToAfterEmailConfirmation;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SendEmailVerificationRequest &&
          other.redirectUrl == redirectUrl &&
          other.returnToAfterEmailConfirmation ==
              returnToAfterEmailConfirmation;

  @override
  int get hashCode =>
      redirectUrl.hashCode + returnToAfterEmailConfirmation.hashCode;

  factory SendEmailVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$SendEmailVerificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailVerificationRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
