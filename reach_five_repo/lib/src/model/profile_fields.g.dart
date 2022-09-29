// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_fields.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileFields _$ProfileFieldsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ProfileFields',
      json,
      ($checkedConvert) {
        final val = ProfileFields(
          email: $checkedConvert('email', (v) => v as String?),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String?),
          externalId: $checkedConvert('external_id', (v) => v as String?),
          emailVerified: $checkedConvert('email_verified', (v) => v as bool?),
          phoneNumberVerified:
              $checkedConvert('phone_number_verified', (v) => v as bool?),
          givenName: $checkedConvert('given_name', (v) => v as String?),
          middleName: $checkedConvert('middle_name', (v) => v as String?),
          familyName: $checkedConvert('family_name', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          nickname: $checkedConvert('nickname', (v) => v as String?),
          username: $checkedConvert('username', (v) => v as String?),
          birthdate: $checkedConvert('birthdate', (v) => v as String?),
          gender: $checkedConvert('gender',
              (v) => $enumDecodeNullable(_$ProfileFieldsGenderEnumEnumMap, v)),
          addresses: $checkedConvert('addresses', (v) => v),
          picture: $checkedConvert('picture', (v) => v as String?),
          company: $checkedConvert('company', (v) => v as String?),
          customFields: $checkedConvert('custom_fields', (v) => v),
          consents: $checkedConvert('consents', (v) => v),
        );
        return val;
      },
      fieldKeyMap: const {
        'phoneNumber': 'phone_number',
        'externalId': 'external_id',
        'emailVerified': 'email_verified',
        'phoneNumberVerified': 'phone_number_verified',
        'givenName': 'given_name',
        'middleName': 'middle_name',
        'familyName': 'family_name',
        'customFields': 'custom_fields'
      },
    );

Map<String, dynamic> _$ProfileFieldsToJson(ProfileFields instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('external_id', instance.externalId);
  writeNotNull('email_verified', instance.emailVerified);
  writeNotNull('phone_number_verified', instance.phoneNumberVerified);
  writeNotNull('given_name', instance.givenName);
  writeNotNull('middle_name', instance.middleName);
  writeNotNull('family_name', instance.familyName);
  writeNotNull('name', instance.name);
  writeNotNull('nickname', instance.nickname);
  writeNotNull('username', instance.username);
  writeNotNull('birthdate', instance.birthdate);
  writeNotNull('gender', _$ProfileFieldsGenderEnumEnumMap[instance.gender]);
  writeNotNull('addresses', instance.addresses);
  writeNotNull('picture', instance.picture);
  writeNotNull('company', instance.company);
  writeNotNull('custom_fields', instance.customFields);
  writeNotNull('consents', instance.consents);
  return val;
}

const _$ProfileFieldsGenderEnumEnumMap = {
  ProfileFieldsGenderEnum.female: 'female',
  ProfileFieldsGenderEnum.male: 'male',
  ProfileFieldsGenderEnum.other: 'other',
};
