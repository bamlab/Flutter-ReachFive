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

    setUp(() {
      flutterReachFivePlatform = MockFlutterReachFivePlatform();
      FlutterReachFivePlatform.instance = flutterReachFivePlatform;

      mockReachFiveRepo = MockReackFiveRepo();
      mockOAuthApi = MockOAuthApi();

      when(mockReachFiveRepo.getOAuthApi).thenReturn(mockOAuthApi);
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
          config: reachFiveConfig,
        );

        expect(
          reachFive.config,
          reachFiveConfig,
        );
      });
    });

    group('signup', () {
      test('returns correct auth token instance', () async {
        final reachFive = ReachFive(
          config: const ReachFiveConfig(
            domain: 'domain',
            clientId: 'clientId',
            scheme: 'scheme',
          ),
          repo: mockReachFiveRepo,
        );
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
        final reachFive = ReachFive(
          config: const ReachFiveConfig(
            domain: 'domain',
            clientId: 'clientId',
            scheme: 'scheme',
          ),
          repo: mockReachFiveRepo,
        );
        const email = 'email';
        const password = 'password';
        const scope = [ScopeValue.events];

        const authToken = AuthToken(
          accessToken: 'accessToken',
        );

        registerFallbackValue(
          ReachFiveConfigConverter.toInterface(reachFive.config),
        );
        registerFallbackValue(password);
        registerFallbackValue(email);
        registerFallbackValue(
          scope.map(ScopeValueConverter.toInterface).toList(),
        );
        when(
          () => flutterReachFivePlatform.loginWithPassword(
            config: any(named: 'config'),
            password: any(named: 'password'),
            email: any(named: 'email'),
            phoneNumber: any(named: 'phoneNumber'),
            scope: any(named: 'scope'),
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
        const config = ReachFiveConfig(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );
        final reachFive = ReachFive(
          config: const ReachFiveConfig(
            domain: 'domain',
            clientId: 'clientId',
            scheme: 'scheme',
          ),
          repo: mockReachFiveRepo,
        );

        registerFallbackValue(
          RevokeTokenRequest(
            (requestTokenRequestBuilder) => requestTokenRequestBuilder
              ..clientId = config.clientId
              ..clientSecret = ''
              ..token = 'token'
              ..tokenTypeHint = 'Bearer',
          ),
        );
        when(
          () => mockOAuthApi.revokeToken(
            revokeTokenRequest: any(named: 'revokeTokenRequest'),
          ),
        ).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions(path: 'path')),
        );

        when(flutterReachFivePlatform.logout).thenAnswer((_) async {});

        await reachFive.logout(
          authToken: const AuthToken(
            accessToken: 'accessToken',
            refreshToken: 'refreshToken',
          ),
        );

        verify(flutterReachFivePlatform.logout).called(1);
      });
    });

    group('refreshAccessToken', () {
      test('returns correct auth token instance', () async {
        final reachFive = ReachFive(
          config: const ReachFiveConfig(
            domain: 'domain',
            clientId: 'clientId',
            scheme: 'scheme',
          ),
          repo: mockReachFiveRepo,
        );
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
        const config = ReachFiveConfig(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        );
        final reachFive = ReachFive(
          config: config,
          repo: mockReachFiveRepo,
        );

        registerFallbackValue(
          RevokeTokenRequest(
            (requestTokenRequestBuilder) => requestTokenRequestBuilder
              ..clientId = config.clientId
              ..clientSecret = ''
              ..token = 'token'
              ..tokenTypeHint = 'Bearer',
          ),
        );
        when(
          () => mockOAuthApi.revokeToken(
            revokeTokenRequest: any(named: 'revokeTokenRequest'),
          ),
        ).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions(path: 'path')),
        );

        await reachFive.revokeToken(
          authToken: const AuthToken(
            refreshToken: 'refreshToken',
            accessToken: 'accessToken',
          ),
          revokeTokenType: RevokeTokenType.access,
        );

        verify(
          () => mockOAuthApi.revokeToken(
            revokeTokenRequest: any(named: 'revokeTokenRequest'),
          ),
        ).called(1);
      });
    });
  });
}
