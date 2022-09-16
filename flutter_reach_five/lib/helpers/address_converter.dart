import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/address.dart';

/// Used to be the link between the AddressInterface
/// and the Address exported from this package
class AddressConverter {
  /// convert a Address to a AddressInterface
  static AddressInterface toInterface(
    Address address,
  ) =>
      AddressInterface(
        formatted: address.formatted,
        streetAddress: address.streetAddress,
        locality: address.locality,
        region: address.region,
        postalCode: address.postalCode,
        country: address.country,
      );

  /// convert a AddressInterface to a Address
  static Address fromInterface(
    AddressInterface addressInterface,
  ) =>
      Address(
        formatted: addressInterface.formatted,
        streetAddress: addressInterface.streetAddress,
        locality: addressInterface.locality,
        region: addressInterface.region,
        postalCode: addressInterface.postalCode,
        country: addressInterface.country,
      );
}
