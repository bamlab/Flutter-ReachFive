import 'package:flutter_reach_five/models/sdk_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$SdkConfig', () {
    test('instances with same fields are equal', () async {
      const firstInstance = SdkConfig(
        domain: 'domain',
        clientId: 'clientId',
        androidScheme: 'androidScheme',
        iosScheme: 'iosScheme',
      );
      const secondInstance = SdkConfig(
        domain: 'domain',
        clientId: 'clientId',
        androidScheme: 'androidScheme',
        iosScheme: 'iosScheme',
      );

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = SdkConfig(
        domain: 'domain1',
        clientId: 'clientId',
        androidScheme: 'androidScheme',
        iosScheme: 'iosScheme',
      );
      const secondInstance = SdkConfig(
        domain: 'domain2',
        clientId: 'clientId',
        androidScheme: 'androidScheme',
        iosScheme: 'iosScheme',
      );

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
