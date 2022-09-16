import 'package:equatable/equatable.dart';

import 'profile_signup_request.dart';

/// Enum for the differents values of a scope
enum ScopeValue {
  /// Used to ask for an ID token. If no ID token exists, this is not returned.
  openid,

  /// Accesses geographical information (postal address, region, geolocation, etc.).
  address,

  /// Accesses email information (email addresses and their verification statuses).
  email,

  /// Access to phone information (phone numbers and their verification statuses).
  phone,

  /// Allows right to request refresh tokens.
  offlineAccess,

  /// Accesses user’s personal information (gender, age, profile picture, etc.).
  profile,

  /// Allows the privilege to update anything on the user’s profile.
  fullWrite,

  /// Allows access to user events.
  events,
}

/// SignupRequest class, contains the infos for a signup request
class SignupRequest extends Equatable {
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

  @override
  List<Object?> get props => [
        profile,
        redirectUrl,
        scope,
      ];
}
