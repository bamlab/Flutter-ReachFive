//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'delete_phone_number_credential_request.g.dart';

/// DeletePhoneNumberCredentialRequest
///
/// Properties:
/// * [phoneNumber] - The phone number used as a second factor. It doesn't have to be the same than the identifier.
abstract class DeletePhoneNumberCredentialRequest
    implements
        Built<DeletePhoneNumberCredentialRequest,
            DeletePhoneNumberCredentialRequestBuilder> {
  /// The phone number used as a second factor. It doesn't have to be the same than the identifier.
  @BuiltValueField(wireName: r'phone_number')
  String get phoneNumber;

  DeletePhoneNumberCredentialRequest._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeletePhoneNumberCredentialRequestBuilder b) => b;

  factory DeletePhoneNumberCredentialRequest(
          [void updates(DeletePhoneNumberCredentialRequestBuilder b)]) =
      _$DeletePhoneNumberCredentialRequest;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeletePhoneNumberCredentialRequest> get serializer =>
      _$DeletePhoneNumberCredentialRequestSerializer();
}

class _$DeletePhoneNumberCredentialRequestSerializer
    implements StructuredSerializer<DeletePhoneNumberCredentialRequest> {
  @override
  final Iterable<Type> types = const [
    DeletePhoneNumberCredentialRequest,
    _$DeletePhoneNumberCredentialRequest
  ];

  @override
  final String wireName = r'DeletePhoneNumberCredentialRequest';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DeletePhoneNumberCredentialRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    result
      ..add(r'phone_number')
      ..add(serializers.serialize(object.phoneNumber,
          specifiedType: const FullType(String)));
    return result;
  }

  @override
  DeletePhoneNumberCredentialRequest deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DeletePhoneNumberCredentialRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;

      switch (key) {
        case r'phone_number':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.phoneNumber = valueDes;
          break;
      }
    }
    return result.build();
  }
}
