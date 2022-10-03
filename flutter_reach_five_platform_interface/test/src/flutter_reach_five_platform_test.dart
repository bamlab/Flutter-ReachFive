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

    late ReachFiveKeyInterface reachFiveKey;

    setUp(() {
      flutterReachFivePlatform = TestFlutterReachFive();
      FlutterReachFivePlatform.instance = flutterReachFivePlatform;

      mockReachFiveHostApi = MockReachFiveHostApi();

      flutterReachFivePlatform.reachFiveHostApi = mockReachFiveHostApi;

      final sdkConfig = SdkConfigInterface(
        domain: 'domain',
        clientId: 'clientId',
        scheme: 'scheme',
      );

      reachFiveKey = ReachFiveKeyInterface(
        sdkConfig: sdkConfig,
      );
    });

    tearDown(() {
      reset(mockReachFiveHostApi);
    });

    group('initialize', () {
      test('returns correct reach five config', () async {
        final reachFiveConfig = ReachFiveConfigInterface(
          reachFiveKey: reachFiveKey,
        );

        when(() => mockReachFiveHostApi.initialize(reachFiveKey))
            .thenAnswer((_) async => reachFiveConfig);

        final receivedReachFiveConfig =
            await FlutterReachFivePlatform.instance.initialize(reachFiveKey);

        expect(reachFiveConfig, receivedReachFiveConfig);
      });
    });

    group('signup', () {
      test('returns correct auth token', () async {
        final profile = ProfileSignupRequestInterface(password: 'password');

        final authToken = AuthTokenInterface(accessToken: 'accessToken');

        registerFallbackValue(
          SignupRequestInterface(
            reachFiveKey: reachFiveKey,
            profile: profile,
          ),
        );
        when(() => mockReachFiveHostApi.signup(any()))
            .thenAnswer((_) async => authToken);

        final receivedAuthToken =
            await FlutterReachFivePlatform.instance.signup(
          reachFiveKey: reachFiveKey,
          profile: profile,
        );

        expect(authToken, receivedAuthToken);
      });
    });

    group('loginWithPassword', () {
      test('returns correct auth token', () async {
        const email = 'email';
        const password = 'password';

        final authToken = AuthTokenInterface(accessToken: 'accessToken');

        registerFallbackValue(
          LoginWithPasswordRequestInterface(
            reachFiveKey: reachFiveKey,
            email: email,
            password: password,
          ),
        );
        when(() => mockReachFiveHostApi.loginWithPassword(any()))
            .thenAnswer((_) async => authToken);

        final receivedAuthToken =
            await FlutterReachFivePlatform.instance.loginWithPassword(
          reachFiveKey: reachFiveKey,
          email: email,
          password: password,
        );

        expect(authToken, receivedAuthToken);
      });
    });

    group('logout', () {
      test('execute reach five host api logout method', () async {
        when(() => mockReachFiveHostApi.logout(reachFiveKey))
            .thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance
            .logout(reachFiveKey: reachFiveKey);

        verify(() => mockReachFiveHostApi.logout(reachFiveKey)).called(1);
      });
    });

    group('refreshAccessToken', () {
      test('returns correct auth token', () async {
        final firstAuthToken =
            AuthTokenInterface(accessToken: 'firstAccessToken');

        final secondAuthToken =
            AuthTokenInterface(accessToken: 'firstAccessToken');

        registerFallbackValue(
          RefreshAccessTokenRequestInterface(
            authToken: firstAuthToken,
            reachFiveKey: reachFiveKey,
          ),
        );
        when(() => mockReachFiveHostApi.refreshAccessToken(any()))
            .thenAnswer((_) async => secondAuthToken);

        final receivedAuthToken =
            await FlutterReachFivePlatform.instance.refreshAccessToken(
          reachFiveKey: reachFiveKey,
          authToken: firstAuthToken,
        );

        expect(secondAuthToken, receivedAuthToken);
      });
    });

    group('requestPasswordReset', () {
      test('execute reach five host api requestPasswordReset method', () async {
        final request = RequestPasswordResetRequestInterface(
          reachFiveKey: reachFiveKey,
          email: 'email',
          redirectUrl: 'redirectUrl',
        );

        registerFallbackValue(request);
        when(() => mockReachFiveHostApi.requestPasswordReset(any()))
            .thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance.requestPasswordReset(
          reachFiveKey: reachFiveKey,
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
        final request = UpdatePasswordWithAccessTokenRequestInterface(
          reachFiveKey: reachFiveKey,
          authToken: AuthTokenInterface(accessToken: 'accessToken'),
          oldPassword: 'oldPassword',
          password: 'newPassword',
        );

        registerFallbackValue(request);
        when(() => mockReachFiveHostApi.updatePasswordWithAccessToken(any()))
            .thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance.updatePasswordWithAccessToken(
          reachFiveKey: reachFiveKey,
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
        final request = UpdatePasswordWithFreshAccessTokenRequestInterface(
          reachFiveKey: reachFiveKey,
          freshAuthToken: AuthTokenInterface(accessToken: 'accessToken'),
          password: 'newPassword',
        );

        registerFallbackValue(request);
        when(
          () => mockReachFiveHostApi.updatePasswordWithFreshAccessToken(any()),
        ).thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance
            .updatePasswordWithFreshAccessToken(
          reachFiveKey: reachFiveKey,
          freshAuthToken: request.freshAuthToken,
          newPassword: request.password,
        );

        verify(
          () => mockReachFiveHostApi.updatePasswordWithFreshAccessToken(any()),
        ).called(1);
      });

      test('execute reach five host api updatePasswordWithEmail method',
          () async {
        final request = UpdatePasswordWithEmailRequestInterface(
          reachFiveKey: reachFiveKey,
          email: 'email',
          verificationCode: 'verificationCode',
          password: 'newPassword',
        );

        registerFallbackValue(request);
        when(
          () => mockReachFiveHostApi.updatePasswordWithEmail(any()),
        ).thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance.updatePasswordWithEmail(
          reachFiveKey: reachFiveKey,
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
        final request = UpdatePasswordWithPhoneNumberRequestInterface(
          reachFiveKey: reachFiveKey,
          phoneNumber: 'phoneNumber',
          verificationCode: 'verificationCode',
          password: 'newPassword',
        );

        registerFallbackValue(request);
        when(
          () => mockReachFiveHostApi.updatePasswordWithPhoneNumber(any()),
        ).thenAnswer((_) async {});

        await FlutterReachFivePlatform.instance.updatePasswordWithPhoneNumber(
          reachFiveKey: reachFiveKey,
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
