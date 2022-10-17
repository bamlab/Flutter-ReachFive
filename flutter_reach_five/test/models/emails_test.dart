import 'package:flutter_reach_five/models/emails.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$Emails', () {
    test('instances with same fields are equal', () async {
      const firstInstance = Emails(
        verified: ['verifiedEmail'],
        unverified: ['unverifiedEmail'],
      );
      const secondInstance = Emails(
        verified: ['verifiedEmail'],
        unverified: ['unverifiedEmail'],
      );

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = Emails(
        verified: ['verifiedEmail'],
        unverified: ['unverifiedEmail'],
      );
      const secondInstance = Emails(
        verified: ['verifiedEmail2'],
        unverified: ['unverifiedEmail2'],
      );

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
