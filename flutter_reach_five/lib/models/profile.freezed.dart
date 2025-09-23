// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {
  /// The user id
  String? get uid;

  /// The user given name
  String? get givenName;

  /// The user middle name
  String? get middleName;

  /// The user family name
  String? get familyName;

  /// The user name
  String? get name;

  /// The user nickname
  String? get nickname;

  /// The user birthdate
  String? get birthdate;

  /// The user profile url
  String? get profileURL;

  /// The user picture
  String? get picture;

  /// The user external id
  String? get externalId;

  /// The user list of authentication types
  List<String>? get authTypes;

  /// The user [LoginSummary]
  LoginSummary? get loginSummary;

  /// The user username
  String? get username;

  /// The user gender
  String? get gender;

  /// The user email
  String? get email;

  /// Used to check if an user [email] is verified or not
  bool? get emailVerified;

  /// The user list of verified/unverified emails
  Emails? get emails;

  /// The user phone number
  String? get phoneNumber;

  /// Used to check if an user [phoneNumber] is verified or not
  bool? get phoneNumberVerified;

  /// The user list of addresses
  List<ProfileAddress>? get addresses;

  /// The user locale
  String? get locale;

  /// The user bio
  String? get bio;

  /// The custom fields linked to your user
  /// It must match the ones you have created in your reachFive console
  Map<String, Object?>? get customFields;

  /// The user consents
// TODO: find the consents we can put in here
  Map<String, Consent>? get consents;

  /// The time the user's profile was created
  String? get createdAt;

  /// The last time the user's profile was updated
  String? get updatedAt;

  /// Used to know if the user profile is lite or not
  bool? get liteOnly;

  /// The user company
  String? get company;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<Profile> get copyWith =>
      _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Profile &&
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
            const DeepCollectionEquality().equals(other.authTypes, authTypes) &&
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
            const DeepCollectionEquality().equals(other.addresses, addresses) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality()
                .equals(other.customFields, customFields) &&
            const DeepCollectionEquality().equals(other.consents, consents) &&
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
        const DeepCollectionEquality().hash(authTypes),
        loginSummary,
        username,
        gender,
        email,
        emailVerified,
        emails,
        phoneNumber,
        phoneNumberVerified,
        const DeepCollectionEquality().hash(addresses),
        locale,
        bio,
        const DeepCollectionEquality().hash(customFields),
        const DeepCollectionEquality().hash(consents),
        createdAt,
        updatedAt,
        liteOnly,
        company
      ]);

  @override
  String toString() {
    return 'Profile(uid: $uid, givenName: $givenName, middleName: $middleName, familyName: $familyName, name: $name, nickname: $nickname, birthdate: $birthdate, profileURL: $profileURL, picture: $picture, externalId: $externalId, authTypes: $authTypes, loginSummary: $loginSummary, username: $username, gender: $gender, email: $email, emailVerified: $emailVerified, emails: $emails, phoneNumber: $phoneNumber, phoneNumberVerified: $phoneNumberVerified, addresses: $addresses, locale: $locale, bio: $bio, customFields: $customFields, consents: $consents, createdAt: $createdAt, updatedAt: $updatedAt, liteOnly: $liteOnly, company: $company)';
  }
}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) =
      _$ProfileCopyWithImpl;
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
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      uid: freezed == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _self.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _self.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: freezed == familyName
          ? _self.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdate: freezed == birthdate
          ? _self.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String?,
      profileURL: freezed == profileURL
          ? _self.profileURL
          : profileURL // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _self.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      externalId: freezed == externalId
          ? _self.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      authTypes: freezed == authTypes
          ? _self.authTypes
          : authTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      loginSummary: freezed == loginSummary
          ? _self.loginSummary
          : loginSummary // ignore: cast_nullable_to_non_nullable
              as LoginSummary?,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      emails: freezed == emails
          ? _self.emails
          : emails // ignore: cast_nullable_to_non_nullable
              as Emails?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumberVerified: freezed == phoneNumberVerified
          ? _self.phoneNumberVerified
          : phoneNumberVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: freezed == addresses
          ? _self.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<ProfileAddress>?,
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      customFields: freezed == customFields
          ? _self.customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      consents: freezed == consents
          ? _self.consents
          : consents // ignore: cast_nullable_to_non_nullable
              as Map<String, Consent>?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      liteOnly: freezed == liteOnly
          ? _self.liteOnly
          : liteOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      company: freezed == company
          ? _self.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Profile].
extension ProfilePatterns on Profile {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Profile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Profile() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Profile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Profile():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Profile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Profile() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? uid,
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
            String? company)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Profile() when $default != null:
        return $default(
            _that.uid,
            _that.givenName,
            _that.middleName,
            _that.familyName,
            _that.name,
            _that.nickname,
            _that.birthdate,
            _that.profileURL,
            _that.picture,
            _that.externalId,
            _that.authTypes,
            _that.loginSummary,
            _that.username,
            _that.gender,
            _that.email,
            _that.emailVerified,
            _that.emails,
            _that.phoneNumber,
            _that.phoneNumberVerified,
            _that.addresses,
            _that.locale,
            _that.bio,
            _that.customFields,
            _that.consents,
            _that.createdAt,
            _that.updatedAt,
            _that.liteOnly,
            _that.company);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? uid,
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
            String? company)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Profile():
        return $default(
            _that.uid,
            _that.givenName,
            _that.middleName,
            _that.familyName,
            _that.name,
            _that.nickname,
            _that.birthdate,
            _that.profileURL,
            _that.picture,
            _that.externalId,
            _that.authTypes,
            _that.loginSummary,
            _that.username,
            _that.gender,
            _that.email,
            _that.emailVerified,
            _that.emails,
            _that.phoneNumber,
            _that.phoneNumberVerified,
            _that.addresses,
            _that.locale,
            _that.bio,
            _that.customFields,
            _that.consents,
            _that.createdAt,
            _that.updatedAt,
            _that.liteOnly,
            _that.company);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? uid,
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
            String? company)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Profile() when $default != null:
        return $default(
            _that.uid,
            _that.givenName,
            _that.middleName,
            _that.familyName,
            _that.name,
            _that.nickname,
            _that.birthdate,
            _that.profileURL,
            _that.picture,
            _that.externalId,
            _that.authTypes,
            _that.loginSummary,
            _that.username,
            _that.gender,
            _that.email,
            _that.emailVerified,
            _that.emails,
            _that.phoneNumber,
            _that.phoneNumberVerified,
            _that.addresses,
            _that.locale,
            _that.bio,
            _that.customFields,
            _that.consents,
            _that.createdAt,
            _that.updatedAt,
            _that.liteOnly,
            _that.company);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Profile implements Profile {
  const _Profile(
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

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
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

  @override
  String toString() {
    return 'Profile(uid: $uid, givenName: $givenName, middleName: $middleName, familyName: $familyName, name: $name, nickname: $nickname, birthdate: $birthdate, profileURL: $profileURL, picture: $picture, externalId: $externalId, authTypes: $authTypes, loginSummary: $loginSummary, username: $username, gender: $gender, email: $email, emailVerified: $emailVerified, emails: $emails, phoneNumber: $phoneNumber, phoneNumberVerified: $phoneNumberVerified, addresses: $addresses, locale: $locale, bio: $bio, customFields: $customFields, consents: $consents, createdAt: $createdAt, updatedAt: $updatedAt, liteOnly: $liteOnly, company: $company)';
  }
}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) =
      __$ProfileCopyWithImpl;
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
class __$ProfileCopyWithImpl<$Res> implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Profile(
      uid: freezed == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _self.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _self.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: freezed == familyName
          ? _self.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      birthdate: freezed == birthdate
          ? _self.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String?,
      profileURL: freezed == profileURL
          ? _self.profileURL
          : profileURL // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _self.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      externalId: freezed == externalId
          ? _self.externalId
          : externalId // ignore: cast_nullable_to_non_nullable
              as String?,
      authTypes: freezed == authTypes
          ? _self._authTypes
          : authTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      loginSummary: freezed == loginSummary
          ? _self.loginSummary
          : loginSummary // ignore: cast_nullable_to_non_nullable
              as LoginSummary?,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      emails: freezed == emails
          ? _self.emails
          : emails // ignore: cast_nullable_to_non_nullable
              as Emails?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumberVerified: freezed == phoneNumberVerified
          ? _self.phoneNumberVerified
          : phoneNumberVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      addresses: freezed == addresses
          ? _self._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<ProfileAddress>?,
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      customFields: freezed == customFields
          ? _self._customFields
          : customFields // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
      consents: freezed == consents
          ? _self._consents
          : consents // ignore: cast_nullable_to_non_nullable
              as Map<String, Consent>?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      liteOnly: freezed == liteOnly
          ? _self.liteOnly
          : liteOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      company: freezed == company
          ? _self.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
