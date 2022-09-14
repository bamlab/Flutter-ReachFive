import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/reach_five.g.dart',
    javaOut:
        '../flutter_reach_five_android/android/src/main/java/tech/bam/flutter_reach_five/android/ReachFiveApi.java',
    javaOptions: JavaOptions(
      package: 'tech.bam.flutter_reach_five.android',
      className: 'ReachFiveApi',
    ),
    objcHeaderOut: '../flutter_reach_five_ios/ios/Classes/reach_five_api.h',
    objcSourceOut: '../flutter_reach_five_ios/ios/Classes/reach_five_api.m',
  ),
)
class ReachFiveConfigInterface {
  const ReachFiveConfigInterface({
    required this.domain,
    required this.clientId,
    required this.scheme,
  });

  final String domain;
  final String clientId;
  final String scheme;
}

@HostApi()
// ignore: one_member_abstracts
abstract class ReachFiveHostApi {
  @async
  ReachFiveConfigInterface initialize(ReachFiveConfigInterface config);
}
