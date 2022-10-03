import 'package:equatable/equatable.dart';

/// [SdkConfig] class, contains the infos for
/// a ReachFive config
class SdkConfig extends Equatable {
  /// [SdkConfig] default constructor
  const SdkConfig({
    required this.domain,
    required this.clientId,
    required this.scheme,
  });

  /// domain of your reachFive api
  final String domain;

  /// clientId of your reachFive api
  final String clientId;

  /// scheme of your reachFive api
  final String scheme;

  @override
  List<Object?> get props => [
        domain,
        clientId,
        scheme,
      ];
}
