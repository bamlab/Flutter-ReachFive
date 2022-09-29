import 'package:dio/dio.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';
import 'package:flutter_reach_five/helpers/auth_token.dart';
import 'package:flutter_reach_five/helpers/profile_signup_request_converter.dart';
import 'package:flutter_reach_five/helpers/reach_five_config_converter.dart';
import 'package:flutter_reach_five/helpers/scope_value_converter.dart';
import 'package:flutter_reach_five/models/revoke_token_type.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:reach_five_repo/reach_five_repo.dart';

mixin PlatformInterfaceMockMixin on Mock implements MockPlatformInterfaceMixin {
}

class MockReackFiveRepo extends Mock implements ReachFiveRepo {}

class MockOAuthApi extends Mock implements OAuthApi {}

class MockFlutterReachFivePlatform extends Mock
    with PlatformInterfaceMockMixin
    implements FlutterReachFivePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterReachFive', () {
    late FlutterReachFivePlatform flutterReachFivePlatform;
    late MockReackFiveRepo mockReachFiveRepo;
    late MockOAuthApi mockOAuthApi;

    late ReachFive reachFive;

    setUp(() {
      flutterReachFivePlatform = MockFlutterReachFivePlatform();
      FlutterReachFivePlatform.instance = flutterReachFivePlatform;

      mockReachFiveRepo = MockReackFiveRepo();
      mockOAuthApi = MockOAuthApi();

      when(mockReachFiveRepo.getOAuthApi).thenReturn(mockOAuthApi);

      const config = ReachFiveConfig(
        domain: 'domain',
        clientId: 'clientId',
        scheme: 'scheme',
      );

      reachFive = ReachFive(
        config: config,
        repo: mockReachFiveRepo,
      );
    });

    group('initialize', () {
      test('returns correct reachFive instance', () async {
        registerFallbackValue(
          ReachFiveConfigConverter.toInterface(reachFive.config),
        );
        when(
          () => flutterReachFivePlatform.initialize(
            any(),
          ),
        ).thenAnswer(
          (_) async => ReachFiveConfigConverter.toInterface(reachFive.config),
        );

        final reachFiveReceived = await ReachFiveManager.initialize(
          config: reachFive.config,
        );

        expect(
          reachFive.config,
          reachFiveReceived.config,
        );
      });
    });

    group('signup', () {
      test('returns correct auth token instance', () async {
        const profile = ProfileSignupRequest(password: 'password');
        const redirectUrl = 'redirectUrl';
        const scope = [ScopeValue.address];

        const authToken = AuthToken(
          accessToken: 'accessToken',
        );

        registerFallbackValue(
          ReachFiveConfigConverter.toInterface(reachFive.config),
        );
        registerFallbackValue(
          ProfileSignupRequestConverter.toInterface(profile),
        );
        registerFallbackValue(redirectUrl);
        registerFallbackValue(
          scope.map(ScopeValueConverter.toInterface).toList(),
        );
        when(
          () => flutterReachFivePlatform.signup(
            config: any(named: 'config'),
            profile: any(named: 'profile'),
            redirectUrl: any(named: 'redirectUrl'),
            scope: any(named: 'scope'),
          ),
        ).thenAnswer(
          (_) async => AuthTokenConverter.toInterface(authToken),
        );

        final signupAuthToken = await reachFive.signup(
          profile: profile,
          redirectUrl: redirectUrl,
          scope: scope,
        );

        expect(
          authToken,
          signupAuthToken,
        );
      });
    });

    group('loginWithPassword', () {
      test('returns correct auth token instance', () async {
        const email = 'email';
        const password = 'password';
        const scope = [ScopeValue.events];

        const authToken = AuthToken(
          accessToken: 'accessToken',
        );

        registerFallbackValue(
          ReachFiveConfigConverter.toInterface(reachFive.config),
        );
        when(
          () => flutterReachFivePlatform.loginWithPassword(
            config: any(named: 'config'),
            password: password,
            email: email,
            scope: scope.map(ScopeValueConverter.toInterface).toList(),
          ),
        ).thenAnswer(
          (_) async => AuthTokenConverter.toInterface(authToken),
        );

        final loginWithPasswordAuthToken = await reachFive.loginWithPassword(
          password: password,
          email: email,
          scope: scope,
        );

        expect(
          authToken,
          loginWithPasswordAuthToken,
        );
      });
    });

    group('logout', () {
      test('call logout method', () async {
        const authToken = AuthToken(
          accessToken: 'accessToken',
          refreshToken: 'refreshToken',
          tokenType: 'Bearer',
        );
        const clientSecret = 'clientSecret';

        final request = RevokeTokenRequest(
          clientId: reachFive.config.clientId,
          clientSecret: clientSecret,
          token: authToken.refreshToken!,
          tokenTypeHint: authToken.tokenType,
        );

        when(
          () => mockOAuthApi.revokeToken(revokeTokenRequest: request),
        ).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions(path: 'path')),
        );

        registerFallbackValue(
          ReachFiveConfigConverter.toInterface(reachFive.config),
        );
        when(
          () => flutterReachFivePlatform.logout(config: any(named: 'config')),
        ).thenAnswer((_) async {});

        await reachFive.logout(
          authToken: authToken,
          clientSecret: clientSecret,
        );

        verify(
          () => mockOAuthApi.revokeToken(revokeTokenRequest: request),
        ).called(1);
        verify(
          () => flutterReachFivePlatform.logout(config: any(named: 'config')),
        ).called(1);
      });
    });

    group('refreshAccessToken', () {
      test('returns correct auth token instance', () async {
        const firstAuthToken = AuthToken(
          accessToken: 'firstAccessToken',
        );
        const secondAuthToken = AuthToken(
          accessToken: 'secondAccessToken',
        );

        registerFallbackValue(
          ReachFiveConfigConverter.toInterface(reachFive.config),
        );
        registerFallbackValue(AuthTokenConverter.toInterface(firstAuthToken));
        when(
          () => flutterReachFivePlatform.refreshAccessToken(
            config: any(named: 'config'),
            authToken: any(named: 'authToken'),
          ),
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

    group('revokeToken', () {
      test('launch revokeToken api call ', () async {
        const authToken = AuthToken(
          accessToken: 'accessToken',
          refreshToken: 'refreshToken',
          tokenType: 'Bearer',
        );
        const clientSecret = 'clientSecret';

        final request = RevokeTokenRequest(
          clientId: reachFive.config.clientId,
          clientSecret: clientSecret,
          token: authToken.accessToken,
          tokenTypeHint: authToken.tokenType,
        );

        when(
          () => mockOAuthApi.revokeToken(revokeTokenRequest: request),
        ).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions(path: 'path')),
        );

        await reachFive.revokeToken(
          authToken: authToken,
          revokeTokenType: RevokeTokenType.access,
          clientSecret: clientSecret,
        );

        verify(
          () => mockOAuthApi.revokeToken(revokeTokenRequest: request),
        ).called(1);
      });
    });

    group('requestPasswordReset', () {
      test('call requestPasswordReset method', () async {
        const email = 'email';
        const redirectUrl = 'redirectUrl';

        registerFallbackValue(
          ReachFiveConfigConverter.toInterface(reachFive.config),
        );
        when(
          () => flutterReachFivePlatform.requestPasswordReset(
            config: any(named: 'config'),
            email: email,
            redirectUrl: redirectUrl,
          ),
        ).thenAnswer((_) async {});

        await reachFive.requestPasswordReset(
          email: email,
          redirectUrl: redirectUrl,
        );

        verify(
          () => flutterReachFivePlatform.requestPasswordReset(
            config: any(named: 'config'),
            email: email,
            redirectUrl: redirectUrl,
          ),
        ).called(1);
      });
    });

    group('updatePassword', () {
      test('call requestPasswordReset withAccessToken method', () async {
        const authToken = AuthToken(
          accessToken: 'accessToken',
        );

        const oldPassword = 'oldPassword';
        const newPassword = 'newPassword';

        registerFallbackValue(
          ReachFiveConfigConverter.toInterface(reachFive.config),
        );
        registerFallbackValue(AuthTokenConverter.toInterface(authToken));
        when(
          () => flutterReachFivePlatform.updatePasswordWithAccessToken(
            config: any(named: 'config'),
            authToken: any(named: 'authToken'),
            oldPassword: oldPassword,
            newPassword: newPassword,
          ),
        ).thenAnswer((_) async {});

        await reachFive.updatePassword(
          const UpdatePasswordRequest.withAccessToken(
            authToken: authToken,
            oldPassword: oldPassword,
            newPassword: newPassword,
          ),
        );

        verify(
          () => flutterReachFivePlatform.updatePasswordWithAccessToken(
            config: any(named: 'config'),
            authToken: any(named: 'authToken'),
            oldPassword: oldPassword,
            newPassword: newPassword,
          ),
        ).called(1);
      });

      test('call requestPasswordReset withFreshAccessToken method', () async {
        const freshAuthToken = AuthToken(
          accessToken: 'accessToken',
        );

        const newPassword = 'newPassword';

        registerFallbackValue(
          ReachFiveConfigConverter.toInterface(reachFive.config),
        );
        registerFallbackValue(AuthTokenConverter.toInterface(freshAuthToken));
        when(
          () => flutterReachFivePlatform.updatePasswordWithFreshAccessToken(
            config: any(named: 'config'),
            freshAuthToken: any(named: 'freshAuthToken'),
            newPassword: newPassword,
          ),
        ).thenAnswer((_) async {});

        await reachFive.updatePassword(
          const UpdatePasswordRequest.withFreshAccessToken(
            freshAuthToken: freshAuthToken,
            newPassword: newPassword,
          ),
        );

        verify(
          () => flutterReachFivePlatform.updatePasswordWithFreshAccessToken(
            config: any(named: 'config'),
            freshAuthToken: any(named: 'freshAuthToken'),
            newPassword: newPassword,
          ),
        ).called(1);
      });

      test('call requestPasswordReset withEmail method', () async {
        const email = 'email';
        const verificationCode = 'verificationCode';
        const newPassword = 'newPassword';

        registerFallbackValue(
          ReachFiveConfigConverter.toInterface(reachFive.config),
        );
        when(
          () => flutterReachFivePlatform.updatePasswordWithEmail(
            config: any(named: 'config'),
            email: email,
            verificationCode: verificationCode,
            newPassword: newPassword,
          ),
        ).thenAnswer((_) async {});

        await reachFive.updatePassword(
          const UpdatePasswordRequest.withEmail(
            email: email,
            verificationCode: verificationCode,
            newPassword: newPassword,
          ),
        );

        verify(
          () => flutterReachFivePlatform.updatePasswordWithEmail(
            config: any(named: 'config'),
            email: email,
            verificationCode: verificationCode,
            newPassword: newPassword,
          ),
        ).called(1);
      });

      test('call requestPasswordReset withPhoneNumber method', () async {
        const phoneNumber = 'phoneNumber';
        const verificationCode = 'verificationCode';
        const newPassword = 'newPassword';

        registerFallbackValue(
          ReachFiveConfigConverter.toInterface(reachFive.config),
        );
        when(
          () => flutterReachFivePlatform.updatePasswordWithPhoneNumber(
            config: any(named: 'config'),
            phoneNumber: phoneNumber,
            verificationCode: verificationCode,
            newPassword: newPassword,
          ),
        ).thenAnswer((_) async {});

        await reachFive.updatePassword(
          const UpdatePasswordRequest.withPhoneNumber(
            phoneNumber: phoneNumber,
            verificationCode: verificationCode,
            newPassword: newPassword,
          ),
        );

        verify(
          () => flutterReachFivePlatform.updatePasswordWithPhoneNumber(
            config: any(named: 'config'),
            phoneNumber: phoneNumber,
            verificationCode: verificationCode,
            newPassword: newPassword,
          ),
        ).called(1);
      });
    });
  });
}
