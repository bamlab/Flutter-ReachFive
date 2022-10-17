import 'package:flutter_reach_five/helpers/login_summary_converter.dart';
import 'package:flutter_reach_five/models/login_summary.dart';
import 'package:flutter_reach_five_platform_interface/flutter_reach_five_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('$LoginSummaryConverter', () {
    test('toInterface method', () async {
      expect(
        LoginSummaryConverter.toInterface(
          const LoginSummary(
            origins: ['origin'],
            devices: ['device'],
          ),
        ),
        isInstanceOf<LoginSummaryInterface>(),
      );
    });

    test('fromInterface method', () async {
      expect(
        LoginSummaryConverter.fromInterface(
          LoginSummaryInterface(
            origins: ['origin'],
            devices: ['device'],
          ),
        ),
        isInstanceOf<LoginSummary>(),
      );
    });
  });
}
