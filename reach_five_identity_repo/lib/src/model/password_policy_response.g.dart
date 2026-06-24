// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_policy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordPolicyResponse _$PasswordPolicyResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PasswordPolicyResponse', json, ($checkedConvert) {
  $checkKeys(
    json,
    requiredKeys: const [
      'minLength',
      'minStrength',
      'allowUpdateWithAccessTokenOnly',
    ],
  );
  final val = PasswordPolicyResponse(
    minLength: $checkedConvert('minLength', (v) => (v as num).toInt()),
    minStrength: $checkedConvert('minStrength', (v) => (v as num).toInt()),
    specialCharacters: $checkedConvert(
      'specialCharacters',
      (v) => (v as num?)?.toInt(),
    ),
    uppercaseCharacters: $checkedConvert(
      'uppercaseCharacters',
      (v) => (v as num?)?.toInt(),
    ),
    lowercaseCharacters: $checkedConvert(
      'lowercaseCharacters',
      (v) => (v as num?)?.toInt(),
    ),
    digitCharacters: $checkedConvert(
      'digitCharacters',
      (v) => (v as num?)?.toInt(),
    ),
    allowUpdateWithAccessTokenOnly: $checkedConvert(
      'allowUpdateWithAccessTokenOnly',
      (v) => v as bool,
    ),
  );
  return val;
});

Map<String, dynamic> _$PasswordPolicyResponseToJson(
  PasswordPolicyResponse instance,
) => <String, dynamic>{
  'minLength': instance.minLength,
  'minStrength': instance.minStrength,
  'specialCharacters': ?instance.specialCharacters,
  'uppercaseCharacters': ?instance.uppercaseCharacters,
  'lowercaseCharacters': ?instance.lowercaseCharacters,
  'digitCharacters': ?instance.digitCharacters,
  'allowUpdateWithAccessTokenOnly': instance.allowUpdateWithAccessTokenOnly,
};
