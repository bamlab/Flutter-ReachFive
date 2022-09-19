import 'package:flutter_reach_five/models/profile_address.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ProfileAddress', () {
    test('instances with same fields are equal', () async {
      const firstInstance = ProfileAddress(title: 'title');
      const secondInstance = ProfileAddress(title: 'title');

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = ProfileAddress(title: 'title1');
      const secondInstance = ProfileAddress(title: 'title2');

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
