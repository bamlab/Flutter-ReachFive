// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_password_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdatePasswordRequest {
  String get newPassword;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePasswordRequestCopyWith<UpdatePasswordRequest> get copyWith =>
      _$UpdatePasswordRequestCopyWithImpl<UpdatePasswordRequest>(
          this as UpdatePasswordRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePasswordRequest &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPassword);

  @override
  String toString() {
    return 'UpdatePasswordRequest(newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class $UpdatePasswordRequestCopyWith<$Res> {
  factory $UpdatePasswordRequestCopyWith(UpdatePasswordRequest value,
          $Res Function(UpdatePasswordRequest) _then) =
      _$UpdatePasswordRequestCopyWithImpl;
  @useResult
  $Res call({String newPassword});
}

/// @nodoc
class _$UpdatePasswordRequestCopyWithImpl<$Res>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  _$UpdatePasswordRequestCopyWithImpl(this._self, this._then);

  final UpdatePasswordRequest _self;
  final $Res Function(UpdatePasswordRequest) _then;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
  }) {
    return _then(_self.copyWith(
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UpdatePasswordRequest].
extension UpdatePasswordRequestPatterns on UpdatePasswordRequest {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePasswordRequestWithAccessToken value)?
        withAccessToken,
    TResult Function(UpdatePasswordRequestWithFreshAccessToken value)?
        withFreshAccessToken,
    TResult Function(UpdatePasswordRequestWithEmail value)? withEmail,
    TResult Function(UpdatePasswordRequestWithPhoneNumber value)?
        withPhoneNumber,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case UpdatePasswordRequestWithAccessToken() when withAccessToken != null:
        return withAccessToken(_that);
      case UpdatePasswordRequestWithFreshAccessToken()
          when withFreshAccessToken != null:
        return withFreshAccessToken(_that);
      case UpdatePasswordRequestWithEmail() when withEmail != null:
        return withEmail(_that);
      case UpdatePasswordRequestWithPhoneNumber() when withPhoneNumber != null:
        return withPhoneNumber(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePasswordRequestWithAccessToken value)
        withAccessToken,
    required TResult Function(UpdatePasswordRequestWithFreshAccessToken value)
        withFreshAccessToken,
    required TResult Function(UpdatePasswordRequestWithEmail value) withEmail,
    required TResult Function(UpdatePasswordRequestWithPhoneNumber value)
        withPhoneNumber,
  }) {
    final _that = this;
    switch (_that) {
      case UpdatePasswordRequestWithAccessToken():
        return withAccessToken(_that);
      case UpdatePasswordRequestWithFreshAccessToken():
        return withFreshAccessToken(_that);
      case UpdatePasswordRequestWithEmail():
        return withEmail(_that);
      case UpdatePasswordRequestWithPhoneNumber():
        return withPhoneNumber(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePasswordRequestWithAccessToken value)?
        withAccessToken,
    TResult? Function(UpdatePasswordRequestWithFreshAccessToken value)?
        withFreshAccessToken,
    TResult? Function(UpdatePasswordRequestWithEmail value)? withEmail,
    TResult? Function(UpdatePasswordRequestWithPhoneNumber value)?
        withPhoneNumber,
  }) {
    final _that = this;
    switch (_that) {
      case UpdatePasswordRequestWithAccessToken() when withAccessToken != null:
        return withAccessToken(_that);
      case UpdatePasswordRequestWithFreshAccessToken()
          when withFreshAccessToken != null:
        return withFreshAccessToken(_that);
      case UpdatePasswordRequestWithEmail() when withEmail != null:
        return withEmail(_that);
      case UpdatePasswordRequestWithPhoneNumber() when withPhoneNumber != null:
        return withPhoneNumber(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            AuthToken authToken, String oldPassword, String newPassword)?
        withAccessToken,
    TResult Function(AuthToken freshAuthToken, String newPassword)?
        withFreshAccessToken,
    TResult Function(String email, String verificationCode, String newPassword)?
        withEmail,
    TResult Function(
            String phoneNumber, String verificationCode, String newPassword)?
        withPhoneNumber,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case UpdatePasswordRequestWithAccessToken() when withAccessToken != null:
        return withAccessToken(
            _that.authToken, _that.oldPassword, _that.newPassword);
      case UpdatePasswordRequestWithFreshAccessToken()
          when withFreshAccessToken != null:
        return withFreshAccessToken(_that.freshAuthToken, _that.newPassword);
      case UpdatePasswordRequestWithEmail() when withEmail != null:
        return withEmail(
            _that.email, _that.verificationCode, _that.newPassword);
      case UpdatePasswordRequestWithPhoneNumber() when withPhoneNumber != null:
        return withPhoneNumber(
            _that.phoneNumber, _that.verificationCode, _that.newPassword);
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
  TResult when<TResult extends Object?>({
    required TResult Function(
            AuthToken authToken, String oldPassword, String newPassword)
        withAccessToken,
    required TResult Function(AuthToken freshAuthToken, String newPassword)
        withFreshAccessToken,
    required TResult Function(
            String email, String verificationCode, String newPassword)
        withEmail,
    required TResult Function(
            String phoneNumber, String verificationCode, String newPassword)
        withPhoneNumber,
  }) {
    final _that = this;
    switch (_that) {
      case UpdatePasswordRequestWithAccessToken():
        return withAccessToken(
            _that.authToken, _that.oldPassword, _that.newPassword);
      case UpdatePasswordRequestWithFreshAccessToken():
        return withFreshAccessToken(_that.freshAuthToken, _that.newPassword);
      case UpdatePasswordRequestWithEmail():
        return withEmail(
            _that.email, _that.verificationCode, _that.newPassword);
      case UpdatePasswordRequestWithPhoneNumber():
        return withPhoneNumber(
            _that.phoneNumber, _that.verificationCode, _that.newPassword);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            AuthToken authToken, String oldPassword, String newPassword)?
        withAccessToken,
    TResult? Function(AuthToken freshAuthToken, String newPassword)?
        withFreshAccessToken,
    TResult? Function(
            String email, String verificationCode, String newPassword)?
        withEmail,
    TResult? Function(
            String phoneNumber, String verificationCode, String newPassword)?
        withPhoneNumber,
  }) {
    final _that = this;
    switch (_that) {
      case UpdatePasswordRequestWithAccessToken() when withAccessToken != null:
        return withAccessToken(
            _that.authToken, _that.oldPassword, _that.newPassword);
      case UpdatePasswordRequestWithFreshAccessToken()
          when withFreshAccessToken != null:
        return withFreshAccessToken(_that.freshAuthToken, _that.newPassword);
      case UpdatePasswordRequestWithEmail() when withEmail != null:
        return withEmail(
            _that.email, _that.verificationCode, _that.newPassword);
      case UpdatePasswordRequestWithPhoneNumber() when withPhoneNumber != null:
        return withPhoneNumber(
            _that.phoneNumber, _that.verificationCode, _that.newPassword);
      case _:
        return null;
    }
  }
}

/// @nodoc

class UpdatePasswordRequestWithAccessToken implements UpdatePasswordRequest {
  const UpdatePasswordRequestWithAccessToken(
      {required this.authToken,
      required this.oldPassword,
      required this.newPassword});

  final AuthToken authToken;
  final String oldPassword;
  @override
  final String newPassword;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePasswordRequestWithAccessTokenCopyWith<
          UpdatePasswordRequestWithAccessToken>
      get copyWith => _$UpdatePasswordRequestWithAccessTokenCopyWithImpl<
          UpdatePasswordRequestWithAccessToken>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePasswordRequestWithAccessToken &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken) &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, authToken, oldPassword, newPassword);

  @override
  String toString() {
    return 'UpdatePasswordRequest.withAccessToken(authToken: $authToken, oldPassword: $oldPassword, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class $UpdatePasswordRequestWithAccessTokenCopyWith<$Res>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  factory $UpdatePasswordRequestWithAccessTokenCopyWith(
          UpdatePasswordRequestWithAccessToken value,
          $Res Function(UpdatePasswordRequestWithAccessToken) _then) =
      _$UpdatePasswordRequestWithAccessTokenCopyWithImpl;
  @override
  @useResult
  $Res call({AuthToken authToken, String oldPassword, String newPassword});
}

/// @nodoc
class _$UpdatePasswordRequestWithAccessTokenCopyWithImpl<$Res>
    implements $UpdatePasswordRequestWithAccessTokenCopyWith<$Res> {
  _$UpdatePasswordRequestWithAccessTokenCopyWithImpl(this._self, this._then);

  final UpdatePasswordRequestWithAccessToken _self;
  final $Res Function(UpdatePasswordRequestWithAccessToken) _then;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? authToken = null,
    Object? oldPassword = null,
    Object? newPassword = null,
  }) {
    return _then(UpdatePasswordRequestWithAccessToken(
      authToken: null == authToken
          ? _self.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as AuthToken,
      oldPassword: null == oldPassword
          ? _self.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UpdatePasswordRequestWithFreshAccessToken
    implements UpdatePasswordRequest {
  const UpdatePasswordRequestWithFreshAccessToken(
      {required this.freshAuthToken, required this.newPassword});

  final AuthToken freshAuthToken;
  @override
  final String newPassword;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePasswordRequestWithFreshAccessTokenCopyWith<
          UpdatePasswordRequestWithFreshAccessToken>
      get copyWith => _$UpdatePasswordRequestWithFreshAccessTokenCopyWithImpl<
          UpdatePasswordRequestWithFreshAccessToken>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePasswordRequestWithFreshAccessToken &&
            (identical(other.freshAuthToken, freshAuthToken) ||
                other.freshAuthToken == freshAuthToken) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, freshAuthToken, newPassword);

  @override
  String toString() {
    return 'UpdatePasswordRequest.withFreshAccessToken(freshAuthToken: $freshAuthToken, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class $UpdatePasswordRequestWithFreshAccessTokenCopyWith<$Res>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  factory $UpdatePasswordRequestWithFreshAccessTokenCopyWith(
          UpdatePasswordRequestWithFreshAccessToken value,
          $Res Function(UpdatePasswordRequestWithFreshAccessToken) _then) =
      _$UpdatePasswordRequestWithFreshAccessTokenCopyWithImpl;
  @override
  @useResult
  $Res call({AuthToken freshAuthToken, String newPassword});
}

/// @nodoc
class _$UpdatePasswordRequestWithFreshAccessTokenCopyWithImpl<$Res>
    implements $UpdatePasswordRequestWithFreshAccessTokenCopyWith<$Res> {
  _$UpdatePasswordRequestWithFreshAccessTokenCopyWithImpl(
      this._self, this._then);

  final UpdatePasswordRequestWithFreshAccessToken _self;
  final $Res Function(UpdatePasswordRequestWithFreshAccessToken) _then;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? freshAuthToken = null,
    Object? newPassword = null,
  }) {
    return _then(UpdatePasswordRequestWithFreshAccessToken(
      freshAuthToken: null == freshAuthToken
          ? _self.freshAuthToken
          : freshAuthToken // ignore: cast_nullable_to_non_nullable
              as AuthToken,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UpdatePasswordRequestWithEmail implements UpdatePasswordRequest {
  const UpdatePasswordRequestWithEmail(
      {required this.email,
      required this.verificationCode,
      required this.newPassword});

  final String email;
  final String verificationCode;
  @override
  final String newPassword;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePasswordRequestWithEmailCopyWith<UpdatePasswordRequestWithEmail>
      get copyWith => _$UpdatePasswordRequestWithEmailCopyWithImpl<
          UpdatePasswordRequestWithEmail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePasswordRequestWithEmail &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, verificationCode, newPassword);

  @override
  String toString() {
    return 'UpdatePasswordRequest.withEmail(email: $email, verificationCode: $verificationCode, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class $UpdatePasswordRequestWithEmailCopyWith<$Res>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  factory $UpdatePasswordRequestWithEmailCopyWith(
          UpdatePasswordRequestWithEmail value,
          $Res Function(UpdatePasswordRequestWithEmail) _then) =
      _$UpdatePasswordRequestWithEmailCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String verificationCode, String newPassword});
}

/// @nodoc
class _$UpdatePasswordRequestWithEmailCopyWithImpl<$Res>
    implements $UpdatePasswordRequestWithEmailCopyWith<$Res> {
  _$UpdatePasswordRequestWithEmailCopyWithImpl(this._self, this._then);

  final UpdatePasswordRequestWithEmail _self;
  final $Res Function(UpdatePasswordRequestWithEmail) _then;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? verificationCode = null,
    Object? newPassword = null,
  }) {
    return _then(UpdatePasswordRequestWithEmail(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: null == verificationCode
          ? _self.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UpdatePasswordRequestWithPhoneNumber implements UpdatePasswordRequest {
  const UpdatePasswordRequestWithPhoneNumber(
      {required this.phoneNumber,
      required this.verificationCode,
      required this.newPassword});

  final String phoneNumber;
  final String verificationCode;
  @override
  final String newPassword;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdatePasswordRequestWithPhoneNumberCopyWith<
          UpdatePasswordRequestWithPhoneNumber>
      get copyWith => _$UpdatePasswordRequestWithPhoneNumberCopyWithImpl<
          UpdatePasswordRequestWithPhoneNumber>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdatePasswordRequestWithPhoneNumber &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, phoneNumber, verificationCode, newPassword);

  @override
  String toString() {
    return 'UpdatePasswordRequest.withPhoneNumber(phoneNumber: $phoneNumber, verificationCode: $verificationCode, newPassword: $newPassword)';
  }
}

/// @nodoc
abstract mixin class $UpdatePasswordRequestWithPhoneNumberCopyWith<$Res>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  factory $UpdatePasswordRequestWithPhoneNumberCopyWith(
          UpdatePasswordRequestWithPhoneNumber value,
          $Res Function(UpdatePasswordRequestWithPhoneNumber) _then) =
      _$UpdatePasswordRequestWithPhoneNumberCopyWithImpl;
  @override
  @useResult
  $Res call({String phoneNumber, String verificationCode, String newPassword});
}

/// @nodoc
class _$UpdatePasswordRequestWithPhoneNumberCopyWithImpl<$Res>
    implements $UpdatePasswordRequestWithPhoneNumberCopyWith<$Res> {
  _$UpdatePasswordRequestWithPhoneNumberCopyWithImpl(this._self, this._then);

  final UpdatePasswordRequestWithPhoneNumber _self;
  final $Res Function(UpdatePasswordRequestWithPhoneNumber) _then;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? phoneNumber = null,
    Object? verificationCode = null,
    Object? newPassword = null,
  }) {
    return _then(UpdatePasswordRequestWithPhoneNumber(
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: null == verificationCode
          ? _self.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _self.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
