import 'package:flutter_reach_five/helpers/emails_converter.dart';
import 'package:flutter_reach_five/models/emails.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$EmailsConverter', () {
    test('toInterface method', () async {
      expect(
        EmailsConverter.toInterface(
          const Emails(
            verified: ['verifiedEmail'],
            unverified: ['unverifiedEmail'],
          ),
        ),
        isInstanceOf<EmailsInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        EmailsConverter.fromInterface(
          EmailsInterface(
            verified: ['verifiedEmail'],
            unverified: ['unverifiedEmail'],
          ),
        ),
        isInstanceOf<Emails>(),
      );
    });
  });
}
