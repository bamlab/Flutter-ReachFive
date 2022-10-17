import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/emails.dart';

/// Used to be the link between the [EmailsInterface]
/// and the [Emails] exported from this package
class EmailsConverter {
  /// convert a [Emails] to a [EmailsInterface]
  static EmailsInterface toInterface(
    Emails emails,
  ) =>
      EmailsInterface(
        verified: emails.verified,
        unverified: emails.unverified,
      );

  /// convert a [EmailsInterface] to a [Emails]
  static Emails fromInterface(
    EmailsInterface emailsInterface,
  ) =>
      Emails(
        verified: emailsInterface.verified?.whereType<String>().toList(),
        unverified: emailsInterface.unverified?.whereType<String>().toList(),
      );
}
