import 'package:flutter_reach_five/flutter_reach_five.dart';
import 'package:flutter_reach_five/helpers/scope_value_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ScopeValueConverter', () {
    test('toInterface method', () async {
      expect(
        ScopeValueConverter.toInterface(ScopeValue.fullWrite),
        'full_write',
      );
    });

    test('fromInterface method', () async {
      expect(
        ScopeValueConverter.fromInterface('full_write'),
        ScopeValue.fullWrite,
      );
    });
  });
}
