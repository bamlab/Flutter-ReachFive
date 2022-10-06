import 'package:equatable/equatable.dart';

/// [SdkConfig] class, contains the infos for
/// a ReachFive config
class SdkConfig extends Equatable {
  /// [SdkConfig] default constructor
  const SdkConfig({
    required this.domain,
    required this.clientId,
    required this.androidScheme,
    required this.iosScheme,
  });

  /// domain of your reachFive api
  final String domain;

  /// clientId of your reachFive api
  final String clientId;

  /// android scheme of your reachFive api
  final String androidScheme;

  /// ios scheme of your reachFive api
  final String iosScheme;

  @override
  List<Object?> get props => [
        domain,
        clientId,
        androidScheme,
        iosScheme,
      ];
}
