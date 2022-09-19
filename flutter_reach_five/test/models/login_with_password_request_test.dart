import 'package:flutter_reach_five/models/login_with_password_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$LoginWithPasswordRequest', () {
    test('instances with same fields are equal', () async {
      const firstInstance = LoginWithPasswordRequest(
        password: 'password',
      );
      const secondInstance = LoginWithPasswordRequest(
        password: 'password',
      );

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = LoginWithPasswordRequest(
        password: 'password1',
      );
      const secondInstance = LoginWithPasswordRequest(
        password: 'password2',
      );

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
