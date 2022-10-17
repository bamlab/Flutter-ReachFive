import 'package:flutter/services.dart';
import 'package:flutter_reach_five_ios/flutter_reach_five_ios.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterReachFiveIOS', () {
    const kPlatformName = 'iOS';
    late FlutterReachFiveIOS flutterReachFive;
    late List<MethodCall> log;

    setUp(() async {
      flutterReachFive = FlutterReachFiveIOS();

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
      FlutterReachFiveIOS.registerWith();
      expect(FlutterReachFivePlatform.instance, isA<FlutterReachFiveIOS>());
    });

    group('can parse an error', () {
      test('random error', () {
        final exception = Exception();

        Object? error;

        try {
          FlutterReachFiveIOS()
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
          FlutterReachFiveIOS()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(exception, error);
      });

      test('$EmailAlreadyInUseExceptionInterface', () {
        final exception = PlatformException(
          code: errorCodesInterface.emailAlreadyInUseCode,
        );

        Object? error;

        try {
          FlutterReachFiveIOS()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(error, isA<EmailAlreadyInUseExceptionInterface>());
      });

      test('$InvalidEmailOrPasswordExceptionInterface', () {
        final exception = PlatformException(
          code: errorCodesInterface.invalidEmailOrPasswordCode,
        );

        Object? error;

        try {
          FlutterReachFiveIOS()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(error, isA<InvalidEmailOrPasswordExceptionInterface>());
      });

      test('$InvalidVerificationCodeExceptionInterface', () {
        final exception = PlatformException(
          code: errorCodesInterface.invalidVerificationCode,
        );

        Object? error;

        try {
          FlutterReachFiveIOS()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(error, isA<InvalidVerificationCodeExceptionInterface>());
      });

      test('$InvalidGrantCodeExceptionInterface', () {
        final exception = PlatformException(
          code: errorCodesInterface.invalidGrant,
        );

        Object? error;

        try {
          FlutterReachFiveIOS()
              .parseError(exception, StackTrace.fromString('test'));
        } catch (e) {
          error = e;
        }

        expect(error, isA<InvalidGrantCodeExceptionInterface>());
      });
    });
  });
}
