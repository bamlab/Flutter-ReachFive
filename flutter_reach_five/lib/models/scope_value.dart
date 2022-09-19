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

  /// constructor of the [ScopeValue] enum
  const ScopeValue(this.name);

  /// Name of the enum scope value
  final String name;
}
