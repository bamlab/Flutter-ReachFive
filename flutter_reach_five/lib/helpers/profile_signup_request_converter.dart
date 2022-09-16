import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/profile_signup_request.dart';
import 'consent_converter.dart';
import 'profile_address_converter.dart';

/// Used to be the link between the [ProfileSignupRequestInterface]
/// and the [ProfileSignupRequest] exported from this package
class ProfileSignupRequestConverter {
  /// convert a [ProfileSignupRequest] to a [ProfileSignupRequestInterface]
  static ProfileSignupRequestInterface toInterface(
    ProfileSignupRequest profileSignupRequest,
  ) {
    final addresses = profileSignupRequest.addresses
        ?.map(ProfileAddressConverter.toInterface)
        .toList();

    final consents = profileSignupRequest.consents?.map(
      (key, consent) => MapEntry(key, ConsentConverter.toInterface(consent)),
    );

    return ProfileSignupRequestInterface(
      password: profileSignupRequest.password,
      email: profileSignupRequest.email,
      phoneNumber: profileSignupRequest.phoneNumber,
      givenName: profileSignupRequest.givenName,
      middleName: profileSignupRequest.middleName,
      familyName: profileSignupRequest.familyName,
      name: profileSignupRequest.name,
      nickname: profileSignupRequest.nickname,
      birthdate: profileSignupRequest.birthdate,
      profileURL: profileSignupRequest.profileURL,
      picture: profileSignupRequest.picture,
      username: profileSignupRequest.username,
      gender: profileSignupRequest.gender,
      company: profileSignupRequest.company,
      addresses: addresses,
      locale: profileSignupRequest.locale,
      bio: profileSignupRequest.bio,
      customFields: profileSignupRequest.customFields,
      consents: consents,
      liteOnly: profileSignupRequest.liteOnly,
    );
  }

  /// convert a [ProfileSignupRequestInterface] to a [ProfileSignupRequest]
  static ProfileSignupRequest fromInterface(
    ProfileSignupRequestInterface profileSignupRequestInterface,
  ) {
    final addresses = profileSignupRequestInterface.addresses
        ?.where((profileAddressInterface) => profileAddressInterface != null)
        .cast<ProfileAddressInterface>()
        .map(ProfileAddressConverter.fromInterface)
        .toList();

    final customFieldsInterface = Map<String?, Object?>.from(
      profileSignupRequestInterface.customFields ?? <String?, Object?>{},
    )..removeWhere((key, _) => key == null);
    final customFields = customFieldsInterface.cast<String, Object?>();

    final consentsInterface = Map<String?, ConsentInterface?>.from(
      profileSignupRequestInterface.consents ?? <String?, ConsentInterface?>{},
    )..removeWhere((key, value) => key == null || value == null);
    final consents = consentsInterface.cast<String, ConsentInterface>().map(
          (key, consentInterface) =>
              MapEntry(key, ConsentConverter.fromInterface(consentInterface)),
        );

    return ProfileSignupRequest(
      password: profileSignupRequestInterface.password,
      email: profileSignupRequestInterface.email,
      phoneNumber: profileSignupRequestInterface.phoneNumber,
      givenName: profileSignupRequestInterface.givenName,
      middleName: profileSignupRequestInterface.middleName,
      familyName: profileSignupRequestInterface.familyName,
      name: profileSignupRequestInterface.name,
      nickname: profileSignupRequestInterface.nickname,
      birthdate: profileSignupRequestInterface.birthdate,
      profileURL: profileSignupRequestInterface.profileURL,
      picture: profileSignupRequestInterface.picture,
      username: profileSignupRequestInterface.username,
      gender: profileSignupRequestInterface.gender,
      company: profileSignupRequestInterface.company,
      addresses: addresses,
      locale: profileSignupRequestInterface.locale,
      bio: profileSignupRequestInterface.bio,
      customFields: customFields,
      consents: consents,
      liteOnly: profileSignupRequestInterface.liteOnly,
    );
  }
}
