import 'package:flutter_reach_five/models/login_summary.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$LoginSummary', () {
    test('instances with same fields are equal', () async {
      const firstInstance = LoginSummary(
        origins: ['origin'],
        devices: ['device'],
      );
      const secondInstance = LoginSummary(
        origins: ['origin'],
        devices: ['device'],
      );

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = LoginSummary(
        origins: ['origin'],
        devices: ['device'],
      );
      const secondInstance = LoginSummary(
        origins: ['origin2'],
        devices: ['device2'],
      );

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
