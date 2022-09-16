import 'package:flutter_reach_five/helpers/profile_address_converter.dart';
import 'package:flutter_reach_five/models/profile_address.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$ProfileAddressConverter', () {
    test('toInterface method', () async {
      expect(
        ProfileAddressConverter.toInterface(
          const ProfileAddress(
            addressType: ProfileAddressType.delivery,
          ),
        ),
        isInstanceOf<ProfileAddressInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        ProfileAddressConverter.fromInterface(
          ProfileAddressInterface(
            addressType: ProfileAddressTypeInterface.delivery,
          ),
        ),
        isInstanceOf<ProfileAddress>(),
      );
    });
  });
}
