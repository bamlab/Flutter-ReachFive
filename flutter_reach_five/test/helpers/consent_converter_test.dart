import 'package:flutter_reach_five/helpers/consent_converter.dart';
import 'package:flutter_reach_five/models/consent.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ConsentConverter', () {
    test('toInterface method', () async {
      expect(
        ConsentConverter.toInterface(
          const Consent(granted: true, date: 'date'),
        ),
        isInstanceOf<ConsentInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        ConsentConverter.fromInterface(
          ConsentInterface(granted: true, date: 'date'),
        ),
        isInstanceOf<Consent>(),
      );
    });
  });
}
