import 'package:equatable/equatable.dart';

import 'scope_value.dart';

/// [LoginWithPasswordRequest] class, contains the infos for a loginWithPassword request
class LoginWithPasswordRequest extends Equatable {
  /// [LoginWithPasswordRequest] default constructor
  const LoginWithPasswordRequest({
    required this.password,
    this.email,
    this.phoneNumber,
    this.scope,
  });

  /// Your user's account password
  final String password;

  /// Email identifier for your user's account
  final String? email;

  /// Phone number identifier for your user's account
  final String? phoneNumber;

  /// The scope values you want to get in your authToken's user
  final List<ScopeValue>? scope;

  @override
  List<Object?> get props => [
        password,
        email,
        phoneNumber,
        scope,
      ];
}
