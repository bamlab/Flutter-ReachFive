import 'package:flutter_reach_five/helpers/address_converter.dart';
import 'package:flutter_reach_five/models/address.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$AddressConverter', () {
    test('toInterface method', () async {
      expect(
        AddressConverter.toInterface(const Address()),
        isInstanceOf<AddressInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        AddressConverter.fromInterface(AddressInterface()),
        isInstanceOf<Address>(),
      );
    });
  });
}
