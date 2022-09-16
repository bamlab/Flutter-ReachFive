import 'package:flutter_reach_five/helpers/auth_token.dart';
import 'package:flutter_reach_five/models/auth_token.dart';
import 'package:flutter_reach_five/models/open_id_user.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$AuthTokenConverter', () {
    test('toInterface method', () async {
      expect(
        AuthTokenConverter.toInterface(
          const AuthToken(accessToken: 'accessToken', user: OpenIdUser()),
        ),
        isInstanceOf<AuthTokenInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        AuthTokenConverter.fromInterface(
          AuthTokenInterface(
            accessToken: 'accessToken',
            user: OpenIdUserInterface(),
          ),
        ),
        isInstanceOf<AuthToken>(),
      );
    });
  });
}
