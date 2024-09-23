//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'send_email_verification200_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SendEmailVerification200Response {
  /// Returns a new [SendEmailVerification200Response] instance.
  SendEmailVerification200Response({
    this.verificationEmailSent,
  });

  /// Whether the email was sent (`false` if the email address was already verified)
  @JsonKey(
      name: r'verification_email_sent', required: false, includeIfNull: false)
  final bool? verificationEmailSent;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SendEmailVerification200Response &&
          other.verificationEmailSent == verificationEmailSent;

  @override
  int get hashCode => verificationEmailSent.hashCode;

  factory SendEmailVerification200Response.fromJson(
          Map<String, dynamic> json) =>
      _$SendEmailVerification200ResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SendEmailVerification200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
