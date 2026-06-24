//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'password_policy.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PasswordPolicy {
  /// Returns a new [PasswordPolicy] instance.
  PasswordPolicy({
    required this.minLength,
    required this.minStrength,
    this.specialCharacters,
    this.uppercaseCharacters,
    this.lowercaseCharacters,
    this.digitCharacters,
    required this.allowUpdateWithAccessTokenOnly,
  });

  /// The minimum number of characters a password must contain.
  @JsonKey(name: r'minLength', required: true, includeIfNull: false)
  final int minLength;

  /// The minimum strength a password must reach (0 to 4).
  @JsonKey(name: r'minStrength', required: true, includeIfNull: false)
  final int minStrength;

  /// The minimum number of special characters a password must contain, or `null` if not enforced.
  @JsonKey(name: r'specialCharacters', required: false, includeIfNull: false)
  final int? specialCharacters;

  /// The minimum number of uppercase characters a password must contain, or `null` if not enforced.
  @JsonKey(name: r'uppercaseCharacters', required: false, includeIfNull: false)
  final int? uppercaseCharacters;

  /// The minimum number of lowercase characters a password must contain, or `null` if not enforced.
  @JsonKey(name: r'lowercaseCharacters', required: false, includeIfNull: false)
  final int? lowercaseCharacters;

  /// The minimum number of digit characters a password must contain, or `null` if not enforced.
  @JsonKey(name: r'digitCharacters', required: false, includeIfNull: false)
  final int? digitCharacters;

  /// Whether the password can be updated with only an access token (without the old password).
  @JsonKey(
    name: r'allowUpdateWithAccessTokenOnly',
    required: true,
    includeIfNull: false,
  )
  final bool allowUpdateWithAccessTokenOnly;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordPolicy &&
          other.minLength == minLength &&
          other.minStrength == minStrength &&
          other.specialCharacters == specialCharacters &&
          other.uppercaseCharacters == uppercaseCharacters &&
          other.lowercaseCharacters == lowercaseCharacters &&
          other.digitCharacters == digitCharacters &&
          other.allowUpdateWithAccessTokenOnly ==
              allowUpdateWithAccessTokenOnly;

  @override
  int get hashCode =>
      minLength.hashCode +
      minStrength.hashCode +
      specialCharacters.hashCode +
      uppercaseCharacters.hashCode +
      lowercaseCharacters.hashCode +
      digitCharacters.hashCode +
      allowUpdateWithAccessTokenOnly.hashCode;

  factory PasswordPolicy.fromJson(Map<String, dynamic> json) =>
      _$PasswordPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordPolicyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
