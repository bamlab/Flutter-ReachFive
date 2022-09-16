import 'package:flutter_reach_five/helpers/reach_five_config_converter.dart';
import 'package:flutter_reach_five/models/reach_five_config.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ReachFiveConfigConverter', () {
    test('toInterface method', () async {
      expect(
        ReachFiveConfigConverter.toInterface(
          const ReachFiveConfig(
            domain: 'domain',
            clientId: 'clientId',
            scheme: 'scheme',
          ),
        ),
        isInstanceOf<ReachFiveConfigInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        ReachFiveConfigConverter.fromInterface(
          ReachFiveConfigInterface(
            domain: 'domain',
            clientId: 'clientId',
            scheme: 'scheme',
          ),
        ),
        isInstanceOf<ReachFiveConfig>(),
      );
    });
  });
}
