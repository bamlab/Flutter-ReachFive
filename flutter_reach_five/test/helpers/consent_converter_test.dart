import 'package:flutter_reach_five/helpers/consent_converter.dart';
import 'package:flutter_reach_five/models/consent.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ConsentConverter', () {
    test('toInterface method', () async {
      expect(
        ConsentConverter.toInterface(
          Consent(granted: true, date: DateTime.parse('2022-06-10')),
        ),
        isInstanceOf<ConsentInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        ConsentConverter.fromInterface(
          ConsentInterface(granted: true, date: '2022-06-10'),
        ),
        isInstanceOf<Consent>(),
      );
    });
  });
}
