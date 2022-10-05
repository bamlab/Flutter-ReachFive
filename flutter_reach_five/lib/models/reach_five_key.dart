import 'package:equatable/equatable.dart';

import '../flutter_reach_five.dart';

/// [ReachFiveKey] class, contains the infos to
/// identify a ReachFive instance on the native side
class ReachFiveKey extends Equatable {
  /// [ReachFiveKey] default constructor
  const ReachFiveKey({
    required this.sdkConfig,
    required this.providerCreators,
  });

  /// sdkConfig of your reachFive instance
  final SdkConfig sdkConfig;

  /// providerCreators of your reachFive instance
  final List<ProviderCreator> providerCreators;

  @override
  List<Object?> get props => [
        sdkConfig,
        providerCreators,
      ];
}
