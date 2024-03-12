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
class ErrorCodesInterface {
  const ErrorCodesInterface({
    required this.emailAlreadyInUseCode,
    required this.invalidEmailOrPasswordCode,
    required this.invalidVerificationCode,
    required this.updateSamePassword,
    required this.invalidGrant,
    required this.userCancelledOrClosedTheWebFlow,
    required this.socialAccountEmailAlreadyInUse,
    required this.unauthorizedRefreshToken,
  });

  final String emailAlreadyInUseCode;
  final String invalidEmailOrPasswordCode;
  final String invalidVerificationCode;
  final String updateSamePassword;
  final String invalidGrant;
  final String userCancelledOrClosedTheWebFlow;
  final String socialAccountEmailAlreadyInUse;
  final String unauthorizedRefreshToken;
}

class SdkConfigInterface {
  const SdkConfigInterface({
    required this.domain,
    required this.clientId,
    required this.androidScheme,
    required this.iosScheme,
  });

  final String domain;
  final String clientId;
  final String androidScheme;
  final String iosScheme;
}

enum ProviderCreatorTypeInterface { google, facebook, webview }

class ProviderCreatorInterface {
  const ProviderCreatorInterface({required this.type});

  final ProviderCreatorTypeInterface type;
}

class ReachFiveKeyInterface {
  const ReachFiveKeyInterface({
    required this.sdkConfig,
    required this.providerCreators,
  });

  final SdkConfigInterface sdkConfig;
  final List<ProviderCreatorInterface?> providerCreators;
}

class ReachFiveConfigInterface {
  const ReachFiveConfigInterface({
    required this.reachFiveKey,
    required this.providers,
  });

  final ReachFiveKeyInterface reachFiveKey;
  final List<String?> providers;
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
  final String? email;
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
    required this.reachFiveKey,
    required this.profile,
    required this.redirectUrl,
    required this.scope,
    required this.errorCodes,
  });

  final ReachFiveKeyInterface reachFiveKey;
  final ProfileSignupRequestInterface profile;
  final String? redirectUrl;
  final List<String?>? scope;
  final ErrorCodesInterface errorCodes;
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

class LoginWithPasswordRequestInterface {
  const LoginWithPasswordRequestInterface({
    required this.reachFiveKey,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.scope,
    required this.errorCodes,
  });

  final ReachFiveKeyInterface reachFiveKey;
  final String? email;
  final String? phoneNumber;
  final String password;
  final List<String?>? scope;
  final ErrorCodesInterface errorCodes;
}

class LoginWithProviderRequestInterface {
  const LoginWithProviderRequestInterface({
    required this.reachFiveKey,
    required this.provider,
    required this.origin,
    required this.scope,
    required this.errorCodes,
  });

  final ReachFiveKeyInterface reachFiveKey;
  final String provider;
  final String origin;
  final List<String?>? scope;
  final ErrorCodesInterface errorCodes;
}

class RefreshAccessTokenRequestInterface {
  const RefreshAccessTokenRequestInterface({
    required this.reachFiveKey,
    required this.authToken,
    required this.errorCodes,
  });

  final ReachFiveKeyInterface reachFiveKey;
  final AuthTokenInterface authToken;
  final ErrorCodesInterface errorCodes;
}

class LoginSummaryInterface {
  const LoginSummaryInterface({
    required this.firstLogin,
    required this.lastLogin,
    required this.total,
    required this.origins,
    required this.devices,
    required this.lastProvider,
  });

  final double? firstLogin;
  final double? lastLogin;
  final int? total;
  final List<String?>? origins;
  final List<String?>? devices;
  final String? lastProvider;
}

class EmailsInterface {
  const EmailsInterface({
    required this.verified,
    required this.unverified,
  });

  final List<String?>? verified;
  final List<String?>? unverified;
}

class ProfileInterface {
  const ProfileInterface({
    required this.uid,
    required this.givenName,
    required this.middleName,
    required this.familyName,
    required this.name,
    required this.nickname,
    required this.birthdate,
    required this.profileURL,
    required this.picture,
    required this.externalId,
    required this.authTypes,
    required this.loginSummary,
    required this.username,
    required this.gender,
    required this.email,
    required this.emailVerified,
    required this.emails,
    required this.phoneNumber,
    required this.phoneNumberVerified,
    required this.addresses,
    required this.locale,
    required this.bio,
    required this.customFields,
    required this.consents,
    required this.createdAt,
    required this.updatedAt,
    required this.liteOnly,
    required this.company,
  });

  final String? uid;
  final String? givenName;
  final String? middleName;
  final String? familyName;
  final String? name;
  final String? nickname;
  final String? birthdate;
  final String? profileURL;
  final String? picture;
  final String? externalId;
  final List<String?>? authTypes;
  final LoginSummaryInterface? loginSummary;
  final String? username;
  final String? gender;
  final String? email;
  final bool? emailVerified;
  final EmailsInterface? emails;
  final String? phoneNumber;
  final bool? phoneNumberVerified;
  final List<ProfileAddressInterface?>? addresses;
  final String? locale;
  final String? bio;
  final Map<String?, Object?>? customFields;
  final Map<String?, ConsentInterface?>? consents;
  final String? createdAt;
  final String? updatedAt;
  final bool? liteOnly;
  final String? company;
}

class GetProfileRequestInterface {
  const GetProfileRequestInterface({
    required this.reachFiveKey,
    required this.authToken,
    required this.errorCodes,
  });

  final ReachFiveKeyInterface reachFiveKey;
  final AuthTokenInterface authToken;
  final ErrorCodesInterface errorCodes;
}

class UpdateProfileRequestInterface {
  const UpdateProfileRequestInterface({
    required this.reachFiveKey,
    required this.authToken,
    required this.profile,
    required this.errorCodes,
  });

  final ReachFiveKeyInterface reachFiveKey;
  final AuthTokenInterface authToken;
  final ProfileInterface profile;
  final ErrorCodesInterface errorCodes;
}

class RequestPasswordResetRequestInterface {
  const RequestPasswordResetRequestInterface({
    required this.reachFiveKey,
    required this.email,
    required this.phoneNumber,
    required this.redirectUrl,
  });

  final ReachFiveKeyInterface reachFiveKey;
  final String? email;
  final String? phoneNumber;
  final String? redirectUrl;
}

class UpdatePasswordWithAccessTokenRequestInterface {
  const UpdatePasswordWithAccessTokenRequestInterface({
    required this.reachFiveKey,
    required this.authToken,
    required this.oldPassword,
    required this.password,
  });

  final ReachFiveKeyInterface reachFiveKey;
  final AuthTokenInterface authToken;
  final String oldPassword;
  final String password;
}

class UpdatePasswordWithFreshAccessTokenRequestInterface {
  const UpdatePasswordWithFreshAccessTokenRequestInterface({
    required this.reachFiveKey,
    required this.freshAuthToken,
    required this.password,
  });

  final ReachFiveKeyInterface reachFiveKey;
  final AuthTokenInterface freshAuthToken;
  final String password;
}

class UpdatePasswordWithEmailRequestInterface {
  const UpdatePasswordWithEmailRequestInterface({
    required this.reachFiveKey,
    required this.email,
    required this.verificationCode,
    required this.password,
    required this.errorCodes,
  });

  final ReachFiveKeyInterface reachFiveKey;
  final String email;
  final String verificationCode;
  final String password;
  final ErrorCodesInterface errorCodes;
}

class UpdatePasswordWithPhoneNumberRequestInterface {
  const UpdatePasswordWithPhoneNumberRequestInterface({
    required this.reachFiveKey,
    required this.phoneNumber,
    required this.verificationCode,
    required this.password,
    required this.errorCodes,
  });

  final ReachFiveKeyInterface reachFiveKey;
  final String phoneNumber;
  final String verificationCode;
  final String password;
  final ErrorCodesInterface errorCodes;
}

@HostApi()
abstract class ReachFiveHostApi {
  @async
  ReachFiveConfigInterface initialize(ReachFiveKeyInterface reachFiveKey);

  @async
  AuthTokenInterface signup(SignupRequestInterface request);

  @async
  AuthTokenInterface loginWithPassword(
    LoginWithPasswordRequestInterface request,
  );

  @async
  AuthTokenInterface loginWithProvider(
    LoginWithProviderRequestInterface request,
  );

  @async
  void logout(ReachFiveKeyInterface reachFiveKey);

  @async
  ProfileInterface getProfile(
    GetProfileRequestInterface request,
  );

  @async
  ProfileInterface updateProfile(
    UpdateProfileRequestInterface request,
  );

  @async
  AuthTokenInterface refreshAccessToken(
    RefreshAccessTokenRequestInterface request,
  );

  @async
  void requestPasswordReset(RequestPasswordResetRequestInterface request);

  @async
  void updatePasswordWithAccessToken(
    UpdatePasswordWithAccessTokenRequestInterface request,
  );

  @async
  void updatePasswordWithFreshAccessToken(
    UpdatePasswordWithFreshAccessTokenRequestInterface request,
  );

  @async
  void updatePasswordWithEmail(
    UpdatePasswordWithEmailRequestInterface request,
  );

  @async
  void updatePasswordWithPhoneNumber(
    UpdatePasswordWithPhoneNumberRequestInterface request,
  );
}
