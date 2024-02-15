import 'package:flutter_reach_five/helpers/profile_signup_request_converter.dart';
import 'package:flutter_reach_five/models/consent.dart';
import 'package:flutter_reach_five/models/profile_address.dart';
import 'package:flutter_reach_five/models/profile_signup_request.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ProfileSignupRequestConverter', () {
    test('toInterface method', () async {
      expect(
        ProfileSignupRequestConverter.toInterface(
          ProfileSignupRequest(
            password: 'password',
            addresses: const [ProfileAddress()],
            customFields: const <String, Object?>{'key': 'objectValue'},
            consents: <String, Consent>{
              'key': Consent(granted: true, date: DateTime.parse('2022-06-10')),
            },
          ),
        ),
        isInstanceOf<ProfileSignupRequestInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        ProfileSignupRequestConverter.fromInterface(
          ProfileSignupRequestInterface(
            password: 'password',
            addresses: [ProfileAddressInterface()],
            customFields: <String, Object?>{'key': 'objectValue'},
            consents: <String, ConsentInterface>{
              'key': ConsentInterface(granted: true, date: '2022-06-10'),
            },
          ),
        ),
        isInstanceOf<ProfileSignupRequest>(),
      );
    });
  });
}
