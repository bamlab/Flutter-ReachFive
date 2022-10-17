import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/profile.dart';
import 'consent_converter.dart';
import 'emails_converter.dart';
import 'login_summary_converter.dart';
import 'profile_address_converter.dart';

/// Used to be the link between the [ProfileInterface]
/// and the [Profile] exported from this package
class ProfileConverter {
  /// convert a [Profile] to a [ProfileInterface]
  static ProfileInterface toInterface(
    Profile profile,
  ) {
    final loginSummary = profile.loginSummary;
    final emails = profile.emails;

    return ProfileInterface(
      uid: profile.uid,
      givenName: profile.givenName,
      middleName: profile.middleName,
      familyName: profile.familyName,
      name: profile.name,
      nickname: profile.nickname,
      birthdate: profile.birthdate,
      profileURL: profile.profileURL,
      picture: profile.picture,
      externalId: profile.externalId,
      authTypes: profile.authTypes,
      loginSummary: loginSummary != null
          ? LoginSummaryConverter.toInterface(loginSummary)
          : null,
      username: profile.username,
      gender: profile.gender,
      email: profile.email,
      emailVerified: profile.emailVerified,
      emails: emails != null ? EmailsConverter.toInterface(emails) : null,
      phoneNumber: profile.phoneNumber,
      phoneNumberVerified: profile.phoneNumberVerified,
      addresses:
          profile.addresses?.map(ProfileAddressConverter.toInterface).toList(),
      locale: profile.locale,
      bio: profile.bio,
      customFields: profile.customFields,
      consents: profile.consents?.map(
        (key, consent) => MapEntry(key, ConsentConverter.toInterface(consent)),
      ),
      createdAt: profile.createdAt,
      updatedAt: profile.updatedAt,
      liteOnly: profile.liteOnly,
      company: profile.company,
    );
  }

  /// convert a [ProfileInterface] to a [Profile]
  static Profile fromInterface(
    ProfileInterface profileInterface,
  ) {
    final loginSummary = profileInterface.loginSummary;
    final emails = profileInterface.emails;

    final profileCustomFieldsInterface = profileInterface.customFields;
    final customFieldsInterface = profileCustomFieldsInterface != null
        ? Map<String?, Object?>.from(profileCustomFieldsInterface)
        : null;
    customFieldsInterface?.removeWhere((key, _) => key == null);
    final customFields = customFieldsInterface?.cast<String, Object?>();

    final profileConsentsInterface = profileInterface.consents;
    final consentsInterface = profileConsentsInterface != null
        ? Map<String?, ConsentInterface?>.from(profileConsentsInterface)
        : null;
    consentsInterface
        ?.removeWhere((key, value) => key == null || value == null);
    final consents = consentsInterface?.cast<String, ConsentInterface>().map(
          (key, consentInterface) =>
              MapEntry(key, ConsentConverter.fromInterface(consentInterface)),
        );

    return Profile(
      uid: profileInterface.uid,
      givenName: profileInterface.givenName,
      middleName: profileInterface.middleName,
      familyName: profileInterface.familyName,
      name: profileInterface.name,
      nickname: profileInterface.nickname,
      birthdate: profileInterface.birthdate,
      profileURL: profileInterface.profileURL,
      picture: profileInterface.picture,
      externalId: profileInterface.externalId,
      authTypes: profileInterface.authTypes?.whereType<String>().toList(),
      loginSummary: loginSummary != null
          ? LoginSummaryConverter.fromInterface(loginSummary)
          : null,
      username: profileInterface.username,
      gender: profileInterface.gender,
      email: profileInterface.email,
      emailVerified: profileInterface.emailVerified,
      emails: emails != null ? EmailsConverter.fromInterface(emails) : null,
      phoneNumber: profileInterface.phoneNumber,
      phoneNumberVerified: profileInterface.phoneNumberVerified,
      addresses: profileInterface.addresses
          ?.whereType<ProfileAddressInterface>()
          .map(ProfileAddressConverter.fromInterface)
          .toList(),
      locale: profileInterface.locale,
      bio: profileInterface.bio,
      customFields: customFields,
      consents: consents,
      createdAt: profileInterface.createdAt,
      updatedAt: profileInterface.updatedAt,
      liteOnly: profileInterface.liteOnly,
      company: profileInterface.company,
    );
  }
}
