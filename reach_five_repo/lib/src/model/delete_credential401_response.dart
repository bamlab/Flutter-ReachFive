//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'delete_credential401_response.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeleteCredential401Response {
  /// Returns a new [DeleteCredential401Response] instance.
  DeleteCredential401Response({
    this.error,
    this.errorDescription,
    this.errorId,
    this.errorMessageKey,
    this.errorUserMsg,
  });

  /// Technical error code
  @JsonKey(name: r'error', required: false, includeIfNull: false)
  final String? error;

  /// Source of error
  @JsonKey(name: r'error_description', required: false, includeIfNull: false)
  final String? errorDescription;

  /// Generated error ID
  @JsonKey(name: r'error_id', required: false, includeIfNull: false)
  final String? errorId;

  /// Message error
  @JsonKey(name: r'error_message_key', required: false, includeIfNull: false)
  final String? errorMessageKey;

  /// User-friendly message error
  @JsonKey(name: r'error_user_msg', required: false, includeIfNull: false)
  final String? errorUserMsg;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeleteCredential401Response &&
          other.error == error &&
          other.errorDescription == errorDescription &&
          other.errorId == errorId &&
          other.errorMessageKey == errorMessageKey &&
          other.errorUserMsg == errorUserMsg;

  @override
  int get hashCode =>
      error.hashCode +
      errorDescription.hashCode +
      errorId.hashCode +
      errorMessageKey.hashCode +
      errorUserMsg.hashCode;

  factory DeleteCredential401Response.fromJson(Map<String, dynamic> json) =>
      _$DeleteCredential401ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCredential401ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
