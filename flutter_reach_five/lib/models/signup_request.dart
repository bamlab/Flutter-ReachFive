import 'package:equatable/equatable.dart';

import 'profile_signup_request.dart';

/// Enum for the differents values of a scope
enum ScopeValue {
  /// Used to ask for an ID token. If no ID token exists, this is not returned.
  openid('openid'),

  /// Accesses geographical information (postal address, region, geolocation, etc.).
  address('address'),

  /// Accesses email information (email addresses and their verification statuses).
  email('email'),

  /// Access to phone information (phone numbers and their verification statuses).
  phone('phone'),

  /// Allows right to request refresh tokens.
  offlineAccess('offline_access'),

  /// Accesses user’s personal information (gender, age, profile picture, etc.).
  profile('profile'),

  /// Allows the privilege to update anything on the user’s profile.
  fullWrite('full_write'),

  /// Allows access to user events.
  events('events');

  /// constructor of the ScopeValue enum
  const ScopeValue(this.name);

  /// Name of the enum scope value
  final String name;
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
