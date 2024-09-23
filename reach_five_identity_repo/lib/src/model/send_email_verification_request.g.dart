// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailVerificationRequest _$SendEmailVerificationRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SendEmailVerificationRequest',
      json,
      ($checkedConvert) {
        final val = SendEmailVerificationRequest(
          redirectUrl: $checkedConvert('redirect_url', (v) => v as String?),
          returnToAfterEmailConfirmation: $checkedConvert(
              'return_to_after_email_confirmation', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'redirectUrl': 'redirect_url',
        'returnToAfterEmailConfirmation': 'return_to_after_email_confirmation'
      },
    );

Map<String, dynamic> _$SendEmailVerificationRequestToJson(
    SendEmailVerificationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('redirect_url', instance.redirectUrl);
  writeNotNull('return_to_after_email_confirmation',
      instance.returnToAfterEmailConfirmation);
  return val;
}
