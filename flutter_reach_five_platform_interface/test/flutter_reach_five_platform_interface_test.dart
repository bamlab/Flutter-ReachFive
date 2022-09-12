// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_reach_five_platform_interface/info.g.dart';
import 'package:flutter_test/flutter_test.dart';

class FlutterReachFiveMock extends FlutterReachFivePlatform {
  static final mockSearchInfos = Infos(info1: 'info1', info2: 'info2');

  @override
  Future<Infos?> search(VoidCallback onSearch) async => mockSearchInfos;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('FlutterReachFivePlatformInterface', () {
    late FlutterReachFivePlatform flutterReachFivePlatform;

    setUp(() {
      flutterReachFivePlatform = FlutterReachFiveMock();
      FlutterReachFivePlatform.instance = flutterReachFivePlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        void onSearch() {}

        expect(
          await FlutterReachFivePlatform.instance.search(onSearch),
          equals(FlutterReachFiveMock.mockSearchInfos),
        );
      });
    });
  });
}
