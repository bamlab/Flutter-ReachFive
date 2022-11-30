// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_password_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdatePasswordRequest {
  String get newPassword => throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePasswordRequestWithAccessToken value)
        withAccessToken,
    required TResult Function(UpdatePasswordRequestWithFreshAccessToken value)
        withFreshAccessToken,
    required TResult Function(UpdatePasswordRequestWithEmail value) withEmail,
    required TResult Function(UpdatePasswordRequestWithPhoneNumber value)
        withPhoneNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePasswordRequestWithAccessToken value)?
        withAccessToken,
    TResult? Function(UpdatePasswordRequestWithFreshAccessToken value)?
        withFreshAccessToken,
    TResult? Function(UpdatePasswordRequestWithEmail value)? withEmail,
    TResult? Function(UpdatePasswordRequestWithPhoneNumber value)?
        withPhoneNumber,
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdatePasswordRequestCopyWith<UpdatePasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePasswordRequestCopyWith<$Res> {
  factory $UpdatePasswordRequestCopyWith(UpdatePasswordRequest value,
          $Res Function(UpdatePasswordRequest) then) =
      _$UpdatePasswordRequestCopyWithImpl<$Res, UpdatePasswordRequest>;
  @useResult
  $Res call({String newPassword});
}

/// @nodoc
class _$UpdatePasswordRequestCopyWithImpl<$Res,
        $Val extends UpdatePasswordRequest>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  _$UpdatePasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
  }) {
    return _then(_value.copyWith(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePasswordRequestWithAccessTokenCopyWith<$Res>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  factory _$$UpdatePasswordRequestWithAccessTokenCopyWith(
          _$UpdatePasswordRequestWithAccessToken value,
          $Res Function(_$UpdatePasswordRequestWithAccessToken) then) =
      __$$UpdatePasswordRequestWithAccessTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthToken authToken, String oldPassword, String newPassword});
}

/// @nodoc
class __$$UpdatePasswordRequestWithAccessTokenCopyWithImpl<$Res>
    extends _$UpdatePasswordRequestCopyWithImpl<$Res,
        _$UpdatePasswordRequestWithAccessToken>
    implements _$$UpdatePasswordRequestWithAccessTokenCopyWith<$Res> {
  __$$UpdatePasswordRequestWithAccessTokenCopyWithImpl(
      _$UpdatePasswordRequestWithAccessToken _value,
      $Res Function(_$UpdatePasswordRequestWithAccessToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authToken = null,
    Object? oldPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_$UpdatePasswordRequestWithAccessToken(
      authToken: null == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as AuthToken,
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePasswordRequestWithAccessToken
    implements UpdatePasswordRequestWithAccessToken {
  const _$UpdatePasswordRequestWithAccessToken(
      {required this.authToken,
      required this.oldPassword,
      required this.newPassword});

  @override
  final AuthToken authToken;
  @override
  final String oldPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'UpdatePasswordRequest.withAccessToken(authToken: $authToken, oldPassword: $oldPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordRequestWithAccessToken &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordRequestWithAccessTokenCopyWith<
          _$UpdatePasswordRequestWithAccessToken>
      get copyWith => __$$UpdatePasswordRequestWithAccessTokenCopyWithImpl<
          _$UpdatePasswordRequestWithAccessToken>(this, _$identity);

  @override
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
    return withAccessToken(authToken, oldPassword, newPassword);
  }

  @override
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
    return withAccessToken?.call(authToken, oldPassword, newPassword);
  }

  @override
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
    if (withAccessToken != null) {
      return withAccessToken(authToken, oldPassword, newPassword);
    }
    return orElse();
  }

  @override
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
    return withAccessToken(this);
  }

  @override
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
    return withAccessToken?.call(this);
  }

  @override
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
    if (withAccessToken != null) {
      return withAccessToken(this);
    }
    return orElse();
  }
}

abstract class UpdatePasswordRequestWithAccessToken
    implements UpdatePasswordRequest {
  const factory UpdatePasswordRequestWithAccessToken(
          {required final AuthToken authToken,
          required final String oldPassword,
          required final String newPassword}) =
      _$UpdatePasswordRequestWithAccessToken;

  AuthToken get authToken;
  String get oldPassword;
  @override
  String get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePasswordRequestWithAccessTokenCopyWith<
          _$UpdatePasswordRequestWithAccessToken>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePasswordRequestWithFreshAccessTokenCopyWith<$Res>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  factory _$$UpdatePasswordRequestWithFreshAccessTokenCopyWith(
          _$UpdatePasswordRequestWithFreshAccessToken value,
          $Res Function(_$UpdatePasswordRequestWithFreshAccessToken) then) =
      __$$UpdatePasswordRequestWithFreshAccessTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthToken freshAuthToken, String newPassword});
}

/// @nodoc
class __$$UpdatePasswordRequestWithFreshAccessTokenCopyWithImpl<$Res>
    extends _$UpdatePasswordRequestCopyWithImpl<$Res,
        _$UpdatePasswordRequestWithFreshAccessToken>
    implements _$$UpdatePasswordRequestWithFreshAccessTokenCopyWith<$Res> {
  __$$UpdatePasswordRequestWithFreshAccessTokenCopyWithImpl(
      _$UpdatePasswordRequestWithFreshAccessToken _value,
      $Res Function(_$UpdatePasswordRequestWithFreshAccessToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? freshAuthToken = null,
    Object? newPassword = null,
  }) {
    return _then(_$UpdatePasswordRequestWithFreshAccessToken(
      freshAuthToken: null == freshAuthToken
          ? _value.freshAuthToken
          : freshAuthToken // ignore: cast_nullable_to_non_nullable
              as AuthToken,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePasswordRequestWithFreshAccessToken
    implements UpdatePasswordRequestWithFreshAccessToken {
  const _$UpdatePasswordRequestWithFreshAccessToken(
      {required this.freshAuthToken, required this.newPassword});

  @override
  final AuthToken freshAuthToken;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'UpdatePasswordRequest.withFreshAccessToken(freshAuthToken: $freshAuthToken, newPassword: $newPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordRequestWithFreshAccessToken &&
            (identical(other.freshAuthToken, freshAuthToken) ||
                other.freshAuthToken == freshAuthToken) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, freshAuthToken, newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordRequestWithFreshAccessTokenCopyWith<
          _$UpdatePasswordRequestWithFreshAccessToken>
      get copyWith => __$$UpdatePasswordRequestWithFreshAccessTokenCopyWithImpl<
          _$UpdatePasswordRequestWithFreshAccessToken>(this, _$identity);

  @override
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
    return withFreshAccessToken(freshAuthToken, newPassword);
  }

  @override
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
    return withFreshAccessToken?.call(freshAuthToken, newPassword);
  }

  @override
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
    if (withFreshAccessToken != null) {
      return withFreshAccessToken(freshAuthToken, newPassword);
    }
    return orElse();
  }

  @override
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
    return withFreshAccessToken(this);
  }

  @override
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
    return withFreshAccessToken?.call(this);
  }

  @override
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
    if (withFreshAccessToken != null) {
      return withFreshAccessToken(this);
    }
    return orElse();
  }
}

abstract class UpdatePasswordRequestWithFreshAccessToken
    implements UpdatePasswordRequest {
  const factory UpdatePasswordRequestWithFreshAccessToken(
          {required final AuthToken freshAuthToken,
          required final String newPassword}) =
      _$UpdatePasswordRequestWithFreshAccessToken;

  AuthToken get freshAuthToken;
  @override
  String get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePasswordRequestWithFreshAccessTokenCopyWith<
          _$UpdatePasswordRequestWithFreshAccessToken>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePasswordRequestWithEmailCopyWith<$Res>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  factory _$$UpdatePasswordRequestWithEmailCopyWith(
          _$UpdatePasswordRequestWithEmail value,
          $Res Function(_$UpdatePasswordRequestWithEmail) then) =
      __$$UpdatePasswordRequestWithEmailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String verificationCode, String newPassword});
}

/// @nodoc
class __$$UpdatePasswordRequestWithEmailCopyWithImpl<$Res>
    extends _$UpdatePasswordRequestCopyWithImpl<$Res,
        _$UpdatePasswordRequestWithEmail>
    implements _$$UpdatePasswordRequestWithEmailCopyWith<$Res> {
  __$$UpdatePasswordRequestWithEmailCopyWithImpl(
      _$UpdatePasswordRequestWithEmail _value,
      $Res Function(_$UpdatePasswordRequestWithEmail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? verificationCode = null,
    Object? newPassword = null,
  }) {
    return _then(_$UpdatePasswordRequestWithEmail(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePasswordRequestWithEmail
    implements UpdatePasswordRequestWithEmail {
  const _$UpdatePasswordRequestWithEmail(
      {required this.email,
      required this.verificationCode,
      required this.newPassword});

  @override
  final String email;
  @override
  final String verificationCode;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'UpdatePasswordRequest.withEmail(email: $email, verificationCode: $verificationCode, newPassword: $newPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordRequestWithEmail &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, verificationCode, newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordRequestWithEmailCopyWith<_$UpdatePasswordRequestWithEmail>
      get copyWith => __$$UpdatePasswordRequestWithEmailCopyWithImpl<
          _$UpdatePasswordRequestWithEmail>(this, _$identity);

  @override
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
    return withEmail(email, verificationCode, newPassword);
  }

  @override
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
    return withEmail?.call(email, verificationCode, newPassword);
  }

  @override
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
    if (withEmail != null) {
      return withEmail(email, verificationCode, newPassword);
    }
    return orElse();
  }

  @override
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
    return withEmail(this);
  }

  @override
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
    return withEmail?.call(this);
  }

  @override
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
    if (withEmail != null) {
      return withEmail(this);
    }
    return orElse();
  }
}

abstract class UpdatePasswordRequestWithEmail implements UpdatePasswordRequest {
  const factory UpdatePasswordRequestWithEmail(
      {required final String email,
      required final String verificationCode,
      required final String newPassword}) = _$UpdatePasswordRequestWithEmail;

  String get email;
  String get verificationCode;
  @override
  String get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePasswordRequestWithEmailCopyWith<_$UpdatePasswordRequestWithEmail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePasswordRequestWithPhoneNumberCopyWith<$Res>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  factory _$$UpdatePasswordRequestWithPhoneNumberCopyWith(
          _$UpdatePasswordRequestWithPhoneNumber value,
          $Res Function(_$UpdatePasswordRequestWithPhoneNumber) then) =
      __$$UpdatePasswordRequestWithPhoneNumberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber, String verificationCode, String newPassword});
}

/// @nodoc
class __$$UpdatePasswordRequestWithPhoneNumberCopyWithImpl<$Res>
    extends _$UpdatePasswordRequestCopyWithImpl<$Res,
        _$UpdatePasswordRequestWithPhoneNumber>
    implements _$$UpdatePasswordRequestWithPhoneNumberCopyWith<$Res> {
  __$$UpdatePasswordRequestWithPhoneNumberCopyWithImpl(
      _$UpdatePasswordRequestWithPhoneNumber _value,
      $Res Function(_$UpdatePasswordRequestWithPhoneNumber) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? verificationCode = null,
    Object? newPassword = null,
  }) {
    return _then(_$UpdatePasswordRequestWithPhoneNumber(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      verificationCode: null == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePasswordRequestWithPhoneNumber
    implements UpdatePasswordRequestWithPhoneNumber {
  const _$UpdatePasswordRequestWithPhoneNumber(
      {required this.phoneNumber,
      required this.verificationCode,
      required this.newPassword});

  @override
  final String phoneNumber;
  @override
  final String verificationCode;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'UpdatePasswordRequest.withPhoneNumber(phoneNumber: $phoneNumber, verificationCode: $verificationCode, newPassword: $newPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordRequestWithPhoneNumber &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordRequestWithPhoneNumberCopyWith<
          _$UpdatePasswordRequestWithPhoneNumber>
      get copyWith => __$$UpdatePasswordRequestWithPhoneNumberCopyWithImpl<
          _$UpdatePasswordRequestWithPhoneNumber>(this, _$identity);

  @override
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
    return withPhoneNumber(phoneNumber, verificationCode, newPassword);
  }

  @override
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
    return withPhoneNumber?.call(phoneNumber, verificationCode, newPassword);
  }

  @override
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
    if (withPhoneNumber != null) {
      return withPhoneNumber(phoneNumber, verificationCode, newPassword);
    }
    return orElse();
  }

  @override
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
    return withPhoneNumber(this);
  }

  @override
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
    return withPhoneNumber?.call(this);
  }

  @override
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
    if (withPhoneNumber != null) {
      return withPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class UpdatePasswordRequestWithPhoneNumber
    implements UpdatePasswordRequest {
  const factory UpdatePasswordRequestWithPhoneNumber(
          {required final String phoneNumber,
          required final String verificationCode,
          required final String newPassword}) =
      _$UpdatePasswordRequestWithPhoneNumber;

  String get phoneNumber;
  String get verificationCode;
  @override
  String get newPassword;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePasswordRequestWithPhoneNumberCopyWith<
          _$UpdatePasswordRequestWithPhoneNumber>
      get copyWith => throw _privateConstructorUsedError;
}
