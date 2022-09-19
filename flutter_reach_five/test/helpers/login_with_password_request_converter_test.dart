import 'package:flutter_reach_five/flutter_reach_five.dart';
import 'package:flutter_reach_five/helpers/login_with_password_request_converter.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$LoginWithPasswordRequestConverter', () {
    test('toInterface method', () async {
      expect(
        LoginWithPasswordRequestConverter.toInterface(
          const ReachFiveConfig(
            domain: 'domain',
            clientId: 'clientId',
            scheme: 'scheme',
          ),
          const LoginWithPasswordRequest(
            password: 'password',
            scope: [ScopeValue.events],
          ),
        ),
        isInstanceOf<LoginWithPasswordRequestInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        LoginWithPasswordRequestConverter.fromInterface(
          LoginWithPasswordRequestInterface(
            config: ReachFiveConfigInterface(
              domain: 'domain',
              clientId: 'clientId',
              scheme: 'scheme',
            ),
            password: 'password',
            scope: ['events'],
          ),
        ),
        isInstanceOf<LoginWithPasswordRequest>(),
      );
    });
  });
}
