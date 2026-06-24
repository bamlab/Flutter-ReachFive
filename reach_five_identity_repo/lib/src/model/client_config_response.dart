//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:reach_five_identity_repo/src/model/password_policy_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_config_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientConfigResponse {
  /// Returns a new [ClientConfigResponse] instance.
  ClientConfigResponse({this.passwordPolicy});

  /// The password policy configured for the client.
  @JsonKey(name: r'password_policy', required: false, includeIfNull: false)
  final PasswordPolicyResponse? passwordPolicy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientConfigResponse && other.passwordPolicy == passwordPolicy;

  @override
  int get hashCode => passwordPolicy.hashCode;

  factory ClientConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClientConfigResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
