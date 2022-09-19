import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/consent.dart';

/// Used to be the link between the [ConsentInterface]
/// and the [Consent] exported from this package
class ConsentConverter {
  /// convert a [Consent] to a [ConsentInterface]
  static ConsentInterface toInterface(
    Consent consent,
  ) =>
      ConsentInterface(
        granted: consent.granted,
        date: consent.date,
        consentType: consent.consentType,
      );

  /// convert a [ConsentInterface] to a [Consent]
  static Consent fromInterface(
    ConsentInterface consentInterface,
  ) =>
      Consent(
        granted: consentInterface.granted,
        date: consentInterface.date,
        consentType: consentInterface.consentType,
      );
}
