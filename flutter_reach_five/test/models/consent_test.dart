import 'package:flutter_reach_five/models/consent.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$Consent', () {
    test('instances with same fields are equal', () async {
      const firstInstance = Consent(granted: true, date: 'date');
      const secondInstance = Consent(granted: true, date: 'date');

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = Consent(granted: true, date: 'date');
      const secondInstance = Consent(granted: false, date: 'date');

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
