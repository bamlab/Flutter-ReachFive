import 'package:flutter_reach_five/models/reach_five_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ReachFiveConfig', () {
    test('instances with same fields are equal', () async {
      const firstInstance = ReachFiveConfig(
        domain: 'domain',
        clientId: 'clientId',
        scheme: 'scheme',
      );
      const secondInstance = ReachFiveConfig(
        domain: 'domain',
        clientId: 'clientId',
        scheme: 'scheme',
      );

      expect(firstInstance == secondInstance, isTrue);
    });

    test('instances with differents fields are not equal', () async {
      const firstInstance = ReachFiveConfig(
        domain: 'domain1',
        clientId: 'clientId',
        scheme: 'scheme',
      );
      const secondInstance = ReachFiveConfig(
        domain: 'domain2',
        clientId: 'clientId',
        scheme: 'scheme',
      );

      expect(firstInstance == secondInstance, isFalse);
    });
  });
}
