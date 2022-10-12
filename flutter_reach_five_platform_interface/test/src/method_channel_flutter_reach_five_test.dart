import 'package:flutter_reach_five_platform_interface/src/method_channel_flutter_reach_five.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('$MethodChannelFlutterReachFive parseError method throw an error',
      () async {
    Object? error;
    try {
      MethodChannelFlutterReachFive()
          .parseError('erreur', StackTrace.fromString('stackTrace'));
    } catch (e) {
      error = e;
    }

    expect(error, isA<UnimplementedError>());
  });
}
