import 'package:flutter_reach_five/models/open_id_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$OpenIdUser', () {
    test('instances with same fields are equal', () async {
      const firstInstance = OpenIdUser(id: 'id');
      const secondInstance = OpenIdUser(id: 'id');

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = OpenIdUser(id: 'id1');
      const secondInstance = OpenIdUser(id: 'id2');

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
