import 'package:flutter_reach_five/models/auth_token.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$AuthToken', () {
    test('instances with same fields are equal', () async {
      const firstInstance = AuthToken(accessToken: 'accessToken');
      const secondInstance = AuthToken(accessToken: 'accessToken');

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = AuthToken(accessToken: 'accessToken1');
      const secondInstance = AuthToken(accessToken: 'accessToken2');

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
