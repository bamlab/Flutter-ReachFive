// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeTokenRequest _$RevokeTokenRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RevokeTokenRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['client_id', 'client_secret', 'token'],
        );
        final val = RevokeTokenRequest(
          clientId: $checkedConvert('client_id', (v) => v as String),
          clientSecret: $checkedConvert('client_secret', (v) => v as String),
          token: $checkedConvert('token', (v) => v as String),
          tokenTypeHint:
              $checkedConvert('token_type_hint', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'clientId': 'client_id',
        'clientSecret': 'client_secret',
        'tokenTypeHint': 'token_type_hint'
      },
    );

Map<String, dynamic> _$RevokeTokenRequestToJson(RevokeTokenRequest instance) {
  final val = <String, dynamic>{
    'client_id': instance.clientId,
    'client_secret': instance.clientSecret,
    'token': instance.token,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token_type_hint', instance.tokenTypeHint);
  return val;
}
