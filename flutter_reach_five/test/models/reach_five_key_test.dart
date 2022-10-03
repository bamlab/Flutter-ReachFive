import 'package:flutter_reach_five/flutter_reach_five.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ReachFiveKey', () {
    test('instances with same fields are equal', () async {
      const firstInstance = ReachFiveKey(
        sdkConfig: SdkConfig(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        ),
      );
      const secondInstance = ReachFiveKey(
        sdkConfig: SdkConfig(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        ),
      );

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = ReachFiveKey(
        sdkConfig: SdkConfig(
          domain: 'domain',
          clientId: 'clientId',
          scheme: 'scheme',
        ),
      );
      const secondInstance = ReachFiveKey(
        sdkConfig: SdkConfig(
          domain: 'domain2',
          clientId: 'clientId2',
          scheme: 'scheme2',
        ),
      );

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
