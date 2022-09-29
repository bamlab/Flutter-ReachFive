//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'delete_phone_number_credential_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeletePhoneNumberCredentialRequest {
  /// Returns a new [DeletePhoneNumberCredentialRequest] instance.
  DeletePhoneNumberCredentialRequest({
    required this.phoneNumber,
  });

  /// The phone number used as a second factor. It doesn't have to be the same than the identifier.
  @JsonKey(name: r'phone_number', required: true, includeIfNull: false)
  final String phoneNumber;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeletePhoneNumberCredentialRequest &&
          other.phoneNumber == phoneNumber;

  @override
  int get hashCode => phoneNumber.hashCode;

  factory DeletePhoneNumberCredentialRequest.fromJson(
          Map<String, dynamic> json) =>
      _$DeletePhoneNumberCredentialRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeletePhoneNumberCredentialRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
