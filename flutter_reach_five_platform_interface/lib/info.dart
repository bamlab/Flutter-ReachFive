import 'package:flutter/foundation.dart';
import 'package:flutter_reach_five_platform_interface/info.g.dart';

/// InfosApi class
class InfosApi {
  HostInfosApi get _hostInfosApi => HostInfosApi();

  /// search
  Future<Infos?> search(VoidCallback onSearch) {
    FLutterInfosApi.setup(
      FLutterInfosApiImplementation(onSearchMethod: onSearch),
    );

    return _hostInfosApi.search();
  }
}

/// FLutterInfosApi implementation
class FLutterInfosApiImplementation implements FLutterInfosApi {
  /// FLutterInfosApiImplementation default constructor
  const FLutterInfosApiImplementation({
    required this.onSearchMethod,
  });

  /// onSearch method callback
  final VoidCallback onSearchMethod;

  @override
  void onSearch() {
    onSearchMethod();
  }
}
