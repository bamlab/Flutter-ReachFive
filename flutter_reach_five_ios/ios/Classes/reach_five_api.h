// Autogenerated from Pigeon (v4.0.3), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ProviderCreatorTypeInterface) {
  ProviderCreatorTypeInterfaceGoogle = 0,
  ProviderCreatorTypeInterfaceFacebook = 1,
  ProviderCreatorTypeInterfaceWebview = 2,
};

typedef NS_ENUM(NSUInteger, ProfileAddressTypeInterface) {
  ProfileAddressTypeInterfaceBilling = 0,
  ProfileAddressTypeInterfaceDelivery = 1,
};

@class ErrorCodesInterface;
@class SdkConfigInterface;
@class ProviderCreatorInterface;
@class ReachFiveKeyInterface;
@class ReachFiveConfigInterface;
@class ProfileAddressInterface;
@class ConsentInterface;
@class ProfileSignupRequestInterface;
@class SignupRequestInterface;
@class AddressInterface;
@class OpenIdUserInterface;
@class AuthTokenInterface;
@class LoginWithPasswordRequestInterface;
@class LoginWithProviderRequestInterface;
@class RefreshAccessTokenRequestInterface;
@class LoginSummaryInterface;
@class EmailsInterface;
@class ProfileInterface;
@class UpdateProfileRequestInterface;
@class RequestPasswordResetRequestInterface;
@class UpdatePasswordWithAccessTokenRequestInterface;
@class UpdatePasswordWithFreshAccessTokenRequestInterface;
@class UpdatePasswordWithEmailRequestInterface;
@class UpdatePasswordWithPhoneNumberRequestInterface;

@interface ErrorCodesInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithEmailAlreadyInUseCode:(NSString *)emailAlreadyInUseCode
    invalidEmailOrPasswordCode:(NSString *)invalidEmailOrPasswordCode
    invalidVerificationCode:(NSString *)invalidVerificationCode
    invalidGrant:(NSString *)invalidGrant
    userCancelledOrClosedTheWebFlow:(NSString *)userCancelledOrClosedTheWebFlow
    socialAccountEmailAlreadyInUse:(NSString *)socialAccountEmailAlreadyInUse;
@property(nonatomic, copy) NSString * emailAlreadyInUseCode;
@property(nonatomic, copy) NSString * invalidEmailOrPasswordCode;
@property(nonatomic, copy) NSString * invalidVerificationCode;
@property(nonatomic, copy) NSString * invalidGrant;
@property(nonatomic, copy) NSString * userCancelledOrClosedTheWebFlow;
@property(nonatomic, copy) NSString * socialAccountEmailAlreadyInUse;
@end

@interface SdkConfigInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithDomain:(NSString *)domain
    clientId:(NSString *)clientId
    androidScheme:(NSString *)androidScheme
    iosScheme:(NSString *)iosScheme;
@property(nonatomic, copy) NSString * domain;
@property(nonatomic, copy) NSString * clientId;
@property(nonatomic, copy) NSString * androidScheme;
@property(nonatomic, copy) NSString * iosScheme;
@end

@interface ProviderCreatorInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithType:(ProviderCreatorTypeInterface)type;
@property(nonatomic, assign) ProviderCreatorTypeInterface type;
@end

@interface ReachFiveKeyInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithSdkConfig:(SdkConfigInterface *)sdkConfig
    providerCreators:(NSArray<ProviderCreatorInterface *> *)providerCreators;
@property(nonatomic, strong) SdkConfigInterface * sdkConfig;
@property(nonatomic, strong) NSArray<ProviderCreatorInterface *> * providerCreators;
@end

@interface ReachFiveConfigInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey
    providers:(NSArray<NSString *> *)providers;
@property(nonatomic, strong) ReachFiveKeyInterface * reachFiveKey;
@property(nonatomic, strong) NSArray<NSString *> * providers;
@end

@interface ProfileAddressInterface : NSObject
+ (instancetype)makeWithTitle:(nullable NSString *)title
    isDefault:(nullable NSNumber *)isDefault
    addressType:(ProfileAddressTypeInterface)addressType
    streetAddress:(nullable NSString *)streetAddress
    locality:(nullable NSString *)locality
    region:(nullable NSString *)region
    postalCode:(nullable NSString *)postalCode
    country:(nullable NSString *)country
    raw:(nullable NSString *)raw
    deliveryNote:(nullable NSString *)deliveryNote
    recipient:(nullable NSString *)recipient
    company:(nullable NSString *)company
    phoneNumber:(nullable NSString *)phoneNumber;
@property(nonatomic, copy, nullable) NSString * title;
@property(nonatomic, strong, nullable) NSNumber * isDefault;
@property(nonatomic, assign) ProfileAddressTypeInterface addressType;
@property(nonatomic, copy, nullable) NSString * streetAddress;
@property(nonatomic, copy, nullable) NSString * locality;
@property(nonatomic, copy, nullable) NSString * region;
@property(nonatomic, copy, nullable) NSString * postalCode;
@property(nonatomic, copy, nullable) NSString * country;
@property(nonatomic, copy, nullable) NSString * raw;
@property(nonatomic, copy, nullable) NSString * deliveryNote;
@property(nonatomic, copy, nullable) NSString * recipient;
@property(nonatomic, copy, nullable) NSString * company;
@property(nonatomic, copy, nullable) NSString * phoneNumber;
@end

@interface ConsentInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithGranted:(NSNumber *)granted
    consentType:(nullable NSString *)consentType
    date:(NSString *)date;
@property(nonatomic, strong) NSNumber * granted;
@property(nonatomic, copy, nullable) NSString * consentType;
@property(nonatomic, copy) NSString * date;
@end

@interface ProfileSignupRequestInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithPassword:(NSString *)password
    email:(nullable NSString *)email
    phoneNumber:(nullable NSString *)phoneNumber
    givenName:(nullable NSString *)givenName
    middleName:(nullable NSString *)middleName
    familyName:(nullable NSString *)familyName
    name:(nullable NSString *)name
    nickname:(nullable NSString *)nickname
    birthdate:(nullable NSString *)birthdate
    profileURL:(nullable NSString *)profileURL
    picture:(nullable NSString *)picture
    username:(nullable NSString *)username
    gender:(nullable NSString *)gender
    company:(nullable NSString *)company
    addresses:(nullable NSArray<ProfileAddressInterface *> *)addresses
    locale:(nullable NSString *)locale
    bio:(nullable NSString *)bio
    customFields:(nullable NSDictionary<NSString *, id> *)customFields
    consents:(nullable NSDictionary<NSString *, ConsentInterface *> *)consents
    liteOnly:(nullable NSNumber *)liteOnly;
@property(nonatomic, copy) NSString * password;
@property(nonatomic, copy, nullable) NSString * email;
@property(nonatomic, copy, nullable) NSString * phoneNumber;
@property(nonatomic, copy, nullable) NSString * givenName;
@property(nonatomic, copy, nullable) NSString * middleName;
@property(nonatomic, copy, nullable) NSString * familyName;
@property(nonatomic, copy, nullable) NSString * name;
@property(nonatomic, copy, nullable) NSString * nickname;
@property(nonatomic, copy, nullable) NSString * birthdate;
@property(nonatomic, copy, nullable) NSString * profileURL;
@property(nonatomic, copy, nullable) NSString * picture;
@property(nonatomic, copy, nullable) NSString * username;
@property(nonatomic, copy, nullable) NSString * gender;
@property(nonatomic, copy, nullable) NSString * company;
@property(nonatomic, strong, nullable) NSArray<ProfileAddressInterface *> * addresses;
@property(nonatomic, copy, nullable) NSString * locale;
@property(nonatomic, copy, nullable) NSString * bio;
@property(nonatomic, strong, nullable) NSDictionary<NSString *, id> * customFields;
@property(nonatomic, strong, nullable) NSDictionary<NSString *, ConsentInterface *> * consents;
@property(nonatomic, strong, nullable) NSNumber * liteOnly;
@end

@interface SignupRequestInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey
    profile:(ProfileSignupRequestInterface *)profile
    redirectUrl:(nullable NSString *)redirectUrl
    scope:(nullable NSArray<NSString *> *)scope
    errorCodes:(ErrorCodesInterface *)errorCodes;
@property(nonatomic, strong) ReachFiveKeyInterface * reachFiveKey;
@property(nonatomic, strong) ProfileSignupRequestInterface * profile;
@property(nonatomic, copy, nullable) NSString * redirectUrl;
@property(nonatomic, strong, nullable) NSArray<NSString *> * scope;
@property(nonatomic, strong) ErrorCodesInterface * errorCodes;
@end

@interface AddressInterface : NSObject
+ (instancetype)makeWithFormatted:(nullable NSString *)formatted
    streetAddress:(nullable NSString *)streetAddress
    locality:(nullable NSString *)locality
    region:(nullable NSString *)region
    postalCode:(nullable NSString *)postalCode
    country:(nullable NSString *)country;
@property(nonatomic, copy, nullable) NSString * formatted;
@property(nonatomic, copy, nullable) NSString * streetAddress;
@property(nonatomic, copy, nullable) NSString * locality;
@property(nonatomic, copy, nullable) NSString * region;
@property(nonatomic, copy, nullable) NSString * postalCode;
@property(nonatomic, copy, nullable) NSString * country;
@end

@interface OpenIdUserInterface : NSObject
+ (instancetype)makeWithId:(nullable NSString *)id
    name:(nullable NSString *)name
    preferredUsername:(nullable NSString *)preferredUsername
    givenName:(nullable NSString *)givenName
    familyName:(nullable NSString *)familyName
    middleName:(nullable NSString *)middleName
    nickname:(nullable NSString *)nickname
    picture:(nullable NSString *)picture
    website:(nullable NSString *)website
    email:(nullable NSString *)email
    emailVerified:(nullable NSNumber *)emailVerified
    gender:(nullable NSString *)gender
    zoneinfo:(nullable NSString *)zoneinfo
    locale:(nullable NSString *)locale
    phoneNumber:(nullable NSString *)phoneNumber
    phoneNumberVerified:(nullable NSNumber *)phoneNumberVerified
    address:(nullable AddressInterface *)address
    birthdate:(nullable NSString *)birthdate
    externalId:(nullable NSString *)externalId;
@property(nonatomic, copy, nullable) NSString * id;
@property(nonatomic, copy, nullable) NSString * name;
@property(nonatomic, copy, nullable) NSString * preferredUsername;
@property(nonatomic, copy, nullable) NSString * givenName;
@property(nonatomic, copy, nullable) NSString * familyName;
@property(nonatomic, copy, nullable) NSString * middleName;
@property(nonatomic, copy, nullable) NSString * nickname;
@property(nonatomic, copy, nullable) NSString * picture;
@property(nonatomic, copy, nullable) NSString * website;
@property(nonatomic, copy, nullable) NSString * email;
@property(nonatomic, strong, nullable) NSNumber * emailVerified;
@property(nonatomic, copy, nullable) NSString * gender;
@property(nonatomic, copy, nullable) NSString * zoneinfo;
@property(nonatomic, copy, nullable) NSString * locale;
@property(nonatomic, copy, nullable) NSString * phoneNumber;
@property(nonatomic, strong, nullable) NSNumber * phoneNumberVerified;
@property(nonatomic, strong, nullable) AddressInterface * address;
@property(nonatomic, copy, nullable) NSString * birthdate;
@property(nonatomic, copy, nullable) NSString * externalId;
@end

@interface AuthTokenInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithIdToken:(nullable NSString *)idToken
    accessToken:(NSString *)accessToken
    refreshToken:(nullable NSString *)refreshToken
    tokenType:(nullable NSString *)tokenType
    expiresIn:(nullable NSNumber *)expiresIn
    user:(nullable OpenIdUserInterface *)user;
@property(nonatomic, copy, nullable) NSString * idToken;
@property(nonatomic, copy) NSString * accessToken;
@property(nonatomic, copy, nullable) NSString * refreshToken;
@property(nonatomic, copy, nullable) NSString * tokenType;
@property(nonatomic, strong, nullable) NSNumber * expiresIn;
@property(nonatomic, strong, nullable) OpenIdUserInterface * user;
@end

@interface LoginWithPasswordRequestInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey
    email:(nullable NSString *)email
    phoneNumber:(nullable NSString *)phoneNumber
    password:(NSString *)password
    scope:(nullable NSArray<NSString *> *)scope
    errorCodes:(ErrorCodesInterface *)errorCodes;
@property(nonatomic, strong) ReachFiveKeyInterface * reachFiveKey;
@property(nonatomic, copy, nullable) NSString * email;
@property(nonatomic, copy, nullable) NSString * phoneNumber;
@property(nonatomic, copy) NSString * password;
@property(nonatomic, strong, nullable) NSArray<NSString *> * scope;
@property(nonatomic, strong) ErrorCodesInterface * errorCodes;
@end

@interface LoginWithProviderRequestInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey
    provider:(NSString *)provider
    origin:(NSString *)origin
    scope:(nullable NSArray<NSString *> *)scope
    errorCodes:(ErrorCodesInterface *)errorCodes;
@property(nonatomic, strong) ReachFiveKeyInterface * reachFiveKey;
@property(nonatomic, copy) NSString * provider;
@property(nonatomic, copy) NSString * origin;
@property(nonatomic, strong, nullable) NSArray<NSString *> * scope;
@property(nonatomic, strong) ErrorCodesInterface * errorCodes;
@end

@interface RefreshAccessTokenRequestInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey
    authToken:(AuthTokenInterface *)authToken;
@property(nonatomic, strong) ReachFiveKeyInterface * reachFiveKey;
@property(nonatomic, strong) AuthTokenInterface * authToken;
@end

@interface LoginSummaryInterface : NSObject
+ (instancetype)makeWithFirstLogin:(nullable NSNumber *)firstLogin
    lastLogin:(nullable NSNumber *)lastLogin
    total:(nullable NSNumber *)total
    origins:(nullable NSArray<NSString *> *)origins
    devices:(nullable NSArray<NSString *> *)devices
    lastProvider:(nullable NSString *)lastProvider;
@property(nonatomic, strong, nullable) NSNumber * firstLogin;
@property(nonatomic, strong, nullable) NSNumber * lastLogin;
@property(nonatomic, strong, nullable) NSNumber * total;
@property(nonatomic, strong, nullable) NSArray<NSString *> * origins;
@property(nonatomic, strong, nullable) NSArray<NSString *> * devices;
@property(nonatomic, copy, nullable) NSString * lastProvider;
@end

@interface EmailsInterface : NSObject
+ (instancetype)makeWithVerified:(nullable NSArray<NSString *> *)verified
    unverified:(nullable NSArray<NSString *> *)unverified;
@property(nonatomic, strong, nullable) NSArray<NSString *> * verified;
@property(nonatomic, strong, nullable) NSArray<NSString *> * unverified;
@end

@interface ProfileInterface : NSObject
+ (instancetype)makeWithUid:(nullable NSString *)uid
    givenName:(nullable NSString *)givenName
    middleName:(nullable NSString *)middleName
    familyName:(nullable NSString *)familyName
    name:(nullable NSString *)name
    nickname:(nullable NSString *)nickname
    birthdate:(nullable NSString *)birthdate
    profileURL:(nullable NSString *)profileURL
    picture:(nullable NSString *)picture
    externalId:(nullable NSString *)externalId
    authTypes:(nullable NSArray<NSString *> *)authTypes
    loginSummary:(nullable LoginSummaryInterface *)loginSummary
    username:(nullable NSString *)username
    gender:(nullable NSString *)gender
    email:(nullable NSString *)email
    emailVerified:(nullable NSNumber *)emailVerified
    emails:(nullable EmailsInterface *)emails
    phoneNumber:(nullable NSString *)phoneNumber
    phoneNumberVerified:(nullable NSNumber *)phoneNumberVerified
    addresses:(nullable NSArray<ProfileAddressInterface *> *)addresses
    locale:(nullable NSString *)locale
    bio:(nullable NSString *)bio
    customFields:(nullable NSDictionary<NSString *, id> *)customFields
    consents:(nullable NSDictionary<NSString *, ConsentInterface *> *)consents
    createdAt:(nullable NSString *)createdAt
    updatedAt:(nullable NSString *)updatedAt
    liteOnly:(nullable NSNumber *)liteOnly
    company:(nullable NSString *)company;
@property(nonatomic, copy, nullable) NSString * uid;
@property(nonatomic, copy, nullable) NSString * givenName;
@property(nonatomic, copy, nullable) NSString * middleName;
@property(nonatomic, copy, nullable) NSString * familyName;
@property(nonatomic, copy, nullable) NSString * name;
@property(nonatomic, copy, nullable) NSString * nickname;
@property(nonatomic, copy, nullable) NSString * birthdate;
@property(nonatomic, copy, nullable) NSString * profileURL;
@property(nonatomic, copy, nullable) NSString * picture;
@property(nonatomic, copy, nullable) NSString * externalId;
@property(nonatomic, strong, nullable) NSArray<NSString *> * authTypes;
@property(nonatomic, strong, nullable) LoginSummaryInterface * loginSummary;
@property(nonatomic, copy, nullable) NSString * username;
@property(nonatomic, copy, nullable) NSString * gender;
@property(nonatomic, copy, nullable) NSString * email;
@property(nonatomic, strong, nullable) NSNumber * emailVerified;
@property(nonatomic, strong, nullable) EmailsInterface * emails;
@property(nonatomic, copy, nullable) NSString * phoneNumber;
@property(nonatomic, strong, nullable) NSNumber * phoneNumberVerified;
@property(nonatomic, strong, nullable) NSArray<ProfileAddressInterface *> * addresses;
@property(nonatomic, copy, nullable) NSString * locale;
@property(nonatomic, copy, nullable) NSString * bio;
@property(nonatomic, strong, nullable) NSDictionary<NSString *, id> * customFields;
@property(nonatomic, strong, nullable) NSDictionary<NSString *, ConsentInterface *> * consents;
@property(nonatomic, copy, nullable) NSString * createdAt;
@property(nonatomic, copy, nullable) NSString * updatedAt;
@property(nonatomic, strong, nullable) NSNumber * liteOnly;
@property(nonatomic, copy, nullable) NSString * company;
@end

@interface UpdateProfileRequestInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey
    authToken:(AuthTokenInterface *)authToken
    profile:(ProfileInterface *)profile
    errorCodes:(ErrorCodesInterface *)errorCodes;
@property(nonatomic, strong) ReachFiveKeyInterface * reachFiveKey;
@property(nonatomic, strong) AuthTokenInterface * authToken;
@property(nonatomic, strong) ProfileInterface * profile;
@property(nonatomic, strong) ErrorCodesInterface * errorCodes;
@end

@interface RequestPasswordResetRequestInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey
    email:(nullable NSString *)email
    phoneNumber:(nullable NSString *)phoneNumber
    redirectUrl:(nullable NSString *)redirectUrl;
@property(nonatomic, strong) ReachFiveKeyInterface * reachFiveKey;
@property(nonatomic, copy, nullable) NSString * email;
@property(nonatomic, copy, nullable) NSString * phoneNumber;
@property(nonatomic, copy, nullable) NSString * redirectUrl;
@end

@interface UpdatePasswordWithAccessTokenRequestInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey
    authToken:(AuthTokenInterface *)authToken
    oldPassword:(NSString *)oldPassword
    password:(NSString *)password;
@property(nonatomic, strong) ReachFiveKeyInterface * reachFiveKey;
@property(nonatomic, strong) AuthTokenInterface * authToken;
@property(nonatomic, copy) NSString * oldPassword;
@property(nonatomic, copy) NSString * password;
@end

@interface UpdatePasswordWithFreshAccessTokenRequestInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey
    freshAuthToken:(AuthTokenInterface *)freshAuthToken
    password:(NSString *)password;
@property(nonatomic, strong) ReachFiveKeyInterface * reachFiveKey;
@property(nonatomic, strong) AuthTokenInterface * freshAuthToken;
@property(nonatomic, copy) NSString * password;
@end

@interface UpdatePasswordWithEmailRequestInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey
    email:(NSString *)email
    verificationCode:(NSString *)verificationCode
    password:(NSString *)password
    errorCodes:(ErrorCodesInterface *)errorCodes;
@property(nonatomic, strong) ReachFiveKeyInterface * reachFiveKey;
@property(nonatomic, copy) NSString * email;
@property(nonatomic, copy) NSString * verificationCode;
@property(nonatomic, copy) NSString * password;
@property(nonatomic, strong) ErrorCodesInterface * errorCodes;
@end

@interface UpdatePasswordWithPhoneNumberRequestInterface : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey
    phoneNumber:(NSString *)phoneNumber
    verificationCode:(NSString *)verificationCode
    password:(NSString *)password
    errorCodes:(ErrorCodesInterface *)errorCodes;
@property(nonatomic, strong) ReachFiveKeyInterface * reachFiveKey;
@property(nonatomic, copy) NSString * phoneNumber;
@property(nonatomic, copy) NSString * verificationCode;
@property(nonatomic, copy) NSString * password;
@property(nonatomic, strong) ErrorCodesInterface * errorCodes;
@end

/// The codec used by ReachFiveHostApi.
NSObject<FlutterMessageCodec> *ReachFiveHostApiGetCodec(void);

@protocol ReachFiveHostApi
- (void)initializeReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey completion:(void(^)(ReachFiveConfigInterface *_Nullable, FlutterError *_Nullable))completion;
- (void)signupRequest:(SignupRequestInterface *)request completion:(void(^)(AuthTokenInterface *_Nullable, FlutterError *_Nullable))completion;
- (void)loginWithPasswordRequest:(LoginWithPasswordRequestInterface *)request completion:(void(^)(AuthTokenInterface *_Nullable, FlutterError *_Nullable))completion;
- (void)loginWithProviderRequest:(LoginWithProviderRequestInterface *)request completion:(void(^)(AuthTokenInterface *_Nullable, FlutterError *_Nullable))completion;
- (void)logoutReachFiveKey:(ReachFiveKeyInterface *)reachFiveKey completion:(void(^)(FlutterError *_Nullable))completion;
- (void)updateProfileRequest:(UpdateProfileRequestInterface *)request completion:(void(^)(ProfileInterface *_Nullable, FlutterError *_Nullable))completion;
- (void)refreshAccessTokenRequest:(RefreshAccessTokenRequestInterface *)request completion:(void(^)(AuthTokenInterface *_Nullable, FlutterError *_Nullable))completion;
- (void)requestPasswordResetRequest:(RequestPasswordResetRequestInterface *)request completion:(void(^)(FlutterError *_Nullable))completion;
- (void)updatePasswordWithAccessTokenRequest:(UpdatePasswordWithAccessTokenRequestInterface *)request completion:(void(^)(FlutterError *_Nullable))completion;
- (void)updatePasswordWithFreshAccessTokenRequest:(UpdatePasswordWithFreshAccessTokenRequestInterface *)request completion:(void(^)(FlutterError *_Nullable))completion;
- (void)updatePasswordWithEmailRequest:(UpdatePasswordWithEmailRequestInterface *)request completion:(void(^)(FlutterError *_Nullable))completion;
- (void)updatePasswordWithPhoneNumberRequest:(UpdatePasswordWithPhoneNumberRequestInterface *)request completion:(void(^)(FlutterError *_Nullable))completion;
@end

extern void ReachFiveHostApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<ReachFiveHostApi> *_Nullable api);

NS_ASSUME_NONNULL_END
