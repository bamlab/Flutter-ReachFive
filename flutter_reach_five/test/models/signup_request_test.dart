import 'package:flutter_reach_five/models/profile_signup_request.dart';
import 'package:flutter_reach_five/models/signup_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$SignupRequest', () {
    test('instances with same fields are equal', () async {
      const firstInstance = SignupRequest(
        profile: ProfileSignupRequest(email: 'email', password: 'password'),
      );
      const secondInstance = SignupRequest(
        profile: ProfileSignupRequest(email: 'email', password: 'password'),
      );

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = SignupRequest(
        profile: ProfileSignupRequest(email: 'email1', password: 'password'),
      );
      const secondInstance = SignupRequest(
        profile: ProfileSignupRequest(email: 'email2', password: 'password'),
      );

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
