import 'package:flutter_reach_five/flutter_reach_five.dart';
import 'package:flutter_reach_five/helpers/reach_five_key_converter.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ReachFiveKeyConverter', () {
    test('toInterface method', () async {
      expect(
        ReachFiveKeyConverter.toInterface(
          const ReachFiveKey(
            sdkConfig: SdkConfig(
              domain: 'domain',
              clientId: 'clientId',
              scheme: 'scheme',
            ),
          ),
        ),
        isInstanceOf<ReachFiveKeyInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        ReachFiveKeyConverter.fromInterface(
          ReachFiveKeyInterface(
            sdkConfig: SdkConfigInterface(
              domain: 'domain',
              clientId: 'clientId',
              scheme: 'scheme',
            ),
          ),
        ),
        isInstanceOf<ReachFiveKey>(),
      );
    });
  });
}
