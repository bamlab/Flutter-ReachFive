import 'package:flutter_reach_five/helpers/profile_converter.dart';
import 'package:flutter_reach_five/models/consent.dart';
import 'package:flutter_reach_five/models/emails.dart';
import 'package:flutter_reach_five/models/login_summary.dart';
import 'package:flutter_reach_five/models/profile.dart';
import 'package:flutter_reach_five/models/profile_address.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ProfileConverter', () {
    test('toInterface method', () async {
      expect(
        ProfileConverter.toInterface(
          const Profile(
            loginSummary: LoginSummary(),
            emails: Emails(),
            customFields: <String, Object?>{'key': 'objectValue'},
            consents: <String, Consent>{
              'key': Consent(granted: true, date: 'date')
            },
            addresses: [ProfileAddress()],
          ),
        ),
        isInstanceOf<ProfileInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        ProfileConverter.fromInterface(
          ProfileInterface(
            loginSummary: LoginSummaryInterface(),
            emails: EmailsInterface(),
            customFields: <String, Object?>{'key': 'objectValue'},
            consents: <String, ConsentInterface>{
              'key': ConsentInterface(granted: true, date: 'date')
            },
            addresses: [ProfileAddressInterface()],
          ),
        ),
        isInstanceOf<Profile>(),
      );
    });
  });
}
