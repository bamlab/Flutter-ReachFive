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
          const ProfileSignupRequest(
            password: 'password',
            addresses: [ProfileAddress()],
            consents: <String, Consent>{
              'key': Consent(granted: true, date: 'date')
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
            consents: <String, ConsentInterface>{
              'key': ConsentInterface(granted: true, date: 'date')
            },
          ),
        ),
        isInstanceOf<ProfileSignupRequest>(),
      );
    });
  });
}
