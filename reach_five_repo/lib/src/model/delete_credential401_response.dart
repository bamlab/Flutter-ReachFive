//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_credential401_response.g.dart';

/// DeleteCredential401Response
///
/// Properties:
/// * [error] - Technical error code
/// * [errorDescription] - Source of error
/// * [errorId] - Generated error ID
/// * [errorMessageKey] - Message error
/// * [errorUserMsg] - User-friendly message error
abstract class DeleteCredential401Response
    implements
        Built<DeleteCredential401Response, DeleteCredential401ResponseBuilder> {
  /// Technical error code
  @BuiltValueField(wireName: r'error')
  String? get error;

  /// Source of error
  @BuiltValueField(wireName: r'error_description')
  String? get errorDescription;

  /// Generated error ID
  @BuiltValueField(wireName: r'error_id')
  String? get errorId;

  /// Message error
  @BuiltValueField(wireName: r'error_message_key')
  String? get errorMessageKey;

  /// User-friendly message error
  @BuiltValueField(wireName: r'error_user_msg')
  String? get errorUserMsg;

  DeleteCredential401Response._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeleteCredential401ResponseBuilder b) => b;

  factory DeleteCredential401Response(
          [void updates(DeleteCredential401ResponseBuilder b)]) =
      _$DeleteCredential401Response;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeleteCredential401Response> get serializer =>
      _$DeleteCredential401ResponseSerializer();
}

class _$DeleteCredential401ResponseSerializer
    implements StructuredSerializer<DeleteCredential401Response> {
  @override
  final Iterable<Type> types = const [
    DeleteCredential401Response,
    _$DeleteCredential401Response
  ];

  @override
  final String wireName = r'DeleteCredential401Response';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DeleteCredential401Response object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.error != null) {
      result
        ..add(r'error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }
    if (object.errorDescription != null) {
      result
        ..add(r'error_description')
        ..add(serializers.serialize(object.errorDescription,
            specifiedType: const FullType(String)));
    }
    if (object.errorId != null) {
      result
        ..add(r'error_id')
        ..add(serializers.serialize(object.errorId,
            specifiedType: const FullType(String)));
    }
    if (object.errorMessageKey != null) {
      result
        ..add(r'error_message_key')
        ..add(serializers.serialize(object.errorMessageKey,
            specifiedType: const FullType(String)));
    }
    if (object.errorUserMsg != null) {
      result
        ..add(r'error_user_msg')
        ..add(serializers.serialize(object.errorUserMsg,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DeleteCredential401Response deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DeleteCredential401ResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;

      switch (key) {
        case r'error':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.error = valueDes;
          break;
        case r'error_description':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.errorDescription = valueDes;
          break;
        case r'error_id':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.errorId = valueDes;
          break;
        case r'error_message_key':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.errorMessageKey = valueDes;
          break;
        case r'error_user_msg':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.errorUserMsg = valueDes;
          break;
      }
    }
    return result.build();
  }
}
