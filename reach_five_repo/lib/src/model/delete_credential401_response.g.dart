// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_credential401_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeleteCredential401Response extends DeleteCredential401Response {
  @override
  final String? error;
  @override
  final String? errorDescription;
  @override
  final String? errorId;
  @override
  final String? errorMessageKey;
  @override
  final String? errorUserMsg;

  factory _$DeleteCredential401Response(
          [void Function(DeleteCredential401ResponseBuilder)? updates]) =>
      (new DeleteCredential401ResponseBuilder()..update(updates))._build();

  _$DeleteCredential401Response._(
      {this.error,
      this.errorDescription,
      this.errorId,
      this.errorMessageKey,
      this.errorUserMsg})
      : super._();

  @override
  DeleteCredential401Response rebuild(
          void Function(DeleteCredential401ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeleteCredential401ResponseBuilder toBuilder() =>
      new DeleteCredential401ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeleteCredential401Response &&
        error == other.error &&
        errorDescription == other.errorDescription &&
        errorId == other.errorId &&
        errorMessageKey == other.errorMessageKey &&
        errorUserMsg == other.errorUserMsg;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, error.hashCode), errorDescription.hashCode),
                errorId.hashCode),
            errorMessageKey.hashCode),
        errorUserMsg.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeleteCredential401Response')
          ..add('error', error)
          ..add('errorDescription', errorDescription)
          ..add('errorId', errorId)
          ..add('errorMessageKey', errorMessageKey)
          ..add('errorUserMsg', errorUserMsg))
        .toString();
  }
}

class DeleteCredential401ResponseBuilder
    implements
        Builder<DeleteCredential401Response,
            DeleteCredential401ResponseBuilder> {
  _$DeleteCredential401Response? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _errorDescription;
  String? get errorDescription => _$this._errorDescription;
  set errorDescription(String? errorDescription) =>
      _$this._errorDescription = errorDescription;

  String? _errorId;
  String? get errorId => _$this._errorId;
  set errorId(String? errorId) => _$this._errorId = errorId;

  String? _errorMessageKey;
  String? get errorMessageKey => _$this._errorMessageKey;
  set errorMessageKey(String? errorMessageKey) =>
      _$this._errorMessageKey = errorMessageKey;

  String? _errorUserMsg;
  String? get errorUserMsg => _$this._errorUserMsg;
  set errorUserMsg(String? errorUserMsg) => _$this._errorUserMsg = errorUserMsg;

  DeleteCredential401ResponseBuilder() {
    DeleteCredential401Response._defaults(this);
  }

  DeleteCredential401ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _errorDescription = $v.errorDescription;
      _errorId = $v.errorId;
      _errorMessageKey = $v.errorMessageKey;
      _errorUserMsg = $v.errorUserMsg;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeleteCredential401Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeleteCredential401Response;
  }

  @override
  void update(void Function(DeleteCredential401ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeleteCredential401Response build() => _build();

  _$DeleteCredential401Response _build() {
    final _$result = _$v ??
        new _$DeleteCredential401Response._(
            error: error,
            errorDescription: errorDescription,
            errorId: errorId,
            errorMessageKey: errorMessageKey,
            errorUserMsg: errorUserMsg);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
