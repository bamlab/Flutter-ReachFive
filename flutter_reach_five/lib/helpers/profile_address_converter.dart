import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/profile_address.dart';

/// Used to be the link between the [ProfileAddressTypeInterface]
/// and the [ProfileAddressType] exported from this package
class ProfileAddressTypeConverter {
  /// convert a [ProfileAddressType] to a [ProfileAddressTypeInterface]
  static ProfileAddressTypeInterface toInterface(
    ProfileAddressType profileAddressType,
  ) {
    switch (profileAddressType) {
      case ProfileAddressType.billing:
        return ProfileAddressTypeInterface.billing;
      case ProfileAddressType.delivery:
        return ProfileAddressTypeInterface.delivery;
    }
  }

  /// convert a [ProfileAddressTypeInterface] to a [ProfileAddressType]
  static ProfileAddressType fromInterface(
    ProfileAddressTypeInterface profileAddressTypeInterface,
  ) {
    switch (profileAddressTypeInterface) {
      case ProfileAddressTypeInterface.billing:
        return ProfileAddressType.billing;
      case ProfileAddressTypeInterface.delivery:
        return ProfileAddressType.delivery;
    }
  }
}

/// Used to be the link between the [ProfileAddressInterface]
/// and the [ProfileAddress] exported from this package
class ProfileAddressConverter {
  /// convert a [ProfileAddress] to a [ProfileAddressInterface]
  static ProfileAddressInterface toInterface(
    ProfileAddress profileAddress,
  ) {
    final addressType = profileAddress.addressType;

    return ProfileAddressInterface(
      title: profileAddress.title,
      isDefault: profileAddress.isDefault,
      addressType: addressType != null
          ? ProfileAddressTypeConverter.toInterface(addressType)
          : null,
      streetAddress: profileAddress.streetAddress,
      locality: profileAddress.locality,
      region: profileAddress.region,
      postalCode: profileAddress.postalCode,
      country: profileAddress.country,
      raw: profileAddress.raw,
      deliveryNote: profileAddress.deliveryNote,
      recipient: profileAddress.recipient,
      company: profileAddress.company,
      phoneNumber: profileAddress.phoneNumber,
    );
  }

  /// convert a [ProfileAddressInterface] to a [ProfileAddress]
  static ProfileAddress fromInterface(
    ProfileAddressInterface profileAddressInterface,
  ) {
    final addressType = profileAddressInterface.addressType;

    return ProfileAddress(
      title: profileAddressInterface.title,
      isDefault: profileAddressInterface.isDefault,
      addressType: addressType != null
          ? ProfileAddressTypeConverter.fromInterface(addressType)
          : null,
      streetAddress: profileAddressInterface.streetAddress,
      locality: profileAddressInterface.locality,
      region: profileAddressInterface.region,
      postalCode: profileAddressInterface.postalCode,
      country: profileAddressInterface.country,
      raw: profileAddressInterface.raw,
      deliveryNote: profileAddressInterface.deliveryNote,
      recipient: profileAddressInterface.recipient,
      company: profileAddressInterface.company,
      phoneNumber: profileAddressInterface.phoneNumber,
    );
  }
}
