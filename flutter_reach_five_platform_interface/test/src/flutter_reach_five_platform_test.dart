import 'package:flutter_reach_five_platform_interface/src/flutter_reach_five_platform.dart';
import 'package:flutter_reach_five_platform_interface/src/reach_five.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockReachFiveHostApi extends Mock implements ReachFiveHostApi {}

class TestFlutterReachFive extends FlutterReachFivePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('FlutterReachFivePlatformInterface', () {
    late FlutterReachFivePlatform flutterReachFivePlatform;
    late ReachFiveHostApi mockReachFiveHostApi;

    setUp(() {
      flutterReachFivePlatform = TestFlutterReachFive();
      FlutterReachFivePlatform.instance = flutterReachFivePlatform;

      mockReachFiveHostApi = MockReachFiveHostApi();

      flutterReachFivePlatform.reachFiveHostApi = mockReachFiveHostApi;
    });

    tearDown(() {
      reset(mockReachFiveHostApi);
    });

    group('initialize', () {
      test('returns correct reach five config', () async {
        final config = ReachFiveConfigInterface(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );

        when(() => mockReachFiveHostApi.initialize(config))
            .thenAnswer((_) async => config);

        final receivedConfig =
            await FlutterReachFivePlatform.instance.initialize(config);

        expect(config, receivedConfig);
      });
    });

    group('signup', () {
      test('returns correct auth token', () async {
        final config = ReachFiveConfigInterface(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );
        final profile = ProfileSignupRequestInterface(password: 'password');

        final authToken = AuthTokenInterface(accessToken: 'accessToken');

        registerFallbackValue(
          SignupRequestInterface(
            config: config,
            profile: profile,
          ),
        );
        when(() => mockReachFiveHostApi.signup(any()))
            .thenAnswer((_) async => authToken);

        final receivedAuthToken =
            await FlutterReachFivePlatform.instance.signup(
          config: config,
          profile: profile,
        );

        expect(authToken, receivedAuthToken);
      });
    });

    group('loginWithPassword', () {
      test('returns correct auth token', () async {
        final config = ReachFiveConfigInterface(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );
        const email = 'email';
        const password = 'password';

        final authToken = AuthTokenInterface(accessToken: 'accessToken');

        registerFallbackValue(
          LoginWithPasswordRequestInterface(
            config: config,
            email: email,
            password: password,
          ),
        );
        when(() => mockReachFiveHostApi.loginWithPassword(any()))
            .thenAnswer((_) async => authToken);

        final receivedAuthToken =
            await FlutterReachFivePlatform.instance.loginWithPassword(
          config: config,
          email: email,
          password: password,
        );

        expect(authToken, receivedAuthToken);
      });
    });

    group('logout', () {
      test('execute reach five host api logout method', () async {
        when(mockReachFiveHostApi.logout).thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance.logout();

        verify(mockReachFiveHostApi.logout).called(1);
      });
    });

    group('refreshAccessToken', () {
      test('returns correct auth token', () async {
        final config = ReachFiveConfigInterface(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );
        final firstAuthToken =
            AuthTokenInterface(accessToken: 'firstAccessToken');

        final secondAuthToken =
            AuthTokenInterface(accessToken: 'firstAccessToken');

        registerFallbackValue(
          RefreshAccessTokenRequestInterface(
            authToken: firstAuthToken,
            config: config,
          ),
        );
        when(() => mockReachFiveHostApi.refreshAccessToken(any()))
            .thenAnswer((_) async => secondAuthToken);

        final receivedAuthToken = await FlutterReachFivePlatform.instance
            .refreshAccessToken(config: config, authToken: firstAuthToken);

        expect(secondAuthToken, receivedAuthToken);
      });
    });
  });
}
