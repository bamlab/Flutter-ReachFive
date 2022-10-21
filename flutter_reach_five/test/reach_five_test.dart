import 'package:dio/dio.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';
import 'package:flutter_reach_five/helpers/auth_token.dart';
import 'package:flutter_reach_five/helpers/profile_converter.dart';
import 'package:flutter_reach_five/helpers/profile_signup_request_converter.dart';
import 'package:flutter_reach_five/helpers/provider_converter.dart';
import 'package:flutter_reach_five/helpers/reach_five_key_converter.dart';
import 'package:flutter_reach_five/helpers/scope_value_converter.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:reach_five_identity_repo/reach_five_identity_repo.dart';

mixin PlatformInterfaceMockMixin on Mock implements MockPlatformInterfaceMixin {
}

class MockReackFiveIdentityRepo extends Mock implements ReachFiveIdentityRepo {}

class MockOAuthApi extends Mock implements OAuthApi {}

class MockFlutterReachFivePlatform extends Mock
    with PlatformInterfaceMockMixin
    implements FlutterReachFivePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterReachFive', () {
    late FlutterReachFivePlatform flutterReachFivePlatform;
    late MockReackFiveIdentityRepo mockReachFiveIdentityRepo;
    late MockOAuthApi mockOAuthApi;

    late ReachFive reachFive;

    setUp(() {
      flutterReachFivePlatform = MockFlutterReachFivePlatform();
      FlutterReachFivePlatform.instance = flutterReachFivePlatform;

      mockReachFiveIdentityRepo = MockReackFiveIdentityRepo();
      mockOAuthApi = MockOAuthApi();

      when(mockReachFiveIdentityRepo.getOAuthApi).thenReturn(mockOAuthApi);

      const sdkConfig = SdkConfig(
        domain: 'domain',
        clientId: 'clientId',
        androidScheme: 'androidScheme',
        iosScheme: 'iosScheme',
      );
      const providerCreators = [ProviderCreator.webview];

      const reachFiveKey = ReachFiveKey(
        sdkConfig: sdkConfig,
        providerCreators: providerCreators,
      );
      const providers = [Provider.google];

      reachFive = ReachFive(
        reachFiveKey: reachFiveKey,
        providers: providers,
        identityRepo: mockReachFiveIdentityRepo,
      );
    });

    group('initialize', () {
      test('returns correct reachFive instance', () async {
        final reachFiveConfigInterface = ReachFiveConfigInterface(
          reachFiveKey:
              ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
          providers:
              reachFive.providers.map(ProviderConverter.toInterface).toList(),
        );

        registerFallbackValue(
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        when(
          () => flutterReachFivePlatform.initialize(
            any(),
          ),
        ).thenAnswer(
          (_) async => reachFiveConfigInterface,
        );

        final reachFiveReceived = await ReachFiveManager().initialize(
          sdkConfig: reachFive.reachFiveKey.sdkConfig,
        );

        expect(
          reachFive.reachFiveKey,
          reachFiveReceived.reachFiveKey,
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
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        registerFallbackValue(
          ProfileSignupRequestConverter.toInterface(profile),
        );
        when(
          () => flutterReachFivePlatform.signup(
            reachFiveKey: any(named: 'reachFiveKey'),
            profile: any(named: 'profile'),
            redirectUrl: redirectUrl,
            scope: scope.map(ScopeValueConverter.toInterface).toList(),
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

      test('parse throw error', () async {
        const profile = ProfileSignupRequest(password: 'password');
        const redirectUrl = 'redirectUrl';
        const scope = [ScopeValue.address];

        registerFallbackValue(
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        registerFallbackValue(
          ProfileSignupRequestConverter.toInterface(profile),
        );
        when(
          () => flutterReachFivePlatform.signup(
            reachFiveKey: any(named: 'reachFiveKey'),
            profile: any(named: 'profile'),
            redirectUrl: redirectUrl,
            scope: scope.map(ScopeValueConverter.toInterface).toList(),
          ),
        ).thenThrow(Exception());

        registerFallbackValue(
          StackTrace.fromString('test'),
        );
        when(
          () => flutterReachFivePlatform.parseError(any(), any()),
        ).thenThrow(Exception());

        try {
          await reachFive.signup(
            profile: profile,
            redirectUrl: redirectUrl,
            scope: scope,
          );
        } catch (_) {}

        verify(() => flutterReachFivePlatform.parseError(any(), any()))
            .called(1);
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
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        when(
          () => flutterReachFivePlatform.loginWithPassword(
            reachFiveKey: any(named: 'reachFiveKey'),
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

      test('parse throw error', () async {
        const email = 'email';
        const password = 'password';
        const scope = [ScopeValue.events];

        registerFallbackValue(
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        when(
          () => flutterReachFivePlatform.loginWithPassword(
            reachFiveKey: any(named: 'reachFiveKey'),
            password: password,
            email: email,
            scope: scope.map(ScopeValueConverter.toInterface).toList(),
          ),
        ).thenThrow(Exception());

        registerFallbackValue(
          StackTrace.fromString('test'),
        );
        when(
          () => flutterReachFivePlatform.parseError(any(), any()),
        ).thenThrow(Exception());

        try {
          await reachFive.loginWithPassword(
            password: password,
            email: email,
            scope: scope,
          );
        } catch (_) {}

        verify(() => flutterReachFivePlatform.parseError(any(), any()))
            .called(1);
      });
    });

    group('loginWithProvider', () {
      test('returns correct auth token instance', () async {
        final provider = reachFive.providers.first;
        const origin = 'origin';
        const scope = [ScopeValue.events];

        const authToken = AuthToken(
          accessToken: 'accessToken',
        );

        registerFallbackValue(
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        registerFallbackValue(
          scope.map(ScopeValueConverter.toInterface).toList(),
        );
        when(
          () => flutterReachFivePlatform.loginWithProvider(
            reachFiveKey: any(named: 'reachFiveKey'),
            provider: provider.name,
            origin: origin,
            scope: any(named: 'scope'),
          ),
        ).thenAnswer(
          (_) async => AuthTokenConverter.toInterface(authToken),
        );

        final loginWithProviderAuthToken = await reachFive.loginWithProvider(
          provider: provider,
          origin: origin,
          scope: scope,
        );

        expect(
          authToken,
          loginWithProviderAuthToken,
        );
      });

      test('parse throw error', () async {
        final provider = reachFive.providers.first;
        const origin = 'origin';
        const scope = [ScopeValue.events];

        registerFallbackValue(
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        registerFallbackValue(
          scope.map(ScopeValueConverter.toInterface).toList(),
        );
        when(
          () => flutterReachFivePlatform.loginWithProvider(
            reachFiveKey: any(named: 'reachFiveKey'),
            provider: provider.name,
            origin: origin,
            scope: any(named: 'scope'),
          ),
        ).thenThrow(Exception());

        registerFallbackValue(
          StackTrace.fromString('test'),
        );
        when(
          () => flutterReachFivePlatform.parseError(any(), any()),
        ).thenThrow(Exception());

        try {
          await reachFive.loginWithProvider(
            provider: provider,
            origin: origin,
            scope: scope,
          );
        } catch (_) {}

        verify(() => flutterReachFivePlatform.parseError(any(), any()))
            .called(1);
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
          clientId: reachFive.reachFiveKey.sdkConfig.clientId,
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
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        when(
          () => flutterReachFivePlatform.logout(
            reachFiveKey: any(named: 'reachFiveKey'),
          ),
        ).thenAnswer((_) async {});

        await reachFive.logout(
          authToken: authToken,
          clientSecret: clientSecret,
        );

        verify(
          () => mockOAuthApi.revokeToken(revokeTokenRequest: request),
        ).called(1);
        verify(
          () => flutterReachFivePlatform.logout(
            reachFiveKey: any(named: 'reachFiveKey'),
          ),
        ).called(1);
      });
    });

    group('updateProfile', () {
      test('returns correct profile instance', () async {
        const firstProfile = Profile(
          givenName: 'firstGivenName',
        );
        const secondProfile = Profile(
          givenName: 'secondGivenName',
        );

        const authToken = AuthToken(accessToken: 'accessToken');

        registerFallbackValue(
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        registerFallbackValue(AuthTokenConverter.toInterface(authToken));
        registerFallbackValue(ProfileConverter.toInterface(firstProfile));
        when(
          () => flutterReachFivePlatform.updateProfile(
            reachFiveKey: any(named: 'reachFiveKey'),
            authToken: any(named: 'authToken'),
            profile: any(named: 'profile'),
          ),
        ).thenAnswer(
          (_) async => ProfileConverter.toInterface(secondProfile),
        );

        final receivedProfile = await reachFive.updateProfile(
          authToken: authToken,
          profile: firstProfile,
        );

        expect(
          secondProfile,
          receivedProfile,
        );
      });

      test('parse throw error', () async {
        const profile = Profile(
          givenName: 'givenName',
        );

        const authToken = AuthToken(accessToken: 'accessToken');

        registerFallbackValue(
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        registerFallbackValue(AuthTokenConverter.toInterface(authToken));
        registerFallbackValue(ProfileConverter.toInterface(profile));
        when(
          () => flutterReachFivePlatform.updateProfile(
            reachFiveKey: any(named: 'reachFiveKey'),
            authToken: any(named: 'authToken'),
            profile: any(named: 'profile'),
          ),
        ).thenThrow(Exception());

        registerFallbackValue(
          StackTrace.fromString('test'),
        );
        when(
          () => flutterReachFivePlatform.parseError(any(), any()),
        ).thenThrow(Exception());

        try {
          await reachFive.updateProfile(
            authToken: authToken,
            profile: profile,
          );
        } catch (_) {}

        verify(() => flutterReachFivePlatform.parseError(any(), any()))
            .called(1);
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
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        registerFallbackValue(AuthTokenConverter.toInterface(firstAuthToken));
        when(
          () => flutterReachFivePlatform.refreshAccessToken(
            reachFiveKey: any(named: 'reachFiveKey'),
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
          clientId: reachFive.reachFiveKey.sdkConfig.clientId,
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
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        when(
          () => flutterReachFivePlatform.requestPasswordReset(
            reachFiveKey: any(named: 'reachFiveKey'),
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
            reachFiveKey: any(named: 'reachFiveKey'),
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
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        registerFallbackValue(AuthTokenConverter.toInterface(authToken));
        when(
          () => flutterReachFivePlatform.updatePasswordWithAccessToken(
            reachFiveKey: any(named: 'reachFiveKey'),
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
            reachFiveKey: any(named: 'reachFiveKey'),
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
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        registerFallbackValue(AuthTokenConverter.toInterface(freshAuthToken));
        when(
          () => flutterReachFivePlatform.updatePasswordWithFreshAccessToken(
            reachFiveKey: any(named: 'reachFiveKey'),
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
            reachFiveKey: any(named: 'reachFiveKey'),
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
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        when(
          () => flutterReachFivePlatform.updatePasswordWithEmail(
            reachFiveKey: any(named: 'reachFiveKey'),
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
            reachFiveKey: any(named: 'reachFiveKey'),
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
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        when(
          () => flutterReachFivePlatform.updatePasswordWithPhoneNumber(
            reachFiveKey: any(named: 'reachFiveKey'),
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
            reachFiveKey: any(named: 'reachFiveKey'),
            phoneNumber: phoneNumber,
            verificationCode: verificationCode,
            newPassword: newPassword,
          ),
        ).called(1);
      });

      test('parse throw error', () async {
        const phoneNumber = 'phoneNumber';
        const verificationCode = 'verificationCode';
        const newPassword = 'newPassword';

        registerFallbackValue(
          ReachFiveKeyConverter.toInterface(reachFive.reachFiveKey),
        );
        when(
          () => flutterReachFivePlatform.updatePasswordWithPhoneNumber(
            reachFiveKey: any(named: 'reachFiveKey'),
            phoneNumber: phoneNumber,
            verificationCode: verificationCode,
            newPassword: newPassword,
          ),
        ).thenThrow(Exception());

        registerFallbackValue(
          StackTrace.fromString('test'),
        );
        when(
          () => flutterReachFivePlatform.parseError(any(), any()),
        ).thenThrow(Exception());

        try {
          await reachFive.updatePassword(
            const UpdatePasswordRequest.withPhoneNumber(
              phoneNumber: phoneNumber,
              verificationCode: verificationCode,
              newPassword: newPassword,
            ),
          );
        } catch (_) {}

        verify(() => flutterReachFivePlatform.parseError(any(), any()))
            .called(1);
      });
    });
  });
}
