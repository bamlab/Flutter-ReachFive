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
        final request = SignupRequestInterface(
          config: config,
          profile: ProfileSignupRequestInterface(password: 'password'),
        );
        final authToken = AuthTokenInterface(accessToken: 'accessToken');

        when(() => mockReachFiveHostApi.signup(request))
            .thenAnswer((_) async => authToken);

        final receivedAuthToken =
            await FlutterReachFivePlatform.instance.signup(request);

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
        final authToken = AuthTokenInterface(accessToken: 'accessToken');
        final request = LoginWithPasswordRequestInterface(
          config: config,
          email: 'email',
          password: 'password',
        );

        when(() => mockReachFiveHostApi.loginWithPassword(request))
            .thenAnswer((_) async => authToken);

        final receivedAuthToken =
            await FlutterReachFivePlatform.instance.loginWithPassword(request);

        expect(authToken, receivedAuthToken);
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
        final request = RefreshAccessTokenRequestInterface(
          authToken: firstAuthToken,
          config: config,
        );

        final secondAuthToken =
            AuthTokenInterface(accessToken: 'firstAccessToken');

        when(() => mockReachFiveHostApi.refreshAccessToken(request))
            .thenAnswer((_) async => secondAuthToken);

        final receivedAuthToken =
            await FlutterReachFivePlatform.instance.refreshAccessToken(request);

        expect(secondAuthToken, receivedAuthToken);
      });
    });
  });
}
