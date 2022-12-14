import 'package:flutter/services.dart';
import 'package:flutter_reach_five_android/flutter_reach_five_android.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterReachFiveAndroid', () {
    const kPlatformName = 'Android';
    late FlutterReachFiveAndroid flutterReachFive;
    late List<MethodCall> log;

    setUp(() async {
      flutterReachFive = FlutterReachFiveAndroid();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
          .setMockMethodCallHandler(flutterReachFive.methodChannel,
              (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      FlutterReachFiveAndroid.registerWith();
      expect(FlutterReachFivePlatform.instance, isA<FlutterReachFiveAndroid>());
    });

    group('can parse an error', () {
      test('random error', () {
        final exception = Exception();

        Object? error;

        try {
          FlutterReachFiveAndroid()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(exception, error);
      });

      test('random platform exception', () {
        final exception = PlatformException(code: 'code');

        Object? error;

        try {
          FlutterReachFiveAndroid()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(exception, error);
      });

      test('$EmailAlreadyInUseExceptionInterface', () {
        final exception = PlatformException(
          code: 'code',
          message: errorCodesInterface.emailAlreadyInUseCode,
        );

        Object? error;

        try {
          FlutterReachFiveAndroid()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(error, isA<EmailAlreadyInUseExceptionInterface>());
      });

      test('$InvalidEmailOrPasswordExceptionInterface', () {
        final exception = PlatformException(
          code: 'code',
          message: errorCodesInterface.invalidEmailOrPasswordCode,
        );

        Object? error;

        try {
          FlutterReachFiveAndroid()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(error, isA<InvalidEmailOrPasswordExceptionInterface>());
      });

      test('$InvalidVerificationCodeExceptionInterface', () {
        final exception = PlatformException(
          code: 'code',
          message: errorCodesInterface.invalidVerificationCode,
        );

        Object? error;

        try {
          FlutterReachFiveAndroid()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(error, isA<InvalidVerificationCodeExceptionInterface>());
      });

      test('$InvalidGrantCodeExceptionInterface', () {
        final exception = PlatformException(
          code: 'code',
          message: errorCodesInterface.invalidGrant,
        );

        Object? error;

        try {
          FlutterReachFiveAndroid()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(error, isA<InvalidGrantCodeExceptionInterface>());
      });

      test('$UserCancelledOrClosedTheWebFlowCodeExceptionInterface', () {
        final exception = PlatformException(
          code: 'code',
          message: errorCodesInterface.userCancelledOrClosedTheWebFlow,
        );

        Object? error;

        try {
          FlutterReachFiveAndroid()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(
          error,
          isA<UserCancelledOrClosedTheWebFlowCodeExceptionInterface>(),
        );
      });

      test('$SocialAccountEmailAlreadyInUseExceptionInterface', () {
        final exception = PlatformException(
          code: 'code',
          message: errorCodesInterface.socialAccountEmailAlreadyInUse,
        );

        Object? error;

        try {
          FlutterReachFiveAndroid()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(
          error,
          isA<SocialAccountEmailAlreadyInUseExceptionInterface>(),
        );
      });
    });
  });
}
