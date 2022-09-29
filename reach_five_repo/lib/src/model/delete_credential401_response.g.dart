// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_credential401_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCredential401Response _$DeleteCredential401ResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DeleteCredential401Response',
      json,
      ($checkedConvert) {
        final val = DeleteCredential401Response(
          error: $checkedConvert('error', (v) => v as String?),
          errorDescription:
              $checkedConvert('error_description', (v) => v as String?),
          errorId: $checkedConvert('error_id', (v) => v as String?),
          errorMessageKey:
              $checkedConvert('error_message_key', (v) => v as String?),
          errorUserMsg: $checkedConvert('error_user_msg', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'errorDescription': 'error_description',
        'errorId': 'error_id',
        'errorMessageKey': 'error_message_key',
        'errorUserMsg': 'error_user_msg'
      },
    );

Map<String, dynamic> _$DeleteCredential401ResponseToJson(
    DeleteCredential401Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.error);
  writeNotNull('error_description', instance.errorDescription);
  writeNotNull('error_id', instance.errorId);
  writeNotNull('error_message_key', instance.errorMessageKey);
  writeNotNull('error_user_msg', instance.errorUserMsg);
  return val;
}
