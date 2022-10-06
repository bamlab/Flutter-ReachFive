import 'package:flutter_reach_five/helpers/provider_converter.dart';
import 'package:flutter_reach_five/models/provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ProviderConverter', () {
    test('toInterface method', () async {
      expect(
        ProviderConverter.toInterface(Provider.apple),
        'apple',
      );
    });

    test('fromInterface method', () async {
      expect(
        ProviderConverter.fromInterface('apple'),
        Provider.apple,
      );
    });
  });
}
