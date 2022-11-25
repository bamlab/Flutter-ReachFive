import 'package:equatable/equatable.dart';

import 'consent.dart';
import 'emails.dart';
import 'login_summary.dart';
import 'profile_address.dart';

/// [Profile] class, contains the infos of an user
class Profile extends Equatable {
  /// [Profile] default constructor
  const Profile({
    this.uid,
    this.givenName,
    this.middleName,
    this.familyName,
    this.name,
    this.nickname,
    this.birthdate,
    this.profileURL,
    this.picture,
    this.externalId,
    this.authTypes,
    this.loginSummary,
    this.username,
    this.gender,
    this.email,
    this.emailVerified,
    this.emails,
    this.phoneNumber,
    this.phoneNumberVerified,
    this.addresses,
    this.locale,
    this.bio,
    this.customFields,
    this.consents,
    this.createdAt,
    this.updatedAt,
    this.liteOnly,
    this.company,
  });

  /// The user id
  final String? uid;

  /// The user given name
  final String? givenName;

  /// The user middle name
  final String? middleName;

  /// The user family name
  final String? familyName;

  /// The user name
  final String? name;

  /// The user nickname
  final String? nickname;

  /// The user birthdate
  final String? birthdate;

  /// The user profile url
  final String? profileURL;

  /// The user picture
  final String? picture;

  /// The user external id
  final String? externalId;

  /// The user list of authentification types
  final List<String>? authTypes;

  /// The user [LoginSummary]
  final LoginSummary? loginSummary;

  /// The user username
  final String? username;

  /// The user gender
  final String? gender;

  /// The user email
  final String? email;

  /// Used to check if an user [email] is verified or not
  final bool? emailVerified;

  /// The user list of verified/unverified emails
  final Emails? emails;

  /// The user phone number
  final String? phoneNumber;

  /// Used to check if an user [phoneNumber] is verified or not
  final bool? phoneNumberVerified;

  /// The user list of addresses
  final List<ProfileAddress>? addresses;

  /// The user locale
  final String? locale;

  /// The user bio
  final String? bio;

  /// The custom fields linked to your user
  /// It must match the ones you have created in your reachFive console
  final Map<String, Object?>? customFields;

  /// The user consents
  // TODO: find the consents we can put in here
  final Map<String, Consent>? consents;

  /// The time the user's profile was created
  final String? createdAt;

  /// The last time the user's profile was updated
  final String? updatedAt;

  /// Used to know if the user profile is lite or not
  final bool? liteOnly;

  /// The user company
  final String? company;

  @override
  List<Object?> get props => [
        uid,
        givenName,
        middleName,
        familyName,
        name,
        nickname,
        birthdate,
        profileURL,
        picture,
        externalId,
        authTypes,
        loginSummary,
        username,
        gender,
        email,
        emailVerified,
        emails,
        phoneNumber,
        phoneNumberVerified,
        addresses,
        locale,
        bio,
        customFields,
        consents,
        createdAt,
        updatedAt,
        liteOnly,
        company,
      ];
}
