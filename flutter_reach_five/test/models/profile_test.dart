import 'package:flutter_reach_five/models/profile.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$Profile', () {
    test('instances with same fields are equal', () async {
      const firstInstance = Profile(
        givenName: 'givenName',
      );
      const secondInstance = Profile(
        givenName: 'givenName',
      );

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = Profile(
        givenName: 'givenName',
      );
      const secondInstance = Profile(
        givenName: 'givenName2',
      );

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
