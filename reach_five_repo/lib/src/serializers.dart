//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:reach_five_repo/src/date_serializer.dart';
import 'package:reach_five_repo/src/model/date.dart';

import 'package:reach_five_repo/src/model/delete_credential401_response.dart';
import 'package:reach_five_repo/src/model/delete_phone_number_credential_request.dart';
import 'package:reach_five_repo/src/model/profile_fields.dart';
import 'package:reach_five_repo/src/model/revoke_token_request.dart';

part 'serializers.g.dart';

@SerializersFor([
  DeleteCredential401Response,
  DeletePhoneNumberCredentialRequest,
  ProfileFields,
  RevokeTokenRequest,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
