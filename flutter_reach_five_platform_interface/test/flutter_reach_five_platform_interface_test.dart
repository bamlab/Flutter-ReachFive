// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_reach_five_platform_interface/src/flutter_reach_five_platform.dart';
import 'package:flutter_reach_five_platform_interface/src/reach_five.g.dart';
import 'package:flutter_test/flutter_test.dart';

class FlutterReachFiveMock extends FlutterReachFivePlatform {
  static final mockReachFiveConfig = ReachFiveConfigInterface(
    domain: 'domain',
    clientId: 'clientId',
    scheme: 'scheme',
  );

  @override
  Future<ReachFiveConfigInterface> initialize(
    ReachFiveConfigInterface config,
  ) async =>
      mockReachFiveConfig;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('FlutterReachFivePlatformInterface', () {
    late FlutterReachFivePlatform flutterReachFivePlatform;

    setUp(() {
      flutterReachFivePlatform = FlutterReachFiveMock();
      FlutterReachFivePlatform.instance = flutterReachFivePlatform;
    });

    group('initialize', () {
      test('returns correct reach five config', () async {
        expect(
          await FlutterReachFivePlatform.instance
              .initialize(FlutterReachFiveMock.mockReachFiveConfig),
          equals(FlutterReachFiveMock.mockReachFiveConfig),
        );
      });
    });
  });
}
