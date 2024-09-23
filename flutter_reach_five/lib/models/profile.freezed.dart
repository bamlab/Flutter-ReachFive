// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Profile {
  /// The user id
  String? get uid => throw _privateConstructorUsedError;

  /// The user given name
  String? get givenName => throw _privateConstructorUsedError;

  /// The user middle name
  String? get middleName => throw _privateConstructorUsedError;

  /// The user family name
  String? get familyName => throw _privateConstructorUsedError;

  /// The user name
  String? get name => throw _privateConstructorUsedError;

  /// The user nickname
  String? get nickname => throw _privateConstructorUsedError;

  /// The user birthdate
  String? get birthdate => throw _privateConstructorUsedError;

  /// The user profile url
  String? get profileURL => throw _privateConstructorUsedError;

  /// The user picture
  String? get picture => throw _privateConstructorUsedError;

  /// The user external id
  String? get externalId => throw _privateConstructorUsedError;

  /// The user list of authentication types
  List<String>? get authTypes => throw _privateConstructorUsedError;

  /// The user [LoginSummary]
  LoginSummary? get loginSummary => throw _privateConstructorUsedError;

  /// The user username
  String? get username => throw _privateConstructorUsedError;

  /// The user gender
  String? get gender => throw _privateConstructorUsedError;

  /// The user email
  String? get email => throw _privateConstructorUsedError;

  /// Used to check if an user [email] is verified or not
  bool? get emailVerified => throw _privateConstructorUsedError;

  /// The user list of verified/unverified emails
  Emails? get emails => throw _privateConstructorUsedError;

  /// The user phone number
  String? get phoneNumber => throw _privateConstructorUsedError;

  /// Used to check if an user [phoneNumber] is verified or not
  bool? get phoneNumberVerified => throw _privateConstructorUsedError;

  /// The user list of addresses
  List<ProfileAddress>? get addresses => throw _privateConstructorUsedError;

  /// The user locale
  String? get locale => throw _privateConstructorUsedError;

  /// The user bio
  String? get bio => throw _privateConstructorUsedError;

  /// The custom fields linked to your user
  /// It must match the ones you have created in your reachFive console
  Map<String, Object?>? get customFields => throw _privateConstructorUsedError;

  /// The user consents
// TODO: find the consents we can put in here
  Map<String, Consent>? get consents => throw _privateConstructorUsedError;

  /// The time the user's profile was created
  String? get createdAt => throw _privateConstructorUsedError;

  /// The last time the user's profile was updated
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Used to know if the user profile is lite or not
  bool? get liteOnly => throw _privateConstructorUsedError;

  /// The user company
  String? get company => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String? uid,
      String? givenName,
      String? middleName,
      String? familyName,
      String? name,
      String? nickname,
      String? birthdate,
      String? profileURL,
      String? picture,
      String? externalId,
      List<String>? authTypes,
      LoginSummary? loginSummary,
      String? username,
      String? gender,
      String? email,
      bool? emailVerified,
      Emails? emails,
      String? phoneNumber,
      bool? phoneNumberVerified,
      List<ProfileAddress>? addresses,
      String? locale,
      String? bio,
      Map<String, Object?>? customFields,
      Map<String, Consent>? consents,
      String? createdAt,
      String? updatedAt,
      bool? liteOnly,
      String? company});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? givenName = freezed,
    Object? middleName = freezed,
    Object? familyName = freezed,
    Object? name = freezed,
    Object? nickname = freezed,
    Object? birthdate = freezed,
    Object? profileURL = freezed,
    Object? picture = freezed,
    Object? externalId = freezed,
    Object? authTypes = freezed,
    Object? loginSummary = freezed,
    Object? username = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? emailVerified = freezed,
    Object? emails = freezed,
    Object? phoneNumber = freezed,
    Object? phoneNumberVerified = freezed,
    Object? addresses = freezed,
    Object? locale = freezed,
    Object? bio = freezed,
    Object? customFields = freezed,
    Object? consents = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? liteOnly = freezed,
    Object? company = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: freezed == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String?,
      profileURL: freezed == profileURL
          ? _value.profileURL
          : profileURL // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      authTypes: freezed == authTypes
          ? _value.authTypes
          : authTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      loginSummary: freezed == loginSummary
          ? _value.loginSummary
          : loginSummary // ignore: cast_nullable_to_non_nullable
              as LoginSummary?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      emails: freezed == emails
          ? _value.emails
          : emails // ignore: cast_nullable_to_non_nullable
              as Emails?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumberVerified: freezed == phoneNumberVerified
          ? _value.phoneNumberVerified
          : phoneNumberVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: freezed == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<ProfileAddress>?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      customFields: freezed == customFields
          ? _value.customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      consents: freezed == consents
          ? _value.consents
          : consents // ignore: cast_nullable_to_non_nullable
              as Map<String, Consent>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      liteOnly: freezed == liteOnly
          ? _value.liteOnly
          : liteOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? givenName,
      String? middleName,
      String? familyName,
      String? name,
      String? nickname,
      String? birthdate,
      String? profileURL,
      String? picture,
      String? externalId,
      List<String>? authTypes,
      LoginSummary? loginSummary,
      String? username,
      String? gender,
      String? email,
      bool? emailVerified,
      Emails? emails,
      String? phoneNumber,
      bool? phoneNumberVerified,
      List<ProfileAddress>? addresses,
      String? locale,
      String? bio,
      Map<String, Object?>? customFields,
      Map<String, Consent>? consents,
      String? createdAt,
      String? updatedAt,
      bool? liteOnly,
      String? company});
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$_Profile>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? givenName = freezed,
    Object? middleName = freezed,
    Object? familyName = freezed,
    Object? name = freezed,
    Object? nickname = freezed,
    Object? birthdate = freezed,
    Object? profileURL = freezed,
    Object? picture = freezed,
    Object? externalId = freezed,
    Object? authTypes = freezed,
    Object? loginSummary = freezed,
    Object? username = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? emailVerified = freezed,
    Object? emails = freezed,
    Object? phoneNumber = freezed,
    Object? phoneNumberVerified = freezed,
    Object? addresses = freezed,
    Object? locale = freezed,
    Object? bio = freezed,
    Object? customFields = freezed,
    Object? consents = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? liteOnly = freezed,
    Object? company = freezed,
  }) {
    return _then(_$_Profile(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: freezed == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdate: freezed == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String?,
      profileURL: freezed == profileURL
          ? _value.profileURL
          : profileURL // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      externalId: freezed == externalId
          ? _value.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      authTypes: freezed == authTypes
          ? _value._authTypes
          : authTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      loginSummary: freezed == loginSummary
          ? _value.loginSummary
          : loginSummary // ignore: cast_nullable_to_non_nullable
              as LoginSummary?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      emails: freezed == emails
          ? _value.emails
          : emails // ignore: cast_nullable_to_non_nullable
              as Emails?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumberVerified: freezed == phoneNumberVerified
          ? _value.phoneNumberVerified
          : phoneNumberVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: freezed == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<ProfileAddress>?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      customFields: freezed == customFields
          ? _value._customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      consents: freezed == consents
          ? _value._consents
          : consents // ignore: cast_nullable_to_non_nullable
              as Map<String, Consent>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      liteOnly: freezed == liteOnly
          ? _value.liteOnly
          : liteOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Profile implements _Profile {
  const _$_Profile(
      {this.uid,
      this.givenName,
      this.middleName,
      this.familyName,
      this.name,
      this.nickname,
      this.birthdate,
      this.profileURL,
      this.picture,
      this.externalId,
      final List<String>? authTypes,
      this.loginSummary,
      this.username,
      this.gender,
      this.email,
      this.emailVerified,
      this.emails,
      this.phoneNumber,
      this.phoneNumberVerified,
      final List<ProfileAddress>? addresses,
      this.locale,
      this.bio,
      final Map<String, Object?>? customFields,
      final Map<String, Consent>? consents,
      this.createdAt,
      this.updatedAt,
      this.liteOnly,
      this.company})
      : _authTypes = authTypes,
        _addresses = addresses,
        _customFields = customFields,
        _consents = consents;

  /// The user id
  @override
  final String? uid;

  /// The user given name
  @override
  final String? givenName;

  /// The user middle name
  @override
  final String? middleName;

  /// The user family name
  @override
  final String? familyName;

  /// The user name
  @override
  final String? name;

  /// The user nickname
  @override
  final String? nickname;

  /// The user birthdate
  @override
  final String? birthdate;

  /// The user profile url
  @override
  final String? profileURL;

  /// The user picture
  @override
  final String? picture;

  /// The user external id
  @override
  final String? externalId;

  /// The user list of authentication types
  final List<String>? _authTypes;

  /// The user list of authentication types
  @override
  List<String>? get authTypes {
    final value = _authTypes;
    if (value == null) return null;
    if (_authTypes is EqualUnmodifiableListView) return _authTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// The user [LoginSummary]
  @override
  final LoginSummary? loginSummary;

  /// The user username
  @override
  final String? username;

  /// The user gender
  @override
  final String? gender;

  /// The user email
  @override
  final String? email;

  /// Used to check if an user [email] is verified or not
  @override
  final bool? emailVerified;

  /// The user list of verified/unverified emails
  @override
  final Emails? emails;

  /// The user phone number
  @override
  final String? phoneNumber;

  /// Used to check if an user [phoneNumber] is verified or not
  @override
  final bool? phoneNumberVerified;

  /// The user list of addresses
  final List<ProfileAddress>? _addresses;

  /// The user list of addresses
  @override
  List<ProfileAddress>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// The user locale
  @override
  final String? locale;

  /// The user bio
  @override
  final String? bio;

  /// The custom fields linked to your user
  /// It must match the ones you have created in your reachFive console
  final Map<String, Object?>? _customFields;

  /// The custom fields linked to your user
  /// It must match the ones you have created in your reachFive console
  @override
  Map<String, Object?>? get customFields {
    final value = _customFields;
    if (value == null) return null;
    if (_customFields is EqualUnmodifiableMapView) return _customFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// The user consents
// TODO: find the consents we can put in here
  final Map<String, Consent>? _consents;

  /// The user consents
// TODO: find the consents we can put in here
  @override
  Map<String, Consent>? get consents {
    final value = _consents;
    if (value == null) return null;
    if (_consents is EqualUnmodifiableMapView) return _consents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// The time the user's profile was created
  @override
  final String? createdAt;

  /// The last time the user's profile was updated
  @override
  final String? updatedAt;

  /// Used to know if the user profile is lite or not
  @override
  final bool? liteOnly;

  /// The user company
  @override
  final String? company;

  @override
  String toString() {
    return 'Profile(uid: $uid, givenName: $givenName, middleName: $middleName, familyName: $familyName, name: $name, nickname: $nickname, birthdate: $birthdate, profileURL: $profileURL, picture: $picture, externalId: $externalId, authTypes: $authTypes, loginSummary: $loginSummary, username: $username, gender: $gender, email: $email, emailVerified: $emailVerified, emails: $emails, phoneNumber: $phoneNumber, phoneNumberVerified: $phoneNumberVerified, addresses: $addresses, locale: $locale, bio: $bio, customFields: $customFields, consents: $consents, createdAt: $createdAt, updatedAt: $updatedAt, liteOnly: $liteOnly, company: $company)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.givenName, givenName) ||
                other.givenName == givenName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.familyName, familyName) ||
                other.familyName == familyName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.profileURL, profileURL) ||
                other.profileURL == profileURL) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.externalId, externalId) ||
                other.externalId == externalId) &&
            const DeepCollectionEquality()
                .equals(other._authTypes, _authTypes) &&
            (identical(other.loginSummary, loginSummary) ||
                other.loginSummary == loginSummary) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.emails, emails) || other.emails == emails) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.phoneNumberVerified, phoneNumberVerified) ||
                other.phoneNumberVerified == phoneNumberVerified) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality()
                .equals(other._customFields, _customFields) &&
            const DeepCollectionEquality().equals(other._consents, _consents) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.liteOnly, liteOnly) ||
                other.liteOnly == liteOnly) &&
            (identical(other.company, company) || other.company == company));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
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
        const DeepCollectionEquality().hash(_authTypes),
        loginSummary,
        username,
        gender,
        email,
        emailVerified,
        emails,
        phoneNumber,
        phoneNumberVerified,
        const DeepCollectionEquality().hash(_addresses),
        locale,
        bio,
        const DeepCollectionEquality().hash(_customFields),
        const DeepCollectionEquality().hash(_consents),
        createdAt,
        updatedAt,
        liteOnly,
        company
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {final String? uid,
      final String? givenName,
      final String? middleName,
      final String? familyName,
      final String? name,
      final String? nickname,
      final String? birthdate,
      final String? profileURL,
      final String? picture,
      final String? externalId,
      final List<String>? authTypes,
      final LoginSummary? loginSummary,
      final String? username,
      final String? gender,
      final String? email,
      final bool? emailVerified,
      final Emails? emails,
      final String? phoneNumber,
      final bool? phoneNumberVerified,
      final List<ProfileAddress>? addresses,
      final String? locale,
      final String? bio,
      final Map<String, Object?>? customFields,
      final Map<String, Consent>? consents,
      final String? createdAt,
      final String? updatedAt,
      final bool? liteOnly,
      final String? company}) = _$_Profile;

  @override

  /// The user id
  String? get uid;
  @override

  /// The user given name
  String? get givenName;
  @override

  /// The user middle name
  String? get middleName;
  @override

  /// The user family name
  String? get familyName;
  @override

  /// The user name
  String? get name;
  @override

  /// The user nickname
  String? get nickname;
  @override

  /// The user birthdate
  String? get birthdate;
  @override

  /// The user profile url
  String? get profileURL;
  @override

  /// The user picture
  String? get picture;
  @override

  /// The user external id
  String? get externalId;
  @override

  /// The user list of authentication types
  List<String>? get authTypes;
  @override

  /// The user [LoginSummary]
  LoginSummary? get loginSummary;
  @override

  /// The user username
  String? get username;
  @override

  /// The user gender
  String? get gender;
  @override

  /// The user email
  String? get email;
  @override

  /// Used to check if an user [email] is verified or not
  bool? get emailVerified;
  @override

  /// The user list of verified/unverified emails
  Emails? get emails;
  @override

  /// The user phone number
  String? get phoneNumber;
  @override

  /// Used to check if an user [phoneNumber] is verified or not
  bool? get phoneNumberVerified;
  @override

  /// The user list of addresses
  List<ProfileAddress>? get addresses;
  @override

  /// The user locale
  String? get locale;
  @override

  /// The user bio
  String? get bio;
  @override

  /// The custom fields linked to your user
  /// It must match the ones you have created in your reachFive console
  Map<String, Object?>? get customFields;
  @override

  /// The user consents
// TODO: find the consents we can put in here
  Map<String, Consent>? get consents;
  @override

  /// The time the user's profile was created
  String? get createdAt;
  @override

  /// The last time the user's profile was updated
  String? get updatedAt;
  @override

  /// Used to know if the user profile is lite or not
  bool? get liteOnly;
  @override

  /// The user company
  String? get company;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
