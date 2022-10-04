import 'package:flutter/services.dart';
import 'package:flutter_reach_five_ios/flutter_reach_five_ios.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterReachFiveIOS', () {
    const kPlatformName = 'iOS';
    late FlutterReachFiveIOS flutterReachFive;
    late List<MethodCall> log;

    setUp(() async {
      flutterReachFive = FlutterReachFiveIOS();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
          .setMockMethodCallHandler(flutterReachFive.methodChannel,
              (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      FlutterReachFiveIOS.registerWith();
      expect(FlutterReachFivePlatform.instance, isA<FlutterReachFiveIOS>());
    });
  });
}
