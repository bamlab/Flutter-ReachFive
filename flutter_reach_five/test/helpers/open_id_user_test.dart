import 'package:flutter_reach_five/helpers/open_id_user.dart';
import 'package:flutter_reach_five/models/address.dart';
import 'package:flutter_reach_five/models/open_id_user.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$OpenIdUserConverter', () {
    test('toInterface method', () async {
      expect(
        OpenIdUserConverter.toInterface(
          const OpenIdUser(
            address: Address(),
          ),
        ),
        isInstanceOf<OpenIdUserInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        OpenIdUserConverter.fromInterface(
          OpenIdUserInterface(
            address: AddressInterface(),
          ),
        ),
        isInstanceOf<OpenIdUser>(),
      );
    });
  });
}
