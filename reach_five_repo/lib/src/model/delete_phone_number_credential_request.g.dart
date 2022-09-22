// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_phone_number_credential_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeletePhoneNumberCredentialRequest
    extends DeletePhoneNumberCredentialRequest {
  @override
  final String phoneNumber;

  factory _$DeletePhoneNumberCredentialRequest(
          [void Function(DeletePhoneNumberCredentialRequestBuilder)?
              updates]) =>
      (new DeletePhoneNumberCredentialRequestBuilder()..update(updates))
          ._build();

  _$DeletePhoneNumberCredentialRequest._({required this.phoneNumber})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, r'DeletePhoneNumberCredentialRequest', 'phoneNumber');
  }

  @override
  DeletePhoneNumberCredentialRequest rebuild(
          void Function(DeletePhoneNumberCredentialRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeletePhoneNumberCredentialRequestBuilder toBuilder() =>
      new DeletePhoneNumberCredentialRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeletePhoneNumberCredentialRequest &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode {
    return $jf($jc(0, phoneNumber.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeletePhoneNumberCredentialRequest')
          ..add('phoneNumber', phoneNumber))
        .toString();
  }
}

class DeletePhoneNumberCredentialRequestBuilder
    implements
        Builder<DeletePhoneNumberCredentialRequest,
            DeletePhoneNumberCredentialRequestBuilder> {
  _$DeletePhoneNumberCredentialRequest? _$v;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  DeletePhoneNumberCredentialRequestBuilder() {
    DeletePhoneNumberCredentialRequest._defaults(this);
  }

  DeletePhoneNumberCredentialRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phoneNumber = $v.phoneNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeletePhoneNumberCredentialRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeletePhoneNumberCredentialRequest;
  }

  @override
  void update(
      void Function(DeletePhoneNumberCredentialRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeletePhoneNumberCredentialRequest build() => _build();

  _$DeletePhoneNumberCredentialRequest _build() {
    final _$result = _$v ??
        new _$DeletePhoneNumberCredentialRequest._(
            phoneNumber: BuiltValueNullFieldError.checkNotNull(phoneNumber,
                r'DeletePhoneNumberCredentialRequest', 'phoneNumber'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
