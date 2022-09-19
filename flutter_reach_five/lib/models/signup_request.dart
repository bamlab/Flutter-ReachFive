import 'package:equatable/equatable.dart';

import 'profile_signup_request.dart';
import 'scope_value.dart';

/// [SignupRequest] class, contains the infos for a signup request
class SignupRequest extends Equatable {
  /// [SignupRequest] default constructor
  const SignupRequest({
    required this.profile,
    this.redirectUrl,
    this.scope,
  });

  /// Your user profile informations
  final ProfileSignupRequest profile;

  /// Url where the user is redirected when validating his email
  final String? redirectUrl;

  /// The scope values you want to get in your authToken's user
  final List<ScopeValue>? scope;

  @override
  List<Object?> get props => [
        profile,
        redirectUrl,
        scope,
      ];
}
