import 'package:equatable/equatable.dart';

/// [LoginSummary] class, contains all the login informations of an user
class LoginSummary extends Equatable {
  /// [LoginSummary] default constructor
  const LoginSummary({
    this.firstLogin,
    this.lastLogin,
    this.total,
    this.origins,
    this.devices,
    this.lastProvider,
  });

  /// first time an user logged in
  final double? firstLogin;

  /// last time an user logged in
  final double? lastLogin;

  /// total number of times an user logged in
  final int? total;

  /// every origin of an user when logging in
  final List<String>? origins;

  /// every devices used to login an user
  final List<String>? devices;

  /// user last provider used to login
  final String? lastProvider;

  @override
  List<Object?> get props => [
        firstLogin,
        lastLogin,
        total,
        origins,
        devices,
        lastProvider,
      ];
}
