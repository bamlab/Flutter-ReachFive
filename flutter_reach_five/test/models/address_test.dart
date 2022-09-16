import 'package:flutter_reach_five/models/address.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$Address', () {
    test('instances with same fields are equal', () async {
      const firstInstance = Address(country: 'France');
      const secondInstance = Address(country: 'France');

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = Address(country: 'France');
      const secondInstance = Address(country: 'England');

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
