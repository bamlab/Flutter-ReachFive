// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_token_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RevokeTokenRequest extends RevokeTokenRequest {
  @override
  final String clientId;
  @override
  final String clientSecret;
  @override
  final String token;
  @override
  final String? tokenTypeHint;

  factory _$RevokeTokenRequest(
          [void Function(RevokeTokenRequestBuilder)? updates]) =>
      (new RevokeTokenRequestBuilder()..update(updates))._build();

  _$RevokeTokenRequest._(
      {required this.clientId,
      required this.clientSecret,
      required this.token,
      this.tokenTypeHint})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        clientId, r'RevokeTokenRequest', 'clientId');
    BuiltValueNullFieldError.checkNotNull(
        clientSecret, r'RevokeTokenRequest', 'clientSecret');
    BuiltValueNullFieldError.checkNotNull(
        token, r'RevokeTokenRequest', 'token');
  }

  @override
  RevokeTokenRequest rebuild(
          void Function(RevokeTokenRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RevokeTokenRequestBuilder toBuilder() =>
      new RevokeTokenRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RevokeTokenRequest &&
        clientId == other.clientId &&
        clientSecret == other.clientSecret &&
        token == other.token &&
        tokenTypeHint == other.tokenTypeHint;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, clientId.hashCode), clientSecret.hashCode),
            token.hashCode),
        tokenTypeHint.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RevokeTokenRequest')
          ..add('clientId', clientId)
          ..add('clientSecret', clientSecret)
          ..add('token', token)
          ..add('tokenTypeHint', tokenTypeHint))
        .toString();
  }
}

class RevokeTokenRequestBuilder
    implements Builder<RevokeTokenRequest, RevokeTokenRequestBuilder> {
  _$RevokeTokenRequest? _$v;

  String? _clientId;
  String? get clientId => _$this._clientId;
  set clientId(String? clientId) => _$this._clientId = clientId;

  String? _clientSecret;
  String? get clientSecret => _$this._clientSecret;
  set clientSecret(String? clientSecret) => _$this._clientSecret = clientSecret;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _tokenTypeHint;
  String? get tokenTypeHint => _$this._tokenTypeHint;
  set tokenTypeHint(String? tokenTypeHint) =>
      _$this._tokenTypeHint = tokenTypeHint;

  RevokeTokenRequestBuilder() {
    RevokeTokenRequest._defaults(this);
  }

  RevokeTokenRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientId = $v.clientId;
      _clientSecret = $v.clientSecret;
      _token = $v.token;
      _tokenTypeHint = $v.tokenTypeHint;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RevokeTokenRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RevokeTokenRequest;
  }

  @override
  void update(void Function(RevokeTokenRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RevokeTokenRequest build() => _build();

  _$RevokeTokenRequest _build() {
    final _$result = _$v ??
        new _$RevokeTokenRequest._(
            clientId: BuiltValueNullFieldError.checkNotNull(
                clientId, r'RevokeTokenRequest', 'clientId'),
            clientSecret: BuiltValueNullFieldError.checkNotNull(
                clientSecret, r'RevokeTokenRequest', 'clientSecret'),
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'RevokeTokenRequest', 'token'),
            tokenTypeHint: tokenTypeHint);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
