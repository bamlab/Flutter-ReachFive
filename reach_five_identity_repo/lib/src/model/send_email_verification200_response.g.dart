// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_verification200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailVerification200Response _$SendEmailVerification200ResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SendEmailVerification200Response',
      json,
      ($checkedConvert) {
        final val = SendEmailVerification200Response(
          verificationEmailSent:
              $checkedConvert('verification_email_sent', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {'verificationEmailSent': 'verification_email_sent'},
    );

Map<String, dynamic> _$SendEmailVerification200ResponseToJson(
    SendEmailVerification200Response instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('verification_email_sent', instance.verificationEmailSent);
  return val;
}
