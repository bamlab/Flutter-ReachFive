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
        final config = ReachFiveConfigInterface(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );

        when(() => mockReachFiveHostApi.logout(config))
            .thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance.logout(config: config);

        verify(() => mockReachFiveHostApi.logout(config)).called(1);
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

    group('requestPasswordReset', () {
      test('execute reach five host api requestPasswordReset method', () async {
        final config = ReachFiveConfigInterface(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );

        final request = RequestPasswordResetRequestInterface(
          config: config,
          email: 'email',
          redirectUrl: 'redirectUrl',
        );

        registerFallbackValue(request);
        when(() => mockReachFiveHostApi.requestPasswordReset(any()))
            .thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance.requestPasswordReset(
          config: config,
          email: request.email,
          redirectUrl: request.redirectUrl,
        );

        verify(() => mockReachFiveHostApi.requestPasswordReset(any()))
            .called(1);
      });
    });

    group('updatePassword', () {
      test('execute reach five host api updatePasswordWithAccessToken method',
          () async {
        final config = ReachFiveConfigInterface(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );

        final request = UpdatePasswordWithAccessTokenRequestInterface(
          config: config,
          authToken: AuthTokenInterface(accessToken: 'accessToken'),
          oldPassword: 'oldPassword',
          password: 'newPassword',
        );

        registerFallbackValue(request);
        when(() => mockReachFiveHostApi.updatePasswordWithAccessToken(any()))
            .thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance.updatePasswordWithAccessToken(
          config: config,
          authToken: request.authToken,
          oldPassword: request.oldPassword,
          newPassword: request.password,
        );

        verify(() => mockReachFiveHostApi.updatePasswordWithAccessToken(any()))
            .called(1);
      });

      test(
          'execute reach five host api updatePasswordWithFreshAccessToken method',
          () async {
        final config = ReachFiveConfigInterface(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );

        final request = UpdatePasswordWithFreshAccessTokenRequestInterface(
          config: config,
          freshAuthToken: AuthTokenInterface(accessToken: 'accessToken'),
          password: 'newPassword',
        );

        registerFallbackValue(request);
        when(
          () => mockReachFiveHostApi.updatePasswordWithFreshAccessToken(any()),
        ).thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance
            .updatePasswordWithFreshAccessToken(
          config: config,
          freshAuthToken: request.freshAuthToken,
          newPassword: request.password,
        );

        verify(
          () => mockReachFiveHostApi.updatePasswordWithFreshAccessToken(any()),
        ).called(1);
      });

      test('execute reach five host api updatePasswordWithEmail method',
          () async {
        final config = ReachFiveConfigInterface(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );

        final request = UpdatePasswordWithEmailRequestInterface(
          config: config,
          email: 'email',
          verificationCode: 'verificationCode',
          password: 'newPassword',
        );

        registerFallbackValue(request);
        when(
          () => mockReachFiveHostApi.updatePasswordWithEmail(any()),
        ).thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance.updatePasswordWithEmail(
          config: config,
          email: request.email,
          verificationCode: request.verificationCode,
          newPassword: request.password,
        );

        verify(
          () => mockReachFiveHostApi.updatePasswordWithEmail(any()),
        ).called(1);
      });

      test('execute reach five host api updatePasswordWithPhoneNumber method',
          () async {
        final config = ReachFiveConfigInterface(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );

        final request = UpdatePasswordWithPhoneNumberRequestInterface(
          config: config,
          phoneNumber: 'phoneNumber',
          verificationCode: 'verificationCode',
          password: 'newPassword',
        );

        registerFallbackValue(request);
        when(
          () => mockReachFiveHostApi.updatePasswordWithPhoneNumber(any()),
        ).thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance.updatePasswordWithPhoneNumber(
          config: config,
          phoneNumber: request.phoneNumber,
          verificationCode: request.verificationCode,
          newPassword: request.password,
        );

        verify(
          () => mockReachFiveHostApi.updatePasswordWithPhoneNumber(any()),
        ).called(1);
      });
    });
  });
}
