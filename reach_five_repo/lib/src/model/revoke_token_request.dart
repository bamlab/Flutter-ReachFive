//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'revoke_token_request.g.dart';

/// RevokeTokenRequest
///
/// Properties:
/// * [clientId] - Your client ID.
/// * [clientSecret] - Your client Secret. Required if your Client's authorization method is POST.
/// * [token] - The Token to revoke.  > **Note**: This can be either an `access_token` or a `refresh_token`.
/// * [tokenTypeHint] - An optional string where you can hint at what type of token to differentiate between access and refresh.  > **Note**: The only meaningful values are `access_token` and `refresh_token`.
abstract class RevokeTokenRequest
    implements Built<RevokeTokenRequest, RevokeTokenRequestBuilder> {
  /// Your client ID.
  @BuiltValueField(wireName: r'client_id')
  String get clientId;

  /// Your client Secret. Required if your Client's authorization method is POST.
  @BuiltValueField(wireName: r'client_secret')
  String get clientSecret;

  /// The Token to revoke.  > **Note**: This can be either an `access_token` or a `refresh_token`.
  @BuiltValueField(wireName: r'token')
  String get token;

  /// An optional string where you can hint at what type of token to differentiate between access and refresh.  > **Note**: The only meaningful values are `access_token` and `refresh_token`.
  @BuiltValueField(wireName: r'token_type_hint')
  String? get tokenTypeHint;

  RevokeTokenRequest._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RevokeTokenRequestBuilder b) => b;

  factory RevokeTokenRequest([void updates(RevokeTokenRequestBuilder b)]) =
      _$RevokeTokenRequest;

  @BuiltValueSerializer(custom: true)
  static Serializer<RevokeTokenRequest> get serializer =>
      _$RevokeTokenRequestSerializer();
}

class _$RevokeTokenRequestSerializer
    implements StructuredSerializer<RevokeTokenRequest> {
  @override
  final Iterable<Type> types = const [RevokeTokenRequest, _$RevokeTokenRequest];

  @override
  final String wireName = r'RevokeTokenRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, RevokeTokenRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    result
      ..add(r'client_id')
      ..add(serializers.serialize(object.clientId,
          specifiedType: const FullType(String)));
    result
      ..add(r'client_secret')
      ..add(serializers.serialize(object.clientSecret,
          specifiedType: const FullType(String)));
    result
      ..add(r'token')
      ..add(serializers.serialize(object.token,
          specifiedType: const FullType(String)));
    if (object.tokenTypeHint != null) {
      result
        ..add(r'token_type_hint')
        ..add(serializers.serialize(object.tokenTypeHint,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RevokeTokenRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RevokeTokenRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;

      switch (key) {
        case r'client_id':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.clientId = valueDes;
          break;
        case r'client_secret':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.clientSecret = valueDes;
          break;
        case r'token':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.token = valueDes;
          break;
        case r'token_type_hint':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.tokenTypeHint = valueDes;
          break;
      }
    }
    return result.build();
  }
}
