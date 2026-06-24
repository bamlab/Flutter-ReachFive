// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientConfigResponse _$ClientConfigResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ClientConfigResponse',
  json,
  ($checkedConvert) {
    final val = ClientConfigResponse(
      passwordPolicy: $checkedConvert(
        'password_policy',
        (v) => v == null
            ? null
            : PasswordPolicy.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'passwordPolicy': 'password_policy'},
);

Map<String, dynamic> _$ClientConfigResponseToJson(
  ClientConfigResponse instance,
) => <String, dynamic>{'password_policy': ?instance.passwordPolicy?.toJson()};
