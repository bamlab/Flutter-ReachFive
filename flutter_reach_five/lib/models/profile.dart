import 'package:freezed_annotation/freezed_annotation.dart';

import 'consent.dart';
import 'emails.dart';
import 'login_summary.dart';
import 'profile_address.dart';

part 'profile.freezed.dart';

/// [Profile] class, contains the infos of an user
@freezed
class Profile with _$Profile {
  /// [Profile] default constructor
  const factory Profile({
    /// The user id
    String? uid,

    /// The user given name
    String? givenName,

    /// The user middle name
    String? middleName,

    /// The user family name
    String? familyName,

    /// The user name
    String? name,

    /// The user nickname
    String? nickname,

    /// The user birthdate
    String? birthdate,

    /// The user profile url
    String? profileURL,

    /// The user picture
    String? picture,

    /// The user external id
    String? externalId,

    /// The user list of authentication types
    List<String>? authTypes,

    /// The user [LoginSummary]
    LoginSummary? loginSummary,

    /// The user username
    String? username,

    /// The user gender
    String? gender,

    /// The user email
    String? email,

    /// Used to check if an user [email] is verified or not
    bool? emailVerified,

    /// The user list of verified/unverified emails
    Emails? emails,

    /// The user phone number
    String? phoneNumber,

    /// Used to check if an user [phoneNumber] is verified or not
    bool? phoneNumberVerified,

    /// The user list of addresses
    List<ProfileAddress>? addresses,

    /// The user locale
    String? locale,

    /// The user bio
    String? bio,

    /// The custom fields linked to your user
    /// It must match the ones you have created in your reachFive console
    Map<String, Object?>? customFields,

    /// The user consents
    // TODO: find the consents we can put in here
    Map<String, Consent>? consents,

    /// The time the user's profile was created
    String? createdAt,

    /// The last time the user's profile was updated
    String? updatedAt,

    /// Used to know if the user profile is lite or not
    bool? liteOnly,

    /// The user company
    String? company,
  }) = _Profile;
}
