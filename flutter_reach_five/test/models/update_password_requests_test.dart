import 'package:flutter_reach_five/models/auth_token.dart';
import 'package:flutter_reach_five/models/update_password_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('${UpdatePasswordRequest.withAccessToken}', () {
    test('instances with same fields are equal', () async {
      const firstInstance = UpdatePasswordRequest.withAccessToken(
        authToken: AuthToken(accessToken: 'accessToken'),
        oldPassword: 'oldPassword',
        newPassword: 'newPassword',
      );
      const secondInstance = UpdatePasswordRequest.withAccessToken(
        authToken: AuthToken(accessToken: 'accessToken'),
        oldPassword: 'oldPassword',
        newPassword: 'newPassword',
      );

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = UpdatePasswordRequest.withAccessToken(
        authToken: AuthToken(accessToken: 'accessToken'),
        oldPassword: 'oldPassword',
        newPassword: 'newPassword',
      );
      const secondInstance = UpdatePasswordRequest.withAccessToken(
        authToken: AuthToken(accessToken: 'accessToken2'),
        oldPassword: 'oldPassword2',
        newPassword: 'newPassword2',
      );

      expect(firstInstance == secondInstance, isFalse);
    });
  });

  group('${UpdatePasswordRequest.withFreshAccessToken}', () {
    test('instances with same fields are equal', () async {
      const firstInstance = UpdatePasswordRequest.withFreshAccessToken(
        freshAuthToken: AuthToken(accessToken: 'accessToken'),
        newPassword: 'newPassword',
      );
      const secondInstance = UpdatePasswordRequest.withFreshAccessToken(
        freshAuthToken: AuthToken(accessToken: 'accessToken'),
        newPassword: 'newPassword',
      );

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = UpdatePasswordRequest.withFreshAccessToken(
        freshAuthToken: AuthToken(accessToken: 'accessToken'),
        newPassword: 'newPassword',
      );
      const secondInstance = UpdatePasswordRequest.withFreshAccessToken(
        freshAuthToken: AuthToken(accessToken: 'accessToken2'),
        newPassword: 'newPassword2',
      );

      expect(firstInstance == secondInstance, isFalse);
    });
  });

  group('${UpdatePasswordRequest.withEmail}', () {
    test('instances with same fields are equal', () async {
      const firstInstance = UpdatePasswordRequest.withEmail(
        email: 'email',
        verificationCode: 'verificationCode',
        newPassword: 'newPassword',
      );
      const secondInstance = UpdatePasswordRequest.withEmail(
        email: 'email',
        verificationCode: 'verificationCode',
        newPassword: 'newPassword',
      );

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = UpdatePasswordRequest.withEmail(
        email: 'email',
        verificationCode: 'verificationCode',
        newPassword: 'newPassword',
      );
      const secondInstance = UpdatePasswordRequest.withEmail(
        email: 'email2',
        verificationCode: 'verificationCode2',
        newPassword: 'newPassword2',
      );

      expect(firstInstance == secondInstance, isFalse);
    });
  });

  group('${UpdatePasswordRequest.withPhoneNumber}', () {
    test('instances with same fields are equal', () async {
      const firstInstance = UpdatePasswordRequest.withPhoneNumber(
        phoneNumber: 'phoneNumber',
        verificationCode: 'verificationCode',
        newPassword: 'newPassword',
      );
      const secondInstance = UpdatePasswordRequest.withPhoneNumber(
        phoneNumber: 'phoneNumber',
        verificationCode: 'verificationCode',
        newPassword: 'newPassword',
      );

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = UpdatePasswordRequest.withPhoneNumber(
        phoneNumber: 'phoneNumber',
        verificationCode: 'verificationCode',
        newPassword: 'newPassword',
      );
      const secondInstance = UpdatePasswordRequest.withPhoneNumber(
        phoneNumber: 'phoneNumber2',
        verificationCode: 'verificationCode2',
        newPassword: 'newPassword2',
      );

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
