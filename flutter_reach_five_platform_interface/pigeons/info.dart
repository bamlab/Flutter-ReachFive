import 'package:pigeon/pigeon.dart';

class Infos {
  String? info1;
  String? info2;
}

@FlutterApi()
// ignore: one_member_abstracts
abstract class FlutterReachFiveApi {
  void onSearch();
}

@HostApi()
// ignore: one_member_abstracts
abstract class HostReachFiveApi {
  Infos? search();
}
