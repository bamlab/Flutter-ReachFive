// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';

FlutterReachFivePlatform get _platform => FlutterReachFivePlatform.instance;

///
class InvalidDataException implements Exception {
  ///
  const InvalidDataException([this.message = '']);

  ///
  final String message;
}

///
class SuperInfos {
  ///
  const SuperInfos({
    required this.info1,
    required this.info2,
  });

  ///
  final String info1;

  ///
  final String info2;
}

///
Future<SuperInfos> search(VoidCallback onSearch) async {
  final infos = await _platform.search(onSearch);
  if (infos == null) throw const InvalidDataException();

  final info1 = infos.info1;
  final info2 = infos.info2;

  if (info1 == null || info2 == null) throw const InvalidDataException();
  return SuperInfos(
    info1: info1,
    info2: info2,
  );
}
