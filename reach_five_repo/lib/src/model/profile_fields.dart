//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:json_annotation/json_annotation.dart';

part 'profile_fields.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ProfileFields {
  /// Returns a new [ProfileFields] instance.
  ProfileFields({
    this.email,
    this.phoneNumber,
    this.externalId,
    this.emailVerified,
    this.phoneNumberVerified,
    this.givenName,
    this.middleName,
    this.familyName,
    this.name,
    this.nickname,
    this.username,
    this.birthdate,
    this.gender,
    this.addresses,
    this.picture,
    this.company,
    this.customFields,
    this.consents,
  });

  /// Email
  @JsonKey(name: r'email', required: false, includeIfNull: false)
  final String? email;

  /// The user's phone number.
  @JsonKey(name: r'phone_number', required: false, includeIfNull: false)
  final String? phoneNumber;

  /// External ID
  @JsonKey(name: r'external_id', required: false, includeIfNull: false)
  final String? externalId;

  /// `true` if the email has been verified.
  @JsonKey(name: r'email_verified', required: false, includeIfNull: false)
  final bool? emailVerified;

  /// `true` if the phone number has been verified.
  @JsonKey(
      name: r'phone_number_verified', required: false, includeIfNull: false)
  final bool? phoneNumberVerified;

  /// Given name(s) or first name(s).
  @JsonKey(name: r'given_name', required: false, includeIfNull: false)
  final String? givenName;

  /// Middle name(s).
  @JsonKey(name: r'middle_name', required: false, includeIfNull: false)
  final String? middleName;

  /// Surname(s) or last name(s).
  @JsonKey(name: r'family_name', required: false, includeIfNull: false)
  final String? familyName;

  /// Full user name.
  @JsonKey(name: r'name', required: false, includeIfNull: false)
  final String? name;

  /// Casual name that may or may not be the same as the `given_name`.
  @JsonKey(name: r'nickname', required: false, includeIfNull: false)
  final String? nickname;

  /// Username
  @JsonKey(name: r'username', required: false, includeIfNull: false)
  final String? username;

  /// User’s birthdate, represented as an ISO 8601 YYYY-MM-DD format.
  @JsonKey(name: r'birthdate', required: false, includeIfNull: false)
  final String? birthdate;

  /// User’s gender.
  @JsonKey(name: r'gender', required: false, includeIfNull: false)
  final ProfileFieldsGenderEnum? gender;

  /// User postal addresses.
  @JsonKey(name: r'addresses', required: false, includeIfNull: false)
  final Object? addresses;

  /// URL to the profile picture
  @JsonKey(name: r'picture', required: false, includeIfNull: false)
  final String? picture;

  /// User company name.
  @JsonKey(name: r'company', required: false, includeIfNull: false)
  final String? company;

  /// Custom fields.
  @JsonKey(name: r'custom_fields', required: false, includeIfNull: false)
  final Object? customFields;

  /// Consents.
  @JsonKey(name: r'consents', required: false, includeIfNull: false)
  final Object? consents;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileFields &&
          other.email == email &&
          other.phoneNumber == phoneNumber &&
          other.externalId == externalId &&
          other.emailVerified == emailVerified &&
          other.phoneNumberVerified == phoneNumberVerified &&
          other.givenName == givenName &&
          other.middleName == middleName &&
          other.familyName == familyName &&
          other.name == name &&
          other.nickname == nickname &&
          other.username == username &&
          other.birthdate == birthdate &&
          other.gender == gender &&
          other.addresses == addresses &&
          other.picture == picture &&
          other.company == company &&
          other.customFields == customFields &&
          other.consents == consents;

  @override
  int get hashCode =>
      email.hashCode +
      phoneNumber.hashCode +
      externalId.hashCode +
      emailVerified.hashCode +
      phoneNumberVerified.hashCode +
      givenName.hashCode +
      middleName.hashCode +
      familyName.hashCode +
      name.hashCode +
      nickname.hashCode +
      username.hashCode +
      birthdate.hashCode +
      gender.hashCode +
      addresses.hashCode +
      picture.hashCode +
      company.hashCode +
      customFields.hashCode +
      consents.hashCode;

  factory ProfileFields.fromJson(Map<String, dynamic> json) =>
      _$ProfileFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileFieldsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// User’s gender.
enum ProfileFieldsGenderEnum {
  @JsonValue(r'female')
  female,
  @JsonValue(r'male')
  male,
  @JsonValue(r'other')
  other,
}
