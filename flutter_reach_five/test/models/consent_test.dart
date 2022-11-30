import 'package:flutter_reach_five/models/consent.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$Consent', () {
    test('instances with same fields are equal', () async {
      final firstInstance =
          Consent(granted: true, date: DateTime.parse('2022-06-10'));
      final secondInstance =
          Consent(granted: true, date: DateTime.parse('2022-06-10'));

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with different fields are not equal', () async {
      final firstInstance =
          Consent(granted: true, date: DateTime.parse('2022-06-10'));
      final secondInstance =
          Consent(granted: false, date: DateTime.parse('2022-06-10'));

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
