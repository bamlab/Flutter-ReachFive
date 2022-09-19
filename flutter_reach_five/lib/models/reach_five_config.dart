import 'package:equatable/equatable.dart';

/// [ReachFiveConfig] class, contains the infos for
/// a ReachFive config
class ReachFiveConfig extends Equatable {
  /// [ReachFiveConfig] default constructor
  const ReachFiveConfig({
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
