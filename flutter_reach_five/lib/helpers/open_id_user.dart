import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/open_id_user.dart';
import 'address_converter.dart';

/// Used to be the link between the OpenIdUserInterface
/// and the OpenIdUser exported from this package
class OpenIdUserConverter {
  /// convert a OpenIdUser to a OpenIdUserInterface
  static OpenIdUserInterface toInterface(
    OpenIdUser openIdUser,
  ) {
    final address = openIdUser.address;

    return OpenIdUserInterface(
      id: openIdUser.id,
      name: openIdUser.name,
      preferredUsername: openIdUser.preferredUsername,
      givenName: openIdUser.givenName,
      familyName: openIdUser.familyName,
      middleName: openIdUser.middleName,
      nickname: openIdUser.nickname,
      picture: openIdUser.picture,
      website: openIdUser.website,
      email: openIdUser.email,
      emailVerified: openIdUser.emailVerified,
      gender: openIdUser.gender,
      zoneinfo: openIdUser.zoneinfo,
      locale: openIdUser.locale,
      phoneNumber: openIdUser.phoneNumber,
      phoneNumberVerified: openIdUser.phoneNumberVerified,
      address: address != null ? AddressConverter.toInterface(address) : null,
      birthdate: openIdUser.birthdate,
      externalId: openIdUser.externalId,
    );
  }

  /// convert a OpenIdUserInterface to a OpenIdUser
  static OpenIdUser fromInterface(
    OpenIdUserInterface openIdUserInterface,
  ) {
    final address = openIdUserInterface.address;

    return OpenIdUser(
      id: openIdUserInterface.id,
      name: openIdUserInterface.name,
      preferredUsername: openIdUserInterface.preferredUsername,
      givenName: openIdUserInterface.givenName,
      familyName: openIdUserInterface.familyName,
      middleName: openIdUserInterface.middleName,
      nickname: openIdUserInterface.nickname,
      picture: openIdUserInterface.picture,
      website: openIdUserInterface.website,
      email: openIdUserInterface.email,
      emailVerified: openIdUserInterface.emailVerified,
      gender: openIdUserInterface.gender,
      zoneinfo: openIdUserInterface.zoneinfo,
      locale: openIdUserInterface.locale,
      phoneNumber: openIdUserInterface.phoneNumber,
      phoneNumberVerified: openIdUserInterface.phoneNumberVerified,
      address: address != null ? AddressConverter.fromInterface(address) : null,
      birthdate: openIdUserInterface.birthdate,
      externalId: openIdUserInterface.externalId,
    );
  }
}
