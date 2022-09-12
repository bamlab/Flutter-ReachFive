// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_reach_five/flutter_reach_five.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_reach_five_platform_interface/info.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterReachFivePlatform extends Mock
    with MockPlatformInterfaceMixin
    implements FlutterReachFivePlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterReachFive', () {
    late FlutterReachFivePlatform flutterReachFivePlatform;

    setUp(() {
      flutterReachFivePlatform = MockFlutterReachFivePlatform();
      FlutterReachFivePlatform.instance = flutterReachFivePlatform;
    });

    group('search', () {
      test('returns correct name when platform implementation exists',
          () async {
        final infos = Infos(info1: 'info1', info2: 'info2');
        void onSearch() {}

        when(
          () => flutterReachFivePlatform.search(onSearch),
        ).thenAnswer((_) async => infos);

        final actualPlatformName = await search(onSearch);

        expect(
          actualPlatformName.info1,
          infos.info1,
        );
        expect(
          actualPlatformName.info2,
          infos.info2,
        );
      });
    });
  });
}
