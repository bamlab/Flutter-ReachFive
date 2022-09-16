import 'package:equatable/equatable.dart';

import 'consent.dart';
import 'profile_address.dart';

/// ProfileSignupRequest class, contains the infos for the profile
/// in a signUp request
class ProfileSignupRequest extends Equatable {
  /// ProfileSignupRequest default constructor
  const ProfileSignupRequest({
    required this.password,
    required this.email,
    this.phoneNumber,
    this.givenName,
    this.middleName,
    this.familyName,
    this.name,
    this.nickname,
    this.birthdate,
    this.profileURL,
    this.picture,
    this.username,
    this.gender,
    this.company,
    this.addresses,
    this.locale,
    this.bio,
    this.customFields,
    this.consents,
    this.liteOnly,
  });

  /// The user password
  final String password;

  /// The user email
  final String email;

  /// The user phoneNumber
  final String? phoneNumber;

  /// The user givenName
  final String? givenName;

  /// The user middleName
  final String? middleName;

  /// The user familyName
  final String? familyName;

  /// The user name
  final String? name;

  /// The user nickname
  final String? nickname;

  /// The user birthdate
  final String? birthdate;

  /// The user profileURL
  final String? profileURL;

  /// The user picture
  final String? picture;

  /// The user username
  final String? username;

  /// The user gender
  final String? gender;

  /// The user company
  final String? company;

  /// The user addresses
  final List<ProfileAddress>? addresses;

  /// The user locale
  final String? locale;

  /// The user bio
  final String? bio;

  /// TODO: find the customFields we can put in here / Only on Android for now
  final Map<String, Object?>? customFields;

  /// TODO: find the consents we can put in here
  final Map<String, Consent>? consents;

  /// TODO: find exactly what's this option do
  final bool? liteOnly;

  @override
  List<Object?> get props => [
        password,
        email,
        phoneNumber,
        givenName,
        middleName,
        familyName,
        name,
        nickname,
        birthdate,
        profileURL,
        picture,
        username,
        gender,
        company,
        addresses,
        locale,
        bio,
        customFields,
        consents,
        liteOnly,
      ];
}
