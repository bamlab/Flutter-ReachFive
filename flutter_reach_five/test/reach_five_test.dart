import 'package:flutter_reach_five/flutter_reach_five.dart';
import 'package:flutter_reach_five/helpers/auth_token.dart';
import 'package:flutter_reach_five/helpers/reach_five_config_converter.dart';
import 'package:flutter_reach_five/helpers/signup_request_converter.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

mixin PlatformInterfaceMockMixin on Mock implements MockPlatformInterfaceMixin {
}

class MockFlutterReachFivePlatform extends Mock
    with PlatformInterfaceMockMixin
    implements FlutterReachFivePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterReachFive', () {
    late FlutterReachFivePlatform flutterReachFivePlatform;

    setUp(() {
      flutterReachFivePlatform = MockFlutterReachFivePlatform();
      FlutterReachFivePlatform.instance = flutterReachFivePlatform;
    });

    group('initialize', () {
      test('returns correct reachFive instance', () async {
        const reachFiveConfig = ReachFiveConfig(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );

        registerFallbackValue(
          ReachFiveConfigConverter.toInterface(reachFiveConfig),
        );
        when(
          () => flutterReachFivePlatform.initialize(
            any(),
          ),
        ).thenAnswer(
          (_) async => ReachFiveConfigConverter.toInterface(reachFiveConfig),
        );

        final reachFive = await ReachFiveManager.initialize(
          reachFiveConfig,
        );

        expect(
          reachFive.config,
          reachFiveConfig,
        );
      });
    });

    group('signup', () {
      test('returns correct auth token instance', () async {
        const reachFive = ReachFive(
          ReachFiveConfig(
            domain: 'domain',
            clientId: 'clientId',
            scheme: 'scheme',
          ),
        );
        const authToken = AuthToken(
          accessToken: 'accessToken',
        );
        const signupRequest = SignupRequest(
          profile: ProfileSignupRequest(email: 'email', password: 'password'),
        );

        registerFallbackValue(
          SignupRequestConverter.toInterface(reachFive.config, signupRequest),
        );
        when(
          () => flutterReachFivePlatform.signup(any()),
        ).thenAnswer(
          (_) async => AuthTokenConverter.toInterface(authToken),
        );

        final signupAuthToken = await reachFive.signup(signupRequest);

        expect(
          authToken,
          signupAuthToken,
        );
      });
    });

    group('refreshAccessToken', () {
      test('returns correct auth token instance', () async {
        const reachFive = ReachFive(
          ReachFiveConfig(
            domain: 'domain',
            clientId: 'clientId',
            scheme: 'scheme',
          ),
        );
        const firstAuthToken = AuthToken(
          accessToken: 'firstAccessToken',
        );
        const secondAuthToken = AuthToken(
          accessToken: 'secondAccessToken',
        );

        registerFallbackValue(
          RefreshAccessTokenRequestInterface(
            config: ReachFiveConfigConverter.toInterface(reachFive.config),
            authToken: AuthTokenConverter.toInterface(firstAuthToken),
          ),
        );
        when(
          () => flutterReachFivePlatform.refreshAccessToken(any()),
        ).thenAnswer(
          (_) async => AuthTokenConverter.toInterface(secondAuthToken),
        );

        final refreshAccessTokenAuthToken =
            await reachFive.refreshAccessToken(firstAuthToken);

        expect(
          secondAuthToken,
          refreshAccessTokenAuthToken,
        );
      });
    });
  });
}
