// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_phone_number_credential_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletePhoneNumberCredentialRequest _$DeletePhoneNumberCredentialRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DeletePhoneNumberCredentialRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['phone_number'],
        );
        final val = DeletePhoneNumberCredentialRequest(
          phoneNumber: $checkedConvert('phone_number', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'phoneNumber': 'phone_number'},
    );

Map<String, dynamic> _$DeletePhoneNumberCredentialRequestToJson(
        DeletePhoneNumberCredentialRequest instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
    };
