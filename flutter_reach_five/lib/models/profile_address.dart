import 'package:equatable/equatable.dart';

/// Enum for the type of your profile address
enum ProfileAddressType {
  /// billing address type
  billing,

  /// delivery address type
  delivery,
}

/// [ProfileAddress] class, contains the infos for the profile address
class ProfileAddress extends Equatable {
  /// [ProfileAddress] default constructor
  const ProfileAddress({
    this.title,
    this.isDefault,
    this.addressType,
    this.streetAddress,
    this.locality,
    this.region,
    this.postalCode,
    this.country,
    this.raw,
    this.deliveryNote,
    this.recipient,
    this.company,
    this.phoneNumber,
  });

  /// The address title
  final String? title;

  /// Is this your default address
  final bool? isDefault;

  /// The address type
  final ProfileAddressType? addressType;

  /// The address street
  final String? streetAddress;

  /// The address locality
  final String? locality;

  /// The address region
  final String? region;

  /// The address postal code
  final String? postalCode;

  /// The address country
  final String? country;

  /// The raw address
  final String? raw;

  /// A delivery note for your address
  final String? deliveryNote;

  /// The address recipient
  final String? recipient;

  /// The company linked to the address
  final String? company;

  /// A phone number linked to the address
  final String? phoneNumber;

  @override
  List<Object?> get props => [
        title,
        isDefault,
        addressType,
        streetAddress,
        locality,
        region,
        postalCode,
        country,
        raw,
        deliveryNote,
        recipient,
        company,
        phoneNumber,
      ];
}
