import 'package:flutter_reach_five/helpers/sdk_config_converter.dart';
import 'package:flutter_reach_five/models/sdk_config.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$SdkConfigConverter', () {
    test('toInterface method', () async {
      expect(
        SdkConfigConverter.toInterface(
          const SdkConfig(
            domain: 'domain',
            clientId: 'clientId',
            scheme: 'scheme',
          ),
        ),
        isInstanceOf<SdkConfigInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        SdkConfigConverter.fromInterface(
          SdkConfigInterface(
            domain: 'domain',
            clientId: 'clientId',
            scheme: 'scheme',
          ),
        ),
        isInstanceOf<SdkConfig>(),
      );
    });
  });
}
