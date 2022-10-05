import 'package:flutter_reach_five/helpers/provider_creator_converter.dart';
import 'package:flutter_reach_five/models/provider_creator.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ProviderCreatorConverter', () {
    test('toInterface method', () async {
      expect(
        ProviderCreatorConverter.toInterface(ProviderCreator.facebook).type,
        ProviderCreatorTypeInterface.facebook,
      );
    });

    test('fromInterface method', () async {
      expect(
        ProviderCreatorConverter.fromInterface(
          ProviderCreatorInterface(
            type: ProviderCreatorTypeInterface.google,
          ),
        ),
        ProviderCreator.google,
      );
    });
  });
}
