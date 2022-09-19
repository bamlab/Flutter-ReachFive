import 'package:flutter_reach_five/models/profile_signup_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ProfileSignupRequest', () {
    test('instances with same fields are equal', () async {
      const firstInstance = ProfileSignupRequest(password: 'password');
      const secondInstance = ProfileSignupRequest(password: 'password');

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = ProfileSignupRequest(password: 'password1');
      const secondInstance = ProfileSignupRequest(password: 'password2');

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
