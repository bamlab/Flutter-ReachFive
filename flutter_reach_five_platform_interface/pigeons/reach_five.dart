import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/reach_five.g.dart',
    javaOut:
        '../flutter_reach_five_android/android/src/main/java/tech/bam/flutter_reach_five/android/ReachFiveApi.java',
    javaOptions: JavaOptions(
      package: 'tech.bam.flutter_reach_five.android',
      className: 'ReachFiveApi',
    ),
    objcHeaderOut: '../flutter_reach_five_ios/ios/Classes/reach_five_api.h',
    objcSourceOut: '../flutter_reach_five_ios/ios/Classes/reach_five_api.m',
  ),
)
class ReachFiveConfigInterface {
  const ReachFiveConfigInterface({
    required this.domain,
    required this.clientId,
    required this.scheme,
  });

  final String domain;
  final String clientId;
  final String scheme;
}

enum ProfileAddressTypeInterface { billing, delivery }

class ProfileAddressInterface {
  const ProfileAddressInterface({
    required this.title,
    required this.isDefault,
    required this.addressType,
    required this.streetAddress,
    required this.locality,
    required this.region,
    required this.postalCode,
    required this.country,
    required this.raw,
    required this.deliveryNote,
    required this.recipient,
    required this.company,
    required this.phoneNumber,
  });

  final String? title;
  final bool? isDefault;
  final ProfileAddressTypeInterface? addressType;
  final String? streetAddress;
  final String? locality;
  final String? region;
  final String? postalCode;
  final String? country;
  final String? raw;
  final String? deliveryNote;
  final String? recipient;
  final String? company;
  final String? phoneNumber;
}

class ConsentInterface {
  const ConsentInterface({
    required this.granted,
    required this.consentType,
    required this.date,
  });

  final bool granted;
  final String? consentType;
  final String date;
}

class ProfileSignupRequestInterface {
  const ProfileSignupRequestInterface({
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.givenName,
    required this.middleName,
    required this.familyName,
    required this.name,
    required this.nickname,
    required this.birthdate,
    required this.profileURL,
    required this.picture,
    required this.username,
    required this.gender,
    required this.company,
    required this.addresses,
    required this.locale,
    required this.bio,
    required this.customFields,
    required this.consents,
    required this.liteOnly,
  });

  final String password;
  final String email;
  final String? phoneNumber;
  final String? givenName;
  final String? middleName;
  final String? familyName;
  final String? name;
  final String? nickname;
  final String? birthdate;
  final String? profileURL;
  final String? picture;
  final String? username;
  final String? gender;
  final String? company;
  final List<ProfileAddressInterface?>? addresses;
  final String? locale;
  final String? bio;
  final Map<String?, Object?>? customFields;
  final Map<String?, ConsentInterface?>? consents;
  final bool? liteOnly;
}

class SignupRequestInterface {
  const SignupRequestInterface({
    required this.config,
    required this.profile,
    required this.redirectUrl,
    required this.scope,
  });

  final ReachFiveConfigInterface config;
  final ProfileSignupRequestInterface profile;
  final String? redirectUrl;
  final List<String?>? scope;
}

class AddressInterface {
  const AddressInterface({
    required this.formatted,
    required this.streetAddress,
    required this.locality,
    required this.region,
    required this.postalCode,
    required this.country,
  });

  final String? formatted;
  final String? streetAddress;
  final String? locality;
  final String? region;
  final String? postalCode;
  final String? country;
}

class OpenIdUserInterface {
  const OpenIdUserInterface({
    required this.id,
    required this.name,
    required this.preferredUsername,
    required this.givenName,
    required this.familyName,
    required this.middleName,
    required this.nickname,
    required this.picture,
    required this.website,
    required this.email,
    required this.emailVerified,
    required this.gender,
    required this.zoneinfo,
    required this.locale,
    required this.phoneNumber,
    required this.phoneNumberVerified,
    required this.address,
    required this.birthdate,
    required this.externalId,
  });

  final String? id;
  final String? name;
  final String? preferredUsername;
  final String? givenName;
  final String? familyName;
  final String? middleName;
  final String? nickname;
  final String? picture;
  final String? website;
  final String? email;
  final bool? emailVerified;
  final String? gender;
  final String? zoneinfo;
  final String? locale;
  final String? phoneNumber;
  final bool? phoneNumberVerified;
  final AddressInterface? address;
  final String? birthdate;
  final String? externalId;
}

class AuthTokenInterface {
  const AuthTokenInterface({
    required this.idToken,
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });

  final String? idToken;
  final String accessToken;
  final String? refreshToken;
  final String? tokenType;
  final int? expiresIn;
  final OpenIdUserInterface? user;
}

@HostApi()
abstract class ReachFiveHostApi {
  @async
  ReachFiveConfigInterface initialize(ReachFiveConfigInterface config);

  @async
  AuthTokenInterface signup(SignupRequestInterface request);
}
