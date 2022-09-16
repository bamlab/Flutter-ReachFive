import 'profile_signup_request.dart';

/// Enum for the differents values of a scope
enum ScopeValue {
  /// openid
  openid,

  /// email
  email,
}

/// SignupRequest class, contains the infos for a signUp request
class SignupRequest {
  /// SignupRequest default constructor
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
}
