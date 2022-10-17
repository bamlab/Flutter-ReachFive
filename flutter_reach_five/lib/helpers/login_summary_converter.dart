import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

import '../models/login_summary.dart';

/// Used to be the link between the [LoginSummaryInterface]
/// and the [LoginSummary] exported from this package
class LoginSummaryConverter {
  /// convert a [LoginSummary] to a [LoginSummaryInterface]
  static LoginSummaryInterface toInterface(
    LoginSummary loginSummary,
  ) =>
      LoginSummaryInterface(
        firstLogin: loginSummary.firstLogin,
        lastLogin: loginSummary.lastLogin,
        total: loginSummary.total,
        origins: loginSummary.origins,
        devices: loginSummary.devices,
        lastProvider: loginSummary.lastProvider,
      );

  /// convert a [LoginSummaryInterface] to a [LoginSummary]
  static LoginSummary fromInterface(
    LoginSummaryInterface loginSummaryInterface,
  ) =>
      LoginSummary(
        firstLogin: loginSummaryInterface.firstLogin,
        lastLogin: loginSummaryInterface.lastLogin,
        total: loginSummaryInterface.total,
        origins: loginSummaryInterface.origins?.whereType<String>().toList(),
        devices: loginSummaryInterface.devices?.whereType<String>().toList(),
        lastProvider: loginSummaryInterface.lastProvider,
      );
}
