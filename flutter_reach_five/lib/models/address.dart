/// Address class, contains the infos for an address
class Address {
  /// Address default constructor
  const Address({
    this.formatted,
    this.streetAddress,
    this.locality,
    this.region,
    this.postalCode,
    this.country,
  });

  /// the formatted address string
  final String? formatted;

  /// the address street
  final String? streetAddress;

  /// the address locality
  final String? locality;

  /// the address region
  final String? region;

  /// the address postal code
  final String? postalCode;

  /// the address country
  final String? country;
}
