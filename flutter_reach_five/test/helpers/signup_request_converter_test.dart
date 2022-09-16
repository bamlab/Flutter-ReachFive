import 'package:flutter_reach_five/helpers/signup_request_converter.dart';
import 'package:flutter_reach_five/models/profile_signup_request.dart';
import 'package:flutter_reach_five/models/reach_five_config.dart';
import 'package:flutter_reach_five/models/signup_request.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ScopeValueConverter', () {
    test('toInterface method', () async {
      expect(
        ScopeValueConverter.toInterface(ScopeValue.fullWrite),
        'full_write',
      );
    });

    test('fromInterface method', () async {
      expect(
        ScopeValueConverter.fromInterface('full_write'),
        ScopeValue.fullWrite,
      );
    });
  });

  group('$SignupRequestConverter', () {
    test('toInterface method', () async {
      expect(
        SignupRequestConverter.toInterface(
          const ReachFiveConfig(
            domain: 'domain',
            clientId: 'clientId',
            scheme: 'scheme',
          ),
          const SignupRequest(
            profile: ProfileSignupRequest(password: 'password'),
            scope: [ScopeValue.events],
          ),
        ),
        isInstanceOf<SignupRequestInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        SignupRequestConverter.fromInterface(
          SignupRequestInterface(
            config: ReachFiveConfigInterface(
              domain: 'domain',
              clientId: 'clientId',
              scheme: 'scheme',
            ),
            profile: ProfileSignupRequestInterface(password: 'password'),
            scope: ['events'],
          ),
        ),
        isInstanceOf<SignupRequest>(),
      );
    });
  });
}