//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'profile_fields.g.dart';

/// ProfileFields
///
/// Properties:
/// * [email] - Email
/// * [phoneNumber] - The user's phone number.
/// * [externalId] - External ID
/// * [emailVerified] - `true` if the email has been verified.
/// * [phoneNumberVerified] - `true` if the phone number has been verified.
/// * [givenName] - Given name(s) or first name(s).
/// * [middleName] - Middle name(s).
/// * [familyName] - Surname(s) or last name(s).
/// * [name] - Full user name.
/// * [nickname] - Casual name that may or may not be the same as the `given_name`.
/// * [username] - Username
/// * [birthdate] - User’s birthdate, represented as an ISO 8601 YYYY-MM-DD format.
/// * [gender] - User’s gender.
/// * [addresses] - User postal addresses.
/// * [picture] - URL to the profile picture
/// * [company] - User company name.
/// * [customFields] - Custom fields.
/// * [consents] - Consents.
abstract class ProfileFields
    implements Built<ProfileFields, ProfileFieldsBuilder> {
  /// Email
  @BuiltValueField(wireName: r'email')
  String? get email;

  /// The user's phone number.
  @BuiltValueField(wireName: r'phone_number')
  String? get phoneNumber;

  /// External ID
  @BuiltValueField(wireName: r'external_id')
  String? get externalId;

  /// `true` if the email has been verified.
  @BuiltValueField(wireName: r'email_verified')
  bool? get emailVerified;

  /// `true` if the phone number has been verified.
  @BuiltValueField(wireName: r'phone_number_verified')
  bool? get phoneNumberVerified;

  /// Given name(s) or first name(s).
  @BuiltValueField(wireName: r'given_name')
  String? get givenName;

  /// Middle name(s).
  @BuiltValueField(wireName: r'middle_name')
  String? get middleName;

  /// Surname(s) or last name(s).
  @BuiltValueField(wireName: r'family_name')
  String? get familyName;

  /// Full user name.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// Casual name that may or may not be the same as the `given_name`.
  @BuiltValueField(wireName: r'nickname')
  String? get nickname;

  /// Username
  @BuiltValueField(wireName: r'username')
  String? get username;

  /// User’s birthdate, represented as an ISO 8601 YYYY-MM-DD format.
  @BuiltValueField(wireName: r'birthdate')
  String? get birthdate;

  /// User’s gender.
  @BuiltValueField(wireName: r'gender')
  ProfileFieldsGenderEnum? get gender;
  // enum genderEnum {  female,  male,  other,  };

  /// User postal addresses.
  @BuiltValueField(wireName: r'addresses')
  JsonObject? get addresses;

  /// URL to the profile picture
  @BuiltValueField(wireName: r'picture')
  String? get picture;

  /// User company name.
  @BuiltValueField(wireName: r'company')
  String? get company;

  /// Custom fields.
  @BuiltValueField(wireName: r'custom_fields')
  JsonObject? get customFields;

  /// Consents.
  @BuiltValueField(wireName: r'consents')
  JsonObject? get consents;

  ProfileFields._();

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ProfileFieldsBuilder b) => b;

  factory ProfileFields([void updates(ProfileFieldsBuilder b)]) =
      _$ProfileFields;

  @BuiltValueSerializer(custom: true)
  static Serializer<ProfileFields> get serializer =>
      _$ProfileFieldsSerializer();
}

class _$ProfileFieldsSerializer implements StructuredSerializer<ProfileFields> {
  @override
  final Iterable<Type> types = const [ProfileFields, _$ProfileFields];

  @override
  final String wireName = r'ProfileFields';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProfileFields object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.email != null) {
      result
        ..add(r'email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.phoneNumber != null) {
      result
        ..add(r'phone_number')
        ..add(serializers.serialize(object.phoneNumber,
            specifiedType: const FullType(String)));
    }
    if (object.externalId != null) {
      result
        ..add(r'external_id')
        ..add(serializers.serialize(object.externalId,
            specifiedType: const FullType(String)));
    }
    if (object.emailVerified != null) {
      result
        ..add(r'email_verified')
        ..add(serializers.serialize(object.emailVerified,
            specifiedType: const FullType(bool)));
    }
    if (object.phoneNumberVerified != null) {
      result
        ..add(r'phone_number_verified')
        ..add(serializers.serialize(object.phoneNumberVerified,
            specifiedType: const FullType(bool)));
    }
    if (object.givenName != null) {
      result
        ..add(r'given_name')
        ..add(serializers.serialize(object.givenName,
            specifiedType: const FullType(String)));
    }
    if (object.middleName != null) {
      result
        ..add(r'middle_name')
        ..add(serializers.serialize(object.middleName,
            specifiedType: const FullType(String)));
    }
    if (object.familyName != null) {
      result
        ..add(r'family_name')
        ..add(serializers.serialize(object.familyName,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add(r'name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.nickname != null) {
      result
        ..add(r'nickname')
        ..add(serializers.serialize(object.nickname,
            specifiedType: const FullType(String)));
    }
    if (object.username != null) {
      result
        ..add(r'username')
        ..add(serializers.serialize(object.username,
            specifiedType: const FullType(String)));
    }
    if (object.birthdate != null) {
      result
        ..add(r'birthdate')
        ..add(serializers.serialize(object.birthdate,
            specifiedType: const FullType(String)));
    }
    if (object.gender != null) {
      result
        ..add(r'gender')
        ..add(serializers.serialize(object.gender,
            specifiedType: const FullType(ProfileFieldsGenderEnum)));
    }
    if (object.addresses != null) {
      result
        ..add(r'addresses')
        ..add(serializers.serialize(object.addresses,
            specifiedType: const FullType(JsonObject)));
    }
    if (object.picture != null) {
      result
        ..add(r'picture')
        ..add(serializers.serialize(object.picture,
            specifiedType: const FullType(String)));
    }
    if (object.company != null) {
      result
        ..add(r'company')
        ..add(serializers.serialize(object.company,
            specifiedType: const FullType(String)));
    }
    if (object.customFields != null) {
      result
        ..add(r'custom_fields')
        ..add(serializers.serialize(object.customFields,
            specifiedType: const FullType(JsonObject)));
    }
    if (object.consents != null) {
      result
        ..add(r'consents')
        ..add(serializers.serialize(object.consents,
            specifiedType: const FullType(JsonObject)));
    }
    return result;
  }

  @override
  ProfileFields deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ProfileFieldsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;

      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.email = valueDes;
          break;
        case r'phone_number':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.phoneNumber = valueDes;
          break;
        case r'external_id':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.externalId = valueDes;
          break;
        case r'email_verified':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          result.emailVerified = valueDes;
          break;
        case r'phone_number_verified':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          result.phoneNumberVerified = valueDes;
          break;
        case r'given_name':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.givenName = valueDes;
          break;
        case r'middle_name':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.middleName = valueDes;
          break;
        case r'family_name':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.familyName = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.name = valueDes;
          break;
        case r'nickname':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.nickname = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.username = valueDes;
          break;
        case r'birthdate':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.birthdate = valueDes;
          break;
        case r'gender':
          final valueDes = serializers.deserialize(value,
                  specifiedType: const FullType(ProfileFieldsGenderEnum))
              as ProfileFieldsGenderEnum;
          result.gender = valueDes;
          break;
        case r'addresses':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject;
          result.addresses = valueDes;
          break;
        case r'picture':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.picture = valueDes;
          break;
        case r'company':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          result.company = valueDes;
          break;
        case r'custom_fields':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject;
          result.customFields = valueDes;
          break;
        case r'consents':
          final valueDes = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject;
          result.consents = valueDes;
          break;
      }
    }
    return result.build();
  }
}

class ProfileFieldsGenderEnum extends EnumClass {
  /// User’s gender.
  @BuiltValueEnumConst(wireName: r'female')
  static const ProfileFieldsGenderEnum female =
      _$profileFieldsGenderEnum_female;

  /// User’s gender.
  @BuiltValueEnumConst(wireName: r'male')
  static const ProfileFieldsGenderEnum male = _$profileFieldsGenderEnum_male;

  /// User’s gender.
  @BuiltValueEnumConst(wireName: r'other')
  static const ProfileFieldsGenderEnum other = _$profileFieldsGenderEnum_other;

  static Serializer<ProfileFieldsGenderEnum> get serializer =>
      _$profileFieldsGenderEnumSerializer;

  const ProfileFieldsGenderEnum._(String name) : super(name);

  static BuiltSet<ProfileFieldsGenderEnum> get values =>
      _$profileFieldsGenderEnumValues;
  static ProfileFieldsGenderEnum valueOf(String name) =>
      _$profileFieldsGenderEnumValueOf(name);
}
