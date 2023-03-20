//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'revoke_token_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RevokeTokenRequest {
  /// Returns a new [RevokeTokenRequest] instance.
  RevokeTokenRequest({
    required this.clientId,
    required this.clientSecret,
    required this.token,
    this.tokenTypeHint,
  });

  /// Your client ID.
  @JsonKey(name: r'client_id', required: true, includeIfNull: false)
  final String clientId;

  /// Your client Secret. Required if your Client's authorization method is POST.
  @JsonKey(name: r'client_secret', required: true, includeIfNull: false)
  final String clientSecret;

  /// The Token to revoke.  > **Note**: This can be either an `access_token` or a `refresh_token`.
  @JsonKey(name: r'token', required: true, includeIfNull: false)
  final String token;

  /// An optional string where you can hint at what type of token to differentiate between access and refresh.  > **Note**: The only meaningful values are `access_token` and `refresh_token`.
  @JsonKey(name: r'token_type_hint', required: false, includeIfNull: false)
  final String? tokenTypeHint;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RevokeTokenRequest &&
          other.clientId == clientId &&
          other.clientSecret == clientSecret &&
          other.token == token &&
          other.tokenTypeHint == tokenTypeHint;

  @override
  int get hashCode =>
      clientId.hashCode +
      clientSecret.hashCode +
      token.hashCode +
      tokenTypeHint.hashCode;

  factory RevokeTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RevokeTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RevokeTokenRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
