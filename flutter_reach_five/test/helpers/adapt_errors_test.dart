import 'package:flutter_reach_five/flutter_reach_five.dart';
import 'package:flutter_reach_five/helpers/adapt_errors.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$adaptErrors', () {
    test('random error', () async {
      const Object error = 'error';
      final stackTrace = StackTrace.fromString('test');

      var hasError = false;

      try {
        adaptErrors(
          error: error,
          stackTrace: stackTrace,
        );
      } catch (e, st) {
        expect(error, e);
        expect(stackTrace, st);

        hasError = true;
      }

      expect(hasError, isTrue);
    });

    test('$EmailAlreadyInUseException', () async {
      Object? error;

      try {
        adaptErrors(
          error: EmailAlreadyInUseExceptionInterface(),
          stackTrace: StackTrace.fromString('test'),
        );
      } catch (e) {
        error = e;
      }

      expect(error, isA<EmailAlreadyInUseException>());
    });

    test('$InvalidEmailOrPasswordException', () async {
      Object? error;

      try {
        adaptErrors(
          error: InvalidEmailOrPasswordExceptionInterface(),
          stackTrace: StackTrace.fromString('test'),
        );
      } catch (e) {
        error = e;
      }

      expect(error, isA<InvalidEmailOrPasswordException>());
    });

    test('$InvalidVerificationCodeException', () async {
      Object? error;

      try {
        adaptErrors(
          error: InvalidVerificationCodeExceptionInterface(),
          stackTrace: StackTrace.fromString('test'),
        );
      } catch (e) {
        error = e;
      }

      expect(error, isA<InvalidVerificationCodeException>());
    });

    test('$InvalidGrantCodeException', () async {
      Object? error;

      try {
        adaptErrors(
          error: InvalidGrantCodeExceptionInterface(),
          stackTrace: StackTrace.fromString('test'),
        );
      } catch (e) {
        error = e;
      }

      expect(error, isA<InvalidGrantCodeException>());
    });
  });
}
