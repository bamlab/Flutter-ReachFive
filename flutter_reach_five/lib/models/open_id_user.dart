import 'package:equatable/equatable.dart';

import './address.dart';

/// [OpenIdUser] class, contains the infos for a open id user
class OpenIdUser extends Equatable {
  /// [OpenIdUser] default constructor
  const OpenIdUser({
    this.id,
    this.name,
    this.preferredUsername,
    this.givenName,
    this.familyName,
    this.middleName,
    this.nickname,
    this.picture,
    this.website,
    this.email,
    this.emailVerified,
    this.gender,
    this.zoneinfo,
    this.locale,
    this.phoneNumber,
    this.phoneNumberVerified,
    this.address,
    this.birthdate,
    this.externalId,
  });

  /// Your user id
  final String? id;

  /// Your user name
  final String? name;

  /// Your user preferredUsername
  final String? preferredUsername;

  /// Your user givenName
  final String? givenName;

  /// Your user familyName
  final String? familyName;

  /// Your user middleName
  final String? middleName;

  /// Your user nickname
  final String? nickname;

  /// Your user picture
  final String? picture;

  /// Your user website
  final String? website;

  /// Your user email
  final String? email;

  /// Is your user email verified
  final bool? emailVerified;

  /// Your user gender
  final String? gender;

  /// Your user zoneinfo
  final String? zoneinfo;

  /// Your user locale
  final String? locale;

  /// Your user phoneNumber
  final String? phoneNumber;

  /// Is your user phoneNumber verified
  final bool? phoneNumberVerified;

  /// Your user [Address]
  final Address? address;

  /// Your user birthdate
  final String? birthdate;

  /// Your user externalId
  final String? externalId;

  @override
  List<Object?> get props => [
        id,
        name,
        preferredUsername,
        givenName,
        familyName,
        middleName,
        nickname,
        picture,
        website,
        email,
        emailVerified,
        gender,
        zoneinfo,
        locale,
        phoneNumber,
        phoneNumberVerified,
        address,
        birthdate,
        externalId,
      ];
}
